#define num_slots 4
#define N 8
#define num_non_zero 16
#include "encoded_data.h"
#include<stdio.h>
#include<math.h>
#include<stdbool.h>

//RUNS ON HOST
int main()
{

	int row_count = 0;

	//Initialize inp vec
	float inp_vec [] = { 0,1,1,1,0,0,1,1};
	//Initialize out vec
	float out_vec [] = {0,0,0,0,0,0,0,0};

	for(int i=0;i<8;i++)
	{
		printf("inp_vec %f\n",inp_vec[i]);

	}

	bool cmd_start = false;

    //Run testbench throughout the non-zero vals
	for(int index=0;index<num_non_zero;index+=num_slots)
	{
		struct slot_data sparse_data_inp_arr[num_slots];
		int row_len[num_slots];
		//Assign input data to accel, 4 slots at once
		for(int slot_id = 0;slot_id < num_slots; slot_id++)
		{
			sparse_data_inp_arr[slot_id].data= sparse_mat[index + slot_id].data;
			sparse_data_inp_arr[slot_id].col_index = sparse_mat[index + slot_id].col_index;
			//int row_len;
			//When to stop reading row_len
			if(row_count+slot_id<N)
			{
			   row_len[slot_id] = row_len_arr[row_count+slot_id];
			}
			//Other wise give -1 (invalid)
			else
			{
				row_len[slot_id] = -1;
			}


		}
		row_count+=num_slots;
		//Call accel function
		if(index==0)
		  cmd_start = true;
		else
		  cmd_start = false;
		HLS_CISR_spmv_accel(
				//Cmd_start- signal implying start of computation
				cmd_start,
				//Inp vector
				inp_vec,
				//Inputs of sparse matrix -size = num_slots = 4
				sparse_data_inp_arr,
				row_len,
				//Outputs
				out_vec
		);

		//Test out_vec now

		/*	for(int i1=0;i1<8;i1++)
			{
				printf("out_val[%d] =  %f\n",i1,out_vec[i1]);

			}*/

	}


	return 0;










}
