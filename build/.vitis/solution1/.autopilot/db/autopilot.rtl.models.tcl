set SynModuleInfo {
  {SRCNAME reduce MODELNAME reduce RTLNAME accelerate_reduce}
  {SRCNAME accelerate MODELNAME accelerate RTLNAME accelerate IS_TOP 1
    SUBMODULES {
      {MODELNAME accelerate_mux_2332_32_1_1 RTLNAME accelerate_mux_2332_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME accelerate_mul_32s_32s_32_2_1 RTLNAME accelerate_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
