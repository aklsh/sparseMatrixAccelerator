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
`define AESL_MEM_subrow_vals AESL_automem_subrow_vals
`define AESL_MEM_INST_subrow_vals mem_inst_subrow_vals
`define AESL_MEM_subrow_col_indices AESL_automem_subrow_col_indices
`define AESL_MEM_INST_subrow_col_indices mem_inst_subrow_col_indices
`define AESL_MEM_mult_enables AESL_automem_mult_enables
`define AESL_MEM_INST_mult_enables mem_inst_mult_enables
`define AESL_DEPTH_label_r 1
`define AESL_MEM_init_vector AESL_automem_init_vector
`define AESL_MEM_INST_init_vector mem_inst_init_vector
`define AESL_DEPTH_init 1
`define AUTOTB_TVIN_subrow_vals  "../tv/cdatafile/c.accelerate.autotvin_subrow_vals.dat"
`define AUTOTB_TVIN_subrow_col_indices  "../tv/cdatafile/c.accelerate.autotvin_subrow_col_indices.dat"
`define AUTOTB_TVIN_mult_enables  "../tv/cdatafile/c.accelerate.autotvin_mult_enables.dat"
`define AUTOTB_TVIN_label_r  "../tv/cdatafile/c.accelerate.autotvin_label_r.dat"
`define AUTOTB_TVIN_init_vector  "../tv/cdatafile/c.accelerate.autotvin_init_vector.dat"
`define AUTOTB_TVIN_init  "../tv/cdatafile/c.accelerate.autotvin_init.dat"
`define AUTOTB_TVIN_subrow_vals_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_vals.dat"
`define AUTOTB_TVIN_subrow_col_indices_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_subrow_col_indices.dat"
`define AUTOTB_TVIN_mult_enables_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_mult_enables.dat"
`define AUTOTB_TVIN_label_r_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_label_r.dat"
`define AUTOTB_TVIN_init_vector_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init_vector.dat"
`define AUTOTB_TVIN_init_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvin_init.dat"
`define AUTOTB_TVOUT_out_r  "../tv/cdatafile/c.accelerate.autotvout_out_r.dat"
`define AUTOTB_TVOUT_out_r_out_wrapc  "../tv/rtldatafile/rtl.accelerate.autotvout_out_r.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 26;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 42;
parameter LENGTH_out_r = 1;
parameter LENGTH_subrow_vals = 4;
parameter LENGTH_subrow_col_indices = 4;
parameter LENGTH_mult_enables = 4;
parameter LENGTH_label_r = 1;
parameter LENGTH_init_vector = 23;
parameter LENGTH_init = 1;

task read_token;
    input integer fp;
    output reg [239 : 0] token;
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
wire [1 : 0] subrow_vals_address0;
wire  subrow_vals_ce0;
wire [31 : 0] subrow_vals_q0;
wire [1 : 0] subrow_vals_address1;
wire  subrow_vals_ce1;
wire [31 : 0] subrow_vals_q1;
wire [1 : 0] subrow_col_indices_address0;
wire  subrow_col_indices_ce0;
wire [31 : 0] subrow_col_indices_q0;
wire [1 : 0] subrow_col_indices_address1;
wire  subrow_col_indices_ce1;
wire [31 : 0] subrow_col_indices_q1;
wire [1 : 0] mult_enables_address0;
wire  mult_enables_ce0;
wire [0 : 0] mult_enables_q0;
wire [1 : 0] mult_enables_address1;
wire  mult_enables_ce1;
wire [0 : 0] mult_enables_q1;
wire [31 : 0] label_r;
wire [4 : 0] init_vector_address0;
wire  init_vector_ce0;
wire [31 : 0] init_vector_q0;
wire [4 : 0] init_vector_address1;
wire  init_vector_ce1;
wire [31 : 0] init_vector_q1;
wire  init;
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
    .subrow_vals_address0(subrow_vals_address0),
    .subrow_vals_ce0(subrow_vals_ce0),
    .subrow_vals_q0(subrow_vals_q0),
    .subrow_vals_address1(subrow_vals_address1),
    .subrow_vals_ce1(subrow_vals_ce1),
    .subrow_vals_q1(subrow_vals_q1),
    .subrow_col_indices_address0(subrow_col_indices_address0),
    .subrow_col_indices_ce0(subrow_col_indices_ce0),
    .subrow_col_indices_q0(subrow_col_indices_q0),
    .subrow_col_indices_address1(subrow_col_indices_address1),
    .subrow_col_indices_ce1(subrow_col_indices_ce1),
    .subrow_col_indices_q1(subrow_col_indices_q1),
    .mult_enables_address0(mult_enables_address0),
    .mult_enables_ce0(mult_enables_ce0),
    .mult_enables_q0(mult_enables_q0),
    .mult_enables_address1(mult_enables_address1),
    .mult_enables_ce1(mult_enables_ce1),
    .mult_enables_q1(mult_enables_q1),
    .label_r(label_r),
    .init_vector_address0(init_vector_address0),
    .init_vector_ce0(init_vector_ce0),
    .init_vector_q0(init_vector_q0),
    .init_vector_address1(init_vector_address1),
    .init_vector_ce1(init_vector_ce1),
    .init_vector_q1(init_vector_q1),
    .init(init));

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
    reg [239:0] token;
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
          while(AESL_done !== 1) begin
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


