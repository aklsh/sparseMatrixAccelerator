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
#define AUTOTB_TVIN_subrow_vals_0 "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_0.dat"
#define AUTOTB_TVOUT_subrow_vals_0 "../tv/cdatafile/c.accelerate.autotvout_subrow_vals_0.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_vals_1 "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_1.dat"
#define AUTOTB_TVOUT_subrow_vals_1 "../tv/cdatafile/c.accelerate.autotvout_subrow_vals_1.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_vals_2 "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_2.dat"
#define AUTOTB_TVOUT_subrow_vals_2 "../tv/cdatafile/c.accelerate.autotvout_subrow_vals_2.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_vals_3 "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_3.dat"
#define AUTOTB_TVOUT_subrow_vals_3 "../tv/cdatafile/c.accelerate.autotvout_subrow_vals_3.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_col_indices_0 "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_0.dat"
#define AUTOTB_TVOUT_subrow_col_indices_0 "../tv/cdatafile/c.accelerate.autotvout_subrow_col_indices_0.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_col_indices_1 "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_1.dat"
#define AUTOTB_TVOUT_subrow_col_indices_1 "../tv/cdatafile/c.accelerate.autotvout_subrow_col_indices_1.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_col_indices_2 "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_2.dat"
#define AUTOTB_TVOUT_subrow_col_indices_2 "../tv/cdatafile/c.accelerate.autotvout_subrow_col_indices_2.dat"
// wrapc file define:
#define AUTOTB_TVIN_subrow_col_indices_3 "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_3.dat"
#define AUTOTB_TVOUT_subrow_col_indices_3 "../tv/cdatafile/c.accelerate.autotvout_subrow_col_indices_3.dat"
// wrapc file define:
#define AUTOTB_TVIN_mult_enables_0 "../tv/cdatafile/c.accelerate.autotvin_mult_enables_0.dat"
#define AUTOTB_TVOUT_mult_enables_0 "../tv/cdatafile/c.accelerate.autotvout_mult_enables_0.dat"
// wrapc file define:
#define AUTOTB_TVIN_mult_enables_1 "../tv/cdatafile/c.accelerate.autotvin_mult_enables_1.dat"
#define AUTOTB_TVOUT_mult_enables_1 "../tv/cdatafile/c.accelerate.autotvout_mult_enables_1.dat"
// wrapc file define:
#define AUTOTB_TVIN_mult_enables_2 "../tv/cdatafile/c.accelerate.autotvin_mult_enables_2.dat"
#define AUTOTB_TVOUT_mult_enables_2 "../tv/cdatafile/c.accelerate.autotvout_mult_enables_2.dat"
// wrapc file define:
#define AUTOTB_TVIN_mult_enables_3 "../tv/cdatafile/c.accelerate.autotvin_mult_enables_3.dat"
#define AUTOTB_TVOUT_mult_enables_3 "../tv/cdatafile/c.accelerate.autotvout_mult_enables_3.dat"
// wrapc file define:
#define AUTOTB_TVIN_label_r "../tv/cdatafile/c.accelerate.autotvin_label_r.dat"
#define AUTOTB_TVOUT_label_r "../tv/cdatafile/c.accelerate.autotvout_label_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_0 "../tv/cdatafile/c.accelerate.autotvin_init_vector_0.dat"
#define AUTOTB_TVOUT_init_vector_0 "../tv/cdatafile/c.accelerate.autotvout_init_vector_0.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_1 "../tv/cdatafile/c.accelerate.autotvin_init_vector_1.dat"
#define AUTOTB_TVOUT_init_vector_1 "../tv/cdatafile/c.accelerate.autotvout_init_vector_1.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_2 "../tv/cdatafile/c.accelerate.autotvin_init_vector_2.dat"
#define AUTOTB_TVOUT_init_vector_2 "../tv/cdatafile/c.accelerate.autotvout_init_vector_2.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_3 "../tv/cdatafile/c.accelerate.autotvin_init_vector_3.dat"
#define AUTOTB_TVOUT_init_vector_3 "../tv/cdatafile/c.accelerate.autotvout_init_vector_3.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_4 "../tv/cdatafile/c.accelerate.autotvin_init_vector_4.dat"
#define AUTOTB_TVOUT_init_vector_4 "../tv/cdatafile/c.accelerate.autotvout_init_vector_4.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_5 "../tv/cdatafile/c.accelerate.autotvin_init_vector_5.dat"
#define AUTOTB_TVOUT_init_vector_5 "../tv/cdatafile/c.accelerate.autotvout_init_vector_5.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_6 "../tv/cdatafile/c.accelerate.autotvin_init_vector_6.dat"
#define AUTOTB_TVOUT_init_vector_6 "../tv/cdatafile/c.accelerate.autotvout_init_vector_6.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_7 "../tv/cdatafile/c.accelerate.autotvin_init_vector_7.dat"
#define AUTOTB_TVOUT_init_vector_7 "../tv/cdatafile/c.accelerate.autotvout_init_vector_7.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_8 "../tv/cdatafile/c.accelerate.autotvin_init_vector_8.dat"
#define AUTOTB_TVOUT_init_vector_8 "../tv/cdatafile/c.accelerate.autotvout_init_vector_8.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_9 "../tv/cdatafile/c.accelerate.autotvin_init_vector_9.dat"
#define AUTOTB_TVOUT_init_vector_9 "../tv/cdatafile/c.accelerate.autotvout_init_vector_9.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_10 "../tv/cdatafile/c.accelerate.autotvin_init_vector_10.dat"
#define AUTOTB_TVOUT_init_vector_10 "../tv/cdatafile/c.accelerate.autotvout_init_vector_10.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_11 "../tv/cdatafile/c.accelerate.autotvin_init_vector_11.dat"
#define AUTOTB_TVOUT_init_vector_11 "../tv/cdatafile/c.accelerate.autotvout_init_vector_11.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_12 "../tv/cdatafile/c.accelerate.autotvin_init_vector_12.dat"
#define AUTOTB_TVOUT_init_vector_12 "../tv/cdatafile/c.accelerate.autotvout_init_vector_12.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_13 "../tv/cdatafile/c.accelerate.autotvin_init_vector_13.dat"
#define AUTOTB_TVOUT_init_vector_13 "../tv/cdatafile/c.accelerate.autotvout_init_vector_13.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_14 "../tv/cdatafile/c.accelerate.autotvin_init_vector_14.dat"
#define AUTOTB_TVOUT_init_vector_14 "../tv/cdatafile/c.accelerate.autotvout_init_vector_14.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_15 "../tv/cdatafile/c.accelerate.autotvin_init_vector_15.dat"
#define AUTOTB_TVOUT_init_vector_15 "../tv/cdatafile/c.accelerate.autotvout_init_vector_15.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_16 "../tv/cdatafile/c.accelerate.autotvin_init_vector_16.dat"
#define AUTOTB_TVOUT_init_vector_16 "../tv/cdatafile/c.accelerate.autotvout_init_vector_16.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_17 "../tv/cdatafile/c.accelerate.autotvin_init_vector_17.dat"
#define AUTOTB_TVOUT_init_vector_17 "../tv/cdatafile/c.accelerate.autotvout_init_vector_17.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_18 "../tv/cdatafile/c.accelerate.autotvin_init_vector_18.dat"
#define AUTOTB_TVOUT_init_vector_18 "../tv/cdatafile/c.accelerate.autotvout_init_vector_18.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_19 "../tv/cdatafile/c.accelerate.autotvin_init_vector_19.dat"
#define AUTOTB_TVOUT_init_vector_19 "../tv/cdatafile/c.accelerate.autotvout_init_vector_19.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_20 "../tv/cdatafile/c.accelerate.autotvin_init_vector_20.dat"
#define AUTOTB_TVOUT_init_vector_20 "../tv/cdatafile/c.accelerate.autotvout_init_vector_20.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_21 "../tv/cdatafile/c.accelerate.autotvin_init_vector_21.dat"
#define AUTOTB_TVOUT_init_vector_21 "../tv/cdatafile/c.accelerate.autotvout_init_vector_21.dat"
// wrapc file define:
#define AUTOTB_TVIN_init_vector_22 "../tv/cdatafile/c.accelerate.autotvin_init_vector_22.dat"
#define AUTOTB_TVOUT_init_vector_22 "../tv/cdatafile/c.accelerate.autotvout_init_vector_22.dat"
// wrapc file define:
#define AUTOTB_TVIN_init "../tv/cdatafile/c.accelerate.autotvin_init.dat"
#define AUTOTB_TVOUT_init "../tv/cdatafile/c.accelerate.autotvout_init.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_out_r "../tv/rtldatafile/rtl.accelerate.autotvout_out_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_vals_0 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_vals_0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_vals_1 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_vals_1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_vals_2 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_vals_2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_vals_3 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_vals_3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_col_indices_0 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_col_indices_0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_col_indices_1 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_col_indices_1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_col_indices_2 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_col_indices_2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_subrow_col_indices_3 "../tv/rtldatafile/rtl.accelerate.autotvout_subrow_col_indices_3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_mult_enables_0 "../tv/rtldatafile/rtl.accelerate.autotvout_mult_enables_0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_mult_enables_1 "../tv/rtldatafile/rtl.accelerate.autotvout_mult_enables_1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_mult_enables_2 "../tv/rtldatafile/rtl.accelerate.autotvout_mult_enables_2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_mult_enables_3 "../tv/rtldatafile/rtl.accelerate.autotvout_mult_enables_3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_label_r "../tv/rtldatafile/rtl.accelerate.autotvout_label_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_0 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_1 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_2 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_3 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_4 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_4.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_5 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_5.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_6 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_6.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_7 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_7.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_8 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_8.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_9 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_9.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_10 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_10.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_11 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_11.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_12 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_12.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_13 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_13.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_14 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_14.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_15 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_15.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_16 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_16.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_17 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_17.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_18 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_18.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_19 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_19.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_20 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_20.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_21 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_21.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init_vector_22 "../tv/rtldatafile/rtl.accelerate.autotvout_init_vector_22.dat"
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
  subrow_vals_0_depth = 0;
  subrow_vals_1_depth = 0;
  subrow_vals_2_depth = 0;
  subrow_vals_3_depth = 0;
  subrow_col_indices_0_depth = 0;
  subrow_col_indices_1_depth = 0;
  subrow_col_indices_2_depth = 0;
  subrow_col_indices_3_depth = 0;
  mult_enables_0_depth = 0;
  mult_enables_1_depth = 0;
  mult_enables_2_depth = 0;
  mult_enables_3_depth = 0;
  label_r_depth = 0;
  init_vector_0_depth = 0;
  init_vector_1_depth = 0;
  init_vector_2_depth = 0;
  init_vector_3_depth = 0;
  init_vector_4_depth = 0;
  init_vector_5_depth = 0;
  init_vector_6_depth = 0;
  init_vector_7_depth = 0;
  init_vector_8_depth = 0;
  init_vector_9_depth = 0;
  init_vector_10_depth = 0;
  init_vector_11_depth = 0;
  init_vector_12_depth = 0;
  init_vector_13_depth = 0;
  init_vector_14_depth = 0;
  init_vector_15_depth = 0;
  init_vector_16_depth = 0;
  init_vector_17_depth = 0;
  init_vector_18_depth = 0;
  init_vector_19_depth = 0;
  init_vector_20_depth = 0;
  init_vector_21_depth = 0;
  init_vector_22_depth = 0;
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
  total_list << "{subrow_vals_0 " << subrow_vals_0_depth << "}\n";
  total_list << "{subrow_vals_1 " << subrow_vals_1_depth << "}\n";
  total_list << "{subrow_vals_2 " << subrow_vals_2_depth << "}\n";
  total_list << "{subrow_vals_3 " << subrow_vals_3_depth << "}\n";
  total_list << "{subrow_col_indices_0 " << subrow_col_indices_0_depth << "}\n";
  total_list << "{subrow_col_indices_1 " << subrow_col_indices_1_depth << "}\n";
  total_list << "{subrow_col_indices_2 " << subrow_col_indices_2_depth << "}\n";
  total_list << "{subrow_col_indices_3 " << subrow_col_indices_3_depth << "}\n";
  total_list << "{mult_enables_0 " << mult_enables_0_depth << "}\n";
  total_list << "{mult_enables_1 " << mult_enables_1_depth << "}\n";
  total_list << "{mult_enables_2 " << mult_enables_2_depth << "}\n";
  total_list << "{mult_enables_3 " << mult_enables_3_depth << "}\n";
  total_list << "{label_r " << label_r_depth << "}\n";
  total_list << "{init_vector_0 " << init_vector_0_depth << "}\n";
  total_list << "{init_vector_1 " << init_vector_1_depth << "}\n";
  total_list << "{init_vector_2 " << init_vector_2_depth << "}\n";
  total_list << "{init_vector_3 " << init_vector_3_depth << "}\n";
  total_list << "{init_vector_4 " << init_vector_4_depth << "}\n";
  total_list << "{init_vector_5 " << init_vector_5_depth << "}\n";
  total_list << "{init_vector_6 " << init_vector_6_depth << "}\n";
  total_list << "{init_vector_7 " << init_vector_7_depth << "}\n";
  total_list << "{init_vector_8 " << init_vector_8_depth << "}\n";
  total_list << "{init_vector_9 " << init_vector_9_depth << "}\n";
  total_list << "{init_vector_10 " << init_vector_10_depth << "}\n";
  total_list << "{init_vector_11 " << init_vector_11_depth << "}\n";
  total_list << "{init_vector_12 " << init_vector_12_depth << "}\n";
  total_list << "{init_vector_13 " << init_vector_13_depth << "}\n";
  total_list << "{init_vector_14 " << init_vector_14_depth << "}\n";
  total_list << "{init_vector_15 " << init_vector_15_depth << "}\n";
  total_list << "{init_vector_16 " << init_vector_16_depth << "}\n";
  total_list << "{init_vector_17 " << init_vector_17_depth << "}\n";
  total_list << "{init_vector_18 " << init_vector_18_depth << "}\n";
  total_list << "{init_vector_19 " << init_vector_19_depth << "}\n";
  total_list << "{init_vector_20 " << init_vector_20_depth << "}\n";
  total_list << "{init_vector_21 " << init_vector_21_depth << "}\n";
  total_list << "{init_vector_22 " << init_vector_22_depth << "}\n";
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
    int subrow_vals_0_depth;
    int subrow_vals_1_depth;
    int subrow_vals_2_depth;
    int subrow_vals_3_depth;
    int subrow_col_indices_0_depth;
    int subrow_col_indices_1_depth;
    int subrow_col_indices_2_depth;
    int subrow_col_indices_3_depth;
    int mult_enables_0_depth;
    int mult_enables_1_depth;
    int mult_enables_2_depth;
    int mult_enables_3_depth;
    int label_r_depth;
    int init_vector_0_depth;
    int init_vector_1_depth;
    int init_vector_2_depth;
    int init_vector_3_depth;
    int init_vector_4_depth;
    int init_vector_5_depth;
    int init_vector_6_depth;
    int init_vector_7_depth;
    int init_vector_8_depth;
    int init_vector_9_depth;
    int init_vector_10_depth;
    int init_vector_11_depth;
    int init_vector_12_depth;
    int init_vector_13_depth;
    int init_vector_14_depth;
    int init_vector_15_depth;
    int init_vector_16_depth;
    int init_vector_17_depth;
    int init_vector_18_depth;
    int init_vector_19_depth;
    int init_vector_20_depth;
    int init_vector_21_depth;
    int init_vector_22_depth;
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
extern "C" void accelerate_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, char);

