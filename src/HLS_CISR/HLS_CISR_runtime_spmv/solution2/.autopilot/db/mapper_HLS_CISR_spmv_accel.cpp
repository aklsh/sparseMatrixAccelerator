#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void HLS_CISR_spmv_accel(char, int*, long long*, int*, int*);
extern "C" void apatb_HLS_CISR_spmv_accel_hw(char __xlx_apatb_param_cmd_start, volatile void * __xlx_apatb_param_inp_vec, volatile void * __xlx_apatb_param_slot_data_arr, volatile void * __xlx_apatb_param_slot_arr_row_len, volatile void * __xlx_apatb_param_output_vec) {
  // Collect __xlx_inp_vec__tmp_vec
  vector<sc_bv<32> >__xlx_inp_vec__tmp_vec;
  for (int j = 0, e = 8; j != e; ++j) {
    __xlx_inp_vec__tmp_vec.push_back(((int*)__xlx_apatb_param_inp_vec)[j]);
  }
  int __xlx_size_param_inp_vec = 8;
  int __xlx_offset_param_inp_vec = 0;
  int __xlx_offset_byte_param_inp_vec = 0*4;
  int* __xlx_inp_vec__input_buffer= new int[__xlx_inp_vec__tmp_vec.size()];
  for (int i = 0; i < __xlx_inp_vec__tmp_vec.size(); ++i) {
    __xlx_inp_vec__input_buffer[i] = __xlx_inp_vec__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_slot_data_arr__tmp_vec
  vector<sc_bv<64> >__xlx_slot_data_arr__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    __xlx_slot_data_arr__tmp_vec.push_back(((long long*)__xlx_apatb_param_slot_data_arr)[j]);
  }
  int __xlx_size_param_slot_data_arr = 4;
  int __xlx_offset_param_slot_data_arr = 0;
  int __xlx_offset_byte_param_slot_data_arr = 0*8;
  long long* __xlx_slot_data_arr__input_buffer= new long long[__xlx_slot_data_arr__tmp_vec.size()];
  for (int i = 0; i < __xlx_slot_data_arr__tmp_vec.size(); ++i) {
    __xlx_slot_data_arr__input_buffer[i] = __xlx_slot_data_arr__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_slot_arr_row_len__tmp_vec
  vector<sc_bv<32> >__xlx_slot_arr_row_len__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    __xlx_slot_arr_row_len__tmp_vec.push_back(((int*)__xlx_apatb_param_slot_arr_row_len)[j]);
  }
  int __xlx_size_param_slot_arr_row_len = 4;
  int __xlx_offset_param_slot_arr_row_len = 0;
  int __xlx_offset_byte_param_slot_arr_row_len = 0*4;
  int* __xlx_slot_arr_row_len__input_buffer= new int[__xlx_slot_arr_row_len__tmp_vec.size()];
  for (int i = 0; i < __xlx_slot_arr_row_len__tmp_vec.size(); ++i) {
    __xlx_slot_arr_row_len__input_buffer[i] = __xlx_slot_arr_row_len__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_output_vec__tmp_vec
  vector<sc_bv<32> >__xlx_output_vec__tmp_vec;
  for (int j = 0, e = 8; j != e; ++j) {
    __xlx_output_vec__tmp_vec.push_back(((int*)__xlx_apatb_param_output_vec)[j]);
  }
  int __xlx_size_param_output_vec = 8;
  int __xlx_offset_param_output_vec = 0;
  int __xlx_offset_byte_param_output_vec = 0*4;
  int* __xlx_output_vec__input_buffer= new int[__xlx_output_vec__tmp_vec.size()];
  for (int i = 0; i < __xlx_output_vec__tmp_vec.size(); ++i) {
    __xlx_output_vec__input_buffer[i] = __xlx_output_vec__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  HLS_CISR_spmv_accel(__xlx_apatb_param_cmd_start, __xlx_inp_vec__input_buffer, __xlx_slot_data_arr__input_buffer, __xlx_slot_arr_row_len__input_buffer, __xlx_output_vec__input_buffer);
// print __xlx_apatb_param_inp_vec
  sc_bv<32>*__xlx_inp_vec_output_buffer = new sc_bv<32>[__xlx_size_param_inp_vec];
  for (int i = 0; i < __xlx_size_param_inp_vec; ++i) {
    __xlx_inp_vec_output_buffer[i] = __xlx_inp_vec__input_buffer[i+__xlx_offset_param_inp_vec];
  }
  for (int i = 0; i < __xlx_size_param_inp_vec; ++i) {
    ((int*)__xlx_apatb_param_inp_vec)[i] = __xlx_inp_vec_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_slot_data_arr
  sc_bv<64>*__xlx_slot_data_arr_output_buffer = new sc_bv<64>[__xlx_size_param_slot_data_arr];
  for (int i = 0; i < __xlx_size_param_slot_data_arr; ++i) {
    __xlx_slot_data_arr_output_buffer[i] = __xlx_slot_data_arr__input_buffer[i+__xlx_offset_param_slot_data_arr];
  }
  for (int i = 0; i < __xlx_size_param_slot_data_arr; ++i) {
    ((long long*)__xlx_apatb_param_slot_data_arr)[i] = __xlx_slot_data_arr_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_slot_arr_row_len
  sc_bv<32>*__xlx_slot_arr_row_len_output_buffer = new sc_bv<32>[__xlx_size_param_slot_arr_row_len];
  for (int i = 0; i < __xlx_size_param_slot_arr_row_len; ++i) {
    __xlx_slot_arr_row_len_output_buffer[i] = __xlx_slot_arr_row_len__input_buffer[i+__xlx_offset_param_slot_arr_row_len];
  }
  for (int i = 0; i < __xlx_size_param_slot_arr_row_len; ++i) {
    ((int*)__xlx_apatb_param_slot_arr_row_len)[i] = __xlx_slot_arr_row_len_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_output_vec
  sc_bv<32>*__xlx_output_vec_output_buffer = new sc_bv<32>[__xlx_size_param_output_vec];
  for (int i = 0; i < __xlx_size_param_output_vec; ++i) {
    __xlx_output_vec_output_buffer[i] = __xlx_output_vec__input_buffer[i+__xlx_offset_param_output_vec];
  }
  for (int i = 0; i < __xlx_size_param_output_vec; ++i) {
    ((int*)__xlx_apatb_param_output_vec)[i] = __xlx_output_vec_output_buffer[i].to_uint64();
  }
}