//------------------------arraysubrow_vals Instantiation--------------

// The input and output of arraysubrow_vals
wire    arraysubrow_vals_ce0, arraysubrow_vals_ce1;
wire [4 - 1 : 0]    arraysubrow_vals_we0, arraysubrow_vals_we1;
wire    [1 : 0]    arraysubrow_vals_address0, arraysubrow_vals_address1;
wire    [31 : 0]    arraysubrow_vals_din0, arraysubrow_vals_din1;
wire    [31 : 0]    arraysubrow_vals_dout0, arraysubrow_vals_dout1;
wire    arraysubrow_vals_ready;
wire    arraysubrow_vals_done;

`AESL_MEM_subrow_vals `AESL_MEM_INST_subrow_vals(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arraysubrow_vals_ce0),
    .we0        (arraysubrow_vals_we0),
    .address0   (arraysubrow_vals_address0),
    .din0       (arraysubrow_vals_din0),
    .dout0      (arraysubrow_vals_dout0),
    .ce1        (arraysubrow_vals_ce1),
    .we1        (arraysubrow_vals_we1),
    .address1   (arraysubrow_vals_address1),
    .din1       (arraysubrow_vals_din1),
    .dout1      (arraysubrow_vals_dout1),
    .ready      (arraysubrow_vals_ready),
    .done    (arraysubrow_vals_done)
);

// Assignment between dut and arraysubrow_vals
assign arraysubrow_vals_address0 = subrow_vals_address0;
assign arraysubrow_vals_ce0 = subrow_vals_ce0;
assign subrow_vals_q0 = arraysubrow_vals_dout0;
assign arraysubrow_vals_we0 = 0;
assign arraysubrow_vals_din0 = 0;
assign arraysubrow_vals_address1 = subrow_vals_address1;
assign arraysubrow_vals_ce1 = subrow_vals_ce1;
assign subrow_vals_q1 = arraysubrow_vals_dout1;
assign arraysubrow_vals_we1 = 0;
assign arraysubrow_vals_din1 = 0;
assign arraysubrow_vals_ready=    ready;
assign arraysubrow_vals_done = 0;


//------------------------arraysubrow_col_indices Instantiation--------------

// The input and output of arraysubrow_col_indices
wire    arraysubrow_col_indices_ce0, arraysubrow_col_indices_ce1;
wire [4 - 1 : 0]    arraysubrow_col_indices_we0, arraysubrow_col_indices_we1;
wire    [1 : 0]    arraysubrow_col_indices_address0, arraysubrow_col_indices_address1;
wire    [31 : 0]    arraysubrow_col_indices_din0, arraysubrow_col_indices_din1;
wire    [31 : 0]    arraysubrow_col_indices_dout0, arraysubrow_col_indices_dout1;
wire    arraysubrow_col_indices_ready;
wire    arraysubrow_col_indices_done;

`AESL_MEM_subrow_col_indices `AESL_MEM_INST_subrow_col_indices(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arraysubrow_col_indices_ce0),
    .we0        (arraysubrow_col_indices_we0),
    .address0   (arraysubrow_col_indices_address0),
    .din0       (arraysubrow_col_indices_din0),
    .dout0      (arraysubrow_col_indices_dout0),
    .ce1        (arraysubrow_col_indices_ce1),
    .we1        (arraysubrow_col_indices_we1),
    .address1   (arraysubrow_col_indices_address1),
    .din1       (arraysubrow_col_indices_din1),
    .dout1      (arraysubrow_col_indices_dout1),
    .ready      (arraysubrow_col_indices_ready),
    .done    (arraysubrow_col_indices_done)
);

// Assignment between dut and arraysubrow_col_indices
assign arraysubrow_col_indices_address0 = subrow_col_indices_address0;
assign arraysubrow_col_indices_ce0 = subrow_col_indices_ce0;
assign subrow_col_indices_q0 = arraysubrow_col_indices_dout0;
assign arraysubrow_col_indices_we0 = 0;
assign arraysubrow_col_indices_din0 = 0;
assign arraysubrow_col_indices_address1 = subrow_col_indices_address1;
assign arraysubrow_col_indices_ce1 = subrow_col_indices_ce1;
assign subrow_col_indices_q1 = arraysubrow_col_indices_dout1;
assign arraysubrow_col_indices_we1 = 0;
assign arraysubrow_col_indices_din1 = 0;
assign arraysubrow_col_indices_ready=    ready;
assign arraysubrow_col_indices_done = 0;


