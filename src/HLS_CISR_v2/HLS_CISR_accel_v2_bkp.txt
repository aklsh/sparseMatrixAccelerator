#include <hls_stream.h>
#include "hls_stream.h"
using namespace hls;
//NOTE- **HAVE TO INCLUDE ENCODED DATA IN DUT FILE (NOT IN TB)**
//#include "encoded_data.h"
#define num_slots 1
#define FIFO_DEPTH 4
#define N 8 //Number of rows in sparse matrix
//rows_per_slot = (int)math.ceil((float)N/num_slots);
#define rows_per_slot  8
#define num_non_zero 16
//#include <math.h>
//#include <stdio.h>
//#include <iostream>
//using namespace std;
//#include <stdbool.h>
/*struct slot_data
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


	int tmp_slot_row_count[num_slots];
	for(int slot_id2=0;slot_id2<num_slots;slot_id2++)
   {

		//#pragma HLS unroll factor=1
		 //Read from FIFO ONLY WHEN SLOT IS DONE WITH CURRENT ROW
		if(slot_row_counter[slot_id2]==0)
		{
			row_len_slot_arr[slot_id2].read(tmp_slot_row_count[slot_id2]);
		}
    }
	for(int slot_id2=0;slot_id2<num_slots;slot_id2++)
		          {


		    //Read for row_len_arr all slots from fifo



		  	   #pragma HLS PIPELINE
		       //#pragma HLS unroll factor=1
		       //Row assignment and CISR row id DECODING
		       //First see which are new row mappings

		       	//New Row assignment
		       	//Can parallelize the row id decoding part
		       	//If some slot is done with a row
				//cout<<"slot_row_counter "<<slot_row_counter[slot_id2]<<" Slot "<<slot_id2<<"\n";

		       	if(slot_row_counter[slot_id2]==0)
		       	{

		       		slot_res_arr[slot_id2] = 0;

		       		//Assign new row len
		       		//cout<<"Reading row len arr for slot"<<slot_id2<<":"<<tmp_slot_row_count[slot_id2];
		       		slot_row_counter[slot_id2] = tmp_slot_row_count[slot_id2];

		       		//CISR row id decoding
		       		//Store row id the slot has to work on
		       		//cout<<"Slot "<<slot_id2<<" has to work on " <<max_row_id[0] <<" row\n";

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

		 	#pragma HLS unroll factor=1
            //#pragma HLS allocation operation instances=mul limit=4
			//#pragma HLS allocation operation instances=add limit=4
		  	float matrix_val;
		  	int col_index;
		  	slot_data_arr_value[slot_id3].read(matrix_val);
		  	slot_data_arr_col_index[slot_id3].read(col_index);
		  	//#pragma HLS dependence variable=slot_data_arr

		    slot_res_arr[slot_id3] += matrix_val*inp_vec[col_index];
		    //cout<<"slot_id "<<slot_id3<<"Multiplying for "<<col_index<<"col index: val "<<matrix_val<<" and remaining vals in row "<<slot_row_counter[slot_id3]<<"\n";
		    slot_row_counter[slot_id3]--;



		  }
	}

void output_write(float *output_vec,float *slot_res_arr,int *slot_row_id)
{
    for(int slot_id4=0;slot_id4<num_slots;slot_id4++)
	    {
         // #pragma HLS unroll factor=1
    	  // #pragma HLS PIPELINE


	    	 int row_index = slot_row_id[slot_id4];
	    	 output_vec[row_index] = slot_res_arr[slot_id4];
	    	 //output_vec[row_index]= res_expected[row_index];

	    }

}

/*void initialize(int *max_row_id,float *slot_res_arr,int *slot_row_counter,int *slot_row_id
		//,int* row_count
		)
{
	max_row_id[0]=0;
	//row_count[0] = 0;
      	//Initialize at start

      	for(int slot_id=0;slot_id<num_slots;slot_id++)
      	    {

      		  slot_res_arr[slot_id]=0;
      		  slot_row_counter[slot_id]=0;
      		  slot_row_id[slot_id]=0;


      	    }


}*/


void fifo_push_1(
		int *row_len_arr,
		stream<int,rows_per_slot> row_len_slot_arr[num_slots])
{
#pragma HLS PIPELINE
	//One time initialization
	static int row_count=0;
	static int index2=0;
	//struct slot_data sparse_data_inp_arr[num_slots];
	//int row_len[num_slots];
	//Assign input data to accel, numslots slots at once

	bool cond = index2<(num_non_zero/num_slots);
	if(cond)
	{

		for(int slot_id = 0;slot_id < num_slots; slot_id++)
			{



				//cout<<"Rowcount "<<row_count<<" slot "<<slot_id<<"\n";
			    int row_len;
				//When to stop reading row_len
				if(row_count+slot_id<N)
				{
				   row_len = row_len_arr[row_count+slot_id];
				}
				//Other wise give -1 (invalid)
				else
				{
					row_len = -1;
				}

				//Push row length data
				row_len_slot_arr[slot_id].write(row_len);

			}
			row_count+=num_slots;

	}
	index2++;


}
void fifo_push_2(
		//int index2,
		//struct slot_data sparse_mat[num_non_zero],
		float data_val_arr[num_non_zero],
		int col_index_arr[num_non_zero],
		//sparse_mat,
		//int *row_count,
		stream<float,FIFO_DEPTH> slot_data_arr_value[num_slots],
		stream<int,FIFO_DEPTH> slot_data_arr_col_index[num_slots])
{

	#pragma HLS PIPELINE
	//One time initialization
	static int row_count=0;
	static int index2=0;
	//struct slot_data sparse_data_inp_arr[num_slots];
	//int row_len[num_slots];
	//Assign input data to accel, numslots slots at once

	bool cond = index2<(num_non_zero/num_slots);
	if(cond)
	{

		for(int slot_id = 0;slot_id < num_slots; slot_id++)
			{

				//#pragma HLS unroll factor=1
				//#pragma HLS PIPELINE
				//float slot_data_val= sparse_mat[index2*num_slots + slot_id].data;
				float slot_data_val= data_val_arr[index2*num_slots+slot_id];
				//int slot_col_index = sparse_mat[index2*num_slots + slot_id].col_index;
				int slot_col_index= col_index_arr[index2*num_slots+slot_id];


				//Push to slot data fifo
				slot_data_arr_value[slot_id].write(slot_data_val);
				slot_data_arr_col_index[slot_id].write(slot_col_index);



			}
			row_count+=num_slots;

	}
	index2++;



}


