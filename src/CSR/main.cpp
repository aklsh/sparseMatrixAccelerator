#include <stdio.h>
#include "hls_stream.h"
#include "hls_math.h"

#include "accelerator/constants.hpp"
#include "encoded_data.hpp"
#include "accelerator/accelerator.hpp"

int main(){
	int val[] = {1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 2, 1, 1, 1, 3, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1};
	int row_ptr[] = {0, 1, 5, 6, 8, 9, 14, 18, 23, 28, 29, 36, 39, 42, 42, 43, 47, 51, 53, 54, 54, 60, 61};
	int col_index[] = {20, 6, 10, 12, 20, 20, 1, 22, 12, 6, 12, 13, 18, 20, 1, 5, 12, 20, 1, 2, 6, 15, 22, 1, 7, 9, 13, 18, 1, 0, 1, 2, 10, 11, 20, 21, 10, 15, 20, 5, 8, 22, 1, 2, 10, 15, 20, 1, 2, 10, 20, 11, 22, 8, 1, 2, 10, 19, 20, 22, 20, 1, 8, 20};

	int vector_x[N] = {0};
	std::fill(vector_x, vector_x+N, 1);
	for(int q=0;q<N;q++)
		printf("x[%d] = %d\n", q, vector_x[q]);
	int vector_y[N] = {0};
	int ref_y[N] = {1, 6, 2, 2, 1, 5, 4, 9, 5, 1, 11, 5, 3, 0, 1, 5, 4, 2, 1, 0, 7, 1, 4};

	bool init_storage = false;

	int processed_elements = 0;
	int curr_row_len = 0;
	int curr_subrow_label = 0;
	int curr_num_subrows = 0;
	int elements_left_curr_row = 0;
	int num_elements_processed_curr = 0;
	int curr_label = 0;
	int curr_subrow_elements[K] = {0};
	int curr_subrow_indices[K] = {0};
	bool curr_subrow_mult_enables[K] = {false};

	for(int row_index = 0; row_index < N; row_index++){
		printf("curr_row: %d\n", row_index);
		if(row_index == N-1)
			curr_row_len = NNZ - row_ptr[row_index];
		else
			curr_row_len = row_ptr[row_index+1] - row_ptr[row_index];
		printf("curr_row_len: %d\n", curr_row_len);
		curr_num_subrows = int((curr_row_len/K)+(curr_row_len%K != 0));
		printf("curr_num_subrows: %d\n", curr_num_subrows);
		elements_left_curr_row = curr_row_len;

		for(int f = 0; f < curr_num_subrows; f++){
			num_elements_processed_curr = (K <= elements_left_curr_row) ? K : elements_left_curr_row;
			for(int g = 0; g < K; g++){
				if(g < num_elements_processed_curr){
					curr_subrow_elements[g] = val[processed_elements+g];
					printf("curr_subrow_elements[%d] = %d\n", g, curr_subrow_elements[g]);
					curr_subrow_mult_enables[g] = true;
					printf("curr_subrow_mult_enables[%d] = true\n", g);
					curr_subrow_indices[g] = col_index[processed_elements+g];
					printf("curr_subrow_indices[%d] = %d\n", g, curr_subrow_indices[g]);
				}
				else{
					curr_subrow_elements[g] = 0;
					printf("curr_subrow_elements[%d] = %d\n", g, curr_subrow_elements[g]);
					curr_subrow_mult_enables[g] = false;
					printf("curr_subrow_mult_enables[%d] = false\n", g);
					curr_subrow_indices[g] = 0;
					printf("curr_subrow_indices[%d] = %d\n", g, curr_subrow_indices[g]);
				}
			}
			curr_label = curr_num_subrows - f;
			printf("curr_label = %d\n", curr_label);
			if(row_index == 0 && f == 0)
				init_storage = true;
			accelerate(vector_y[row_index], curr_subrow_elements, curr_subrow_indices, curr_subrow_mult_enables, curr_label, vector_x, init_storage);
			processed_elements += num_elements_processed_curr;
			elements_left_curr_row -= num_elements_processed_curr;
		}
	}

	for(int r = 0; r < N; r++)
		printf("vector_y[%d] = %d\n", r, vector_y[r]);

	bool correct = true;
	for(int z = 0; z < N; z++){
		if(vector_y[z] != ref_y[z]){
			correct = false;
			printf("Wrong value at out index %d\n", z);
			break;
		}
	}
	if(correct)
		return 0;
	else
		return 1;
}



