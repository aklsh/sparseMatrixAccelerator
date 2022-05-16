/*
 * Implementation of CSR-encoding based Sparse Matrix-Vector Multiplication on the ARM-Cortex A9 core
 *
 * Components:
 * 		- CSR encoding of sparse weight matrix (sequential, 4-way SIMD)
 * 		- Row-wise evaluation of the SpMV product (sequential, 4-way SIMD)
 * 		- Profiling for different kinds of sparsity (Random irregular, 2:4 struct sparsity, col-wise skewed CISR friendly)
 * 		- Software code to run SpMV using the 2:4 sparse dot-product accelerator
 *
 *	Profiling:
 *		- clock(), time() based profiling requires a Linux OS (for gettimeofday() function)
 *		- Read PMCCNTR register: accessible only at PL1 priority level- requires Linux
 *		- use HLS-based Perf Counter instead
 *
 * Arjun Menon Vadakkeveedu, ee18b104@smail.iitm.ac.in
 * Dept. of Electrical Engineering, IIT Madras
 * May 2022
 */

#define TEST_MATRIX structSparse
#define TEST_HLS_MODULE 1
#define TEST_CISR 0
#if (TEST_CISR == 1)
#include "test_cisr8x8.h"
float weights8_8[8][8];
float inputs8[30][8];
#define USE_MATRIX weights8_8
#define USE_INPUT inputs8
#else
#include "test_vectors.h"
#include "test_sparse.h"
float weights[MATRIX_HEIGHT][MATRIX_WIDTH];
float weights90[MATRIX_HEIGHT][MATRIX_WIDTH];
float inp_vector[NUM_INPUTS][MATRIX_WIDTH];
float structSparse[MATRIX_HEIGHT][MATRIX_WIDTH];
#define USE_MATRIX TEST_MATRIX
#define USE_INPUT inp_vector
#endif

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "platform.h"
#include "xil_printf.h"
#include <arm_neon.h>
#include "structSparseEncode.h"
#include "xsparse2_4mult.h"
#include "xcounter.h"
#include "xparameters.h"

#define SIMD_WIDTH 4	// using 128-bit packed NEON registers
#define COUNTER_devID XPAR_COUNTER_0_DEVICE_ID
#define SPARSEHLS_devID XPAR_SPARSE2_4MULT_0_DEVICE_ID
#define POLL_CTR_MAX 10000

typedef struct{
	float data;
	unsigned int colIdx;
} CSRdata;

void getNNZ(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], unsigned int *indPtr){
	// parse sparseMatrix, write to indptr and evaluate nnz
	int non_zeroes = 0;
	for (int i = 0; i < MATRIX_HEIGHT; i++){
		indPtr[i] = non_zeroes;
		for (int j = 0; j < MATRIX_WIDTH; j++){
			if (sparseMatrix[i][j] != 0){
				non_zeroes += 1;
			}
		}
	}
	indPtr[MATRIX_HEIGHT] = non_zeroes;
}

void getNNZ_simd(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], unsigned int *indPtr){
	uint32_t non_zeroes = 0;
	float32x4_t vreg_sparse;
	uint32_t scalar_masks[SIMD_WIDTH/2];
	uint32x4_t ones = vmovq_n_u32(1);
	uint32x4_t zeros_u32 = vmovq_n_u32(0);
	float32x4_t zeros_f32 = vmovq_n_f32(0.0);
	for (int i = 0; i < MATRIX_HEIGHT; i++){ //not vectorized
		indPtr[i] = non_zeroes;
		float *ptr2sparseRow;
		ptr2sparseRow = &sparseMatrix[i][0];
		for (int j = 0; j < MATRIX_WIDTH; j+=SIMD_WIDTH){ //vectorize by 4
			vreg_sparse = vld1q_f32(ptr2sparseRow + j);
			uint32x4_t vreg_mask = vceqq_f32(vreg_sparse, zeros_f32);
			uint32x4_t bool_mask = vbslq_u32(vreg_mask, ones, zeros_u32);
			uint32x2_t partial_sum = vadd_u32(vget_high_u32(bool_mask), vget_low_u32(bool_mask));
			uint32x2_t reduced_sum = vpadd_u32(partial_sum, vmov_n_u32(0));	// Most Sig Word contains the sum
			vst1_u32(scalar_masks, reduced_sum);
			non_zeroes += (4 - scalar_masks[0]);
		}
	}
	indPtr[MATRIX_HEIGHT] = non_zeroes;
}

