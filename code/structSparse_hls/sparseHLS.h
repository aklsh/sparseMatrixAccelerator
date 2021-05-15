#ifndef __SPARSEHLS_H__
#define __SPARSEHLS_H__

//Macro Definitions:
#define blockSize 4
#define nnzPerBlock 2
#define bitsPerElem 2	// 2 bits to encode index for each nnz element
#define bitsPerBlock 4
#define MATRIX_HEIGHT 64
#define MATRIX_WIDTH 64
#define nnzPerRow 32
#define numIndicesPerRow 2

#define BATCH_SIZE 16

void sparse2_4Mult(
		float dataValues[nnzPerRow],
		unsigned int indices[numIndicesPerRow],
		float inp_vector[MATRIX_WIDTH],
		float *dotProd
		);

#endif
