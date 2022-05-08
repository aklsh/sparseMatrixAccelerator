// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="HLS_CISR_spmv_accel_HLS_CISR_spmv_accel,hls_ip_2020_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=25,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=936,HLS_SYN_LUT=1627,HLS_VERSION=2020_2}" *)

module HLS_CISR_spmv_accel (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        cmd_start,
        inp_vec_address0,
        inp_vec_ce0,
        inp_vec_q0,
        slot_data_arr_address0,
        slot_data_arr_ce0,
        slot_data_arr_q0,
        slot_arr_row_len_address0,
        slot_arr_row_len_ce0,
        slot_arr_row_len_q0,
        output_vec_address0,
        output_vec_ce0,
        output_vec_we0,
        output_vec_d0
);

parameter    ap_ST_fsm_state1 = 21'd1;
parameter    ap_ST_fsm_state2 = 21'd2;
parameter    ap_ST_fsm_state3 = 21'd4;
parameter    ap_ST_fsm_state4 = 21'd8;
parameter    ap_ST_fsm_pp1_stage0 = 21'd16;
parameter    ap_ST_fsm_state7 = 21'd32;
parameter    ap_ST_fsm_pp2_stage0 = 21'd64;
parameter    ap_ST_fsm_state10 = 21'd128;
parameter    ap_ST_fsm_state11 = 21'd256;
parameter    ap_ST_fsm_state12 = 21'd512;
parameter    ap_ST_fsm_state13 = 21'd1024;
parameter    ap_ST_fsm_state14 = 21'd2048;
parameter    ap_ST_fsm_state15 = 21'd4096;
parameter    ap_ST_fsm_state16 = 21'd8192;
parameter    ap_ST_fsm_state17 = 21'd16384;
parameter    ap_ST_fsm_state18 = 21'd32768;
parameter    ap_ST_fsm_state19 = 21'd65536;
parameter    ap_ST_fsm_state20 = 21'd131072;
parameter    ap_ST_fsm_state21 = 21'd262144;
parameter    ap_ST_fsm_state22 = 21'd524288;
parameter    ap_ST_fsm_state23 = 21'd1048576;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [0:0] cmd_start;
output  [2:0] inp_vec_address0;
output   inp_vec_ce0;
input  [31:0] inp_vec_q0;
output  [0:0] slot_data_arr_address0;
output   slot_data_arr_ce0;
input  [63:0] slot_data_arr_q0;
output  [0:0] slot_arr_row_len_address0;
output   slot_arr_row_len_ce0;
input  [31:0] slot_arr_row_len_q0;
output  [2:0] output_vec_address0;
output   output_vec_ce0;
output   output_vec_we0;
output  [31:0] output_vec_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[2:0] inp_vec_address0;
reg inp_vec_ce0;
reg[0:0] slot_data_arr_address0;
reg slot_data_arr_ce0;
reg slot_arr_row_len_ce0;
reg[2:0] output_vec_address0;
reg output_vec_ce0;
reg output_vec_we0;
reg[31:0] output_vec_d0;

