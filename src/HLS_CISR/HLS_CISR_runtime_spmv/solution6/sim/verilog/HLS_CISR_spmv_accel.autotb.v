// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      HLS_CISR_spmv_accel
`define AUTOTB_DUT_INST AESL_inst_HLS_CISR_spmv_accel
`define AUTOTB_TOP      apatb_HLS_CISR_spmv_accel_top
`define AUTOTB_LAT_RESULT_FILE "HLS_CISR_spmv_accel.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "HLS_CISR_spmv_accel.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_HLS_CISR_spmv_accel_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 6.00

`define AESL_DEPTH_cmd_start 1
`define AESL_MEM_inp_vec AESL_automem_inp_vec
`define AESL_MEM_INST_inp_vec mem_inst_inp_vec
`define AESL_MEM_slot_data_arr AESL_automem_slot_data_arr
`define AESL_MEM_INST_slot_data_arr mem_inst_slot_data_arr
`define AESL_MEM_slot_arr_row_len AESL_automem_slot_arr_row_len
`define AESL_MEM_INST_slot_arr_row_len mem_inst_slot_arr_row_len
`define AESL_MEM_output_vec AESL_automem_output_vec
`define AESL_MEM_INST_output_vec mem_inst_output_vec
`define AUTOTB_TVIN_cmd_start  "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_cmd_start.dat"
`define AUTOTB_TVIN_inp_vec  "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_inp_vec.dat"
`define AUTOTB_TVIN_slot_data_arr  "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_slot_data_arr.dat"
`define AUTOTB_TVIN_slot_arr_row_len  "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_slot_arr_row_len.dat"
`define AUTOTB_TVIN_output_vec  "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvin_output_vec.dat"
`define AUTOTB_TVIN_cmd_start_out_wrapc  "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvin_cmd_start.dat"
`define AUTOTB_TVIN_inp_vec_out_wrapc  "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvin_inp_vec.dat"
`define AUTOTB_TVIN_slot_data_arr_out_wrapc  "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvin_slot_data_arr.dat"
`define AUTOTB_TVIN_slot_arr_row_len_out_wrapc  "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvin_slot_arr_row_len.dat"
`define AUTOTB_TVIN_output_vec_out_wrapc  "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvin_output_vec.dat"
`define AUTOTB_TVOUT_output_vec  "../tv/cdatafile/c.HLS_CISR_spmv_accel.autotvout_output_vec.dat"
`define AUTOTB_TVOUT_output_vec_out_wrapc  "../tv/rtldatafile/rtl.HLS_CISR_spmv_accel.autotvout_output_vec.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 4;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 30;
parameter LENGTH_cmd_start = 1;
parameter LENGTH_inp_vec = 8;
parameter LENGTH_slot_data_arr = 4;
parameter LENGTH_slot_arr_row_len = 4;
parameter LENGTH_output_vec = 8;

task read_token;
    input integer fp;
    output reg [223 : 0] token;
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
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [0 : 0] cmd_start;
wire [2 : 0] inp_vec_address0;
wire  inp_vec_ce0;
wire [31 : 0] inp_vec_q0;
wire [1 : 0] slot_data_arr_address0;
wire  slot_data_arr_ce0;
wire [63 : 0] slot_data_arr_q0;
wire [1 : 0] slot_arr_row_len_address0;
wire  slot_arr_row_len_ce0;
wire [31 : 0] slot_arr_row_len_q0;
wire [2 : 0] output_vec_address0;
wire  output_vec_ce0;
wire  output_vec_we0;
wire [31 : 0] output_vec_d0;
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
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .cmd_start(cmd_start),
    .inp_vec_address0(inp_vec_address0),
    .inp_vec_ce0(inp_vec_ce0),
    .inp_vec_q0(inp_vec_q0),
    .slot_data_arr_address0(slot_data_arr_address0),
    .slot_data_arr_ce0(slot_data_arr_ce0),
    .slot_data_arr_q0(slot_data_arr_q0),
    .slot_arr_row_len_address0(slot_arr_row_len_address0),
    .slot_arr_row_len_ce0(slot_arr_row_len_ce0),
    .slot_arr_row_len_q0(slot_arr_row_len_q0),
    .output_vec_address0(output_vec_address0),
    .output_vec_ce0(output_vec_ce0),
    .output_vec_we0(output_vec_we0),
    .output_vec_d0(output_vec_d0));

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
// The signal of port cmd_start
reg [0: 0] AESL_REG_cmd_start = 0;
assign cmd_start = AESL_REG_cmd_start;
initial begin : read_file_process_cmd_start
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [223  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_cmd_start,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_cmd_start);
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
            ret = $sscanf(token, "0x%x", AESL_REG_cmd_start);
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


