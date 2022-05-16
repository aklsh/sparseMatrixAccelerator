// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         bit 5 - enable ap_local_deadlock interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (COR/TOW)
//         bit 1 - ap_ready (COR/TOW)
//         bit 5 - ap_local_deadlock (COR/TOW)
//         others - reserved
// 0x018 : Data signal of dotProd
//         bit 31~0 - dotProd[31:0] (Read)
// 0x01c : Control signal of dotProd
//         bit 0  - dotProd_ap_vld (Read/COR)
//         others - reserved
// 0x010 ~
// 0x017 : Memory 'indices' (2 * 32b)
//         Word n : bit [31:0] - indices[n]
// 0x080 ~
// 0x0ff : Memory 'dataValues' (32 * 32b)
//         Word n : bit [31:0] - dataValues[n]
// 0x100 ~
// 0x1ff : Memory 'inp_vector' (64 * 32b)
//         Word n : bit [31:0] - inp_vector[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL         0x000
#define XSPARSE2_4MULT_CONTROL_ADDR_GIE             0x004
#define XSPARSE2_4MULT_CONTROL_ADDR_IER             0x008
#define XSPARSE2_4MULT_CONTROL_ADDR_ISR             0x00c
#define XSPARSE2_4MULT_CONTROL_ADDR_DOTPROD_DATA    0x018
#define XSPARSE2_4MULT_CONTROL_BITS_DOTPROD_DATA    32
#define XSPARSE2_4MULT_CONTROL_ADDR_DOTPROD_CTRL    0x01c
#define XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE    0x010
#define XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH    0x017
#define XSPARSE2_4MULT_CONTROL_WIDTH_INDICES        32
#define XSPARSE2_4MULT_CONTROL_DEPTH_INDICES        2
#define XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE 0x080
#define XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH 0x0ff
#define XSPARSE2_4MULT_CONTROL_WIDTH_DATAVALUES     32
#define XSPARSE2_4MULT_CONTROL_DEPTH_DATAVALUES     32
#define XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE 0x100
#define XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH 0x1ff
#define XSPARSE2_4MULT_CONTROL_WIDTH_INP_VECTOR     32
#define XSPARSE2_4MULT_CONTROL_DEPTH_INP_VECTOR     64