(* fsm_encoding = "none" *) reg   [20:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] max_row_id;
reg   [2:0] row_len_slot_arr_address0;
reg    row_len_slot_arr_ce0;
reg    row_len_slot_arr_we0;
reg   [31:0] row_len_slot_arr_d0;
reg   [2:0] row_len_slot_arr_address1;
reg    row_len_slot_arr_ce1;
reg    row_len_slot_arr_we1;
wire   [31:0] row_len_slot_arr_q1;
reg   [31:0] slot_counter_0;
reg   [31:0] slot_counter_1;
reg   [31:0] slot_row_counter_0;
reg   [31:0] slot_row_counter_1;
reg   [31:0] slot_row_len_id_0;
reg   [31:0] slot_row_len_id_1;
reg   [31:0] slot_res_arr_0;
reg   [31:0] slot_res_arr_1;
reg   [2:0] slot_row_id_0;
reg   [2:0] slot_row_id_1;
reg   [1:0] slot_id1_reg_259;
reg   [1:0] slot_id2_reg_270;
reg   [31:0] reg_319;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state13;
wire   [31:0] grp_fu_281_p2;
reg   [31:0] reg_323;
wire    ap_CS_fsm_state21;
wire    ap_CS_fsm_state22;
wire   [0:0] cmd_start_read_read_fu_106_p2;
wire   [1:0] add_ln25_fu_333_p2;
reg   [1:0] add_ln25_reg_782;
wire    ap_CS_fsm_state2;
reg   [2:0] row_len_slot_arr_addr_5_reg_790;
wire   [0:0] icmp_ln25_fu_339_p2;
reg   [2:0] row_len_slot_arr_addr_3_reg_795;
wire   [1:0] add_ln49_fu_455_p2;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter0;
wire    ap_block_state5_pp1_stage0_iter0;
wire    ap_block_state6_pp1_stage0_iter1;
wire    ap_block_pp1_stage0_11001;
wire   [0:0] icmp_ln49_fu_461_p2;
wire   [0:0] trunc_ln58_fu_472_p1;
reg   [0:0] trunc_ln58_reg_812;
wire   [1:0] add_ln68_fu_537_p2;
wire    ap_CS_fsm_pp2_stage0;
reg    ap_enable_reg_pp2_iter0;
wire    ap_block_state8_pp2_stage0_iter0;
wire    ap_block_state9_pp2_stage0_iter1;
wire    ap_block_pp2_stage0_11001;
wire   [0:0] icmp_ln68_fu_543_p2;
wire   [0:0] trunc_ln86_fu_549_p1;
reg   [0:0] trunc_ln86_reg_835;
wire   [0:0] icmp_ln80_fu_569_p2;
reg   [0:0] icmp_ln80_reg_839;
wire    ap_CS_fsm_state10;
wire   [31:0] trunc_ln107_fu_692_p1;
reg   [31:0] trunc_ln107_reg_853;
wire    ap_CS_fsm_state11;
wire   [31:0] trunc_ln107_1_fu_701_p1;
reg   [31:0] trunc_ln107_1_reg_868;
wire   [31:0] matrix_val_fu_710_p1;
wire   [31:0] bitcast_ln111_fu_714_p1;
wire   [31:0] matrix_val_1_fu_719_p1;
wire    ap_CS_fsm_state14;
wire   [31:0] bitcast_ln111_1_fu_723_p1;
wire   [31:0] grp_fu_285_p2;
reg   [31:0] mul_i_reg_898;
wire    ap_CS_fsm_state16;
reg   [31:0] mul_1_i_reg_906;
wire    ap_CS_fsm_state17;
wire    ap_CS_fsm_state4;
wire    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state5;
reg    ap_enable_reg_pp1_iter1;
wire    ap_CS_fsm_state7;
wire    ap_block_pp2_stage0_subdone;
reg    ap_condition_pp2_exit_iter0_state8;
reg    ap_enable_reg_pp2_iter1;
reg   [1:0] slot_id_reg_248;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln37_fu_353_p1;
wire   [63:0] tmp_1_fu_364_p3;
wire   [63:0] tmp_2_fu_379_p3;
wire   [63:0] tmp_3_fu_394_p3;
wire   [63:0] slot_id1_cast_fu_467_p1;
wire    ap_block_pp1_stage0;
wire   [63:0] zext_ln58_fu_514_p1;
wire   [0:0] icmp_ln55_fu_498_p2;
wire   [63:0] zext_ln86_fu_601_p1;
wire    ap_block_pp2_stage0;
wire   [63:0] zext_ln111_fu_696_p1;
wire   [63:0] zext_ln111_1_fu_705_p1;
wire   [63:0] zext_ln131_fu_748_p1;
wire   [63:0] zext_ln131_1_fu_768_p1;
wire    ap_CS_fsm_state23;
wire   [31:0] add_ln92_fu_644_p2;
wire   [31:0] add_ln59_fu_519_p2;
wire   [0:0] trunc_ln29_fu_403_p1;
wire   [31:0] add_ln115_fu_668_p2;
reg   [31:0] ap_sig_allocacmp_slot_row_counter_0_load_1;
reg   [31:0] grp_load_fu_301_p1;
wire   [31:0] add_ln115_1_fu_680_p2;
reg   [31:0] ap_sig_allocacmp_slot_row_counter_1_load_1;
reg   [31:0] grp_load_fu_305_p1;
wire   [31:0] add_ln87_fu_606_p2;
wire    ap_CS_fsm_state18;
wire   [2:0] trunc_ln91_fu_628_p1;
wire   [31:0] bitcast_ln131_fu_753_p1;
wire   [31:0] bitcast_ln131_1_fu_773_p1;
reg   [31:0] grp_fu_281_p0;
reg   [31:0] grp_fu_281_p1;
reg   [31:0] grp_fu_285_p0;
reg   [31:0] grp_fu_285_p1;
wire   [3:0] tmp_fu_345_p3;
wire   [3:0] or_ln37_fu_358_p2;
wire   [3:0] or_ln37_1_fu_373_p2;
wire   [3:0] or_ln37_2_fu_388_p2;
wire   [31:0] slot_row_count_fu_491_p3;
wire   [2:0] tmp_4_cast_fu_476_p3;
wire   [2:0] trunc_ln58_1_fu_504_p1;
wire   [2:0] add_ln58_fu_508_p2;
wire   [31:0] select_ln80_fu_561_p3;
wire   [31:0] select_ln86_fu_583_p3;
wire   [2:0] tmp_5_cast_fu_553_p3;
wire   [2:0] trunc_ln86_1_fu_591_p1;
wire   [2:0] add_ln86_fu_595_p2;
wire   [2:0] grp_fu_309_p4;
reg   [20:0] ap_NS_fsm;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
reg    ap_idle_pp2;
wire    ap_enable_pp2;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 21'd1;
#0 max_row_id = 32'd0;
#0 slot_counter_0 = 32'd0;
#0 slot_counter_1 = 32'd0;
#0 slot_row_counter_0 = 32'd0;
#0 slot_row_counter_1 = 32'd0;
#0 slot_row_len_id_0 = 32'd0;
#0 slot_row_len_id_1 = 32'd0;
#0 slot_res_arr_0 = 32'd0;
#0 slot_res_arr_1 = 32'd0;
#0 slot_row_id_0 = 3'd0;
#0 slot_row_id_1 = 3'd0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp2_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
#0 ap_enable_reg_pp2_iter1 = 1'b0;
end

