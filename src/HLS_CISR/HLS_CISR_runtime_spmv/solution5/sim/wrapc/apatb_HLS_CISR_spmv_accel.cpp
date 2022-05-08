#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_cmd_start "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_cmd_start.dat"
#define AUTOTB_TVOUT_cmd_start "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvout_cmd_start.dat"
// wrapc file define:
#define AUTOTB_TVIN_inp_vec "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_inp_vec.dat"
#define AUTOTB_TVOUT_inp_vec "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvout_inp_vec.dat"
// wrapc file define:
#define AUTOTB_TVIN_slot_data_arr "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_slot_data_arr.dat"
#define AUTOTB_TVOUT_slot_data_arr "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvout_slot_data_arr.dat"
// wrapc file define:
#define AUTOTB_TVIN_slot_arr_row_len "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_slot_arr_row_len.dat"
#define AUTOTB_TVOUT_slot_arr_row_len "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvout_slot_arr_row_len.dat"
// wrapc file define:
#define AUTOTB_TVIN_output_vec "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_output_vec.dat"
#define AUTOTB_TVOUT_output_vec "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvout_output_vec.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_cmd_start "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvout_cmd_start.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_inp_vec "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvout_inp_vec.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_slot_data_arr "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvout_slot_data_arr.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_slot_arr_row_len "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvout_slot_arr_row_len.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_output_vec "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvout_output_vec.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  cmd_start_depth = 0;
  inp_vec_depth = 0;
  slot_data_arr_depth = 0;
  slot_arr_row_len_depth = 0;
  output_vec_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{cmd_start " << cmd_start_depth << "}\n";
  total_list << "{inp_vec " << inp_vec_depth << "}\n";
  total_list << "{slot_data_arr " << slot_data_arr_depth << "}\n";
  total_list << "{slot_arr_row_len " << slot_arr_row_len_depth << "}\n";
  total_list << "{output_vec " << output_vec_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int cmd_start_depth;
    int inp_vec_depth;
    int slot_data_arr_depth;
    int slot_arr_row_len_depth;
    int output_vec_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void HLS_CISR_spmv_accel_hw_stub_wrapper(char, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_HLS_CISR_spmv_accel_hw(char __xlx_apatb_param_cmd_start, volatile void * __xlx_apatb_param_inp_vec, volatile void * __xlx_apatb_param_slot_data_arr, volatile void * __xlx_apatb_param_slot_arr_row_len, volatile void * __xlx_apatb_param_output_vec) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_output_vec);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > output_vec_pc_buffer(8);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "output_vec");
  
            // push token into output port buffer
            if (AESL_token != "") {
              output_vec_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 8; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_output_vec)[j] = output_vec_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//cmd_start
aesl_fh.touch(AUTOTB_TVIN_cmd_start);
aesl_fh.touch(AUTOTB_TVOUT_cmd_start);
//inp_vec
aesl_fh.touch(AUTOTB_TVIN_inp_vec);
aesl_fh.touch(AUTOTB_TVOUT_inp_vec);
//slot_data_arr
aesl_fh.touch(AUTOTB_TVIN_slot_data_arr);
aesl_fh.touch(AUTOTB_TVOUT_slot_data_arr);
//slot_arr_row_len
aesl_fh.touch(AUTOTB_TVIN_slot_arr_row_len);
aesl_fh.touch(AUTOTB_TVOUT_slot_arr_row_len);
//output_vec
aesl_fh.touch(AUTOTB_TVIN_output_vec);
aesl_fh.touch(AUTOTB_TVOUT_output_vec);
CodeState = DUMP_INPUTS;
// print cmd_start Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_cmd_start, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_cmd_start);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_cmd_start, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.cmd_start_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_cmd_start, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_inp_vec = 0;
// print inp_vec Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_inp_vec, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_inp_vec = 0*4;
  if (__xlx_apatb_param_inp_vec) {
    for (int j = 0  - 0, e = 8 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_inp_vec)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_inp_vec, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8, &tcl_file.inp_vec_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_inp_vec, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_slot_data_arr = 0;
// print slot_data_arr Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_slot_data_arr, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_slot_data_arr = 0*8;
  if (__xlx_apatb_param_slot_data_arr) {
    for (int j = 0  - 0, e = 2 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_slot_data_arr)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_slot_data_arr, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2, &tcl_file.slot_data_arr_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_slot_data_arr, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_slot_arr_row_len = 0;
// print slot_arr_row_len Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_slot_arr_row_len, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_slot_arr_row_len = 0*4;
  if (__xlx_apatb_param_slot_arr_row_len) {
    for (int j = 0  - 0, e = 2 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_slot_arr_row_len)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_slot_arr_row_len, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2, &tcl_file.slot_arr_row_len_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_slot_arr_row_len, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_output_vec = 0;
// print output_vec Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_output_vec, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_output_vec = 0*4;
  if (__xlx_apatb_param_output_vec) {
    for (int j = 0  - 0, e = 8 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_output_vec)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_output_vec, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8, &tcl_file.output_vec_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_output_vec, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
HLS_CISR_spmv_accel_hw_stub_wrapper(__xlx_apatb_param_cmd_start, __xlx_apatb_param_inp_vec, __xlx_apatb_param_slot_data_arr, __xlx_apatb_param_slot_arr_row_len, __xlx_apatb_param_output_vec);
CodeState = DUMP_OUTPUTS;
// print output_vec Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_output_vec, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_output_vec = 0*4;
  if (__xlx_apatb_param_output_vec) {
    for (int j = 0  - 0, e = 8 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_output_vec)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_output_vec, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8, &tcl_file.output_vec_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_output_vec, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
