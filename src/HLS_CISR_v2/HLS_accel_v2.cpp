#include <hls_stream.h>
#include "hls_stream.h"
using namespace hls;
//NOTE- **HAVE TO INCLUDE ENCODED DATA IN DUT FILE (NOT IN TB)**
#include "encoded_data.h"
#define num_slots 4
#define FIFO_DEPTH 4
#define N 8 //Number of rows in sparse matrix
//rows_per_slot = (int)math.ceil((float)N/num_slots);
#define rows_per_slot  2
#define num_non_zero 16
//#include <math.h>
//#include <stdio.h>
#include <stdbool.h>
/*struct slot_data
//#include "encoded_data.h"
{
  float data;
  int col_index;
};*/

float res_expected []={0.3,-32.5,0,6.2,20.8,14.7,55.6,17.6};


void CISR_decoder(int *slot_row_counter,
		stream<int,rows_per_slot> row_len_slot_arr[num_slots],
		float *slot_res_arr,
		int *slot_row_id,
		int* max_row_id)
{

	  for(int slot_id2=0;slot_id2<num_slots;slot_id2++)
		          {

		      //#pragma HLS PIPELINE

		       //#pragma HLS unroll factor=4
		       //Row assignment and CISR row id DECODING
		       //First see which are new row mappings

		       	//New Row assignment
		       	//Can parallelize the row id decoding part
		       	//If some slot is done with a row
		       	if(slot_row_counter[slot_id2]==0)
		       	{

		       		slot_res_arr[slot_id2] = 0;

		       		//Assign new row len
		       		//Read from FIFO
		       		row_len_slot_arr[slot_id2].read(slot_row_counter[slot_id2]);

		       		//CISR row id decoding
		       		//Store row id the slot has to work on
		       		//printf("Slot %d has to work on %d row\n",slot_id2,max_row_id[0]);
		       		slot_row_id[slot_id2] = max_row_id[0];
		       		max_row_id[0]++;

		       	}
		       }
}


void compute( stream<float, FIFO_DEPTH> slot_data_arr_value[num_slots],
			 stream<int, FIFO_DEPTH> slot_data_arr_col_index[num_slots],
			 float *inp_vec,
			 float *slot_res_arr,
			 int *slot_row_counter)
{

	 for(int slot_id3=0;slot_id3<num_slots;slot_id3++)
		    {

		 	//#pragma HLS unroll factor=4
            //#pragma HLS allocation operation instances=mul limit=4
			//#pragma HLS allocation operation instances=add limit=4
		  	float matrix_val;
		  	int col_index;
		  	slot_data_arr_value[slot_id3].read(matrix_val);
		  	slot_data_arr_col_index[slot_id3].read(col_index);
		  	//#pragma HLS dependence variable=slot_data_arr

		    slot_res_arr[slot_id3] += matrix_val*inp_vec[col_index];
		    //printf("slot id %d Multiplying for %d col index: val %f and remaining vals in row %d\n",slot_id3,col_index,matrix_val,slot_row_counter[slot_id3]);
		  	slot_row_counter[slot_id3]--;



		  }
	}

void output_write(float *output_vec,float *slot_res_arr,int *slot_row_id)
{
    for(int slot_id4=0;slot_id4<num_slots;slot_id4++)
	    {
           //#pragma HLS unroll factor=4
    	   //#pragma HLS PIPELINE


	    	 int row_index = slot_row_id[slot_id4];
	    	 output_vec[row_index] = slot_res_arr[slot_id4];
	    	 //output_vec[row_index]= res_expected[row_index];

	    }

}

void initialize(int *max_row_id,float *slot_res_arr,int *slot_row_counter,int *slot_row_id)
{
	max_row_id[0]=0;
      	//Initialize at start

      	for(int slot_id=0;slot_id<num_slots;slot_id++)
      	    {

      		  slot_res_arr[slot_id]=0;
      		  slot_row_counter[slot_id]=0;
      		  slot_row_id[slot_id]=0;


      	    }


}