extern "C" void apatb_accelerate_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_subrow_vals_0, volatile void * __xlx_apatb_param_subrow_vals_1, volatile void * __xlx_apatb_param_subrow_vals_2, volatile void * __xlx_apatb_param_subrow_vals_3, volatile void * __xlx_apatb_param_subrow_col_indices_0, volatile void * __xlx_apatb_param_subrow_col_indices_1, volatile void * __xlx_apatb_param_subrow_col_indices_2, volatile void * __xlx_apatb_param_subrow_col_indices_3, volatile void * __xlx_apatb_param_mult_enables_0, volatile void * __xlx_apatb_param_mult_enables_1, volatile void * __xlx_apatb_param_mult_enables_2, volatile void * __xlx_apatb_param_mult_enables_3, int __xlx_apatb_param_label_r, volatile void * __xlx_apatb_param_init_vector_0, volatile void * __xlx_apatb_param_init_vector_1, volatile void * __xlx_apatb_param_init_vector_2, volatile void * __xlx_apatb_param_init_vector_3, volatile void * __xlx_apatb_param_init_vector_4, volatile void * __xlx_apatb_param_init_vector_5, volatile void * __xlx_apatb_param_init_vector_6, volatile void * __xlx_apatb_param_init_vector_7, volatile void * __xlx_apatb_param_init_vector_8, volatile void * __xlx_apatb_param_init_vector_9, volatile void * __xlx_apatb_param_init_vector_10, volatile void * __xlx_apatb_param_init_vector_11, volatile void * __xlx_apatb_param_init_vector_12, volatile void * __xlx_apatb_param_init_vector_13, volatile void * __xlx_apatb_param_init_vector_14, volatile void * __xlx_apatb_param_init_vector_15, volatile void * __xlx_apatb_param_init_vector_16, volatile void * __xlx_apatb_param_init_vector_17, volatile void * __xlx_apatb_param_init_vector_18, volatile void * __xlx_apatb_param_init_vector_19, volatile void * __xlx_apatb_param_init_vector_20, volatile void * __xlx_apatb_param_init_vector_21, volatile void * __xlx_apatb_param_init_vector_22, char __xlx_apatb_param_init) {
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

// print subrow_vals_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_vals_0, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_vals_0);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_0, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_vals_0_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_0, end_str());
}

