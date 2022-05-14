/*
 * Implementation of CSR-encoding based Sparse Matrix-Vector Multiplication on the ARM-Cortex A9 core
 *
 * Components:
 * 		- CSR encoding of sparse weight matrix (sequential, 4-way SIMD)
 * 		- Row-wise evaluation of the SpMV product (sequential, 4-way SIMD)
 * 		- Profiling for different kinds of sparsity (Random irregular, 2:4 struct sparsity, col-wise skewed CISR friendly)
 *
 *	Profiling:
 *		- clock(), time() based profiling requires a Linux OS (for gettimeofday() function)
 *		- Read PMCCNTR register: accessible only at PL1 priority level- requires Linux
 *		- use Xilinx Counter API instead
 *
 * Arjun Menon Vadakkeveedu, ee18b104@smail.iitm.ac.in
 * Dept. of Electrical Engineering, IIT Madras
 * May 2022
 */

#include <stdio.h>
#include <stdlib.h>
#include <arm_neon.h>
#include <string.h>
#include "test_data.h"
#include "platform.h"
#include "xil_printf.h"

#define SIMD_WIDTH 4	// using 128-bit packed NEON registers

float weights[MATRIX_HEIGHT][MATRIX_WIDTH];
float inp_vector[NUM_INPUTS][MATRIX_WIDTH];


typedef struct{
	float data;
	unsigned int colIdx;
} CSRdata;

/*
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

void csrEncode(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], float *data, unsigned int *colIdx){
	int index = 0;
	for(int i = 0; i < MATRIX_HEIGHT; i++){
		for (int j = 0; j < MATRIX_WIDTH; j++){
			if (sparseMatrix[i][j] != 0){
				//csrMatrix[index].colIdx = j;
				//colIdx[index] = j;
				*(colIdx + index) = j;
				//csrMatrix[index].data = sparseMatrix[i][j];
				data[index] = sparseMatrix[i][j];
				index++;
			}
		}
		xil_printf(" %d, ", colIdx[0]);
	}
}
*/

