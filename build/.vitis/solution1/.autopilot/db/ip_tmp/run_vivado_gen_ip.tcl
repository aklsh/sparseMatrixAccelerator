create_project prj -part xc7z020-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/home/akileshkannan/SPMV_CSR/solution1/syn/verilog/accelerate_fadd_32ns_32ns_32_5_full_dsp_1_x_ip.tcl"
source "/home/akileshkannan/SPMV_CSR/solution1/syn/verilog/accelerate_fadd_32ns_32ns_32_5_full_dsp_1_ip.tcl"
source "/home/akileshkannan/SPMV_CSR/solution1/syn/verilog/accelerate_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
