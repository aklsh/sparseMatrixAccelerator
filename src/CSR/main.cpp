#include <math.h>
#include <malloc.h>
#include <iostream>
#include <algorithm>
#include <vector>

#define __CSR_ENCODE_ENABLE__
#include "encoding/csr.h"
#include "matrices/matrix.hpp"

int main(){
	int8_t* A_row_ptrs[23];
	for (int i = 0; i < 23; i++)
		A_row_ptrs[i] = Matrices::Ragusa18[i];
	int8_t** A = A_row_ptrs;

	std::cout<<"A: "<<std::endl;
	for(int i=0; i<23; i++){
		for(int j=0; j<23; j++){
			std::cout<<int(A[i][j])<<" ";
		}
		std::cout<<std::endl;
	}

	int nonzeros = 0;
	nonzeros = nnz(A, 23);

	std::cout<<"nnz: "<<nonzeros<<std::endl;

	int8_t* val = new int8_t[nonzeros];
	int* col_index = new int[nonzeros];
	int* row_ptr = new int[23+1];

	encode(val, row_ptr, col_index, A, 23);

	std::cout<<std::endl;
	std::cout<<"val: "<<std::endl;
	for(int i = 0; i < nonzeros; i++){
		std::cout<<int(val[i])<<" ";
	}
	std::cout<<std::endl;
	std::cout<<"col_index: "<<std::endl;
	for(int i = 0; i < nonzeros; i++){
		std::cout<<col_index[i]<<" ";
	}
	std::cout<<std::endl;
	std::cout<<"row_ptr: "<<std::endl;
	for(int i = 0; i < 23; i++){
		std::cout<<row_ptr[i]<<" ";
	}
	return 0;
}
