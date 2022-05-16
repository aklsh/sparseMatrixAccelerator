// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_accelerate (
volatile void* out_r,
volatile void* subrow_vals,
volatile void* subrow_col_indices,
volatile void* mult_enables,
int label_r,
volatile void* init_vector,
char init);