//------------------------arrayinp_vec Instantiation--------------

// The input and output of arrayinp_vec
wire    arrayinp_vec_ce0, arrayinp_vec_ce1;
wire [4 - 1 : 0]    arrayinp_vec_we0, arrayinp_vec_we1;
wire    [2 : 0]    arrayinp_vec_address0, arrayinp_vec_address1;
wire    [31 : 0]    arrayinp_vec_din0, arrayinp_vec_din1;
wire    [31 : 0]    arrayinp_vec_dout0, arrayinp_vec_dout1;
wire    arrayinp_vec_ready;
wire    arrayinp_vec_done;

`AESL_MEM_inp_vec `AESL_MEM_INST_inp_vec(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayinp_vec_ce0),
    .we0        (arrayinp_vec_we0),
    .address0   (arrayinp_vec_address0),
    .din0       (arrayinp_vec_din0),
    .dout0      (arrayinp_vec_dout0),
    .ce1        (arrayinp_vec_ce1),
    .we1        (arrayinp_vec_we1),
    .address1   (arrayinp_vec_address1),
    .din1       (arrayinp_vec_din1),
    .dout1      (arrayinp_vec_dout1),
    .ready      (arrayinp_vec_ready),
    .done    (arrayinp_vec_done)
);

// Assignment between dut and arrayinp_vec
assign arrayinp_vec_address0 = inp_vec_address0;
assign arrayinp_vec_ce0 = inp_vec_ce0;
assign inp_vec_q0 = arrayinp_vec_dout0;
assign arrayinp_vec_we0 = 0;
assign arrayinp_vec_din0 = 0;
assign arrayinp_vec_we1 = 0;
assign arrayinp_vec_din1 = 0;
assign arrayinp_vec_ready=    ready;
assign arrayinp_vec_done = 0;


//------------------------arrayslot_data_arr Instantiation--------------

// The input and output of arrayslot_data_arr
wire    arrayslot_data_arr_ce0, arrayslot_data_arr_ce1;
wire [8 - 1 : 0]    arrayslot_data_arr_we0, arrayslot_data_arr_we1;
wire    [1 : 0]    arrayslot_data_arr_address0, arrayslot_data_arr_address1;
wire    [63 : 0]    arrayslot_data_arr_din0, arrayslot_data_arr_din1;
wire    [63 : 0]    arrayslot_data_arr_dout0, arrayslot_data_arr_dout1;
wire    arrayslot_data_arr_ready;
wire    arrayslot_data_arr_done;

`AESL_MEM_slot_data_arr `AESL_MEM_INST_slot_data_arr(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayslot_data_arr_ce0),
    .we0        (arrayslot_data_arr_we0),
    .address0   (arrayslot_data_arr_address0),
    .din0       (arrayslot_data_arr_din0),
    .dout0      (arrayslot_data_arr_dout0),
    .ce1        (arrayslot_data_arr_ce1),
    .we1        (arrayslot_data_arr_we1),
    .address1   (arrayslot_data_arr_address1),
    .din1       (arrayslot_data_arr_din1),
    .dout1      (arrayslot_data_arr_dout1),
    .ready      (arrayslot_data_arr_ready),
    .done    (arrayslot_data_arr_done)
);

// Assignment between dut and arrayslot_data_arr
assign arrayslot_data_arr_address0 = slot_data_arr_address0;
assign arrayslot_data_arr_ce0 = slot_data_arr_ce0;
assign slot_data_arr_q0 = arrayslot_data_arr_dout0;
assign arrayslot_data_arr_we0 = 0;
assign arrayslot_data_arr_din0 = 0;
assign arrayslot_data_arr_we1 = 0;
assign arrayslot_data_arr_din1 = 0;
assign arrayslot_data_arr_ready=    ready;
assign arrayslot_data_arr_done = 0;


//------------------------arrayslot_arr_row_len Instantiation--------------

// The input and output of arrayslot_arr_row_len
wire    arrayslot_arr_row_len_ce0, arrayslot_arr_row_len_ce1;
wire [4 - 1 : 0]    arrayslot_arr_row_len_we0, arrayslot_arr_row_len_we1;
wire    [1 : 0]    arrayslot_arr_row_len_address0, arrayslot_arr_row_len_address1;
wire    [31 : 0]    arrayslot_arr_row_len_din0, arrayslot_arr_row_len_din1;
wire    [31 : 0]    arrayslot_arr_row_len_dout0, arrayslot_arr_row_len_dout1;
wire    arrayslot_arr_row_len_ready;
wire    arrayslot_arr_row_len_done;

