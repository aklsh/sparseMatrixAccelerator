// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      accelerate
`define AUTOTB_DUT_INST AESL_inst_accelerate
`define AUTOTB_TOP      apatb_accelerate_top
`define AUTOTB_LAT_RESULT_FILE "accelerate.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "accelerate.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_accelerate_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_DEPTH_out_r 1
`define AESL_DEPTH_subrow_vals_0 1
`define AESL_DEPTH_subrow_vals_1 1
`define AESL_DEPTH_subrow_vals_2 1
`define AESL_DEPTH_subrow_vals_3 1
`define AESL_DEPTH_subrow_col_indices_0 1
`define AESL_DEPTH_subrow_col_indices_1 1
`define AESL_DEPTH_subrow_col_indices_2 1
`define AESL_DEPTH_subrow_col_indices_3 1
`define AESL_DEPTH_mult_enables_0 1
`define AESL_DEPTH_mult_enables_1 1
`define AESL_DEPTH_mult_enables_2 1
`define AESL_DEPTH_mult_enables_3 1
`define AESL_DEPTH_label_r 1
`define AESL_DEPTH_init_vector_0 1
`define AESL_DEPTH_init_vector_1 1
`define AESL_DEPTH_init_vector_2 1
`define AESL_DEPTH_init_vector_3 1
`define AESL_DEPTH_init_vector_4 1
`define AESL_DEPTH_init_vector_5 1
`define AESL_DEPTH_init_vector_6 1
`define AESL_DEPTH_init_vector_7 1
`define AESL_DEPTH_init_vector_8 1
`define AESL_DEPTH_init_vector_9 1
`define AESL_DEPTH_init_vector_10 1
`define AESL_DEPTH_init_vector_11 1
`define AESL_DEPTH_init_vector_12 1
`define AESL_DEPTH_init_vector_13 1
`define AESL_DEPTH_init_vector_14 1
`define AESL_DEPTH_init_vector_15 1
`define AESL_DEPTH_init_vector_16 1
`define AESL_DEPTH_init_vector_17 1
`define AESL_DEPTH_init_vector_18 1
`define AESL_DEPTH_init_vector_19 1
`define AESL_DEPTH_init_vector_20 1
`define AESL_DEPTH_init_vector_21 1
`define AESL_DEPTH_init_vector_22 1
`define AESL_DEPTH_init 1
`define AUTOTB_TVIN_subrow_vals_0  "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_0.dat"
`define AUTOTB_TVIN_subrow_vals_1  "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_1.dat"
`define AUTOTB_TVIN_subrow_vals_2  "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_2.dat"
`define AUTOTB_TVIN_subrow_vals_3  "../tv/cdatafile/c.accelerate.autotvin_subrow_vals_3.dat"
`define AUTOTB_TVIN_subrow_col_indices_0  "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_0.dat"
`define AUTOTB_TVIN_subrow_col_indices_1  "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_1.dat"
`define AUTOTB_TVIN_subrow_col_indices_2  "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_2.dat"
`define AUTOTB_TVIN_subrow_col_indices_3  "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices_3.dat"
`define AUTOTB_TVIN_mult_enables_0  "../tv/cdatafile/c.accelerate.autotvin_mult_enables_0.dat"
`define AUTOTB_TVIN_mult_enables_1  "../tv/cdatafile/c.accelerate.autotvin_mult_enables_1.dat"
`define AUTOTB_TVIN_mult_enables_2  "../tv/cdatafile/c.accelerate.autotvin_mult_enables_2.dat"
`define AUTOTB_TVIN_mult_enables_3  "../tv/cdatafile/c.accelerate.autotvin_mult_enables_3.dat"
`define AUTOTB_TVIN_label_r  "../tv/cdatafile/c.accelerate.autotvin_label_r.dat"
`define AUTOTB_TVIN_init_vector_0  "../tv/cdatafile/c.accelerate.autotvin_init_vector_0.dat"
`define AUTOTB_TVIN_init_vector_1  "../tv/cdatafile/c.accelerate.autotvin_init_vector_1.dat"
`define AUTOTB_TVIN_init_vector_2  "../tv/cdatafile/c.accelerate.autotvin_init_vector_2.dat"
`define AUTOTB_TVIN_init_vector_3  "../tv/cdatafile/c.accelerate.autotvin_init_vector_3.dat"
`define AUTOTB_TVIN_init_vector_4  "../tv/cdatafile/c.accelerate.autotvin_init_vector_4.dat"
`define AUTOTB_TVIN_init_vector_5  "../tv/cdatafile/c.accelerate.autotvin_init_vector_5.dat"
`define AUTOTB_TVIN_init_vector_6  "../tv/cdatafile/c.accelerate.autotvin_init_vector_6.dat"
`define AUTOTB_TVIN_init_vector_7  "../tv/cdatafile/c.accelerate.autotvin_init_vector_7.dat"
`define AUTOTB_TVIN_init_vector_8  "../tv/cdatafile/c.accelerate.autotvin_init_vector_8.dat"
`define AUTOTB_TVIN_init_vector_9  "../tv/cdatafile/c.accelerate.autotvin_init_vector_9.dat"
`define AUTOTB_TVIN_init_vector_10  "../tv/cdatafile/c.accelerate.autotvin_init_vector_10.dat"
`define AUTOTB_TVIN_init_vector_11  "../tv/cdatafile/c.accelerate.autotvin_init_vector_11.dat"
`define AUTOTB_TVIN_init_vector_12  "../tv/cdatafile/c.accelerate.autotvin_init_vector_12.dat"
`define AUTOTB_TVIN_init_vector_13  "../tv/cdatafile/c.accelerate.autotvin_init_vector_13.dat"
`define AUTOTB_TVIN_init_vector_14  "../tv/cdatafile/c.accelerate.autotvin_init_vector_14.dat"
`define AUTOTB_TVIN_init_vector_15  "../tv/cdatafile/c.accelerate.autotvin_init_vector_15.dat"
`define AUTOTB_TVIN_init_vector_16  "../tv/cdatafile/c.accelerate.autotvin_init_vector_16.dat"
`define AUTOTB_TVIN_init_vector_17  "../tv/cdatafile/c.accelerate.autotvin_init_vector_17.dat"
`define AUTOTB_TVIN_init_vector_18  "../tv/cdatafile/c.accelerate.autotvin_init_vector_18.dat"
`define AUTOTB_TVIN_init_vector_19  "../tv/cdatafile/c.accelerate.autotvin_init_vector_19.dat"
`define AUTOTB_TVIN_init_vector_20  "../tv/cdatafile/c.accelerate.autotvin_init_vector_20.dat"
`define AUTOTB_TVIN_init_vector_21  "../tv/cdatafile/c.accelerate.autotvin_init_vector_21.dat"
`define AUTOTB_TVIN_init_vector_22  "../tv/cdatafile/c.accelerate.autotvin_init_vector_22.dat"
`define AUTOTB_TVIN_init  "../tv/cdatafile/c.accelerate.autotvin_init.dat"
`define AUTOTB_TVIN_subrow_vals_0_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_vals_0.dat"
`define AUTOTB_TVIN_subrow_vals_1_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_vals_1.dat"
`define AUTOTB_TVIN_subrow_vals_2_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_vals_2.dat"
`define AUTOTB_TVIN_subrow_vals_3_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_vals_3.dat"
`define AUTOTB_TVIN_subrow_col_indices_0_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_col_indices_0.dat"
`define AUTOTB_TVIN_subrow_col_indices_1_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_col_indices_1.dat"
`define AUTOTB_TVIN_subrow_col_indices_2_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_col_indices_2.dat"
`define AUTOTB_TVIN_subrow_col_indices_3_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_col_indices_3.dat"
`define AUTOTB_TVIN_mult_enables_0_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_mult_enables_0.dat"
`define AUTOTB_TVIN_mult_enables_1_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_mult_enables_1.dat"
`define AUTOTB_TVIN_mult_enables_2_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_mult_enables_2.dat"
`define AUTOTB_TVIN_mult_enables_3_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_mult_enables_3.dat"
`define AUTOTB_TVIN_label_r_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_label_r.dat"
`define AUTOTB_TVIN_init_vector_0_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_0.dat"
`define AUTOTB_TVIN_init_vector_1_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_1.dat"
`define AUTOTB_TVIN_init_vector_2_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_2.dat"
`define AUTOTB_TVIN_init_vector_3_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_3.dat"
`define AUTOTB_TVIN_init_vector_4_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_4.dat"
`define AUTOTB_TVIN_init_vector_5_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_5.dat"
`define AUTOTB_TVIN_init_vector_6_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_6.dat"
`define AUTOTB_TVIN_init_vector_7_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_7.dat"
`define AUTOTB_TVIN_init_vector_8_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_8.dat"
`define AUTOTB_TVIN_init_vector_9_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_9.dat"
`define AUTOTB_TVIN_init_vector_10_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_10.dat"
`define AUTOTB_TVIN_init_vector_11_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_11.dat"
`define AUTOTB_TVIN_init_vector_12_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_12.dat"
`define AUTOTB_TVIN_init_vector_13_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_13.dat"
`define AUTOTB_TVIN_init_vector_14_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_14.dat"
`define AUTOTB_TVIN_init_vector_15_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_15.dat"
`define AUTOTB_TVIN_init_vector_16_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_16.dat"
`define AUTOTB_TVIN_init_vector_17_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_17.dat"
`define AUTOTB_TVIN_init_vector_18_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_18.dat"
`define AUTOTB_TVIN_init_vector_19_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_19.dat"
`define AUTOTB_TVIN_init_vector_20_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_20.dat"
`define AUTOTB_TVIN_init_vector_21_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_21.dat"
`define AUTOTB_TVIN_init_vector_22_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector_22.dat"
`define AUTOTB_TVIN_init_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init.dat"
`define AUTOTB_TVOUT_out_r  "../tv/cdatafile/c.accelerate.autotvout_out_r.dat"
`define AUTOTB_TVOUT_out_r_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvout_out_r.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 26;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 27;
parameter LENGTH_out_r = 1;
parameter LENGTH_subrow_vals_0 = 1;
parameter LENGTH_subrow_vals_1 = 1;
parameter LENGTH_subrow_vals_2 = 1;
parameter LENGTH_subrow_vals_3 = 1;
parameter LENGTH_subrow_col_indices_0 = 1;
parameter LENGTH_subrow_col_indices_1 = 1;
parameter LENGTH_subrow_col_indices_2 = 1;
parameter LENGTH_subrow_col_indices_3 = 1;
parameter LENGTH_mult_enables_0 = 1;
parameter LENGTH_mult_enables_1 = 1;
parameter LENGTH_mult_enables_2 = 1;
parameter LENGTH_mult_enables_3 = 1;
parameter LENGTH_label_r = 1;
parameter LENGTH_init_vector_0 = 1;
parameter LENGTH_init_vector_1 = 1;
parameter LENGTH_init_vector_2 = 1;
parameter LENGTH_init_vector_3 = 1;
parameter LENGTH_init_vector_4 = 1;
parameter LENGTH_init_vector_5 = 1;
parameter LENGTH_init_vector_6 = 1;
parameter LENGTH_init_vector_7 = 1;
parameter LENGTH_init_vector_8 = 1;
parameter LENGTH_init_vector_9 = 1;
parameter LENGTH_init_vector_10 = 1;
parameter LENGTH_init_vector_11 = 1;
parameter LENGTH_init_vector_12 = 1;
parameter LENGTH_init_vector_13 = 1;
parameter LENGTH_init_vector_14 = 1;
parameter LENGTH_init_vector_15 = 1;
parameter LENGTH_init_vector_16 = 1;
parameter LENGTH_init_vector_17 = 1;
parameter LENGTH_init_vector_18 = 1;
parameter LENGTH_init_vector_19 = 1;
parameter LENGTH_init_vector_20 = 1;
parameter LENGTH_init_vector_21 = 1;
parameter LENGTH_init_vector_22 = 1;
parameter LENGTH_init = 1;

