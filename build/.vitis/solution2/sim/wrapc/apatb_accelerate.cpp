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
#define AUTOTB_TVIN_out_r "../tv/cdatafile/c.accelerate.autotvin_out_r.dat"
#define AUTOTB_TVOUT_out_r "../tv/cdatafile/c.accelerate.autotvout_out_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_vals "../tv/cdatafile/c.accelerate.autotvin_subrow_vals.dat"
#define AUTOTB_TVOUT_subrow_vals "../tv/cdatafile/c.accelerate.autotvout_subrow_vals.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_col_indices "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices.dat"
#define AUTOTB_TVOUT_subrow_col_indices "../tv/cdatafile/c.accelerate.autotvout_subrow_col_indices.dat"
// wrapc file define:
#define AUTOTB_TVIN_mult_enables "../tv/cdatafile/c.accelerate.autotvin_mult_enables.dat"
#define AUTOTB_TVOUT_mult_enables "../tv/cdatafile/c.accelerate.autotvout_mult_enables.dat"
// wrapc file define:
#define AUTOTB_TVIN_label_r "../tv/cdatafile/c.accelerate.autotvin_label_r.dat"
#define AUTOTB_TVOUT_label_r "../tv/cdatafile/c.accelerate.autotvout_label_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector "../tv/cdatafile/c.accelerate.autotvin_init_vector.dat"
#define AUTOTB_TVOUT_init_vector "../tv/cdatafile/c.accelerate.autotvout_init_vector.dat"
// wrapc file define:
#define AUTOTB_TVIN_init "../tv/cdatafile/c.accelerate.autotvin_init.dat"
#define AUTOTB_TVOUT_init "../tv/cdatafile/c.accelerate.autotvout_init.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_out_r "../tv/rtldatafile/rtl.accelerate.autotvout_out_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_vals "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_vals.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_col_indices "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_col_indices.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_mult_enables "../tv/rtldatafile/rtl.accelerate.autotvout_mult_enables.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_label_r "../tv/rtldatafile/rtl.accelerate.autotvout_label_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init "../tv/rtldatafile/rtl.accelerate.autotvout_init.dat"


inline void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    vp = (p_dat) (p+dbytes);
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};
      

inline const std::string begin_str(int num)
{
  return std::string("[[transaction]] ")
         .append(std::to_string(num))
         .append("\n");
}

inline const std::string end_str()
{
  return std::string("[[/transaction]] \n");
}
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  out_r_depth = 0;
  subrow_vals_depth = 0;
  subrow_col_indices_depth = 0;
  mult_enables_depth = 0;
  label_r_depth = 0;
  init_vector_depth = 0;
  init_depth = 0;
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
  total_list << "{out_r " << out_r_depth << "}\n";
  total_list << "{subrow_vals " << subrow_vals_depth << "}\n";
  total_list << "{subrow_col_indices " << subrow_col_indices_depth << "}\n";
  total_list << "{mult_enables " << mult_enables_depth << "}\n";
  total_list << "{label_r " << label_r_depth << "}\n";
  total_list << "{init_vector " << init_vector_depth << "}\n";
  total_list << "{init " << init_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int out_r_depth;
    int subrow_vals_depth;
    int subrow_col_indices_depth;
    int mult_enables_depth;
    int label_r_depth;
    int init_vector_depth;
    int init_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static bool RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool err = false;
  size_t x_found;

  // search and replace 'X' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('X', 0)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  // search and replace 'x' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('x', 2)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  return err;}
extern "C" void accelerate_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, int, volatile void *, char);

extern "C" void apatb_accelerate_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_subrow_vals, volatile void * __xlx_apatb_param_subrow_col_indices, volatile void * __xlx_apatb_param_mult_enables, int __xlx_apatb_param_label_r, volatile void * __xlx_apatb_param_init_vector, char __xlx_apatb_param_init) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_r);
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
          std::vector<sc_bv<32> > out_r_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "out_r");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_r_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "out_r" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_out_r)[0*4+0] = out_r_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_out_r)[0*4+1] = out_r_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_out_r)[0*4+2] = out_r_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_out_r)[0*4+3] = out_r_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
// print out_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_out_r, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_out_r);
aesl_fh.write(AUTOTB_TVIN_out_r, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.out_r_depth);
aesl_fh.write(AUTOTB_TVIN_out_r, end_str());
}

unsigned __xlx_offset_byte_param_subrow_vals = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_subrow_vals, 'b');
transaction<32> tr(4);
  __xlx_offset_byte_param_subrow_vals = 0*4;
  if (__xlx_apatb_param_subrow_vals) {
tr.import<4>((char*)__xlx_apatb_param_subrow_vals, 4, 0);
  }
