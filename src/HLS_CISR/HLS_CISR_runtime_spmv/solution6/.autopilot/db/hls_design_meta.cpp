#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("cmd_start", 1, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("inp_vec_address0", 3, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("inp_vec_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("inp_vec_q0", 32, hls_in, 1, "ap_memory", "mem_dout", 1),
	Port_Property("slot_data_arr_address0", 2, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("slot_data_arr_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("slot_data_arr_q0", 64, hls_in, 2, "ap_memory", "mem_dout", 1),
	Port_Property("slot_arr_row_len_address0", 2, hls_out, 3, "ap_memory", "mem_address", 1),
	Port_Property("slot_arr_row_len_ce0", 1, hls_out, 3, "ap_memory", "mem_ce", 1),
	Port_Property("slot_arr_row_len_q0", 32, hls_in, 3, "ap_memory", "mem_dout", 1),
	Port_Property("output_vec_address0", 3, hls_out, 4, "ap_memory", "mem_address", 1),
	Port_Property("output_vec_ce0", 1, hls_out, 4, "ap_memory", "mem_ce", 1),
	Port_Property("output_vec_we0", 1, hls_out, 4, "ap_memory", "mem_we", 1),
	Port_Property("output_vec_d0", 32, hls_out, 4, "ap_memory", "mem_din", 1),
};
const char* HLS_Design_Meta::dut_name = "HLS_CISR_spmv_accel";
