############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project SPMV_CSR
set_top accelerate
add_files SPMV_CSR_src/accelerator/reducer.hpp
add_files SPMV_CSR_src/accelerator/reducer.cpp
add_files SPMV_CSR_src/encoded_data.hpp
add_files SPMV_CSR_src/accelerator/constants.hpp
add_files SPMV_CSR_src/accelerator/accelerator.hpp
add_files SPMV_CSR_src/accelerator/accelerator.cpp
add_files -tb SPMV_CSR_src/main.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution2" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/akileshkannan/SPMV_CSR_src -rtl verilog
source "./SPMV_CSR/solution2/directives.tcl"
csim_design -ldflags {-B"/usr/lib/x86_64-linux-gnu/"} -clean -setup
csynth_design
cosim_design -ldflags {-B"/usr/lib/x86_64-linux-gnu/"}
export_design -rtl verilog -format ip_catalog -output /home/akileshkannan/SPMV_CSR_src