// print subrow_vals_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_vals_1, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_vals_1);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_1, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_vals_1_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_1, end_str());
}

// print subrow_vals_2 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_vals_2, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_vals_2);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_2, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_vals_2_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_2, end_str());
}

// print subrow_vals_3 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_vals_3, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_vals_3);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_3, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_vals_3_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_vals_3, end_str());
}

// print subrow_col_indices_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_0, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_col_indices_0);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_0, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_col_indices_0_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_0, end_str());
}

// print subrow_col_indices_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_1, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_col_indices_1);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_1, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_col_indices_1_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_1, end_str());
}

// print subrow_col_indices_2 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_2, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_col_indices_2);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_2, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_col_indices_2_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_2, end_str());
}

// print subrow_col_indices_3 Transactions
{
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_3, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_subrow_col_indices_3);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_3, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.subrow_col_indices_3_depth);
aesl_fh.write(AUTOTB_TVIN_subrow_col_indices_3, end_str());
}

// print mult_enables_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_mult_enables_0, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_mult_enables_0);
aesl_fh.write(AUTOTB_TVIN_mult_enables_0, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.mult_enables_0_depth);
aesl_fh.write(AUTOTB_TVIN_mult_enables_0, end_str());
}

// print mult_enables_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_mult_enables_1, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_mult_enables_1);
aesl_fh.write(AUTOTB_TVIN_mult_enables_1, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.mult_enables_1_depth);
aesl_fh.write(AUTOTB_TVIN_mult_enables_1, end_str());
}

