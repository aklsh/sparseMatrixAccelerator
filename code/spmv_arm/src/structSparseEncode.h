/*
 * Encode matrices with 2:4 structured sparsity in Software
 * 	- Transfer encoded matrix to structured sparsity MAC unit on PL
 *
 * Author: Arjun Menon Vadakkeveedu, ee18b104@smail.iitm.ac.in
 * Dept. of Electrical Engineering, IIT Madras
 * May 2022
 */

//Macro Definitions:
#define blockSize 4
#define nnzPerBlock 2
#define bitsPerElem 2	// 2 bits to encode index for each nnz element
#define bitsPerBlock 4

const unsigned int nnzPerRow = (MATRIX_WIDTH * nnzPerBlock)/blockSize;
const unsigned int uint_size = sizeof(unsigned int);
const unsigned int numIndicesPerRow = (bitsPerElem * nnzPerRow) / (8 * uint_size);

void encode2_4Sparsity(
		float sparseMatrix[MATRIX_HEIGHT][MATRIX_WIDTH],
		float dataValues[MATRIX_HEIGHT][nnzPerRow],
		unsigned int indices[MATRIX_HEIGHT][numIndicesPerRow]
		){
	/*
	 * dataValues => store non zero values in row-major format
	 * indices => 2-bits per non zero element to identify location within a block
	 */
	memset(indices, 0, MATRIX_HEIGHT * numIndicesPerRow * sizeof(unsigned int));
	for (int i = 0; i < MATRIX_HEIGHT; i++){
		for (int j = 0; j < MATRIX_WIDTH/blockSize; j += 1){
			unsigned int zeroMask[blockSize];
			memset(zeroMask, 0, blockSize*sizeof(unsigned int));
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
