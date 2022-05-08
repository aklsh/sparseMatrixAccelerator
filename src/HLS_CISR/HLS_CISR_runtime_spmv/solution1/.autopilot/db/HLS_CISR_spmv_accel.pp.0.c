# 1 "HLS_CISR_spmv_accel.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 338 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Xilinx/Vitis_HLS/2020.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 314 "/Xilinx/Vitis_HLS/2020.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
    void _ssdm_op_IfRead() __attribute__ ((nothrow));
    void _ssdm_op_IfWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite() __attribute__ ((nothrow));


    void _ssdm_StreamRead() __attribute__ ((nothrow));
    void _ssdm_StreamWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite() __attribute__ ((nothrow));
    void _ssdm_op_ReadReq() __attribute__ ((nothrow));
    void _ssdm_op_Read() __attribute__ ((nothrow));
    void _ssdm_op_WriteReq() __attribute__ ((nothrow));
    void _ssdm_op_Write() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq() __attribute__ ((nothrow));




    void _ssdm_op_MemShiftRead() __attribute__ ((nothrow));

    void _ssdm_op_Wait() __attribute__ ((nothrow));
    void _ssdm_op_Poll() __attribute__ ((nothrow));

    void _ssdm_op_Return() __attribute__ ((nothrow));


    void _ssdm_op_SpecSynModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecTopModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDecl() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDef() __attribute__ ((nothrow));
    void _ssdm_op_SpecPort() __attribute__ ((nothrow));
    void _ssdm_op_SpecConnection() __attribute__ ((nothrow));
    void _ssdm_op_SpecChannel() __attribute__ ((nothrow));
    void _ssdm_op_SpecSensitive() __attribute__ ((nothrow));
    void _ssdm_op_SpecModuleInst() __attribute__ ((nothrow));
    void _ssdm_op_SpecPortMap() __attribute__ ((nothrow));

    void _ssdm_op_SpecReset() __attribute__ ((nothrow));

    void _ssdm_op_SpecPlatform() __attribute__ ((nothrow));
    void _ssdm_op_SpecClockDomain() __attribute__ ((nothrow));
    void _ssdm_op_SpecPowerDomain() __attribute__ ((nothrow));

    int _ssdm_op_SpecRegionBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecRegionEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopName() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopTripCount() __attribute__ ((nothrow));

    int _ssdm_op_SpecStateBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecStateEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecInterface() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipeline() __attribute__ ((nothrow));
    void _ssdm_op_SpecDataflowPipeline() __attribute__ ((nothrow));


    void _ssdm_op_SpecLatency() __attribute__ ((nothrow));
    void _ssdm_op_SpecParallel() __attribute__ ((nothrow));
    void _ssdm_op_SpecProtocol() __attribute__ ((nothrow));
    void _ssdm_op_SpecOccurrence() __attribute__ ((nothrow));

    void _ssdm_op_SpecResource() __attribute__ ((nothrow));
    void _ssdm_op_SpecResourceLimit() __attribute__ ((nothrow));
    void _ssdm_op_SpecCHCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecFUCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIFCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIPCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecKeepValue() __attribute__ ((nothrow));
    void _ssdm_op_SpecMemCore() __attribute__ ((nothrow));

    void _ssdm_op_SpecExt() __attribute__ ((nothrow));




    void _ssdm_SpecArrayDimSize() __attribute__ ((nothrow));

    void _ssdm_RegionBegin() __attribute__ ((nothrow));
    void _ssdm_RegionEnd() __attribute__ ((nothrow));

    void _ssdm_Unroll() __attribute__ ((nothrow));
    void _ssdm_UnrollRegion() __attribute__ ((nothrow));

    void _ssdm_InlineAll() __attribute__ ((nothrow));
    void _ssdm_InlineLoop() __attribute__ ((nothrow));
    void _ssdm_Inline() __attribute__ ((nothrow));
    void _ssdm_InlineSelf() __attribute__ ((nothrow));
    void _ssdm_InlineRegion() __attribute__ ((nothrow));

    void _ssdm_SpecArrayMap() __attribute__ ((nothrow));
    void _ssdm_SpecArrayPartition() __attribute__ ((nothrow));
    void _ssdm_SpecArrayReshape() __attribute__ ((nothrow));

    void _ssdm_SpecStream() __attribute__ ((nothrow));

    void _ssdm_op_SpecStable() __attribute__ ((nothrow));
    void _ssdm_op_SpecStableContent() __attribute__ ((nothrow));

    void _ssdm_op_SpecBindPort() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipoDepth() __attribute__ ((nothrow));

    void _ssdm_SpecExpr() __attribute__ ((nothrow));
    void _ssdm_SpecExprBalance() __attribute__ ((nothrow));

    void _ssdm_SpecDependence() __attribute__ ((nothrow));

    void _ssdm_SpecLoopMerge() __attribute__ ((nothrow));
    void _ssdm_SpecLoopFlatten() __attribute__ ((nothrow));
    void _ssdm_SpecLoopRewind() __attribute__ ((nothrow));

    void _ssdm_SpecFuncInstantiation() __attribute__ ((nothrow));
    void _ssdm_SpecFuncBuffer() __attribute__ ((nothrow));
    void _ssdm_SpecFuncExtract() __attribute__ ((nothrow));
    void _ssdm_SpecConstant() __attribute__ ((nothrow));

    void _ssdm_DataPack() __attribute__ ((nothrow));
    void _ssdm_SpecDataPack() __attribute__ ((nothrow));

    void _ssdm_op_SpecBitsMap() __attribute__ ((nothrow));
    void _ssdm_op_SpecLicense() __attribute__ ((nothrow));
