#define num_slots 4
#define N 8
//rows_per_slot = (int)math.ceil((float)N/num_slots);
#define rows_per_slot  2

//#include <math.h>
//#include <stdio.h>
#include <stdbool.h>
struct slot_data
{
  float data;
  int col_index;
};
//TODO- How does HLS implement this interface using AXI?
void HLS_CISR_spmv_accel(
		//Cmd_start- signal implying start of computation
		bool cmd_start,

		//Inp vector
		float * inp_vec,
		//Inputs of sparse matrix -size = num_slots = 4
		struct  slot_data * slot_data_arr,
		int  * slot_arr_row_len,
		//Outputs
		//TODO- Where does HLS store the output vector arrays- which we are passing as pointers
		float * output_vec

)

{

	//Each slot has an array of row_lengths- ie, the row_length of the rows its supposed to work on
    static int row_len_slot_arr[num_slots][rows_per_slot];
    //This stores the id pointing to row_len_arr for each slot
    static int slot_counter[num_slots];

    //Each slot has a counter which is initialized to the row length, and keeps decrementing after computation.
    //Once it hits 0, it is re-assigned a new value- row len of new row.
    static int slot_row_counter[num_slots];

    //id used by a slot to traverse through its row_len array and find the next row_len
    static int slot_row_len_id[num_slots];

    //Global row id variable- stores the max. row id worked on right now- helpful in CISR row id decoding
    static int max_row_id;

    //Stores row id currently worked on by the slot
    static int slot_row_id[num_slots];
    if(cmd_start)
    {
    	max_row_id=0;
    	//Initialize at start
    	for(int slot_id=0;slot_id<num_slots;slot_id++)
    	    {
    		  slot_counter[slot_id]=0;
    		  slot_row_counter[slot_id]=0;
    		  slot_row_len_id[slot_id]=0;
    		  slot_row_id[slot_id]=0;

    		  for(int i=0;i<rows_per_slot;i++)
    		  {
    			  row_len_slot_arr[slot_id][i]=0;

    		  }

    	    }
    }

	//STORING ROW LENGTH ARR INTO ACCEL
    for(int slot_id=0;slot_id<num_slots;slot_id++)
    {
    	//Counts no. of rows mapped to given slot so far
    	int slot_row_count = slot_counter[slot_id];
    	//If its a valid row_length
    	if(slot_arr_row_len[slot_id]!=-1)
    	{
    		//Stores row length assigned to given slot
    		row_len_slot_arr[slot_id][slot_row_count] = slot_arr_row_len[slot_id];
    		slot_counter[slot_id]++;
    	}


    }

    //Row assignment and CISR row id DECODING
    //First see which are new row mappings
    for(int slot_id2=0;slot_id2<num_slots;slot_id2++)
    {

    	//New Row assignment
    	//Can parallelize the row id decoding part
    	//If some slot is done with a row
    	if(slot_row_counter[slot_id2]==0)
    	{
    		//Assign new row len
    		slot_row_counter[slot_id2] = row_len_slot_arr[slot_id2][slot_row_len_id[slot_id2]];
    		slot_row_len_id[slot_id2]++;
    		//CISR row id decoding
    		//Store row id the slot has to work on
    		slot_row_id[slot_id2] = max_row_id;
    		max_row_id++;

    	}


    }






	//Implement 4 MAC units which does the computation
    for(int slot_id3=0;slot_id3<num_slots;slot_id3++)
	{

		int row_index = slot_row_id[slot_id3];
		float matrix_val = slot_data_arr[slot_id3].data;
		int col_index    = slot_data_arr[slot_id3].col_index;

        #pragma HLS dependence variable=output_vec
        //#pragma HLS dependence variable=slot_row_id
        //#pragma HLS dependence variable=slot_data_arr


		output_vec[row_index] = output_vec[row_index] + matrix_val*inp_vec[col_index];
	    slot_row_counter[slot_id3]--;


	}





}
