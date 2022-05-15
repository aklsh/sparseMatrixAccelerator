set SynModuleInfo {
  {SRCNAME reduce MODELNAME reduce RTLNAME accelerate_reduce}
  {SRCNAME accelerate MODELNAME accelerate RTLNAME accelerate IS_TOP 1
    SUBMODULES {
      {MODELNAME accelerate_mul_32s_32s_32_2_1 RTLNAME accelerate_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME accelerate_storage_RAM_AUTO_1R1W RTLNAME accelerate_storage_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