# 2 "<built-in>" 2
# 1 "HLS_CISR_spmv_accel.c" 2







# 1 "/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdbool.h" 1 3
# 9 "HLS_CISR_spmv_accel.c" 2
struct slot_data
{
  float data;
  int col_index;
};

float res_expected []={0.3,-32.5,0,6.2,20.8,14.7,55.6,17.6};



void initialize(_Bool cmd_start,int* max_row_id,float *slot_res_arr,int *slot_counter,int *slot_row_counter,int *slot_row_len_id,int *slot_row_id,int row_len_slot_arr [4][2])
{
    if(cmd_start)
       {
        max_row_id[0]=0;


        VITIS_LOOP_26_1: for(int slot_id=0;slot_id<4;slot_id++)
            {

           slot_res_arr[slot_id]=0;
           slot_counter[slot_id]=0;
           slot_row_counter[slot_id]=0;
           slot_row_len_id[slot_id]=0;
           slot_row_id[slot_id]=0;

           VITIS_LOOP_35_2: for(int i=0;i<2;i++)
           {
            row_len_slot_arr[slot_id][i]=0;

           }

            }
       }
}


void store_row_len_arr(int *slot_counter,int *slot_arr_row_len,int row_len_slot_arr[4][2])
{

    VITIS_LOOP_49_1: for(int slot_id1=0;slot_id1<4;slot_id1++)
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


void CISR_decoder(int *slot_row_counter,int row_len_slot_arr[4][2],float *slot_res_arr,int *slot_row_len_id,int *slot_row_id,int* max_row_id)
{

   VITIS_LOOP_68_1: for(int slot_id2=0;slot_id2<4;slot_id2++)
            {



#pragma HLS unroll factor=4






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

  VITIS_LOOP_102_1: for(int slot_id3=0;slot_id3<4;slot_id3++)
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
    VITIS_LOOP_124_1: for(int slot_id4=0;slot_id4<4;slot_id4++)
     {
#pragma HLS unroll factor=4



 int row_index = slot_row_id[slot_id4];
       output_vec[row_index] = slot_res_arr[slot_id4];


     }

}

__attribute__((sdx_kernel("HLS_CISR_spmv_accel", 0))) void HLS_CISR_spmv_accel(

  _Bool cmd_start,


  float inp_vec[8],

  struct slot_data slot_data_arr[4],
  int slot_arr_row_len[4],


  float output_vec [8]

)

{_ssdm_SpecArrayDimSize(inp_vec, 8);_ssdm_SpecArrayDimSize(slot_data_arr, 4);_ssdm_SpecArrayDimSize(slot_arr_row_len, 4);_ssdm_SpecArrayDimSize(output_vec, 8);
#pragma HLS TOP name=HLS_CISR_spmv_accel
# 153 "HLS_CISR_spmv_accel.c"





     static int row_len_slot_arr[4][2];

     static int slot_counter[4];



     static int slot_row_counter[4];


     static int slot_row_len_id[4];


     static int max_row_id[1];


     static int slot_row_id[4];


     static float slot_res_arr[4];
   initialize(cmd_start,max_row_id,slot_res_arr,slot_counter,slot_row_counter,slot_row_len_id,slot_row_id,row_len_slot_arr);


    store_row_len_arr(slot_counter,slot_arr_row_len,row_len_slot_arr);


    CISR_decoder(slot_row_counter,row_len_slot_arr,slot_res_arr,slot_row_len_id,slot_row_id,max_row_id);


    compute(slot_data_arr,inp_vec,slot_res_arr,slot_row_counter);


    output_write(output_vec,slot_res_arr,slot_row_id);
# 200 "HLS_CISR_spmv_accel.c"
}
