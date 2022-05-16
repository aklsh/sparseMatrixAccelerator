set SynModuleInfo {
  {SRCNAME reduce MODELNAME reduce RTLNAME accelerate_reduce
    SUBMODULES {
      {MODELNAME accelerate_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME accelerate_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME accelerate MODELNAME accelerate RTLNAME accelerate IS_TOP 1
    SUBMODULES {
      {MODELNAME accelerate_fadd_32ns_32ns_32_5_full_dsp_1_x RTLNAME accelerate_fadd_32ns_32ns_32_5_full_dsp_1_x BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME accelerate_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME accelerate_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME accelerate_mux_2332_32_1_1 RTLNAME accelerate_mux_2332_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
}
