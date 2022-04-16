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
extern "C" void HLS_CISR_spmv_accel(char, volatile void *, volatile void *, volatile void *, volatile void *);
extern "C" void apatb_HLS_CISR_spmv_accel_hw(char __xlx_apatb_param_cmd_start, volatile void * __xlx_apatb_param_inp_vec, volatile void * __xlx_apatb_param_slot_data_arr, volatile void * __xlx_apatb_param_slot_arr_row_len, volatile void * __xlx_apatb_param_output_vec) {
  // DUT call
  HLS_CISR_spmv_accel(__xlx_apatb_param_cmd_start, __xlx_apatb_param_inp_vec, __xlx_apatb_param_slot_data_arr, __xlx_apatb_param_slot_arr_row_len, __xlx_apatb_param_output_vec);
}
