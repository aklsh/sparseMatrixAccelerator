# This script segment is generated automatically by AutoPilot

set name accelerate_fadd_32ns_32ns_32_5_full_dsp_1_x
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name accelerate_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


set id 14
set name accelerate_mux_2332_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 32
set din2_signed 0
set din3_width 32
set din3_signed 0
set din4_width 32
set din4_signed 0
set din5_width 32
set din5_signed 0
set din6_width 32
set din6_signed 0
set din7_width 32
set din7_signed 0
set din8_width 32
set din8_signed 0
set din9_width 32
set din9_signed 0
set din10_width 32
set din10_signed 0
set din11_width 32
set din11_signed 0
set din12_width 32
set din12_signed 0
set din13_width 32
set din13_signed 0
set din14_width 32
set din14_signed 0
set din15_width 32
set din15_signed 0
set din16_width 32
set din16_signed 0
set din17_width 32
set din17_signed 0
set din18_width 32
set din18_signed 0
set din19_width 32
set din19_signed 0
set din20_width 32
set din20_signed 0
set din21_width 32
set din21_signed 0
set din22_width 32
set din22_signed 0
set din23_width 32
set din23_signed 0
set dout_width 32
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    din5_width ${din5_width} \
    din5_signed ${din5_signed} \
    din6_width ${din6_width} \
    din6_signed ${din6_signed} \
    din7_width ${din7_width} \
    din7_signed ${din7_signed} \
    din8_width ${din8_width} \
    din8_signed ${din8_signed} \
    din9_width ${din9_width} \
    din9_signed ${din9_signed} \
    din10_width ${din10_width} \
    din10_signed ${din10_signed} \
    din11_width ${din11_width} \
    din11_signed ${din11_signed} \
    din12_width ${din12_width} \
    din12_signed ${din12_signed} \
    din13_width ${din13_width} \
    din13_signed ${din13_signed} \
    din14_width ${din14_width} \
    din14_signed ${din14_signed} \
    din15_width ${din15_width} \
    din15_signed ${din15_signed} \
    din16_width ${din16_width} \
    din16_signed ${din16_signed} \
    din17_width ${din17_width} \
    din17_signed ${din17_signed} \
    din18_width ${din18_width} \
    din18_signed ${din18_signed} \
    din19_width ${din19_width} \
    din19_signed ${din19_signed} \
    din20_width ${din20_width} \
    din20_signed ${din20_signed} \
    din21_width ${din21_width} \
    din21_signed ${din21_signed} \
    din22_width ${din22_width} \
    din22_signed ${din22_signed} \
    din23_width ${din23_width} \
    din23_signed ${din23_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name out_r \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_out_r \
    op interface \
    ports { out_r { O 32 vector } out_r_ap_vld { O 1 bit } out_r_ap_lwr { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name subrow_vals_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_vals_0 \
    op interface \
    ports { subrow_vals_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name subrow_vals_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_vals_1 \
    op interface \
    ports { subrow_vals_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name subrow_vals_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_vals_2 \
    op interface \
    ports { subrow_vals_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name subrow_vals_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_vals_3 \
    op interface \
    ports { subrow_vals_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name subrow_col_indices_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_col_indices_0 \
    op interface \
    ports { subrow_col_indices_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name subrow_col_indices_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_col_indices_1 \
    op interface \
    ports { subrow_col_indices_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name subrow_col_indices_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_col_indices_2 \
    op interface \
    ports { subrow_col_indices_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name subrow_col_indices_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subrow_col_indices_3 \
    op interface \
    ports { subrow_col_indices_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name mult_enables_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mult_enables_0 \
    op interface \
    ports { mult_enables_0 { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name mult_enables_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mult_enables_1 \
    op interface \
    ports { mult_enables_1 { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name mult_enables_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mult_enables_2 \
    op interface \
    ports { mult_enables_2 { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name mult_enables_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mult_enables_3 \
    op interface \
    ports { mult_enables_3 { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name label_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_label_r \
    op interface \
    ports { label_r { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name init_vector_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_0 \
    op interface \
    ports { init_vector_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name init_vector_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_1 \
    op interface \
    ports { init_vector_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name init_vector_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_2 \
    op interface \
    ports { init_vector_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name init_vector_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_3 \
    op interface \
    ports { init_vector_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name init_vector_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_4 \
    op interface \
    ports { init_vector_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name init_vector_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_5 \
    op interface \
    ports { init_vector_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name init_vector_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_6 \
    op interface \
    ports { init_vector_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name init_vector_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_7 \
    op interface \
    ports { init_vector_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name init_vector_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_8 \
    op interface \
    ports { init_vector_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name init_vector_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_9 \
    op interface \
    ports { init_vector_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name init_vector_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_10 \
    op interface \
    ports { init_vector_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name init_vector_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_11 \
    op interface \
    ports { init_vector_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name init_vector_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_12 \
    op interface \
    ports { init_vector_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name init_vector_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_13 \
    op interface \
    ports { init_vector_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name init_vector_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_14 \
    op interface \
    ports { init_vector_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name init_vector_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_15 \
    op interface \
    ports { init_vector_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name init_vector_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_16 \
    op interface \
    ports { init_vector_16 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name init_vector_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_17 \
    op interface \
    ports { init_vector_17 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name init_vector_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_18 \
    op interface \
    ports { init_vector_18 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name init_vector_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_19 \
    op interface \
    ports { init_vector_19 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name init_vector_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_20 \
    op interface \
    ports { init_vector_20 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name init_vector_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_21 \
    op interface \
    ports { init_vector_21 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name init_vector_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init_vector_22 \
    op interface \
    ports { init_vector_22 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name init \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_init \
    op interface \
    ports { init { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