void csrEncode(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], CSRdata *csrMatrix){
	int index = 0;
	for(int i = 0; i < MATRIX_HEIGHT; i++){
		for (int j = 0; j < MATRIX_WIDTH; j++){
			if (sparseMatrix[i][j] != 0){
				csrMatrix[index].colIdx = j;
				csrMatrix[index].data = sparseMatrix[i][j];
				index++;
			}
		}
	}
}

void stdMatMul(
		float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH],
		float inputs[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
		){
	/*
	 * Standard Matrix-Vector Multiplication of the
	 * Sparse Matrix with the Input Vector (for perf comparison with CSR)
	 */
	for (int i = 0; i < NUM_INPUTS; i++){
		// process input batch sequentially one vector after another
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			for (int k = 0; k < MATRIX_WIDTH; k++){
				outputs[i][j] += sparseMatrix[j][k]*inputs[i][k];
			}
		}
	}
}

void stdMatMulSIMD(
		float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH],
		float inputs[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
		){
	for (int i = 0; i < NUM_INPUTS; i++){
		float *inpVal_ptr;
		inpVal_ptr = &inputs[i][0];
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			float32x4_t vecAccumulator = vmovq_n_f32(0.0);
			float *dataVal_ptr;
			dataVal_ptr = &sparseMatrix[j][0];
			for (int k = 0; k < MATRIX_WIDTH; k+= SIMD_WIDTH){
				float32x4_t dataVal = vld1q_f32(dataVal_ptr + k);
				float32x4_t inpVal = vld1q_f32(inpVal_ptr + k);
				vecAccumulator = vmlaq_f32(vecAccumulator, dataVal, inpVal);
				//outputs[i][j] += sparseMatrix[j][k]*inputs[i][k];
			}
			float seqAccumulator[SIMD_WIDTH];
			vst1q_f32(seqAccumulator, vecAccumulator);
			for (int k = 0; k < SIMD_WIDTH; k++){
				outputs[i][j] += seqAccumulator[k];
			}
		}
	}
}

void spMV(
		CSRdata *csrMatrix,
		unsigned int *indPtr,
		float inputs[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
	){
	// sequential mult of CSR-encoded matrix with batch of input vectors
	unsigned int current_indptr;
	unsigned int next_indptr;
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			current_indptr = indPtr[j];
			next_indptr = indPtr[j+1];
			while(current_indptr < next_indptr){
				unsigned int vecIdx = csrMatrix[current_indptr].colIdx;
				outputs[i][j] += csrMatrix[current_indptr].data * inputs[i][vecIdx];
				current_indptr++;
			}
		}
	}
}