// print mult_enables_2 Transactions
{
aesl_fh.write(AUTOTB_TVIN_mult_enables_2, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_mult_enables_2);
aesl_fh.write(AUTOTB_TVIN_mult_enables_2, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.mult_enables_2_depth);
aesl_fh.write(AUTOTB_TVIN_mult_enables_2, end_str());
}

// print mult_enables_3 Transactions
{
aesl_fh.write(AUTOTB_TVIN_mult_enables_3, begin_str(AESL_transaction));
{
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_mult_enables_3);
aesl_fh.write(AUTOTB_TVIN_mult_enables_3, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.mult_enables_3_depth);
aesl_fh.write(AUTOTB_TVIN_mult_enables_3, end_str());
}

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

// print init_vector_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_0, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_0);
aesl_fh.write(AUTOTB_TVIN_init_vector_0, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_0_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_0, end_str());
}

// print init_vector_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_1, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_1);
aesl_fh.write(AUTOTB_TVIN_init_vector_1, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_1_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_1, end_str());
}

// print init_vector_2 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_2, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_2);
aesl_fh.write(AUTOTB_TVIN_init_vector_2, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_2_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_2, end_str());
}

// print init_vector_3 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_3, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_3);
aesl_fh.write(AUTOTB_TVIN_init_vector_3, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_3_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_3, end_str());
}

