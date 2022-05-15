// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module accelerate_accelerate_Pipeline_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        reducer_circuit_levels_buffer_value_0_1,
        reducer_circuit_levels_buffer_value_0_1_ap_vld,
        reducer_circuit_levels_buffer_label_0_0,
        reducer_circuit_levels_buffer_label_0_0_ap_vld,
        reducer_circuit_levels_buffer_value_0_0,
        reducer_circuit_levels_buffer_value_0_0_ap_vld,
        reducer_circuit_levels_buffer_value_1_0,
        reducer_circuit_levels_buffer_value_1_0_ap_vld,
        reducer_circuit_levels_buffer_label_1_0,
        reducer_circuit_levels_buffer_label_1_0_ap_vld,
        reducer_circuit_levels_buffer_value_1_1,
        reducer_circuit_levels_buffer_value_1_1_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] reducer_circuit_levels_buffer_value_0_1;
output   reducer_circuit_levels_buffer_value_0_1_ap_vld;
output  [31:0] reducer_circuit_levels_buffer_label_0_0;
output   reducer_circuit_levels_buffer_label_0_0_ap_vld;
output  [31:0] reducer_circuit_levels_buffer_value_0_0;
output   reducer_circuit_levels_buffer_value_0_0_ap_vld;
output  [31:0] reducer_circuit_levels_buffer_value_1_0;
output   reducer_circuit_levels_buffer_value_1_0_ap_vld;
output  [31:0] reducer_circuit_levels_buffer_label_1_0;
output   reducer_circuit_levels_buffer_label_1_0_ap_vld;
output  [31:0] reducer_circuit_levels_buffer_value_1_1;
output   reducer_circuit_levels_buffer_value_1_1_ap_vld;

reg ap_idle;
reg reducer_circuit_levels_buffer_value_0_1_ap_vld;
reg reducer_circuit_levels_buffer_label_0_0_ap_vld;
reg reducer_circuit_levels_buffer_value_0_0_ap_vld;
reg reducer_circuit_levels_buffer_value_1_0_ap_vld;
reg reducer_circuit_levels_buffer_label_1_0_ap_vld;
reg reducer_circuit_levels_buffer_value_1_1_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] ap_phi_mux_indvar_i_phi_fu_33_p4;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [0:0] indvar_i_reg_30;
wire   [0:0] xor_ln23_fu_40_p2;
wire    ap_loop_init;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

accelerate_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_i_reg_30 <= xor_ln23_fu_40_p2;
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_indvar_i_phi_fu_33_p4 = 1'd0;
    end else begin
        ap_phi_mux_indvar_i_phi_fu_33_p4 = indvar_i_reg_30;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        reducer_circuit_levels_buffer_label_0_0_ap_vld = 1'b1;
    end else begin
        reducer_circuit_levels_buffer_label_0_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        reducer_circuit_levels_buffer_label_1_0_ap_vld = 1'b1;
    end else begin
        reducer_circuit_levels_buffer_label_1_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        reducer_circuit_levels_buffer_value_0_0_ap_vld = 1'b1;
    end else begin
        reducer_circuit_levels_buffer_value_0_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        reducer_circuit_levels_buffer_value_0_1_ap_vld = 1'b1;
    end else begin
        reducer_circuit_levels_buffer_value_0_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        reducer_circuit_levels_buffer_value_1_0_ap_vld = 1'b1;
    end else begin
        reducer_circuit_levels_buffer_value_1_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_phi_mux_indvar_i_phi_fu_33_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        reducer_circuit_levels_buffer_value_1_1_ap_vld = 1'b1;
    end else begin
        reducer_circuit_levels_buffer_value_1_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign reducer_circuit_levels_buffer_label_0_0 = 32'd0;

assign reducer_circuit_levels_buffer_label_1_0 = 32'd0;

assign reducer_circuit_levels_buffer_value_0_0 = 32'd0;

assign reducer_circuit_levels_buffer_value_0_1 = 32'd0;

assign reducer_circuit_levels_buffer_value_1_0 = 32'd0;

assign reducer_circuit_levels_buffer_value_1_1 = 32'd0;

assign xor_ln23_fu_40_p2 = (ap_phi_mux_indvar_i_phi_fu_33_p4 ^ 1'd1);

endmodule //accelerate_accelerate_Pipeline_1