tr.reorder();
aesl_fh.write(AUTOTB_TVIN_subrow_vals, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.subrow_vals_depth);
#else
// print subrow_vals Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_vals, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_subrow_vals = 0*4;
  if (__xlx_apatb_param_subrow_vals) {
    for (int j = 0  - 0, e = 4 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_subrow_vals)[j];
aesl_fh.write(AUTOTB_TVIN_subrow_vals, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }
}

  tcl_file.set_num(4, &tcl_file.subrow_vals_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_vals, end_str());
}

#endif
unsigned __xlx_offset_byte_param_subrow_col_indices = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_subrow_col_indices, 'b');
transaction<32> tr(4);
  __xlx_offset_byte_param_subrow_col_indices = 0*4;
  if (__xlx_apatb_param_subrow_col_indices) {
tr.import<4>((char*)__xlx_apatb_param_subrow_col_indices, 4, 0);
  }
tr.reorder();
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.subrow_col_indices_depth);
#else
// print subrow_col_indices Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_subrow_col_indices = 0*4;
  if (__xlx_apatb_param_subrow_col_indices) {
    for (int j = 0  - 0, e = 4 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_subrow_col_indices)[j];
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }
}

  tcl_file.set_num(4, &tcl_file.subrow_col_indices_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices, end_str());
}

#endif
unsigned __xlx_offset_byte_param_mult_enables = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_mult_enables, 'b');
transaction<1> tr(4);
  __xlx_offset_byte_param_mult_enables = 0*1;
  if (__xlx_apatb_param_mult_enables) {
tr.import<1>((char*)__xlx_apatb_param_mult_enables, 4, 0);
  }
tr.reorder();
aesl_fh.write(AUTOTB_TVIN_mult_enables, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.mult_enables_depth);
#else
// print mult_enables Transactions
{
aesl_fh.write(AUTOTB_TVIN_mult_enables, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_mult_enables = 0*1;
  if (__xlx_apatb_param_mult_enables) {
    for (int j = 0  - 0, e = 4 - 0; j != e; ++j) {
sc_bv<1> __xlx_tmp_lv = ((char*)__xlx_apatb_param_mult_enables)[j];
aesl_fh.write(AUTOTB_TVIN_mult_enables, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }
}

  tcl_file.set_num(4, &tcl_file.mult_enables_depth);
aesl_fh.write(AUTOTB_TVIN_mult_enables, end_str());
}

#endif
// print label_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_label_r, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_label_r);
aesl_fh.write(AUTOTB_TVIN_label_r, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.label_r_depth);
aesl_fh.write(AUTOTB_TVIN_label_r, end_str());
}

unsigned __xlx_offset_byte_param_init_vector = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_init_vector, 'b');
transaction<32> tr(23);
  __xlx_offset_byte_param_init_vector = 0*4;
  if (__xlx_apatb_param_init_vector) {
tr.import<4>((char*)__xlx_apatb_param_init_vector, 23, 0);
  }
tr.reorder();
aesl_fh.write(AUTOTB_TVIN_init_vector, tr.p, tr.tbytes);
}

  tcl_file.set_num(23, &tcl_file.init_vector_depth);
#else
// print init_vector Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_init_vector = 0*4;
  if (__xlx_apatb_param_init_vector) {
    for (int j = 0  - 0, e = 23 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_init_vector)[j];
aesl_fh.write(AUTOTB_TVIN_init_vector, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }
}

  tcl_file.set_num(23, &tcl_file.init_vector_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector, end_str());
}

#endif
// print init Transactions
{
aesl_fh.write(AUTOTB_TVIN_init, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_init);
aesl_fh.write(AUTOTB_TVIN_init, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_depth);
aesl_fh.write(AUTOTB_TVIN_init, end_str());
}

CodeState = CALL_C_DUT;
accelerate_hw_stub_wrapper(__xlx_apatb_param_out_r, __xlx_apatb_param_subrow_vals, __xlx_apatb_param_subrow_col_indices, __xlx_apatb_param_mult_enables, __xlx_apatb_param_label_r, __xlx_apatb_param_init_vector, __xlx_apatb_param_init);
CodeState = DUMP_OUTPUTS;
// print out_r Transactions
{
aesl_fh.write(AUTOTB_TVOUT_out_r, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_out_r);
aesl_fh.write(AUTOTB_TVOUT_out_r, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.out_r_depth);
aesl_fh.write(AUTOTB_TVOUT_out_r, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