task read_token;
    input integer fp;
    output reg [183 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire  ap_local_block;
wire  ap_local_deadlock;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [31 : 0] out_r;
wire  out_r_ap_vld;
wire [31 : 0] subrow_vals_0;
wire [31 : 0] subrow_vals_1;
wire [31 : 0] subrow_vals_2;
wire [31 : 0] subrow_vals_3;
wire [31 : 0] subrow_col_indices_0;
wire [31 : 0] subrow_col_indices_1;
wire [31 : 0] subrow_col_indices_2;
wire [31 : 0] subrow_col_indices_3;
wire  mult_enables_0;
wire  mult_enables_1;
wire  mult_enables_2;
wire  mult_enables_3;
wire [31 : 0] label_r;
wire [31 : 0] init_vector_0;
wire [31 : 0] init_vector_1;
wire [31 : 0] init_vector_2;
wire [31 : 0] init_vector_3;
wire [31 : 0] init_vector_4;
wire [31 : 0] init_vector_5;
wire [31 : 0] init_vector_6;
wire [31 : 0] init_vector_7;
wire [31 : 0] init_vector_8;
wire [31 : 0] init_vector_9;
wire [31 : 0] init_vector_10;
wire [31 : 0] init_vector_11;
wire [31 : 0] init_vector_12;
wire [31 : 0] init_vector_13;
wire [31 : 0] init_vector_14;
wire [31 : 0] init_vector_15;
wire [31 : 0] init_vector_16;
wire [31 : 0] init_vector_17;
wire [31 : 0] init_vector_18;
wire [31 : 0] init_vector_19;
wire [31 : 0] init_vector_20;
wire [31 : 0] init_vector_21;
wire [31 : 0] init_vector_22;
wire  init;
wire  out_r_ap_lwr;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;


wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_local_block(ap_local_block),
    .ap_local_deadlock(ap_local_deadlock),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .out_r(out_r),
    .out_r_ap_vld(out_r_ap_vld),
    .subrow_vals_0(subrow_vals_0),
    .subrow_vals_1(subrow_vals_1),
    .subrow_vals_2(subrow_vals_2),
    .subrow_vals_3(subrow_vals_3),
    .subrow_col_indices_0(subrow_col_indices_0),
    .subrow_col_indices_1(subrow_col_indices_1),
    .subrow_col_indices_2(subrow_col_indices_2),
    .subrow_col_indices_3(subrow_col_indices_3),
    .mult_enables_0(mult_enables_0),
    .mult_enables_1(mult_enables_1),
    .mult_enables_2(mult_enables_2),
    .mult_enables_3(mult_enables_3),
    .label_r(label_r),
    .init_vector_0(init_vector_0),
    .init_vector_1(init_vector_1),
    .init_vector_2(init_vector_2),
    .init_vector_3(init_vector_3),
    .init_vector_4(init_vector_4),
    .init_vector_5(init_vector_5),
    .init_vector_6(init_vector_6),
    .init_vector_7(init_vector_7),
    .init_vector_8(init_vector_8),
    .init_vector_9(init_vector_9),
    .init_vector_10(init_vector_10),
    .init_vector_11(init_vector_11),
    .init_vector_12(init_vector_12),
    .init_vector_13(init_vector_13),
    .init_vector_14(init_vector_14),
    .init_vector_15(init_vector_15),
    .init_vector_16(init_vector_16),
    .init_vector_17(init_vector_17),
    .init_vector_18(init_vector_18),
    .init_vector_19(init_vector_19),
    .init_vector_20(init_vector_20),
    .init_vector_21(init_vector_21),
    .init_vector_22(init_vector_22),
    .init(init),
    .out_r_ap_lwr(out_r_ap_lwr));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst = dut_rst;
