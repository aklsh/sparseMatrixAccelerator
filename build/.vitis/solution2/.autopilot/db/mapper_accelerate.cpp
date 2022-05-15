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
extern "C" void accelerate(volatile void *, int*, int*, char*, int, int*, char);
extern "C" void apatb_accelerate_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_subrow_vals, volatile void * __xlx_apatb_param_subrow_col_indices, volatile void * __xlx_apatb_param_mult_enables, int __xlx_apatb_param_label_r, volatile void * __xlx_apatb_param_init_vector, char __xlx_apatb_param_init) {
  // Collect __xlx_subrow_vals__tmp_vec
  vector<sc_bv<32> >__xlx_subrow_vals__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_subrow_vals)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_subrow_vals)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_subrow_vals)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_subrow_vals)[j*4+3];
    __xlx_subrow_vals__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_subrow_vals = 4;
  int __xlx_offset_param_subrow_vals = 0;
  int __xlx_offset_byte_param_subrow_vals = 0*4;
  int* __xlx_subrow_vals__input_buffer= new int[__xlx_subrow_vals__tmp_vec.size()];
  for (int i = 0; i < __xlx_subrow_vals__tmp_vec.size(); ++i) {
    __xlx_subrow_vals__input_buffer[i] = __xlx_subrow_vals__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_subrow_col_indices__tmp_vec
  vector<sc_bv<32> >__xlx_subrow_col_indices__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_subrow_col_indices)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_subrow_col_indices)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_subrow_col_indices)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_subrow_col_indices)[j*4+3];
    __xlx_subrow_col_indices__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_subrow_col_indices = 4;
  int __xlx_offset_param_subrow_col_indices = 0;
  int __xlx_offset_byte_param_subrow_col_indices = 0*4;
  int* __xlx_subrow_col_indices__input_buffer= new int[__xlx_subrow_col_indices__tmp_vec.size()];
  for (int i = 0; i < __xlx_subrow_col_indices__tmp_vec.size(); ++i) {
    __xlx_subrow_col_indices__input_buffer[i] = __xlx_subrow_col_indices__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_mult_enables__tmp_vec
  vector<sc_bv<1> >__xlx_mult_enables__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    __xlx_mult_enables__tmp_vec.push_back(((char*)__xlx_apatb_param_mult_enables)[j]);
  }
  int __xlx_size_param_mult_enables = 4;
  int __xlx_offset_param_mult_enables = 0;
  int __xlx_offset_byte_param_mult_enables = 0*1;
  char* __xlx_mult_enables__input_buffer= new char[__xlx_mult_enables__tmp_vec.size()];
  for (int i = 0; i < __xlx_mult_enables__tmp_vec.size(); ++i) {
    __xlx_mult_enables__input_buffer[i] = __xlx_mult_enables__tmp_vec[i].range(0, 0).to_uint64();
  }
  // Collect __xlx_init_vector__tmp_vec
  vector<sc_bv<32> >__xlx_init_vector__tmp_vec;
  for (int j = 0, e = 23; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_init_vector)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_init_vector)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_init_vector)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_init_vector)[j*4+3];
    __xlx_init_vector__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_init_vector = 23;
  int __xlx_offset_param_init_vector = 0;
  int __xlx_offset_byte_param_init_vector = 0*4;
  int* __xlx_init_vector__input_buffer= new int[__xlx_init_vector__tmp_vec.size()];
  for (int i = 0; i < __xlx_init_vector__tmp_vec.size(); ++i) {
    __xlx_init_vector__input_buffer[i] = __xlx_init_vector__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  accelerate(__xlx_apatb_param_out_r, __xlx_subrow_vals__input_buffer, __xlx_subrow_col_indices__input_buffer, __xlx_mult_enables__input_buffer, __xlx_apatb_param_label_r, __xlx_init_vector__input_buffer, __xlx_apatb_param_init);
// print __xlx_apatb_param_subrow_vals
  sc_bv<32>*__xlx_subrow_vals_output_buffer = new sc_bv<32>[__xlx_size_param_subrow_vals];
  for (int i = 0; i < __xlx_size_param_subrow_vals; ++i) {
    __xlx_subrow_vals_output_buffer[i] = __xlx_subrow_vals__input_buffer[i+__xlx_offset_param_subrow_vals];
  }
  for (int i = 0; i < __xlx_size_param_subrow_vals; ++i) {
    ((char*)__xlx_apatb_param_subrow_vals)[i*4+0] = __xlx_subrow_vals_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_subrow_vals)[i*4+1] = __xlx_subrow_vals_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_subrow_vals)[i*4+2] = __xlx_subrow_vals_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_subrow_vals)[i*4+3] = __xlx_subrow_vals_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_subrow_col_indices
  sc_bv<32>*__xlx_subrow_col_indices_output_buffer = new sc_bv<32>[__xlx_size_param_subrow_col_indices];
  for (int i = 0; i < __xlx_size_param_subrow_col_indices; ++i) {
    __xlx_subrow_col_indices_output_buffer[i] = __xlx_subrow_col_indices__input_buffer[i+__xlx_offset_param_subrow_col_indices];
  }
  for (int i = 0; i < __xlx_size_param_subrow_col_indices; ++i) {
    ((char*)__xlx_apatb_param_subrow_col_indices)[i*4+0] = __xlx_subrow_col_indices_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_subrow_col_indices)[i*4+1] = __xlx_subrow_col_indices_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_subrow_col_indices)[i*4+2] = __xlx_subrow_col_indices_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_subrow_col_indices)[i*4+3] = __xlx_subrow_col_indices_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_mult_enables
  sc_bv<1>*__xlx_mult_enables_output_buffer = new sc_bv<1>[__xlx_size_param_mult_enables];
  for (int i = 0; i < __xlx_size_param_mult_enables; ++i) {
    __xlx_mult_enables_output_buffer[i] = __xlx_mult_enables__input_buffer[i+__xlx_offset_param_mult_enables];
  }
  for (int i = 0; i < __xlx_size_param_mult_enables; ++i) {
    ((char*)__xlx_apatb_param_mult_enables)[i] = __xlx_mult_enables_output_buffer[i].to_uint();
  }
// print __xlx_apatb_param_init_vector
  sc_bv<32>*__xlx_init_vector_output_buffer = new sc_bv<32>[__xlx_size_param_init_vector];
  for (int i = 0; i < __xlx_size_param_init_vector; ++i) {
    __xlx_init_vector_output_buffer[i] = __xlx_init_vector__input_buffer[i+__xlx_offset_param_init_vector];
  }
  for (int i = 0; i < __xlx_size_param_init_vector; ++i) {
    ((char*)__xlx_apatb_param_init_vector)[i*4+0] = __xlx_init_vector_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_init_vector)[i*4+1] = __xlx_init_vector_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_init_vector)[i*4+2] = __xlx_init_vector_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_init_vector)[i*4+3] = __xlx_init_vector_output_buffer[i].range(31, 24).to_uint();
  }
}
