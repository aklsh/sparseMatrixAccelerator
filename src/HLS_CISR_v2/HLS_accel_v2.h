#ifndef __HLS_ACCEL_V2_H_
#define __HLS_ACCEL_V2_H_

#include <stdio.h>
void HLS_CISR_spmv_accel_v2(

		//Inp vector
		float  inp_vec[8],
		//Sparse mat
		//struct slot_data sparse_mat[num_non_zero],

		//row len arr
		//int row_len_arr[N],
		//Outputs
		//TODO- Where does HLS store the output vector arrays- which we are passing as pointers
		float  output_vec [8]

);
#endif