void spMV_simd(
		CSRdata *csrMatrix,
		unsigned int *indPtr,
		float inputs[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
	){
	/*
	 * Compute dot product with SIMD intrinsics
	 */
	unsigned int current_indptr;
	unsigned int next_indptr;
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			current_indptr = indPtr[j];
			next_indptr = indPtr[j+1];
			float32x4_t vecAccumulator = vmovq_n_f32(0.0);
			float seqAccumulator = 0;
			while(current_indptr < next_indptr){
			if (next_indptr - current_indptr >= SIMD_WIDTH){
			/*
			 * NEON does not support gather-scatter accesses
			 * 	- csrMatrix is in AoS form, not SoA => csrMatrix.data isn't stored contiguously
			 * 	- load csrMatrix.data seq into vreg
			 * 	- loading input vector requires indexed access => load it sequentially into vreg
			 * 	- perform mult-accumulate using NEON intrinsics
			 */
				float temp_data[SIMD_WIDTH];
				float temp_inp[SIMD_WIDTH];
				for (int ctr = 0; ctr < SIMD_WIDTH; ctr++){
					temp_data[ctr] = csrMatrix[current_indptr + ctr].data;
					temp_inp[ctr] = inputs[i][csrMatrix[current_indptr + ctr].colIdx];
				}
				float32x4_t dataVal = vld1q_f32(temp_data);
				float32x4_t inpVal = vld1q_f32(temp_inp);

				vecAccumulator = vmlaq_f32(vecAccumulator, dataVal, inpVal);
				current_indptr += SIMD_WIDTH;
			}
			else{
				while(current_indptr < next_indptr){
					seqAccumulator += csrMatrix[current_indptr].data * inputs[i][csrMatrix[current_indptr].colIdx];
					current_indptr++;
				}
			}
			}
			// outputs[i][j] = sum(vecAccumulator) + seqAccumulator
			float temp_acc[SIMD_WIDTH];
			vst1q_f32(temp_acc, vecAccumulator);
			for (int ctr = 0; ctr < SIMD_WIDTH; ctr++){
				seqAccumulator += temp_acc[ctr];
			}
			outputs[i][j] = seqAccumulator;
		}
	}
}

