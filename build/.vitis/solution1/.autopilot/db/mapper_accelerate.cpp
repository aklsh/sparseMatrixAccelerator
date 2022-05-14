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
extern "C" void accelerate(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, char);
extern "C" void apatb_accelerate_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_subrow_vals_0, volatile void * __xlx_apatb_param_subrow_vals_1, volatile void * __xlx_apatb_param_subrow_vals_2, volatile void * __xlx_apatb_param_subrow_vals_3, volatile void * __xlx_apatb_param_subrow_col_indices_0, volatile void * __xlx_apatb_param_subrow_col_indices_1, volatile void * __xlx_apatb_param_subrow_col_indices_2, volatile void * __xlx_apatb_param_subrow_col_indices_3, volatile void * __xlx_apatb_param_mult_enables_0, volatile void * __xlx_apatb_param_mult_enables_1, volatile void * __xlx_apatb_param_mult_enables_2, volatile void * __xlx_apatb_param_mult_enables_3, int __xlx_apatb_param_label_r, volatile void * __xlx_apatb_param_init_vector_0, volatile void * __xlx_apatb_param_init_vector_1, volatile void * __xlx_apatb_param_init_vector_2, volatile void * __xlx_apatb_param_init_vector_3, volatile void * __xlx_apatb_param_init_vector_4, volatile void * __xlx_apatb_param_init_vector_5, volatile void * __xlx_apatb_param_init_vector_6, volatile void * __xlx_apatb_param_init_vector_7, volatile void * __xlx_apatb_param_init_vector_8, volatile void * __xlx_apatb_param_init_vector_9, volatile void * __xlx_apatb_param_init_vector_10, volatile void * __xlx_apatb_param_init_vector_11, volatile void * __xlx_apatb_param_init_vector_12, volatile void * __xlx_apatb_param_init_vector_13, volatile void * __xlx_apatb_param_init_vector_14, volatile void * __xlx_apatb_param_init_vector_15, volatile void * __xlx_apatb_param_init_vector_16, volatile void * __xlx_apatb_param_init_vector_17, volatile void * __xlx_apatb_param_init_vector_18, volatile void * __xlx_apatb_param_init_vector_19, volatile void * __xlx_apatb_param_init_vector_20, volatile void * __xlx_apatb_param_init_vector_21, volatile void * __xlx_apatb_param_init_vector_22, char __xlx_apatb_param_init) {
  // DUT call
  accelerate(__xlx_apatb_param_out_r, __xlx_apatb_param_subrow_vals_0, __xlx_apatb_param_subrow_vals_1, __xlx_apatb_param_subrow_vals_2, __xlx_apatb_param_subrow_vals_3, __xlx_apatb_param_subrow_col_indices_0, __xlx_apatb_param_subrow_col_indices_1, __xlx_apatb_param_subrow_col_indices_2, __xlx_apatb_param_subrow_col_indices_3, __xlx_apatb_param_mult_enables_0, __xlx_apatb_param_mult_enables_1, __xlx_apatb_param_mult_enables_2, __xlx_apatb_param_mult_enables_3, __xlx_apatb_param_label_r, __xlx_apatb_param_init_vector_0, __xlx_apatb_param_init_vector_1, __xlx_apatb_param_init_vector_2, __xlx_apatb_param_init_vector_3, __xlx_apatb_param_init_vector_4, __xlx_apatb_param_init_vector_5, __xlx_apatb_param_init_vector_6, __xlx_apatb_param_init_vector_7, __xlx_apatb_param_init_vector_8, __xlx_apatb_param_init_vector_9, __xlx_apatb_param_init_vector_10, __xlx_apatb_param_init_vector_11, __xlx_apatb_param_init_vector_12, __xlx_apatb_param_init_vector_13, __xlx_apatb_param_init_vector_14, __xlx_apatb_param_init_vector_15, __xlx_apatb_param_init_vector_16, __xlx_apatb_param_init_vector_17, __xlx_apatb_param_init_vector_18, __xlx_apatb_param_init_vector_19, __xlx_apatb_param_init_vector_20, __xlx_apatb_param_init_vector_21, __xlx_apatb_param_init_vector_22, __xlx_apatb_param_init);
}