HLS_CISR_spmv_accel_row_len_slot_arr #(
    .DataWidth( 32 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
row_len_slot_arr_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(row_len_slot_arr_address0),
    .ce0(row_len_slot_arr_ce0),
    .we0(row_len_slot_arr_we0),
    .d0(row_len_slot_arr_d0),
    .address1(row_len_slot_arr_address1),
    .ce1(row_len_slot_arr_ce1),
    .we1(row_len_slot_arr_we1),
    .d1(32'd0),
    .q1(row_len_slot_arr_q1)
);

HLS_CISR_spmv_accel_fadd_32ns_32ns_32_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fadd_32ns_32ns_32_5_full_dsp_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_281_p0),
    .din1(grp_fu_281_p1),
    .ce(1'b1),
    .dout(grp_fu_281_p2)
);

HLS_CISR_spmv_accel_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_285_p0),
    .din1(grp_fu_285_p1),
    .ce(1'b1),
    .dout(grp_fu_285_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp1_exit_iter0_state5) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp1_exit_iter0_state5) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state5);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp2_exit_iter0_state8) & (1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_subdone))) begin
            ap_enable_reg_pp2_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_enable_reg_pp2_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp2_exit_iter0_state8) & (1'b0 == ap_block_pp2_stage0_subdone))) begin
            ap_enable_reg_pp2_iter1 <= (1'b1 ^ ap_condition_pp2_exit_iter0_state8);
        end else if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter1 <= ap_enable_reg_pp2_iter0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_enable_reg_pp2_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (cmd_start_read_read_fu_106_p2 == 1'd1))) begin
        max_row_id <= 32'd0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        max_row_id <= add_ln92_fu_644_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_counter_0 <= 32'd0;
    end else if (((icmp_ln55_fu_498_p2 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (trunc_ln58_reg_812 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        slot_counter_0 <= add_ln59_fu_519_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_counter_1 <= 32'd0;
    end else if (((icmp_ln55_fu_498_p2 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (trunc_ln58_reg_812 == 1'd1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        slot_counter_1 <= add_ln59_fu_519_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        slot_id1_reg_259 <= 2'd0;
    end else if (((1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln49_fu_461_p2 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        slot_id1_reg_259 <= add_ln49_fu_455_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        slot_id2_reg_270 <= 2'd0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_id2_reg_270 <= add_ln68_fu_537_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (cmd_start_read_read_fu_106_p2 == 1'd1))) begin
        slot_id_reg_248 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        slot_id_reg_248 <= add_ln25_reg_782;
    end
end

always @ (posedge ap_clk) begin
    if ((((trunc_ln29_fu_403_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (trunc_ln86_fu_549_p1 == 1'd0) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001)))) begin
        slot_res_arr_0 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state22)) begin
        slot_res_arr_0 <= reg_323;
    end
end

always @ (posedge ap_clk) begin
    if ((((trunc_ln29_fu_403_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (trunc_ln86_fu_549_p1 == 1'd1) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001)))) begin
        slot_res_arr_1 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state23)) begin
        slot_res_arr_1 <= reg_323;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_row_counter_0 <= 32'd0;
    end else if (((ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_reg_839 == 1'd1) & (trunc_ln86_reg_835 == 1'd0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_row_counter_0 <= row_len_slot_arr_q1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        slot_row_counter_0 <= add_ln115_fu_668_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_row_counter_1 <= 32'd0;
    end else if (((ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_reg_839 == 1'd1) & (trunc_ln86_reg_835 == 1'd1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_row_counter_1 <= row_len_slot_arr_q1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        slot_row_counter_1 <= add_ln115_1_fu_680_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_row_id_0 <= 3'd0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (trunc_ln86_fu_549_p1 == 1'd0) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_row_id_0 <= trunc_ln91_fu_628_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_row_id_1 <= 3'd0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (trunc_ln86_fu_549_p1 == 1'd1) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_row_id_1 <= trunc_ln91_fu_628_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_row_len_id_0 <= 32'd0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (trunc_ln86_fu_549_p1 == 1'd0) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_row_len_id_0 <= add_ln87_fu_606_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln29_fu_403_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        slot_row_len_id_1 <= 32'd0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_fu_569_p2 == 1'd1) & (trunc_ln86_fu_549_p1 == 1'd1) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        slot_row_len_id_1 <= add_ln87_fu_606_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln25_reg_782 <= add_ln25_fu_333_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln68_fu_543_p2 == 1'd0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        icmp_ln80_reg_839 <= icmp_ln80_fu_569_p2;
        trunc_ln86_reg_835 <= trunc_ln86_fu_549_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        mul_1_i_reg_906 <= grp_fu_285_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        mul_i_reg_898 <= grp_fu_285_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state12))) begin
        reg_319 <= inp_vec_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state22) | (1'b1 == ap_CS_fsm_state21))) begin
        reg_323 <= grp_fu_281_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
        row_len_slot_arr_addr_3_reg_795[2] <= tmp_3_fu_394_p3[2];
        row_len_slot_arr_addr_5_reg_790[2] <= tmp_2_fu_379_p3[2];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        trunc_ln107_1_reg_868 <= trunc_ln107_1_fu_701_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        trunc_ln107_reg_853 <= trunc_ln107_fu_692_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln49_fu_461_p2 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        trunc_ln58_reg_812 <= trunc_ln58_fu_472_p1;
    end
end

always @ (*) begin
    if ((icmp_ln49_fu_461_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln68_fu_543_p2 == 1'd1)) begin
        ap_condition_pp2_exit_iter0_state8 = 1'b1;
    end else begin
        ap_condition_pp2_exit_iter0_state8 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state23)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter1 == 1'b0) & (ap_enable_reg_pp2_iter0 == 1'b0))) begin
        ap_idle_pp2 = 1'b1;
    end else begin
        ap_idle_pp2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state23)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_reg_839 == 1'd1) & (trunc_ln86_reg_835 == 1'd0) & (1'b0 == ap_block_pp2_stage0))) begin
        ap_sig_allocacmp_slot_row_counter_0_load_1 = row_len_slot_arr_q1;
    end else begin
        ap_sig_allocacmp_slot_row_counter_0_load_1 = slot_row_counter_0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln80_reg_839 == 1'd1) & (trunc_ln86_reg_835 == 1'd1) & (1'b0 == ap_block_pp2_stage0))) begin
        ap_sig_allocacmp_slot_row_counter_1_load_1 = row_len_slot_arr_q1;
    end else begin
        ap_sig_allocacmp_slot_row_counter_1_load_1 = slot_row_counter_1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        grp_fu_281_p0 = slot_res_arr_1;
    end else if ((1'b1 == ap_CS_fsm_state17)) begin
        grp_fu_281_p0 = slot_res_arr_0;
    end else begin
        grp_fu_281_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        grp_fu_281_p1 = mul_1_i_reg_906;
    end else if ((1'b1 == ap_CS_fsm_state17)) begin
        grp_fu_281_p1 = mul_i_reg_898;
    end else begin
        grp_fu_281_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_285_p0 = matrix_val_1_fu_719_p1;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_fu_285_p0 = matrix_val_fu_710_p1;
    end else begin
        grp_fu_285_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_285_p1 = bitcast_ln111_1_fu_723_p1;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_fu_285_p1 = bitcast_ln111_fu_714_p1;
    end else begin
        grp_fu_285_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_load_fu_301_p1 = slot_row_counter_0;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0))) begin
        grp_load_fu_301_p1 = ap_sig_allocacmp_slot_row_counter_0_load_1;
    end else begin
        grp_load_fu_301_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_load_fu_305_p1 = slot_row_counter_1;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln68_fu_543_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0))) begin
        grp_load_fu_305_p1 = ap_sig_allocacmp_slot_row_counter_1_load_1;
    end else begin
        grp_load_fu_305_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        inp_vec_address0 = zext_ln111_1_fu_705_p1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        inp_vec_address0 = zext_ln111_fu_696_p1;
    end else begin
        inp_vec_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12))) begin
        inp_vec_ce0 = 1'b1;
    end else begin
        inp_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state23)) begin
        output_vec_address0 = zext_ln131_1_fu_768_p1;
    end else if ((1'b1 == ap_CS_fsm_state22)) begin
        output_vec_address0 = zext_ln131_fu_748_p1;
    end else begin
        output_vec_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state22))) begin
        output_vec_ce0 = 1'b1;
    end else begin
        output_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state23)) begin
        output_vec_d0 = bitcast_ln131_1_fu_773_p1;
    end else if ((1'b1 == ap_CS_fsm_state22)) begin
        output_vec_d0 = bitcast_ln131_fu_753_p1;
    end else begin
        output_vec_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state22))) begin
        output_vec_we0 = 1'b1;
    end else begin
        output_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0))) begin
        row_len_slot_arr_address0 = zext_ln58_fu_514_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        row_len_slot_arr_address0 = row_len_slot_arr_addr_3_reg_795;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        row_len_slot_arr_address0 = tmp_1_fu_364_p3;
    end else begin
        row_len_slot_arr_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp2_stage0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0))) begin
        row_len_slot_arr_address1 = zext_ln86_fu_601_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        row_len_slot_arr_address1 = row_len_slot_arr_addr_5_reg_790;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        row_len_slot_arr_address1 = zext_ln37_fu_353_p1;
    end else begin
        row_len_slot_arr_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        row_len_slot_arr_ce0 = 1'b1;
    end else begin
        row_len_slot_arr_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_11001)))) begin
        row_len_slot_arr_ce1 = 1'b1;
    end else begin
        row_len_slot_arr_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0))) begin
        row_len_slot_arr_d0 = slot_arr_row_len_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        row_len_slot_arr_d0 = 32'd0;
    end else begin
        row_len_slot_arr_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln55_fu_498_p2 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0)))) begin
        row_len_slot_arr_we0 = 1'b1;
    end else begin
        row_len_slot_arr_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0)))) begin
        row_len_slot_arr_we1 = 1'b1;
    end else begin
        row_len_slot_arr_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        slot_arr_row_len_ce0 = 1'b1;
    end else begin
        slot_arr_row_len_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        slot_data_arr_address0 = 64'd1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        slot_data_arr_address0 = 64'd0;
    end else begin
        slot_data_arr_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10))) begin
        slot_data_arr_ce0 = 1'b1;
    end else begin
        slot_data_arr_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (cmd_start_read_read_fu_106_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (cmd_start_read_read_fu_106_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln25_fu_339_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_pp1_stage0;
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((icmp_ln49_fu_461_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((icmp_ln49_fu_461_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_pp2_stage0;
        end
        ap_ST_fsm_pp2_stage0 : begin
            if (~((icmp_ln68_fu_543_p2 == 1'd1) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end else if (((icmp_ln68_fu_543_p2 == 1'd1) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b0 == ap_block_pp2_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln115_1_fu_680_p2 = ($signed(grp_load_fu_305_p1) + $signed(32'd4294967295));

assign add_ln115_fu_668_p2 = ($signed(grp_load_fu_301_p1) + $signed(32'd4294967295));

assign add_ln25_fu_333_p2 = (slot_id_reg_248 + 2'd1);

assign add_ln49_fu_455_p2 = (slot_id1_reg_259 + 2'd1);

assign add_ln58_fu_508_p2 = (tmp_4_cast_fu_476_p3 + trunc_ln58_1_fu_504_p1);

assign add_ln59_fu_519_p2 = (slot_row_count_fu_491_p3 + 32'd1);

assign add_ln68_fu_537_p2 = (slot_id2_reg_270 + 2'd1);

assign add_ln86_fu_595_p2 = (tmp_5_cast_fu_553_p3 + trunc_ln86_1_fu_591_p1);

assign add_ln87_fu_606_p2 = (select_ln86_fu_583_p3 + 32'd1);

assign add_ln92_fu_644_p2 = (max_row_id + 32'd1);

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp2_stage0 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state22 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state23 = ap_CS_fsm[32'd20];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state5_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp2_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp2_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign ap_enable_pp2 = (ap_idle_pp2 ^ 1'b1);

assign bitcast_ln111_1_fu_723_p1 = reg_319;

assign bitcast_ln111_fu_714_p1 = reg_319;

assign bitcast_ln131_1_fu_773_p1 = reg_323;

assign bitcast_ln131_fu_753_p1 = reg_323;

assign cmd_start_read_read_fu_106_p2 = cmd_start;

assign grp_fu_309_p4 = {{slot_data_arr_q0[34:32]}};

assign icmp_ln25_fu_339_p2 = ((slot_id_reg_248 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_461_p2 = ((slot_id1_reg_259 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_498_p2 = ((slot_arr_row_len_q0 == 32'd4294967295) ? 1'b1 : 1'b0);

assign icmp_ln68_fu_543_p2 = ((slot_id2_reg_270 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln80_fu_569_p2 = ((select_ln80_fu_561_p3 == 32'd0) ? 1'b1 : 1'b0);

assign matrix_val_1_fu_719_p1 = trunc_ln107_1_reg_868;

assign matrix_val_fu_710_p1 = trunc_ln107_reg_853;

assign or_ln37_1_fu_373_p2 = (tmp_fu_345_p3 | 4'd2);

assign or_ln37_2_fu_388_p2 = (tmp_fu_345_p3 | 4'd3);

assign or_ln37_fu_358_p2 = (tmp_fu_345_p3 | 4'd1);

assign select_ln80_fu_561_p3 = ((trunc_ln86_fu_549_p1[0:0] == 1'b1) ? grp_load_fu_305_p1 : grp_load_fu_301_p1);

assign select_ln86_fu_583_p3 = ((trunc_ln86_fu_549_p1[0:0] == 1'b1) ? slot_row_len_id_1 : slot_row_len_id_0);

assign slot_arr_row_len_address0 = slot_id1_cast_fu_467_p1;

assign slot_id1_cast_fu_467_p1 = slot_id1_reg_259;

assign slot_row_count_fu_491_p3 = ((trunc_ln58_reg_812[0:0] == 1'b1) ? slot_counter_1 : slot_counter_0);

assign tmp_1_fu_364_p3 = {{60'd0}, {or_ln37_fu_358_p2}};

assign tmp_2_fu_379_p3 = {{60'd0}, {or_ln37_1_fu_373_p2}};

assign tmp_3_fu_394_p3 = {{60'd0}, {or_ln37_2_fu_388_p2}};

assign tmp_4_cast_fu_476_p3 = {{trunc_ln58_reg_812}, {2'd0}};

assign tmp_5_cast_fu_553_p3 = {{trunc_ln86_fu_549_p1}, {2'd0}};

assign tmp_fu_345_p3 = {{slot_id_reg_248}, {2'd0}};

assign trunc_ln107_1_fu_701_p1 = slot_data_arr_q0[31:0];

assign trunc_ln107_fu_692_p1 = slot_data_arr_q0[31:0];

assign trunc_ln29_fu_403_p1 = slot_id_reg_248[0:0];

assign trunc_ln58_1_fu_504_p1 = slot_row_count_fu_491_p3[2:0];

assign trunc_ln58_fu_472_p1 = slot_id1_reg_259[0:0];

assign trunc_ln86_1_fu_591_p1 = select_ln86_fu_583_p3[2:0];

assign trunc_ln86_fu_549_p1 = slot_id2_reg_270[0:0];

assign trunc_ln91_fu_628_p1 = max_row_id[2:0];

assign zext_ln111_1_fu_705_p1 = grp_fu_309_p4;

assign zext_ln111_fu_696_p1 = grp_fu_309_p4;

assign zext_ln131_1_fu_768_p1 = slot_row_id_1;

assign zext_ln131_fu_748_p1 = slot_row_id_0;

assign zext_ln37_fu_353_p1 = tmp_fu_345_p3;

assign zext_ln58_fu_514_p1 = add_ln58_fu_508_p2;

assign zext_ln86_fu_601_p1 = add_ln86_fu_595_p2;

always @ (posedge ap_clk) begin
    row_len_slot_arr_addr_5_reg_790[1:0] <= 2'b10;
    row_len_slot_arr_addr_3_reg_795[1:0] <= 2'b11;
end

endmodule //HLS_CISR_spmv_accel
