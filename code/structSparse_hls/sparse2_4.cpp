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

void demuxInputs(
		float dataValues[nnzPerRow],
		float inp_vector[MATRIX_WIDTH],
		float dataValuesDemux[nnzPerRow],
		float inp_vectorDemux[nnzPerRow]
		){

	//HARD-CODED for 2:4 sparsity
	for (int i = 0; i < MATRIX_WIDTH; i++){
#pragma HLS PIPELINE
		inp_vectorDemux[i] = inp_vector[i];
		if (i % 2 == 0){
			// nnzPerRow = MATRIX_WIDTH / 2
			dataValuesDemux[i / 2] = dataValues[i / 2];
		}
	}
}

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
#pragma HLS PIPELINE II=4
	for (int i = 0; i < nnzPerRow; i++){
#pragma HLS UNROLL factor=32
		partialMAC[i] = dataValuesRow[i] * multInpsRow[i];
	}
	// reduction: (HARD-CODED for 32 nnzPerRow)
	for (int i = 0; i < nnzPerRow; i += 2){
#pragma HLS UNROLL factor= 16
		partialMAC[i] += partialMAC[i+1];
	}
	for (int i = 0; i < nnzPerRow; i += 4){
#pragma HLS UNROLL factor= 8
		partialMAC[i] += partialMAC[i+2];
	}
	for (int i = 0; i < nnzPerRow; i += 8){
#pragma HLS UNROLL factor= 4
		partialMAC[i] += partialMAC[i+4];
	}
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

#pragma HLS INTERFACE mode=s_axilite port=return
#pragma HLS AGGREGATE compact=auto variable=inp_vector
#pragma HLS AGGREGATE compact=auto variable=dataValues
#pragma HLS INTERFACE mode=s_axilite port=dotProd
#pragma HLS INTERFACE mode=s_axilite port=inp_vector
#pragma HLS INTERFACE mode=s_axilite port=indices
#pragma HLS INTERFACE mode=s_axilite port=dataValues

	// demuxing inputs into array partitioned buffers
	float dataValuesDemux[nnzPerRow];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=dataValuesDemux
	float inp_vectorDemux[MATRIX_WIDTH];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=inp_vectorDemux

	float multInpsRow[nnzPerRow];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=multInpsRow

	demuxInputs(dataValues, inp_vector, dataValuesDemux, inp_vectorDemux);
	decodeStage(indices, inp_vectorDemux, multInpsRow);
	macStage(dataValuesDemux, multInpsRow, dotProd);
}