/*void full_compute_predecessor(
				int *slot_row_counter,int *slot_row_counter_tmp,
			    float *slot_res_arr,    float *slot_res_arr_tmp,
				int *slot_row_id, int *slot_row_id_tmp,
				int *max_row_id, int *max_row_id_tmp,
				float *inp_vec , float *inp_vec_tmp
				)
{

	max_row_id_tmp[0] = max_row_id[0];
	for(int slot_id = 0;slot_id<num_slots;slot_id++)
	{
		slot_row_counter_tmp[slot_id] =slot_row_counter[slot_id];
		slot_res_arr_tmp[slot_id] =slot_res_arr[slot_id];
		slot_row_id_tmp[slot_id] = slot_row_id[slot_id];


	}


	for(int i=0;i<8;i++)
	{

		inp_vec_tmp[i] = inp_vec[i];

	}

}*/


void full_compute(


		//For CISR decode
		//int *slot_row_counter,
		stream<int,rows_per_slot> row_len_slot_arr[num_slots],
		//float *slot_res_arr,
		//int *slot_row_id,
		//int *max_row_id,
		//Compute- parallel MAC

		stream<float, FIFO_DEPTH> slot_data_arr_value[num_slots],
		stream<int, FIFO_DEPTH> slot_data_arr_col_index[num_slots],
		float * inp_vec,

		//Output write
		float *output_vec
)
{
		#pragma HLS pipeline II=10


	   //Each slot has a counter which is initialized to the row length, and keeps decrementing after computation.
		    //Once it hits 0, it is re-assigned a new value- row len of new row.
		     static int slot_row_counter[num_slots];


		    //Global row id variable- stores the max. row id worked on right now- helpful in CISR row id decoding
		     static int max_row_id[1];

		    //Stores row id currently worked on by the slot
		     static int slot_row_id[num_slots];

		     //TODO Is this needed?
		     //Results array, written to out vec later
		     static float slot_res_arr[num_slots];




//#pragma HLS PIPELINE
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
void HLS_accel_v2(

		//Inp vector
		float  inp_vec[8],
		//Sparse mat
		//struct slot_data sparse_mat[num_non_zero],
		float data_val_arr[num_non_zero],
		int col_index_arr[num_non_zero],


		//row len arr
	    int row_len_arr[N],
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

	#pragma HLS ARRAY_PARTITION variable=data_val_arr  dim=1 //factor=2 type=block
 	#pragma HLS ARRAY_PARTITION variable=col_index_arr   dim=1 //factor=2 type=block
	#pragma HLS ARRAY_PARTITION variable=row_len_arr   dim=1 //type=block factor=2

	     //For fifo push, row_count keeps track of how many rows are surpassed for pushing values of row_len_arr into fifos
	    // int row_count[1];


	//First initialize- done once
   // initialize(max_row_id,slot_res_arr,slot_row_counter,slot_row_id
    		//,row_count
	//		);


    //Now, go through the given input matrix and feed in slot data to its fifos and row_len_data to the row_len fifos
    //Do this until you've exhausted all non-zero values

    //Using pragma DATAFLOW, we will try to do software pipelining for broadly two tasks:
    //FIFO push- for all slot data and row len data into fifo
    //Compute- Do the computation based on given slot data and row len data
	for(int index2=0;index2<num_non_zero/num_slots;index2+=1)
	{

		/*int slot_row_counter_tmp[num_slots];
		float slot_res_arr_tmp[num_slots];
		int slot_row_id_tmp[num_slots];
		int max_row_id_tmp[1];
		float inp_vec_tmp[8];*/


		#pragma HLS DATAFLOW
		//#pragma HLS PIPELINE




		//First, push slot data and row length data to fifos.
		fifo_push_1(
				//index2,
				//sparse_mat,
				row_len_arr,
				row_len_slot_arr
			)
		fifo_push_2(
				//index2,
				//sparse_mat,
				data_val_arr,
				col_index_arr,
				slot_data_arr_value,
				slot_data_arr_col_index);

		//TODO- intermediate fifo read before compute?

		//Read inps to full compute- necessary predecessor process

		//Second, launch full compute




        full_compute(
        		//CISR
        		//slot_row_counter,//
				row_len_slot_arr,
        		//slot_res_arr,//
        		//slot_row_id,//
        		//max_row_id,//
        		//Compute parallel MAC
        		slot_data_arr_value,
				slot_data_arr_col_index,
				inp_vec,//
				output_vec);

	}



		//for(int i1=0;i1<8;i1++)
			//			{
				//		printf("out_val[%d] =  %f\n",i1,out_vec[i1]);
					//	}
	}