void csr_encode(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], CSRdata *csrMatrix, unsigned int *indPtr, int mode){
//void csr_encode(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], float *data, unsigned int *colIdx, unsigned int *indPtr, int mode){
	/*
	 * Encode in 2 passes of the sparse matrix: nnz not known, nnz is reqd for dyn alloc of data and indices fields
	 *
	 * mode == 0 (init) -> parse sparseMatrix, write to indptr and nnz
	 * after init, malloc csrMatrix.data and csrMatrix.indices with nnz elements
	 * mode == 1 -> compress: parse sparseMatrix, write data and indices
	 */
	if (mode == 0){
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
	if (mode == 1){
		int index = 0;
		for(int i = 0; i < MATRIX_HEIGHT; i++){
			for (int j = 0; j < MATRIX_WIDTH; j++){
				if (sparseMatrix[i][j] != 0){
					csrMatrix[index].colIdx = j;
					//colIdx[index] = j;
					csrMatrix[index].data = sparseMatrix[i][j];
					//data[index] = sparseMatrix[i][j];
					index++;
				}
			}
		}
	}
}

void csr_encode_simd(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], CSRdata *csrMatrix, unsigned int *indPtr, int mode){
//void csr_encode_simd(float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH], float *data, unsigned int *colIdx, unsigned int *indPtr, int mode){
	/*
	* Use NEON SIMD Intrinsics to encode 4 elements of sparseMatrix at a time. Will not result in 4x speedup
	* due to lane divergence (conditional predication). But should still be faster than the original sequential code
	* Requires MATRIX_WIDTH to be a multiple of SIMD width = 4
	*/
	if (mode == 0){
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
	if (mode == 1){
		/*
		 * not vectorized
		 * 	- can only vectorize sparseMatrix load and condition check
		 * 	- vectorized writing to data and indices requires packing vreg's across itns
		 */
		int index = 0;
		for(int i = 0; i < MATRIX_HEIGHT; i++){
			for (int j = 0; j < MATRIX_WIDTH; j+=1){
				if (sparseMatrix[i][j] != 0){
					csrMatrix[index].colIdx = j;
					//colIdx[index] = j;
					csrMatrix[index].data = sparseMatrix[i][j];
					//data[index] = sparseMatrix[i][j];
					index++;
				}
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
	 * Standard Matrix-Vector Multiplication of the Sparse Matrix with the Input Vector (for perf comparison with CSR)
	 */
	for (int i = 0; i < NUM_INPUTS; i++){
		// process input batch sequentially one vector after another
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			//outputs[i][j] = 0;
			for (int k = 0; k < MATRIX_WIDTH; k++){
				outputs[i][j] += sparseMatrix[j][k]*inputs[i][k];
			}
		}
	}
}

void spMV(CSRdata *csrMatrix, unsigned int *indPtr, float inputs[NUM_INPUTS][MATRIX_WIDTH], float outputs[NUM_INPUTS][MATRIX_HEIGHT]){
/*
void spMV(
		float *data,
		unsigned int *colIdx,
		unsigned int *indPtr,
		float inputs[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
	){*/
	// sequential mult of CSR-encoded matrix with batch of input vectors
	unsigned int current_indptr;
	unsigned int next_indptr;
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			//outputs[i][j] = 0;
			current_indptr = indPtr[j];
			next_indptr = indPtr[j+1];
			while(current_indptr < next_indptr){
				//xil_printf(" %d, ", current_indptr);
				//xil_printf(" %d, ", next_indptr);
				unsigned int vecIdx = csrMatrix[current_indptr].colIdx;
				//unsigned int vecIdx = colIdx[current_indptr];
				//xil_printf(" %d, ", vecIdx);
				outputs[i][j] += csrMatrix[current_indptr].data * inputs[i][vecIdx];
				//outputs[i][j] += data[current_indptr] * inputs[i][vecIdx];
				current_indptr++;
			}
		}
	}
}

/*
void spMV_simd(CSRdata *csrMatrix, unsigned int *indPtr, float inputs[NUM_INPUTS][MATRIX_WIDTH], float outputs[NUM_INPUTS][MATRIX_HEIGHT]){
/*void spMV_simd(
		float *data,
		unsigned int *colIdx,
		unsigned int *indPtr,
		float inputs[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
	){*
	/*
	 * Compute dot product with SIMD intrinsics
	 *
	unsigned int current_indptr;
	unsigned int next_indptr;
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			//outputs[i][j] = 0;
			current_indptr = indPtr[j];
			next_indptr = indPtr[j+1];
			float32x4_t dataValues;
			//uint32x4_t colIndices;
			float32x4_t vecAccumulator = vmovq_n_f32(0.0);
			float seqAccumulator = 0;
			while(current_indptr < next_indptr){	// vectorize this while loop
				if (next_indptr - current_indptr >= 4){
					//SIMD
					continue;
				}
				else{
					//sequential
					continue;
				}
				/*
				unsigned int vecIdx = csrMatrix[current_indptr].colIdx;
				outputs[i][j] += csrMatrix[current_indptr].data * inputs[i][vecIdx];
				current_indptr++;
				*
			}
		}
	}
}
*/
int main(){
	init_platform();

	CSRdata *csrValues;
	CSRdata *csrValuesSIMD;


	unsigned int indicesPtr[MATRIX_HEIGHT+1], indicesPtrSIMD[MATRIX_HEIGHT+1];
	//float *dataValues, *dataValuesSIMD;
	//unsigned int *colIdx, *colIdxSIMD;
	memset(indicesPtr, 0, (MATRIX_HEIGHT+1)*sizeof(unsigned int));
	csr_encode(weights, csrValues, indicesPtr, 0);
	//getNNZ(weights, indicesPtr);
	unsigned int nnz = indicesPtr[MATRIX_HEIGHT];
	csrValues = (CSRdata *)malloc(nnz*sizeof(CSRdata));
	//dataValues = (float *)malloc(nnz*sizeof(float));
	//colIdx = (unsigned int *)malloc(nnz*sizeof(unsigned int));
	csr_encode(weights, csrValues, indicesPtr, 1);
	//csrEncode(weights, dataValues, colIdx);
	//
	memset(indicesPtrSIMD, 0, (MATRIX_HEIGHT+1)*sizeof(unsigned int));
	csr_encode(weights, csrValuesSIMD, indicesPtrSIMD, 0);
	//csr_encode(weights, dataValuesSIMD, colIdxSIMD, indicesPtrSIMD, 0);
	//getNNZ_simd(weights, indicesPtrSIMD);
	unsigned int nnzSIMD = indicesPtrSIMD[MATRIX_HEIGHT];
	csrValuesSIMD = (CSRdata *)malloc(nnzSIMD*sizeof(CSRdata));
	//float *dataValuesSIMD = (float *)malloc(nnzSIMD*sizeof(float));
	//unsigned int *colIdxSIMD = (unsigned int *)malloc(nnzSIMD*sizeof(unsigned int));
	csr_encode(weights, csrValuesSIMD, indicesPtrSIMD, 1);
	//csr_encode(weights, dataValuesSIMD, colIdxSIMD, indicesPtrSIMD, 1);
	//csrEncode(weights, dataValuesSIMD, colIdxSIMD);
	//
	int diff = 0;
	for (int k = 0; k < MATRIX_HEIGHT + 1; k++){
		diff += abs(indicesPtr[k] - indicesPtrSIMD[k]);
	}
	xil_printf("\nIndex Ptrs: Cumulative diff (SIMD vs seq) : %d, ", diff);
	//
	float outputs_std[NUM_INPUTS][MATRIX_HEIGHT];
	float outputs_csr[NUM_INPUTS][MATRIX_HEIGHT];
	memset(outputs_std, 0, NUM_INPUTS*MATRIX_HEIGHT*sizeof(float));
	memset(outputs_csr, 0, NUM_INPUTS*MATRIX_HEIGHT*sizeof(float));
	stdMatMul(weights, inp_vector, outputs_std);
	xil_printf("Starting spMV\n");
	spMV(csrValues, indicesPtr, inp_vector, outputs_csr);
	//spMV(dataValues, colIdx, indicesPtr, inp_vector, outputs_csr);

	diff = 0;
	for (int m = 0; m < NUM_INPUTS; m++){
		for (int n = 0; n < MATRIX_HEIGHT; n++){
			diff += abs(outputs_std[m][n] - outputs_csr[m][n]);
		}
	}
	xil_printf("spMV result: Cumulative diff (std matmul vs CSR): %d, ", (int)(diff));
	//
	/*
	free(dataValues);
	free(colIdx);
	free(dataValuesSIMD);
	free(colIdxSIMD);
	*/
	free(csrValues);
	free(csrValuesSIMD);
	cleanup_platform();
	return 0;
}