int main(){
	init_platform();
	xil_printf("\n");
	// Peripheral Driver Initialization:
	XCounter xctr;
	XSparse2_4mult xsparseHLS;
	XCounter *xctr_ptr = &xctr;
	XSparse2_4mult *xsparse_ptr = &xsparseHLS;

	XCounter_Initialize(xctr_ptr, COUNTER_devID);
	XSparse2_4mult_Initialize(xsparse_ptr, SPARSEHLS_devID);
	XCounter_EnableAutoRestart(xctr_ptr);
	XCounter_Start(xctr_ptr);
	//

	if ((TEST_HLS_MODULE == 1) && (TEST_CISR == 0)){
		float dataValues[MATRIX_HEIGHT][nnzPerRow];
		unsigned int indices[MATRIX_HEIGHT][numIndicesPerRow];
		float outputHLS[NUM_INPUTS][MATRIX_HEIGHT];
		int tEnc_begin = XCounter_Get_return(xctr_ptr);
		encode2_4Sparsity(USE_MATRIX, dataValues, indices);
		int tEnc_elapsed = XCounter_Get_return(xctr_ptr) - tEnc_begin;
		xil_printf("| SW Encoding of 2:4 sparse matrix: elapsed time = %d |", tEnc_elapsed);
		//
		int tSparse_compute = 0;
		int tCompute_begin;
		int tSparse_begin = XCounter_Get_return(xctr_ptr);
		for (int i = 0; i < NUM_INPUTS; i++){
			float *inp_vector_ptr = &inp_vector[i][0];
			for (int j = 0; j < MATRIX_HEIGHT; j++){
				float *dataValuesRow_ptr = &dataValues[j][0];
				unsigned int *indices_ptr = &indices[j][0];
				XSparse2_4mult_Write_indices_Words(xsparse_ptr, 0, (long unsigned int *)indices_ptr, numIndicesPerRow);
				XSparse2_4mult_Write_dataValues_Words(xsparse_ptr, 0, (long unsigned int *)dataValuesRow_ptr, nnzPerRow);
				XSparse2_4mult_Write_inp_vector_Words(xsparse_ptr, 0, (long unsigned int *)inp_vector_ptr, MATRIX_WIDTH);
				tCompute_begin = XCounter_Get_return(xctr_ptr);
				XSparse2_4mult_Start(xsparse_ptr);
				int poll_ctr = 0;
				while(!XSparse2_4mult_IsDone(xsparse_ptr) && poll_ctr < POLL_CTR_MAX) poll_ctr++;
				if (poll_ctr == POLL_CTR_MAX){
					xil_printf("| Timed Out: Sparse HLS Unit did not complete in % cycles |", POLL_CTR_MAX);
				}
				tSparse_compute += XCounter_Get_return(xctr_ptr) - tCompute_begin;
				long unsigned int dotProd;
				dotProd = XSparse2_4mult_Get_dotProd(xsparse_ptr);
				float *dotProd_ptr = &dotProd;
				outputHLS[i][j] = *dotProd_ptr;
			}
		}
		int tSparse_elapsed = XCounter_Get_return(xctr_ptr) - tSparse_begin;
		//
		xil_printf("| Elapsed Time: HLS MODULE = %d |", tSparse_elapsed);
		xil_printf("| Elapsed Time: HLS MODULE Compute only = %d |", tSparse_compute);
	}
	else{
		CSRdata *csrValues, *csrValuesSIMD;
		unsigned int indicesPtr[MATRIX_HEIGHT+1], indicesPtrSIMD[MATRIX_HEIGHT+1];
		//
		memset(indicesPtr, 0, (MATRIX_HEIGHT+1)*sizeof(unsigned int));
		getNNZ(USE_MATRIX, indicesPtr);
		unsigned int nnz = indicesPtr[MATRIX_HEIGHT];
		csrValues = (CSRdata *)malloc(nnz*sizeof(CSRdata));
		csrEncode(USE_MATRIX, csrValues);

		memset(indicesPtrSIMD, 0, (MATRIX_HEIGHT+1)*sizeof(unsigned int));
		getNNZ_simd(USE_MATRIX, indicesPtrSIMD);
		unsigned int nnzSIMD = indicesPtrSIMD[MATRIX_HEIGHT];
		csrValuesSIMD = (CSRdata *)malloc(nnzSIMD*sizeof(CSRdata));
		csrEncode(USE_MATRIX, csrValuesSIMD);
		//
		float outputs_csr[NUM_INPUTS][MATRIX_HEIGHT];
		float outputs_simd[NUM_INPUTS][MATRIX_HEIGHT];
		//
		memset(outputs_csr, 0, NUM_INPUTS*MATRIX_HEIGHT*sizeof(float));
		memset(outputs_simd, 0, NUM_INPUTS*MATRIX_HEIGHT*sizeof(float));
		int tCSR_begin = XCounter_Get_return(xctr_ptr);
		spMV(csrValues, indicesPtr, USE_INPUT, outputs_csr);
		int tCSR_elapsed = XCounter_Get_return(xctr_ptr) - tCSR_begin;
		int tCSR_SIMD_begin = XCounter_Get_return(xctr_ptr);
		spMV_simd(csrValuesSIMD, indicesPtrSIMD, USE_INPUT, outputs_simd);
		int tCSR_SIMD_elapsed = XCounter_Get_return(xctr_ptr) - tCSR_SIMD_begin;

		xil_printf("| Elapsed Time: CSR-Sequential = %d |", tCSR_elapsed);
		xil_printf("| Elapsed Time: CSR-NEON SIMD = %d |", tCSR_SIMD_elapsed);
		//
		float output_std[NUM_INPUTS][MATRIX_HEIGHT];
		int tStd_begin = XCounter_Get_return(xctr_ptr);
		memset(output_std, 0, NUM_INPUTS * MATRIX_HEIGHT * sizeof(float));
		stdMatMul(USE_MATRIX, USE_INPUT, output_std);
		int tStd_elapsed = XCounter_Get_return(xctr_ptr) - tStd_begin;
		xil_printf("| Elapsed Time: Std Matmul = %d |", tStd_elapsed);
		//
		float output_stdSIMD[NUM_INPUTS][MATRIX_HEIGHT];
		int tStdSIMD_begin = XCounter_Get_return(xctr_ptr);
		memset(output_stdSIMD, 0, NUM_INPUTS * MATRIX_HEIGHT * sizeof(float));
		//
		stdMatMulSIMD(USE_MATRIX, USE_INPUT, output_stdSIMD);
		int tStdSIMD_elapsed = XCounter_Get_return(xctr_ptr) - tStdSIMD_begin;
		xil_printf("| Elapsed Time: Std Matmul SIMD = %d |", tStdSIMD_elapsed);

		free(csrValues);
		free(csrValuesSIMD);
	}
	cleanup_platform();
	return 0;
}