assign ap_rst_n = ~dut_rst;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_idle = ap_idle;
assign AESL_ready = ap_ready;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
                $finish;
            end
        end
    end
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
reg AESL_REG_out_r_ap_vld = 0;
// The signal of port out_r
reg [31: 0] AESL_REG_out_r = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset)
        AESL_REG_out_r = 0; 
    else if(out_r_ap_vld) begin
        AESL_REG_out_r <= out_r;
        AESL_REG_out_r_ap_vld <= 1;
    end
end 

initial begin : write_file_process_out_r
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer proc_rand;
    integer out_r_count;
    reg [183:0] token;
    integer transaction_idx;
    reg [8 * 5:1] str;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVOUT_out_r_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_out_r_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != AUTOTB_TRANSACTION_NUM) begin
        @(posedge AESL_clock);
          while(out_r_ap_lwr !== 1) begin
              @(posedge AESL_clock);
          end
        # 0.4;
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
        if(AESL_REG_out_r_ap_vld)  begin
          $fdisplay(fp,"0x%x", AESL_REG_out_r);
        AESL_REG_out_r_ap_vld = 0;
        end
    transaction_idx = transaction_idx + 1;
      $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end


// The signal of port subrow_vals_0
reg [31: 0] AESL_REG_subrow_vals_0 = 0;
assign subrow_vals_0 = AESL_REG_subrow_vals_0;
initial begin : read_file_process_subrow_vals_0
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_vals_0,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_vals_0);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_vals_0);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_vals_1
reg [31: 0] AESL_REG_subrow_vals_1 = 0;
assign subrow_vals_1 = AESL_REG_subrow_vals_1;
initial begin : read_file_process_subrow_vals_1
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_vals_1,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_vals_1);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_vals_1);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_vals_2
reg [31: 0] AESL_REG_subrow_vals_2 = 0;
assign subrow_vals_2 = AESL_REG_subrow_vals_2;
initial begin : read_file_process_subrow_vals_2
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_vals_2,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_vals_2);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_vals_2);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_vals_3
reg [31: 0] AESL_REG_subrow_vals_3 = 0;
assign subrow_vals_3 = AESL_REG_subrow_vals_3;
initial begin : read_file_process_subrow_vals_3
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_vals_3,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_vals_3);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_vals_3);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_col_indices_0
reg [31: 0] AESL_REG_subrow_col_indices_0 = 0;
assign subrow_col_indices_0 = AESL_REG_subrow_col_indices_0;
initial begin : read_file_process_subrow_col_indices_0
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_col_indices_0,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_col_indices_0);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_col_indices_0);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_col_indices_1
reg [31: 0] AESL_REG_subrow_col_indices_1 = 0;
assign subrow_col_indices_1 = AESL_REG_subrow_col_indices_1;
initial begin : read_file_process_subrow_col_indices_1
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_col_indices_1,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_col_indices_1);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_col_indices_1);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_col_indices_2
reg [31: 0] AESL_REG_subrow_col_indices_2 = 0;
assign subrow_col_indices_2 = AESL_REG_subrow_col_indices_2;
initial begin : read_file_process_subrow_col_indices_2
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_col_indices_2,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_col_indices_2);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_col_indices_2);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port subrow_col_indices_3
reg [31: 0] AESL_REG_subrow_col_indices_3 = 0;
assign subrow_col_indices_3 = AESL_REG_subrow_col_indices_3;
initial begin : read_file_process_subrow_col_indices_3
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_subrow_col_indices_3,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_subrow_col_indices_3);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_subrow_col_indices_3);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port mult_enables_0
reg [0: 0] AESL_REG_mult_enables_0 = 0;
assign mult_enables_0 = AESL_REG_mult_enables_0;
initial begin : read_file_process_mult_enables_0
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_mult_enables_0,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_mult_enables_0);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_mult_enables_0);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port mult_enables_1
reg [0: 0] AESL_REG_mult_enables_1 = 0;
assign mult_enables_1 = AESL_REG_mult_enables_1;
initial begin : read_file_process_mult_enables_1
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_mult_enables_1,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_mult_enables_1);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_mult_enables_1);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port mult_enables_2
reg [0: 0] AESL_REG_mult_enables_2 = 0;
assign mult_enables_2 = AESL_REG_mult_enables_2;
initial begin : read_file_process_mult_enables_2
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_mult_enables_2,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_mult_enables_2);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_mult_enables_2);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port mult_enables_3
reg [0: 0] AESL_REG_mult_enables_3 = 0;
assign mult_enables_3 = AESL_REG_mult_enables_3;
initial begin : read_file_process_mult_enables_3
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_mult_enables_3,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_mult_enables_3);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_mult_enables_3);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port label_r
reg [31: 0] AESL_REG_label_r = 0;
assign label_r = AESL_REG_label_r;
initial begin : read_file_process_label_r
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_label_r,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_label_r);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_label_r);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_0
reg [31: 0] AESL_REG_init_vector_0 = 0;
assign init_vector_0 = AESL_REG_init_vector_0;
initial begin : read_file_process_init_vector_0
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_0,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_0);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_0);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_1
reg [31: 0] AESL_REG_init_vector_1 = 0;
assign init_vector_1 = AESL_REG_init_vector_1;
initial begin : read_file_process_init_vector_1
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_1,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_1);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_1);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_2
reg [31: 0] AESL_REG_init_vector_2 = 0;
assign init_vector_2 = AESL_REG_init_vector_2;
initial begin : read_file_process_init_vector_2
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_2,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_2);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_2);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_3
reg [31: 0] AESL_REG_init_vector_3 = 0;
assign init_vector_3 = AESL_REG_init_vector_3;
initial begin : read_file_process_init_vector_3
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_3,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_3);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_3);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_4
reg [31: 0] AESL_REG_init_vector_4 = 0;
assign init_vector_4 = AESL_REG_init_vector_4;
initial begin : read_file_process_init_vector_4
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_4,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_4);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_4);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_5
reg [31: 0] AESL_REG_init_vector_5 = 0;
assign init_vector_5 = AESL_REG_init_vector_5;
initial begin : read_file_process_init_vector_5
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_5,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_5);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_5);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_6
reg [31: 0] AESL_REG_init_vector_6 = 0;
assign init_vector_6 = AESL_REG_init_vector_6;
initial begin : read_file_process_init_vector_6
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_6,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_6);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_6);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_7
reg [31: 0] AESL_REG_init_vector_7 = 0;
assign init_vector_7 = AESL_REG_init_vector_7;
initial begin : read_file_process_init_vector_7
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_7,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_7);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_7);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_8
reg [31: 0] AESL_REG_init_vector_8 = 0;
assign init_vector_8 = AESL_REG_init_vector_8;
initial begin : read_file_process_init_vector_8
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_8,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_8);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_8);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_9
reg [31: 0] AESL_REG_init_vector_9 = 0;
assign init_vector_9 = AESL_REG_init_vector_9;
initial begin : read_file_process_init_vector_9
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_9,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_9);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_9);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_10
reg [31: 0] AESL_REG_init_vector_10 = 0;
assign init_vector_10 = AESL_REG_init_vector_10;
initial begin : read_file_process_init_vector_10
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_10,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_10);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_10);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_11
reg [31: 0] AESL_REG_init_vector_11 = 0;
assign init_vector_11 = AESL_REG_init_vector_11;
initial begin : read_file_process_init_vector_11
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_11,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_11);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_11);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_12
reg [31: 0] AESL_REG_init_vector_12 = 0;
assign init_vector_12 = AESL_REG_init_vector_12;
initial begin : read_file_process_init_vector_12
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_12,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_12);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_12);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_13
reg [31: 0] AESL_REG_init_vector_13 = 0;
assign init_vector_13 = AESL_REG_init_vector_13;
initial begin : read_file_process_init_vector_13
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_13,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_13);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_13);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_14
reg [31: 0] AESL_REG_init_vector_14 = 0;
assign init_vector_14 = AESL_REG_init_vector_14;
initial begin : read_file_process_init_vector_14
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_14,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_14);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_14);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_15
reg [31: 0] AESL_REG_init_vector_15 = 0;
assign init_vector_15 = AESL_REG_init_vector_15;
initial begin : read_file_process_init_vector_15
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_15,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_15);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_15);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_16
reg [31: 0] AESL_REG_init_vector_16 = 0;
assign init_vector_16 = AESL_REG_init_vector_16;
initial begin : read_file_process_init_vector_16
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_16,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_16);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_16);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_17
reg [31: 0] AESL_REG_init_vector_17 = 0;
assign init_vector_17 = AESL_REG_init_vector_17;
initial begin : read_file_process_init_vector_17
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_17,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_17);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_17);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_18
reg [31: 0] AESL_REG_init_vector_18 = 0;
assign init_vector_18 = AESL_REG_init_vector_18;
initial begin : read_file_process_init_vector_18
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_18,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_18);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_18);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_19
reg [31: 0] AESL_REG_init_vector_19 = 0;
assign init_vector_19 = AESL_REG_init_vector_19;
initial begin : read_file_process_init_vector_19
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_19,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_19);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_19);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_20
reg [31: 0] AESL_REG_init_vector_20 = 0;
assign init_vector_20 = AESL_REG_init_vector_20;
initial begin : read_file_process_init_vector_20
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_20,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_20);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_20);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_21
reg [31: 0] AESL_REG_init_vector_21 = 0;
assign init_vector_21 = AESL_REG_init_vector_21;
initial begin : read_file_process_init_vector_21
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_21,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_21);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_21);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init_vector_22
reg [31: 0] AESL_REG_init_vector_22 = 0;
assign init_vector_22 = AESL_REG_init_vector_22;
initial begin : read_file_process_init_vector_22
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init_vector_22,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init_vector_22);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init_vector_22);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port init
reg [0: 0] AESL_REG_init = 0;
assign init = AESL_REG_init;
initial begin : read_file_process_init
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_init,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_init);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_init);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        repeat(6) @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_subrow_vals_0;
reg [31:0] size_subrow_vals_0;
reg [31:0] size_subrow_vals_0_backup;
reg end_subrow_vals_1;
reg [31:0] size_subrow_vals_1;
reg [31:0] size_subrow_vals_1_backup;
reg end_subrow_vals_2;
reg [31:0] size_subrow_vals_2;
reg [31:0] size_subrow_vals_2_backup;
reg end_subrow_vals_3;
reg [31:0] size_subrow_vals_3;
reg [31:0] size_subrow_vals_3_backup;
reg end_subrow_col_indices_0;
reg [31:0] size_subrow_col_indices_0;
reg [31:0] size_subrow_col_indices_0_backup;
reg end_subrow_col_indices_1;
reg [31:0] size_subrow_col_indices_1;
reg [31:0] size_subrow_col_indices_1_backup;
reg end_subrow_col_indices_2;
reg [31:0] size_subrow_col_indices_2;
reg [31:0] size_subrow_col_indices_2_backup;
reg end_subrow_col_indices_3;
reg [31:0] size_subrow_col_indices_3;
reg [31:0] size_subrow_col_indices_3_backup;
reg end_mult_enables_0;
reg [31:0] size_mult_enables_0;
reg [31:0] size_mult_enables_0_backup;
reg end_mult_enables_1;
reg [31:0] size_mult_enables_1;
reg [31:0] size_mult_enables_1_backup;
reg end_mult_enables_2;
reg [31:0] size_mult_enables_2;
reg [31:0] size_mult_enables_2_backup;
reg end_mult_enables_3;
reg [31:0] size_mult_enables_3;
reg [31:0] size_mult_enables_3_backup;
reg end_label_r;
reg [31:0] size_label_r;
reg [31:0] size_label_r_backup;
reg end_init_vector_0;
reg [31:0] size_init_vector_0;
reg [31:0] size_init_vector_0_backup;
reg end_init_vector_1;
reg [31:0] size_init_vector_1;
reg [31:0] size_init_vector_1_backup;
reg end_init_vector_2;
reg [31:0] size_init_vector_2;
reg [31:0] size_init_vector_2_backup;
reg end_init_vector_3;
reg [31:0] size_init_vector_3;
reg [31:0] size_init_vector_3_backup;
reg end_init_vector_4;
reg [31:0] size_init_vector_4;
reg [31:0] size_init_vector_4_backup;
reg end_init_vector_5;
reg [31:0] size_init_vector_5;
reg [31:0] size_init_vector_5_backup;
reg end_init_vector_6;
reg [31:0] size_init_vector_6;
reg [31:0] size_init_vector_6_backup;
reg end_init_vector_7;
reg [31:0] size_init_vector_7;
reg [31:0] size_init_vector_7_backup;
reg end_init_vector_8;
reg [31:0] size_init_vector_8;
reg [31:0] size_init_vector_8_backup;
reg end_init_vector_9;
reg [31:0] size_init_vector_9;
reg [31:0] size_init_vector_9_backup;
reg end_init_vector_10;
reg [31:0] size_init_vector_10;
reg [31:0] size_init_vector_10_backup;
reg end_init_vector_11;
reg [31:0] size_init_vector_11;
reg [31:0] size_init_vector_11_backup;
reg end_init_vector_12;
reg [31:0] size_init_vector_12;
reg [31:0] size_init_vector_12_backup;
reg end_init_vector_13;
reg [31:0] size_init_vector_13;
reg [31:0] size_init_vector_13_backup;
reg end_init_vector_14;
reg [31:0] size_init_vector_14;
reg [31:0] size_init_vector_14_backup;
reg end_init_vector_15;
reg [31:0] size_init_vector_15;
reg [31:0] size_init_vector_15_backup;
reg end_init_vector_16;
reg [31:0] size_init_vector_16;
reg [31:0] size_init_vector_16_backup;
reg end_init_vector_17;
reg [31:0] size_init_vector_17;
reg [31:0] size_init_vector_17_backup;
reg end_init_vector_18;
reg [31:0] size_init_vector_18;
reg [31:0] size_init_vector_18_backup;
reg end_init_vector_19;
reg [31:0] size_init_vector_19;
reg [31:0] size_init_vector_19_backup;
reg end_init_vector_20;
reg [31:0] size_init_vector_20;
reg [31:0] size_init_vector_20_backup;
reg end_init_vector_21;
reg [31:0] size_init_vector_21;
reg [31:0] size_init_vector_21_backup;
reg end_init_vector_22;
reg [31:0] size_init_vector_22;
reg [31:0] size_init_vector_22_backup;
reg end_init;
reg [31:0] size_init;
reg [31:0] size_init_backup;
reg end_out_r;
reg [31:0] size_out_r;
reg [31:0] size_out_r_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(0+3) @ (posedge AESL_clock);
    rst = 0;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    dut_rst = 0;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 0);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        if (start_cnt >= AUTOTB_TRANSACTION_NUM + 1) begin
            #0 start = 0;
        end
        @ (posedge AESL_clock);
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
task write_binary;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;

////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 1) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
        // non-dataflow design && latency is predictable && no AXI master/slave interface
        get_intra_progress(intra_progress);
        if (intra_progress > 1000) begin
            $display("// RTL Simulation : transaction %0d run-time latency is greater than %0f time(s) of the prediction @ \"%0t\"", start_cnt, intra_progress, $time);
            $display("////////////////////////////////////////////////////////////////////////////////////");
            $finish;
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif
///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(rst),
    .finish(all_finish));

`include "fifo_para.vh"

endmodule
