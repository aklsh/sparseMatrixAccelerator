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

float res_expected []={0.3,-32.5,0,6.2,20.8,14.7,55.6,17.6};



void initialize(bool cmd_start,int* max_row_id,float *slot_res_arr,int *slot_counter,int *slot_row_counter,int *slot_row_len_id,int *slot_row_id,int row_len_slot_arr [num_slots][rows_per_slot])
{
    if(cmd_start)
	      {
	      	max_row_id[0]=0;
	      	//Initialize at start

	      	for(int slot_id=0;slot_id<num_slots;slot_id++)
	      	    {

	      		  slot_res_arr[slot_id]=0;
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
}


void store_row_len_arr(int *slot_counter,int *slot_arr_row_len,int row_len_slot_arr[num_slots][rows_per_slot])
{
	//STORING ROW LENGTH ARR INTO ACCEL
    for(int slot_id1=0;slot_id1<num_slots;slot_id1++)
    {
        #pragma HLS unroll factor=4
    	//Counts no. of rows mapped to given slot so far
    	int slot_row_count = slot_counter[slot_id1];
    	//If its a valid row_length
    	if(slot_arr_row_len[slot_id1]!=-1)
    	{
    		//Stores row length assigned to given slot
    		row_len_slot_arr[slot_id1][slot_row_count] = slot_arr_row_len[slot_id1];
    		slot_counter[slot_id1]++;
    	}
   }
	}


void CISR_decoder(int *slot_row_counter,int row_len_slot_arr[num_slots][rows_per_slot],float *slot_res_arr,int *slot_row_len_id,int *slot_row_id,int* max_row_id)
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
		       		slot_row_counter[slot_id2] = row_len_slot_arr[slot_id2][slot_row_len_id[slot_id2]];
		       		slot_row_len_id[slot_id2]++;
		       		//CISR row id decoding
		       		//Store row id the slot has to work on
		       		//printf("Slot %d has to work on %d row\n",slot_id2,max_row_id[0]);
		       		slot_row_id[slot_id2] = max_row_id[0];
		       		max_row_id[0]++;

		       	}
		       }
}


void compute(struct  slot_data *slot_data_arr,float *inp_vec,float *slot_res_arr,int *slot_row_counter)
{

	 for(int slot_id3=0;slot_id3<num_slots;slot_id3++)
		    {
		  	//Implement 4 MAC units which does the computation
		    #pragma HLS unroll factor=4

		  	float matrix_val = slot_data_arr[slot_id3].data;
		  	int col_index    = slot_data_arr[slot_id3].col_index;
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
           #pragma HLS unroll factor=4
    	   ///#pragma HLS PIPELINE


	    	 int row_index = slot_row_id[slot_id4];
	    	 output_vec[row_index] = slot_res_arr[slot_id4];
	    	 //output_vec[row_index]= res_expected[row_index];

	    }

}
//TODO- How does HLS implement this interface using AXI?
void HLS_CISR_spmv_accel(
		//Cmd_start- signal implying start of computation
		bool cmd_start,

		//Inp vector
		float  inp_vec[8],
		//Inputs of sparse matrix -size = num_slots = 4
		struct  slot_data  slot_data_arr[num_slots],
		int   slot_arr_row_len[num_slots],
		//Outputs
		//TODO- Where does HLS store the output vector arrays- which we are passing as pointers
		float  output_vec [8]

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
	    static int max_row_id[1];

	    //Stores row id currently worked on by the slot
	    static int slot_row_id[num_slots];

	    //Results array, written to out vec later
	    static float slot_res_arr[num_slots];
   initialize(cmd_start,max_row_id,slot_res_arr,slot_counter,slot_row_counter,slot_row_len_id,slot_row_id,row_len_slot_arr);


    store_row_len_arr(slot_counter,slot_arr_row_len,row_len_slot_arr);


    CISR_decoder(slot_row_counter,row_len_slot_arr,slot_res_arr,slot_row_len_id,slot_row_id,max_row_id);


    compute(slot_data_arr,inp_vec,slot_res_arr,slot_row_counter);


    output_write(output_vec,slot_res_arr,slot_row_id);
	    //for(int id=0;id<8;id++)
	    //	{
	    //	  output_vec[id]=  res_expected[id];
	    	  //printf("out_vec[id] %d :%d",id,output_vec[id]);
	    //	}
      //out write




}