void fifo_push(
		int index,
		//sparse_mat,
		int *row_len_arr,
		int *row_count,
		stream<int,rows_per_slot> row_len_slot_arr[num_slots],
		stream<float,FIFO_DEPTH> slot_data_arr_value[num_slots],
		stream<int,FIFO_DEPTH> slot_data_arr_col_index[num_slots])
{
	//struct slot_data sparse_data_inp_arr[num_slots];
	//int row_len[num_slots];
	//Assign input data to accel, numslots slots at once
	for(int slot_id = 0;slot_id < num_slots; slot_id++)
	{
		float slot_data_val= sparse_mat[index + slot_id].data;
		int slot_col_index = sparse_mat[index + slot_id].col_index;

		//Push to slot data fifo
		slot_data_arr_value[slot_id].write(slot_data_val);
		slot_data_arr_col_index[slot_id].write(slot_col_index);


	    int row_len;
		//When to stop reading row_len
		if(row_count[0]+slot_id<N)
		{
		   row_len = row_len_arr[row_count[0]+slot_id];
		}
		//Other wise give -1 (invalid)
		else
		{
			row_len = -1;
		}

		//Push row length data
		row_len_slot_arr[slot_id].write(row_len);

	}
	row_count[0]+=num_slots;


}

void full_compute(


		//For CISR decode
		int *slot_row_counter,
		stream<int,rows_per_slot> row_len_slot_arr[num_slots],
		float *slot_res_arr,
		int *slot_row_id,
		int *max_row_id,
		//Compute- parallel MAC

		stream<float, FIFO_DEPTH> slot_data_arr_value[num_slots],
		stream<int, FIFO_DEPTH> slot_data_arr_col_index[num_slots],
		float * inp_vec,

		//Output write
		float *output_vec
)
{

	//Check for new row assignments and take next val in row_len_arr
	CISR_decoder(slot_row_counter,
				row_len_slot_arr,
				slot_res_arr,
				slot_row_id,
				max_row_id);

	//Compute- 'num_slots' amount of parallel Mac computation
	compute(slot_data_arr_value,
			slot_data_arr_col_index,
			inp_vec,
			slot_res_arr,
			slot_row_counter);


	//Output write- TODO- possibly needed
	output_write(output_vec,
				slot_res_arr,
				slot_row_id);




}





//TODO- How does HLS implement this interface using AXI?
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

)

{



	//TODO- via FIFO
	//Each slot has an array of row_lengths- ie, the row_length of the rows its supposed to work on
	   // int row_len_slot_arr[num_slots][rows_per_slot];
      	stream<int,rows_per_slot> row_len_slot_arr[num_slots];

      //Also, need FIFO for slot data for different slots
      	stream<float, FIFO_DEPTH> slot_data_arr_value[num_slots];
      	stream<int, FIFO_DEPTH> slot_data_arr_col_index[num_slots];
		//struct  slot_data  slot_data_arr[num_slots]

	    //Each slot has a counter which is initialized to the row length, and keeps decrementing after computation.
	    //Once it hits 0, it is re-assigned a new value- row len of new row.
	     int slot_row_counter[num_slots];


	    //Global row id variable- stores the max. row id worked on right now- helpful in CISR row id decoding
	    int max_row_id[1];

	    //Stores row id currently worked on by the slot
	     int slot_row_id[num_slots];

	     //TODO Is this needed?
	     //Results array, written to out vec later
	     float slot_res_arr[num_slots];


	     //For fifo push, row_count keeps track of how many rows are surpassed for pushing values of row_len_arr into fifos
	     int row_count[1];


	//First initialize- done once
    initialize(max_row_id,slot_res_arr,slot_row_counter,slot_row_id);


    //Now, go through the given input matrix and feed in slot data to its fifos and row_len_data to the row_len fifos
    //Do this until you've exhausted all non-zero values

    //Using pragma DATAFLOW, we will try to do software pipelining for broadly two tasks:
    //FIFO push- for all slot data and row len data into fifo
    //Compute- Do the computation based on given slot data and row len data
	for(int index=0;index<num_non_zero;index+=num_slots)
	{
		//#pragma DATAFLOW


		//First, push slot data and row length data to fifos.
		fifo_push(
				index,
				//sparse_mat,
				row_len_arr,
				row_count,
				row_len_slot_arr,
				slot_data_arr_value,
				slot_data_arr_col_index);
		//Second, launch full compute
        full_compute(
        		//CISR
        		slot_row_counter,
				row_len_slot_arr,
        		slot_res_arr,
        		slot_row_id,
        		max_row_id,
        		//Compute parallel MAC
        		slot_data_arr_value,
				slot_data_arr_col_index,
				inp_vec,
				output_vec);

	}

		/*HLS_CISR_spmv_accel_v2(
				//Cmd_start- signal implying start of computation
				cmd_start,
				//Inp vector
				inp_vec,
				//Inputs of sparse matrix -size = num_slots
				sparse_data_inp_arr,
				row_len,
				//Outputs
				out_vec
		);*/

		//for(int i1=0;i1<8;i1++)
			//			{
				//		printf("out_val[%d] =  %f\n",i1,out_vec[i1]);
					//	}
	}