// print init_vector_4 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_4, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_4);
aesl_fh.write(AUTOTB_TVIN_init_vector_4, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_4_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_4, end_str());
}

// print init_vector_5 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_5, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_5);
aesl_fh.write(AUTOTB_TVIN_init_vector_5, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_5_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_5, end_str());
}

// print init_vector_6 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_6, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_6);
aesl_fh.write(AUTOTB_TVIN_init_vector_6, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_6_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_6, end_str());
}

// print init_vector_7 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_7, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_7);
aesl_fh.write(AUTOTB_TVIN_init_vector_7, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_7_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_7, end_str());
}

// print init_vector_8 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_8, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_8);
aesl_fh.write(AUTOTB_TVIN_init_vector_8, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_8_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_8, end_str());
}

// print init_vector_9 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_9, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_9);
aesl_fh.write(AUTOTB_TVIN_init_vector_9, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_9_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_9, end_str());
}

// print init_vector_10 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_10, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_10);
aesl_fh.write(AUTOTB_TVIN_init_vector_10, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_10_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_10, end_str());
}

// print init_vector_11 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_11, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_11);
aesl_fh.write(AUTOTB_TVIN_init_vector_11, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_11_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_11, end_str());
}

// print init_vector_12 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_12, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_12);
aesl_fh.write(AUTOTB_TVIN_init_vector_12, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_12_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_12, end_str());
}

