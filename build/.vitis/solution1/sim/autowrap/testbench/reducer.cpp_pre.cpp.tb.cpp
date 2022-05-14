// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/home/akileshkannan/SPMV_CSR_src/accelerator/reducer.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/akileshkannan/SPMV_CSR_src/accelerator/reducer.cpp"
# 1 "/home/akileshkannan/SPMV_CSR_src/accelerator/reducer.hpp" 1



# 1 "/home/akileshkannan/SPMV_CSR_src/accelerator/constants.hpp" 1
# 5 "/home/akileshkannan/SPMV_CSR_src/accelerator/reducer.hpp" 2
# 1 "/home/akileshkannan/SPMV_CSR_src/accelerator/../encoded_data.hpp" 1
# 6 "/home/akileshkannan/SPMV_CSR_src/accelerator/reducer.hpp" 2

class reducer_data{
 public:
  int value;
  int label;
  reducer_data(int=0, int=0);
};

class reducer_level{
 public:
  int curr_level;
  reducer_data buffer[2];
  int num_items;
  bool valid;
  void add(reducer_data&);
  void insert(reducer_data);
};

class reducer{
 public:
  reducer_level adder_levels[2];
  bool valid;
  void reduce(int&, int, int);
  void set_levels();
};
# 2 "/home/akileshkannan/SPMV_CSR_src/accelerator/reducer.cpp" 2


reducer_data::reducer_data(int value_init, int label_init){
 value = value_init;
 label = label_init;
}


void reducer_level::add(reducer_data &out){
 if(num_items == 2){
  num_items = 0;
  valid = true;
  out.value = buffer[0].value + buffer[1].value;
  out.label = buffer[0].label;
 }
 else if(num_items == 1){
  if(buffer[0].label < (1<<curr_level) + 1){
   num_items = 0;
   valid = true;
   out.value = buffer[0].value;
   out.label = buffer[0].label;
  }
 }
 else if (num_items == 0){
  valid = false;
  out.value = 0;
  out.label = 0;
 }
}


void reducer_level::insert(reducer_data new_data){
 buffer[num_items] = new_data;
 num_items++;
}

void reducer::set_levels(){
 for(int i=0;i<2;i++){
#pragma HLS UNROLL
  adder_levels[i].curr_level = i;
 }
}


void reducer::reduce(int &out, int value, int label){
 reducer_data out_data, level_out, new_data;
 new_data.label = label;
 new_data.value = value;

 adder_levels[0].insert(new_data);
 reducer_loop: for(int b=1;b<2;b++){
#pragma HLS UNROLL
  adder_levels[b-1].add(level_out);
  if(adder_levels[b-1].valid)
   adder_levels[b].insert(level_out);
 }

 adder_levels[2 -1].add(out_data);
 if(adder_levels[2 -1].valid)
  out = out_data.value;
}
