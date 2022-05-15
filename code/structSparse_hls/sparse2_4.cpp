/*
 * HLS implementation of NVidia Structured Sparsity Multiplier Unit
 *
 * 2:4 structured sparsity- divide matrix into blocks with 4 elements per block, constrain at least 2 elements
 * 							per block to be 0
 *
 * Input: (float) data matrix, holding non zero values
 * 		  (unsigned int) indices matrix, with 2-bit index for each nnz element
 * 		  		- each 32-bit entry packs the block-relative index for 16 elements (8 blocks)
 *
 *	HARD-CODED for 2:4 sparsity
 *
 * Author: Arjun Menon Vadakkeveedu, ee18b104@smail.iitm.ac.in
 * Dept of Electrical Engineering, IIT Madras
 * May 2022
 */

#include "sparseHLS.h"
#include "hls_print.h"

void decodeStage(
		unsigned int indicesRow[numIndicesPerRow],
		float inp_vectorRow[MATRIX_WIDTH],
		float multInpsRow[nnzPerRow]
		){
	/*
	* Decode Stage:
	* 	- extract 2-bit index corresponding to each dataValues element in the block
	* 	- pick elements from input vector buffer that corr to non-zero indices
	* 	- return elements in an array
	*/
	unsigned int blocksPerRow = MATRIX_WIDTH / blockSize;
	unsigned int maskPacked = 0xF;
	unsigned int maskLow = 0x3;
	unsigned int maskHigh = 0xC;
	// unroll by blocksPerRow
	for (int i = 0; i < blocksPerRow; i++){
#pragma HLS UNROLL
		unsigned int indexPos = i / ( blocksPerRow / numIndicesPerRow );
		unsigned int numShifts = 4 * (i % ( blocksPerRow / numIndicesPerRow ));
		unsigned int packedIdx = (indicesRow[indexPos] >> numShifts) & (maskPacked);
		/*
		 * The following lines are hard-coded for 2:4 sparsity.
		 * For larger blocksizes or nnzPerBlock, manually change the indexing
		 */
		unsigned int idxLow = packedIdx & maskLow;
		unsigned int idxHigh = (packedIdx & maskHigh) >> bitsPerElem;
		multInpsRow[nnzPerBlock * i] = inp_vectorRow[blockSize * i + idxLow];
		multInpsRow[nnzPerBlock * i + 1] = inp_vectorRow[blockSize * i + idxHigh];
	}
}

void macStage(
		float dataValuesRow[nnzPerRow],
		float multInpsRow[nnzPerRow],
		float *dotResult
		){
	/*
	* Multiply Stage:
	* 	- multiply inputs returned by decoder with corr dataValues and accumulate (row-wise mult performed seq)
	* 	- *number of reduction stages is hardcoded for nnzPerRow = 32*
	* 	- return dot-product result
	*/

	float partialMAC[nnzPerRow];
	// unroll by 32
#pragma HLS PIPELINE II=4
	for (int i = 0; i < nnzPerRow; i++){
#pragma HLS UNROLL factor=32
		partialMAC[i] = dataValuesRow[i] * multInpsRow[i];
	}
	// reduction: (HARD-CODED for 32 nnzPerRow)
	// unroll by 16
	for (int i = 0; i < nnzPerRow; i += 2){
#pragma HLS UNROLL factor= 16
		partialMAC[i] += partialMAC[i+1];
	}
	// unroll by 8
	for (int i = 0; i < nnzPerRow; i += 4){
#pragma HLS UNROLL factor= 8
		partialMAC[i] += partialMAC[i+2];
	}
	// unroll by 4
	for (int i = 0; i < nnzPerRow; i += 8){
#pragma HLS UNROLL factor= 4
		partialMAC[i] += partialMAC[i+4];
	}
	// unroll by 2
	for (int i = 0; i < nnzPerRow; i += 16){
#pragma HLS UNROLL factor= 2
		partialMAC[i] += partialMAC[i+8];
	}
	*dotResult = partialMAC[0] + partialMAC[16];

}

void sparse2_4Mult(
		float dataValues[nnzPerRow],
		unsigned int indices[numIndicesPerRow],
		float inp_vector[MATRIX_WIDTH],
		float *dotProd
		){
#pragma HLS INTERFACE mode=s_axilite port=dotProd
#pragma HLS INTERFACE mode=s_axilite port=inp_vector
#pragma HLS INTERFACE mode=s_axilite port=indices
#pragma HLS INTERFACE mode=s_axilite port=dataValues
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=dataValues
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=inp_vector
	float multInpsRow[nnzPerRow];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=multInpsRow
	//float dotProd[1];

	decodeStage(indices, inp_vector, multInpsRow);
	macStage(dataValues, multInpsRow, dotProd);
}
/*
void sparse2_4Mult(
		float dataValues[MATRIX_HEIGHT][nnzPerRow],
		unsigned int indices[MATRIX_HEIGHT][numIndicesPerRow],
		float inp_vector[BATCH_SIZE][MATRIX_WIDTH],
		float out_vector[BATCH_SIZE][MATRIX_HEIGHT]
		){
//#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=out_vector
//#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=inp_vector
//#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=indices
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=dataValues
#pragma HLS TOP name=sparse2_4Mult
	float inp[MATRIX_WIDTH];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=inp
	unsigned int indicesRow[numIndicesPerRow];
	float dataValuesRow[nnzPerRow];
	float multInpsRow[nnzPerRow];
	float dotProd[1];
	for (int i = 0; i < BATCH_SIZE; i++){
		// unroll by 64?
		for (int j = 0; j < MATRIX_WIDTH; j++){
//#pragma HLS UNROLL factor= 64
			inp[j] = inp_vector[i][j];
		}
		// unroll by 4?
		loop_compute:
		for (int j = 0; j < MATRIX_HEIGHT; j++){
//#pragma HLS DATAFLOW
//#pragma HLS UNROLL factor= 4
			// unroll by 2
			for (int k = 0; k < numIndicesPerRow; k++){
//#pragma HLS UNROLL factor= 2
				indicesRow[k] = indices[j][k];
			}
			// unroll by 32
			for (int k = 0; k < nnzPerRow; k++){
//#pragma HLS UNROLL factor= 32
				dataValuesRow[k] = dataValues[j][k];
			}
//
			decodeStage(indicesRow, inp, multInpsRow);
			macStage(dataValuesRow, multInpsRow, dotProd);
			out_vector[i][j] = *dotProd;
		}
	}
}
*/