// print init_vector_13 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_13, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_13);
aesl_fh.write(AUTOTB_TVIN_init_vector_13, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_13_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_13, end_str());
}

// print init_vector_14 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_14, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_14);
aesl_fh.write(AUTOTB_TVIN_init_vector_14, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_14_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_14, end_str());
}

// print init_vector_15 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_15, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_15);
aesl_fh.write(AUTOTB_TVIN_init_vector_15, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_15_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_15, end_str());
}

// print init_vector_16 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_16, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_16);
aesl_fh.write(AUTOTB_TVIN_init_vector_16, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_16_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_16, end_str());
}

// print init_vector_17 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_17, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_17);
aesl_fh.write(AUTOTB_TVIN_init_vector_17, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_17_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_17, end_str());
}

// print init_vector_18 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_18, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_18);
aesl_fh.write(AUTOTB_TVIN_init_vector_18, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_18_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_18, end_str());
}

// print init_vector_19 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_19, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_19);
aesl_fh.write(AUTOTB_TVIN_init_vector_19, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_19_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_19, end_str());
}

// print init_vector_20 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_20, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_20);
aesl_fh.write(AUTOTB_TVIN_init_vector_20, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_20_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_20, end_str());
}

// print init_vector_21 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_21, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_21);
aesl_fh.write(AUTOTB_TVIN_init_vector_21, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_21_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_21, end_str());
}

// print init_vector_22 Transactions
{
aesl_fh.write(AUTOTB_TVIN_init_vector_22, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_init_vector_22);
aesl_fh.write(AUTOTB_TVIN_init_vector_22, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.init_vector_22_depth);
aesl_fh.write(AUTOTB_TVIN_init_vector_22, end_str());
}

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
accelerate_hw_stub_wrapper(__xlx_apatb_param_out_r, __xlx_apatb_param_subrow_vals_0, __xlx_apatb_param_subrow_vals_1, __xlx_apatb_param_subrow_vals_2, __xlx_apatb_param_subrow_vals_3, __xlx_apatb_param_subrow_col_indices_0, __xlx_apatb_param_subrow_col_indices_1, __xlx_apatb_param_subrow_col_indices_2, __xlx_apatb_param_subrow_col_indices_3, __xlx_apatb_param_mult_enables_0, __xlx_apatb_param_mult_enables_1, __xlx_apatb_param_mult_enables_2, __xlx_apatb_param_mult_enables_3, __xlx_apatb_param_label_r, __xlx_apatb_param_init_vector_0, __xlx_apatb_param_init_vector_1, __xlx_apatb_param_init_vector_2, __xlx_apatb_param_init_vector_3, __xlx_apatb_param_init_vector_4, __xlx_apatb_param_init_vector_5, __xlx_apatb_param_init_vector_6, __xlx_apatb_param_init_vector_7, __xlx_apatb_param_init_vector_8, __xlx_apatb_param_init_vector_9, __xlx_apatb_param_init_vector_10, __xlx_apatb_param_init_vector_11, __xlx_apatb_param_init_vector_12, __xlx_apatb_param_init_vector_13, __xlx_apatb_param_init_vector_14, __xlx_apatb_param_init_vector_15, __xlx_apatb_param_init_vector_16, __xlx_apatb_param_init_vector_17, __xlx_apatb_param_init_vector_18, __xlx_apatb_param_init_vector_19, __xlx_apatb_param_init_vector_20, __xlx_apatb_param_init_vector_21, __xlx_apatb_param_init_vector_22, __xlx_apatb_param_init);
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
