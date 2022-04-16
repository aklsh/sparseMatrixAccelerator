#ifdef __CSR_ENCODE_ENABLE__
#ifndef __ENCODING_CSR__
#define __ENCODING_CSR__

int nnz(int8_t** input, int N){
	int nonzeros = 0;
	for(int i=0;i<N;i++)
		for(int j=0;j<N;j++)
			if(input[i][j] != 0)
				nonzeros++;
	return nonzeros;
}

void encode(int8_t* val, int* row_ptr, int* col_index, int8_t** input, int N){
	int val_index = 0;
    for(int i=0;i<N;i++){
		row_ptr[i] = val_index;
		for(int j=0;j<N;j++){
			if(input[i][j] != 0){
                col_index[val_index] = j;
                val[val_index] = input[i][j];
                val_index++;
			}
        }
    }
    row_ptr[N] = val_index;
}

#endif
#endif
