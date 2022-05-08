// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c"
# 1 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c" 1
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 149 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c" 2







# 1 "/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang/bin/../lib/clang/3.1/include/stdbool.h" 1 3
# 9 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c" 2
struct slot_data
{
  float data;
  int col_index;
};

float res_expected []={0.3,-32.5,0,6.2,20.8,14.7,55.6,17.6};



void initialize(_Bool cmd_start,int* max_row_id,float *slot_res_arr,int *slot_counter,int *slot_row_counter,int *slot_row_len_id,int *slot_row_id,int row_len_slot_arr [2][4])
{
    if(cmd_start)
       {
        max_row_id[0]=0;

        for(int slot_id=0;slot_id<2;slot_id++)
            {

           slot_res_arr[slot_id]=0;
           slot_counter[slot_id]=0;
           slot_row_counter[slot_id]=0;
           slot_row_len_id[slot_id]=0;
           slot_row_id[slot_id]=0;

           for(int i=0;i<4;i++)
           {
            row_len_slot_arr[slot_id][i]=0;

           }

            }
       }
}


void store_row_len_arr(int *slot_counter,int *slot_arr_row_len,int row_len_slot_arr[2][4])
{

    for(int slot_id1=0;slot_id1<2;slot_id1++)
    {
#pragma HLS unroll factor=4

 int slot_row_count = slot_counter[slot_id1];

     if(slot_arr_row_len[slot_id1]!=-1)
     {

      row_len_slot_arr[slot_id1][slot_row_count] = slot_arr_row_len[slot_id1];
      slot_counter[slot_id1]++;
     }
   }
 }


void CISR_decoder(int *slot_row_counter,int row_len_slot_arr[2][4],float *slot_res_arr,int *slot_row_len_id,int *slot_row_id,int* max_row_id)
{

   for(int slot_id2=0;slot_id2<2;slot_id2++)
            {
# 79 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c"
          if(slot_row_counter[slot_id2]==0)
          {

           slot_res_arr[slot_id2] = 0;


           slot_row_counter[slot_id2] = row_len_slot_arr[slot_id2][slot_row_len_id[slot_id2]];
           slot_row_len_id[slot_id2]++;



           slot_row_id[slot_id2] = max_row_id[0];
           max_row_id[0]++;

          }
         }
}


void compute(struct slot_data *slot_data_arr,float *inp_vec,float *slot_res_arr,int *slot_row_counter)
{

  for(int slot_id3=0;slot_id3<2;slot_id3++)
      {

#pragma HLS unroll factor=4

 float matrix_val = slot_data_arr[slot_id3].data;
     int col_index = slot_data_arr[slot_id3].col_index;


      slot_res_arr[slot_id3] += matrix_val*inp_vec[col_index];



     slot_row_counter[slot_id3]--;



    }
 }

void output_write(float *output_vec,float *slot_res_arr,int *slot_row_id)
{
    for(int slot_id4=0;slot_id4<2;slot_id4++)
     {
#pragma HLS unroll factor=4



 int row_index = slot_row_id[slot_id4];
       output_vec[row_index] = slot_res_arr[slot_id4];


     }

}

void HLS_CISR_spmv_accel(

  _Bool cmd_start,


  float inp_vec[8],

  struct slot_data slot_data_arr[2],
  int slot_arr_row_len[2],


  float output_vec [8]

)

{




     static int row_len_slot_arr[2][4];

     static int slot_counter[2];



     static int slot_row_counter[2];


     static int slot_row_len_id[2];


     static int max_row_id[1];


     static int slot_row_id[2];


     static float slot_res_arr[2];
   initialize(cmd_start,max_row_id,slot_res_arr,slot_counter,slot_row_counter,slot_row_len_id,slot_row_id,row_len_slot_arr);


    store_row_len_arr(slot_counter,slot_arr_row_len,row_len_slot_arr);


    CISR_decoder(slot_row_counter,row_len_slot_arr,slot_res_arr,slot_row_len_id,slot_row_id,max_row_id);


    compute(slot_data_arr,inp_vec,slot_res_arr,slot_row_counter);


    output_write(output_vec,slot_res_arr,slot_row_id);
# 199 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c"
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_HLS_CISR_spmv_accel_ir(_Bool, float *, struct slot_data *, int *, float *);
#ifdef __cplusplus
extern "C"
#endif
void HLS_CISR_spmv_accel_hw_stub(_Bool cmd_start, float *inp_vec, struct slot_data *slot_data_arr, int *slot_arr_row_len, float *output_vec){
HLS_CISR_spmv_accel(cmd_start, inp_vec, slot_data_arr, slot_arr_row_len, output_vec);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void apatb_HLS_CISR_spmv_accel_sw(_Bool cmd_start, float *inp_vec, struct slot_data *slot_data_arr, int *slot_arr_row_len, float *output_vec){
apatb_HLS_CISR_spmv_accel_ir(cmd_start, inp_vec, slot_data_arr, slot_arr_row_len, output_vec);
return ;
}
#endif
# 199 "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.c"

