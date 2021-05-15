/*
 *	Testbench for the HLS module
 *		- Compute SpMV with the HLS code and compare against standard matrix multiply
 *		- return 0 if results match, else return 1
 *
 *		Using SW encoding code for the testbench
 */

#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include "sparseHLS.h"
#include "test_data.h"

using namespace std;
//float inp_vector[NUM_INPUTS][MATRIX_WIDTH];
//float structSparse[MATRIX_HEIGHT][MATRIX_WIDTH];

void encode2_4Sparsity(
		float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH],
		float dataValues[MATRIX_HEIGHT][nnzPerRow],
		unsigned int indices[MATRIX_HEIGHT][numIndicesPerRow]
		){
	/*
	 * dataValues => store non zero values in row-major format
	 * indices => 2-bits per non zero element to identify location within a block
	 */
	//memset(indices, 0, MATRIX_HEIGHT * numIndicesPerRow * sizeof(unsigned int));
	for (int row = 0; row < MATRIX_HEIGHT; row++){
		for (int col = 0; col < numIndicesPerRow; col++){
			indices[row][col] = 0;
		}
	}
	for (int i = 0; i < MATRIX_HEIGHT; i++){
		for (int j = 0; j < MATRIX_WIDTH/blockSize; j += 1){
			unsigned int zeroMask[blockSize];
			//memset(zeroMask, 0, blockSize*sizeof(unsigned int));
			for (int ctr = 0; ctr < blockSize; ctr++){
				zeroMask[ctr] = 0;
			}
			unsigned int _4bitIdx;
			for (int k = 0;  k < blockSize; k++){
				if(sparseMatrix[i][blockSize*j + k] != 0){
					zeroMask[k] = 1;
				}
			}
			// assign 4-bit index based on positions of nnz elements
			// HARD-CODED for 2:4 sparsity
			if (zeroMask[0]){
				dataValues[i][2*j + 0] = sparseMatrix[i][blockSize*j];
				if (zeroMask[2]){
					dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 2];
					_4bitIdx = (unsigned int)0x8; //1000
				}
				else if (zeroMask[3]){
					dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 3];
					_4bitIdx = (unsigned int)0xC; //1100
				}
				else{
					dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 1];
					_4bitIdx = (unsigned int)0x4; //0100; regardless of zeroMask[1] value
				}
			}
			else if (zeroMask[1]){
				dataValues[i][2*j + 0] = sparseMatrix[i][blockSize*j + 1];
				if (zeroMask[3]){
					dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 3];
					_4bitIdx = (unsigned int)0xD; //1101
				}
				else{
					dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 2];
					_4bitIdx = (unsigned int)0x9; //1001
				}
			}
			else if (zeroMask[2]){
				dataValues[i][2*j + 0] = sparseMatrix[i][blockSize*j + 2];
				dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 3];
				_4bitIdx = (unsigned int)0xE; //1110
			}
			else{
				dataValues[i][2*j + 0] = sparseMatrix[i][blockSize*j];
				dataValues[i][2*j + 1] = sparseMatrix[i][blockSize*j + 3];
				_4bitIdx = (unsigned int)0xC; //1100; at most only one nnz elem in block (zeroMask[3])
			}
			//
			unsigned int indexPosition = j / (MATRIX_WIDTH / (blockSize * numIndicesPerRow));
			unsigned int numShifts = bitsPerBlock * (j % (MATRIX_WIDTH / (blockSize * numIndicesPerRow)));
			indices[i][indexPosition] += _4bitIdx << numShifts;
		}
	}
}

void stdMatMul(
		float structSparse[MATRIX_HEIGHT][MATRIX_WIDTH],
		float inp_vector[NUM_INPUTS][MATRIX_WIDTH],
		float outputs[NUM_INPUTS][MATRIX_HEIGHT]
		){
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			outputs[i][j] = 0;
			for (int k = 0; k < MATRIX_WIDTH; k++){
				outputs[i][j] += structSparse[j][k] * inp_vector[i][k];
			}
		}
	}
}


int main(){
	cout << "C-simulation of HLS 2:4 sparse module against std matmul" << endl;
	float dataValues[MATRIX_HEIGHT][nnzPerRow];
	unsigned int indices[MATRIX_HEIGHT][numIndicesPerRow];
	encode2_4Sparsity(structSparse, dataValues, indices);
	float output_std[NUM_INPUTS][MATRIX_HEIGHT];
	float output_hls[NUM_INPUTS][MATRIX_HEIGHT];
	stdMatMul(structSparse, inp_vector, output_std);
	//sparse2_4Mult(dataValues, indices, inp_vector, output_hls);
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			float dataValuesRow[nnzPerRow];
			unsigned int indicesRow[numIndicesPerRow];
			float inputRow[MATRIX_WIDTH];
			float dotProd[1];
			for (int k = 0; k < nnzPerRow; k++){
				dataValuesRow[k] = dataValues[j][k];
			}
			for (int k = 0; k < numIndicesPerRow; k++){
				indicesRow[k] = indices[j][k];
			}
			for (int k = 0; k < MATRIX_WIDTH; k++){
				inputRow[k] = inp_vector[i][k];
			}
			sparse2_4Mult(dataValuesRow, indicesRow, inputRow, dotProd);
			output_hls[i][j] = *dotProd;
		}
	}
	float diff = 0;
	cout << endl;
	for (int i = 0; i < NUM_INPUTS; i++){
		for (int j = 0; j < MATRIX_HEIGHT; j++){
			diff += (output_hls[i][j] - output_std[i][j])*(output_hls[i][j] - output_std[i][j]);
		}
	}
	//printf("\nError = %f\n", diff);
	int retval = (int)(diff * 10000);	// neglect errors < 1e-5
	printf("Quantized Error (scaled by 1e5) = %d\n", retval);
	if (retval == 0){
		cout << "PASS" << endl;
		return 0;
	}
	else{
		cout << "FAIL" << endl;
		return 1;
	}
}
