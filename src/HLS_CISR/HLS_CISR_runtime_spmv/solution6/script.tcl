############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project HLS_CISR_runtime_spmv
set_top HLS_CISR_spmv_accel
add_files HLS_CISR_spmv_accel.c
add_files -tb HLS_CISR_spmv_accel_tb.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution6" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 12 -name default
config_export -format ip_catalog -output /home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.zip -rtl verilog
source "./HLS_CISR_runtime_spmv/solution6/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_spmv_accel.zip
