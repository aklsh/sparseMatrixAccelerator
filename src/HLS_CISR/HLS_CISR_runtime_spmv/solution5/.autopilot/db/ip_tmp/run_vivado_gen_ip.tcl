create_project prj -part xc7z020-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_runtime_spmv/solution5/syn/verilog/HLS_CISR_spmv_accel_ap_fadd_3_full_dsp_32_ip.tcl"
source "/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_runtime_spmv/solution5/syn/verilog/HLS_CISR_spmv_accel_ap_fmul_2_max_dsp_32_ip.tcl"