`AESL_MEM_slot_arr_row_len `AESL_MEM_INST_slot_arr_row_len(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayslot_arr_row_len_ce0),
    .we0        (arrayslot_arr_row_len_we0),
    .address0   (arrayslot_arr_row_len_address0),
    .din0       (arrayslot_arr_row_len_din0),
    .dout0      (arrayslot_arr_row_len_dout0),
    .ce1        (arrayslot_arr_row_len_ce1),
    .we1        (arrayslot_arr_row_len_we1),
    .address1   (arrayslot_arr_row_len_address1),
    .din1       (arrayslot_arr_row_len_din1),
    .dout1      (arrayslot_arr_row_len_dout1),
    .ready      (arrayslot_arr_row_len_ready),
    .done    (arrayslot_arr_row_len_done)
);

// Assignment between dut and arrayslot_arr_row_len
assign arrayslot_arr_row_len_address0 = slot_arr_row_len_address0;
assign arrayslot_arr_row_len_ce0 = slot_arr_row_len_ce0;
assign slot_arr_row_len_q0 = arrayslot_arr_row_len_dout0;
assign arrayslot_arr_row_len_we0 = 0;
assign arrayslot_arr_row_len_din0 = 0;
assign arrayslot_arr_row_len_we1 = 0;
assign arrayslot_arr_row_len_din1 = 0;
assign arrayslot_arr_row_len_ready=    ready;
assign arrayslot_arr_row_len_done = 0;


//------------------------arrayoutput_vec Instantiation--------------

// The input and output of arrayoutput_vec
wire    arrayoutput_vec_ce0, arrayoutput_vec_ce1;
wire [4 - 1 : 0]    arrayoutput_vec_we0, arrayoutput_vec_we1;
wire    [2 : 0]    arrayoutput_vec_address0, arrayoutput_vec_address1;
wire    [31 : 0]    arrayoutput_vec_din0, arrayoutput_vec_din1;
wire    [31 : 0]    arrayoutput_vec_dout0, arrayoutput_vec_dout1;
wire    arrayoutput_vec_ready;
wire    arrayoutput_vec_done;

`AESL_MEM_output_vec `AESL_MEM_INST_output_vec(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayoutput_vec_ce0),
    .we0        (arrayoutput_vec_we0),
    .address0   (arrayoutput_vec_address0),
    .din0       (arrayoutput_vec_din0),
    .dout0      (arrayoutput_vec_dout0),
    .ce1        (arrayoutput_vec_ce1),
    .we1        (arrayoutput_vec_we1),
    .address1   (arrayoutput_vec_address1),
    .din1       (arrayoutput_vec_din1),
    .dout1      (arrayoutput_vec_dout1),
    .ready      (arrayoutput_vec_ready),
    .done    (arrayoutput_vec_done)
);

// Assignment between dut and arrayoutput_vec
assign arrayoutput_vec_address0 = output_vec_address0;
assign arrayoutput_vec_ce0 = output_vec_ce0;
assign arrayoutput_vec_we0[0] = output_vec_we0;
assign arrayoutput_vec_we0[1] = output_vec_we0;
assign arrayoutput_vec_we0[2] = output_vec_we0;
assign arrayoutput_vec_we0[3] = output_vec_we0;
assign arrayoutput_vec_din0 = output_vec_d0;
assign arrayoutput_vec_we1 = 0;
assign arrayoutput_vec_din1 = 0;
assign arrayoutput_vec_ready= ready_initial | arrayoutput_vec_done;
assign arrayoutput_vec_done =    AESL_done_delay;


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
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_cmd_start;
reg [31:0] size_cmd_start;
reg [31:0] size_cmd_start_backup;
reg end_inp_vec;
reg [31:0] size_inp_vec;
reg [31:0] size_inp_vec_backup;
reg end_slot_data_arr;
reg [31:0] size_slot_data_arr;
reg [31:0] size_slot_data_arr_backup;
reg end_slot_arr_row_len;
reg [31:0] size_slot_arr_row_len;
reg [31:0] size_slot_arr_row_len_backup;
reg end_output_vec;
reg [31:0] size_output_vec;
reg [31:0] size_output_vec_backup;

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

reg dump_tvout_finish_output_vec;

initial begin : dump_tvout_runtime_sign_output_vec
    integer fp;
    dump_tvout_finish_output_vec = 0;
    fp = $fopen(`AUTOTB_TVOUT_output_vec_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_output_vec_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_output_vec_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_output_vec_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_output_vec = 1;
end


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