//------------------------arraymult_enables Instantiation--------------

// The input and output of arraymult_enables
wire    arraymult_enables_ce0, arraymult_enables_ce1;
wire [1 - 1 : 0]    arraymult_enables_we0, arraymult_enables_we1;
wire    [1 : 0]    arraymult_enables_address0, arraymult_enables_address1;
wire    [0 : 0]    arraymult_enables_din0, arraymult_enables_din1;
wire    [0 : 0]    arraymult_enables_dout0, arraymult_enables_dout1;
wire    arraymult_enables_ready;
wire    arraymult_enables_done;

`AESL_MEM_mult_enables `AESL_MEM_INST_mult_enables(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arraymult_enables_ce0),
    .we0        (arraymult_enables_we0),
    .address0   (arraymult_enables_address0),
    .din0       (arraymult_enables_din0),
    .dout0      (arraymult_enables_dout0),
    .ce1        (arraymult_enables_ce1),
    .we1        (arraymult_enables_we1),
    .address1   (arraymult_enables_address1),
    .din1       (arraymult_enables_din1),
    .dout1      (arraymult_enables_dout1),
    .ready      (arraymult_enables_ready),
    .done    (arraymult_enables_done)
);

// Assignment between dut and arraymult_enables
assign arraymult_enables_address0 = mult_enables_address0;
assign arraymult_enables_ce0 = mult_enables_ce0;
assign mult_enables_q0 = arraymult_enables_dout0;
assign arraymult_enables_we0 = 0;
assign arraymult_enables_din0 = 0;
assign arraymult_enables_address1 = mult_enables_address1;
assign arraymult_enables_ce1 = mult_enables_ce1;
assign mult_enables_q1 = arraymult_enables_dout1;
assign arraymult_enables_we1 = 0;
assign arraymult_enables_din1 = 0;
assign arraymult_enables_ready=    ready;
assign arraymult_enables_done = 0;


// The signal of port label_r
reg [31: 0] AESL_REG_label_r = 0;
assign label_r = AESL_REG_label_r;
initial begin : read_file_process_label_r
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [239  : 0] token;
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


//------------------------arrayinit_vector Instantiation--------------

// The input and output of arrayinit_vector
wire    arrayinit_vector_ce0, arrayinit_vector_ce1;
wire [4 - 1 : 0]    arrayinit_vector_we0, arrayinit_vector_we1;
wire    [4 : 0]    arrayinit_vector_address0, arrayinit_vector_address1;
wire    [31 : 0]    arrayinit_vector_din0, arrayinit_vector_din1;
wire    [31 : 0]    arrayinit_vector_dout0, arrayinit_vector_dout1;
wire    arrayinit_vector_ready;
wire    arrayinit_vector_done;

`AESL_MEM_init_vector `AESL_MEM_INST_init_vector(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayinit_vector_ce0),
    .we0        (arrayinit_vector_we0),
    .address0   (arrayinit_vector_address0),
    .din0       (arrayinit_vector_din0),
    .dout0      (arrayinit_vector_dout0),
    .ce1        (arrayinit_vector_ce1),
    .we1        (arrayinit_vector_we1),
    .address1   (arrayinit_vector_address1),
    .din1       (arrayinit_vector_din1),
    .dout1      (arrayinit_vector_dout1),
    .ready      (arrayinit_vector_ready),
    .done    (arrayinit_vector_done)
);

// Assignment between dut and arrayinit_vector
assign arrayinit_vector_address0 = init_vector_address0;
assign arrayinit_vector_ce0 = init_vector_ce0;
assign init_vector_q0 = arrayinit_vector_dout0;
assign arrayinit_vector_we0 = 0;
assign arrayinit_vector_din0 = 0;
assign arrayinit_vector_address1 = init_vector_address1;
assign arrayinit_vector_ce1 = init_vector_ce1;
assign init_vector_q1 = arrayinit_vector_dout1;
assign arrayinit_vector_we1 = 0;
assign arrayinit_vector_din1 = 0;
assign arrayinit_vector_ready=    ready;
assign arrayinit_vector_done = 0;


// The signal of port init
reg [0: 0] AESL_REG_init = 0;
assign init = AESL_REG_init;
initial begin : read_file_process_init
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [239  : 0] token;
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


reg end_subrow_vals;
reg [31:0] size_subrow_vals;
reg [31:0] size_subrow_vals_backup;
reg end_subrow_col_indices;
reg [31:0] size_subrow_col_indices;
reg [31:0] size_subrow_col_indices_backup;
reg end_mult_enables;
reg [31:0] size_mult_enables;
reg [31:0] size_mult_enables_backup;
reg end_label_r;
reg [31:0] size_label_r;
reg [31:0] size_label_r_backup;
reg end_init_vector;
reg [31:0] size_init_vector;
reg [31:0] size_init_vector_backup;
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
