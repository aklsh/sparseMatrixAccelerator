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
extern "C" void accelerate(volatile void *, volatile void *, volatile void *, char*, int, char, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);
extern "C" void apatb_accelerate_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_subrow_vals, volatile void * __xlx_apatb_param_subrow_col_indices, volatile void * __xlx_apatb_param_mult_enables, int __xlx_apatb_param_label_r, char __xlx_apatb_param_init_vector, volatile void * __xlx_apatb_param_vector_0, volatile void * __xlx_apatb_param_vector_1, volatile void * __xlx_apatb_param_vector_2, volatile void * __xlx_apatb_param_vector_3, volatile void * __xlx_apatb_param_vector_4, volatile void * __xlx_apatb_param_vector_5, volatile void * __xlx_apatb_param_vector_6, volatile void * __xlx_apatb_param_vector_7, volatile void * __xlx_apatb_param_vector_8, volatile void * __xlx_apatb_param_vector_9, volatile void * __xlx_apatb_param_vector_10, volatile void * __xlx_apatb_param_vector_11, volatile void * __xlx_apatb_param_vector_12, volatile void * __xlx_apatb_param_vector_13, volatile void * __xlx_apatb_param_vector_14, volatile void * __xlx_apatb_param_vector_15, volatile void * __xlx_apatb_param_vector_16, volatile void * __xlx_apatb_param_vector_17, volatile void * __xlx_apatb_param_vector_18, volatile void * __xlx_apatb_param_vector_19, volatile void * __xlx_apatb_param_vector_20, volatile void * __xlx_apatb_param_vector_21, volatile void * __xlx_apatb_param_vector_22) {
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
  // DUT call
  accelerate(__xlx_apatb_param_out_r, __xlx_apatb_param_subrow_vals, __xlx_apatb_param_subrow_col_indices, __xlx_mult_enables__input_buffer, __xlx_apatb_param_label_r, __xlx_apatb_param_init_vector, __xlx_apatb_param_vector_0, __xlx_apatb_param_vector_1, __xlx_apatb_param_vector_2, __xlx_apatb_param_vector_3, __xlx_apatb_param_vector_4, __xlx_apatb_param_vector_5, __xlx_apatb_param_vector_6, __xlx_apatb_param_vector_7, __xlx_apatb_param_vector_8, __xlx_apatb_param_vector_9, __xlx_apatb_param_vector_10, __xlx_apatb_param_vector_11, __xlx_apatb_param_vector_12, __xlx_apatb_param_vector_13, __xlx_apatb_param_vector_14, __xlx_apatb_param_vector_15, __xlx_apatb_param_vector_16, __xlx_apatb_param_vector_17, __xlx_apatb_param_vector_18, __xlx_apatb_param_vector_19, __xlx_apatb_param_vector_20, __xlx_apatb_param_vector_21, __xlx_apatb_param_vector_22);
// print __xlx_apatb_param_mult_enables
  sc_bv<1>*__xlx_mult_enables_output_buffer = new sc_bv<1>[__xlx_size_param_mult_enables];
  for (int i = 0; i < __xlx_size_param_mult_enables; ++i) {
    __xlx_mult_enables_output_buffer[i] = __xlx_mult_enables__input_buffer[i+__xlx_offset_param_mult_enables];
  }
  for (int i = 0; i < __xlx_size_param_mult_enables; ++i) {
    ((char*)__xlx_apatb_param_mult_enables)[i] = __xlx_mult_enables_output_buffer[i].to_uint();
  }
}
