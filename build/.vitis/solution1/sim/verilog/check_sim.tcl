# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# ==============================================================
proc sc_sim_check {ret err logfile} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        while {[gets $fl line] >= 0} {
            if {[string first "AESL_mErrNo = " $line] == 0} {
                set mismatch_num [string range $line [string length "AESL_mErrNo = "] end]
                if {$mismatch_num != 0} {
                    ::AP::printMsg ERR COSIM 403 COSIM_403_986 ${mismatch_num}
                    break
                }
            }
        }
    }
    if {$ret || $err != ""} {
        if { [lindex $::errorCode 0] eq "CHILDSTATUS"} {
            set status [lindex $::errorCode 2]
            if {$status != ""} {
                ::AP::printMsg ERR COSIM 404 COSIM_404_987 $status
            } else {
                ::AP::printMsg ERR COSIM 405 COSIM_405_988
            }
        } else {
            ::AP::printMsg ERR COSIM 405 COSIM_405_989
        }
    }
    if {[file exists $logfile]} {
        set cmdret [catch {eval exec "grep \"Error:\" $logfile"} err]
        file delete -force $logfile
        if {$cmdret == 0} {
            ::AP::printMsg ERR COSIM 405 COSIM_405_990
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc rtl_sim_check {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        set unmatch_num 0
        while {[gets $fl line] >= 0} {
            if {[string first "unmatched" $line] != -1} {
                set unmatch_num [expr $unmatch_num + 1]
            }
        }
        if {$unmatch_num != 0} {
            ::AP::printMsg ERR COSIM 406 COSIM_406_991 ${unmatch_num}
        }
    }
    if {[file exists ".aesl_error"]} {
        set errfl [open ".aesl_error" r]
        gets $errfl line
        if {$line != 0} {
            ::AP::printMsg ERR COSIM 407 COSIM_407_992 $line
        }
    }
    if {[file exists ".exit.err"]} {
        ::AP::printMsg ERR COSIM 405 COSIM_405_993
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc check_tvin_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "c.accelerate.autotvin_subrow_vals_0.dat"
         "c.accelerate.autotvin_subrow_vals_1.dat"
         "c.accelerate.autotvin_subrow_vals_2.dat"
         "c.accelerate.autotvin_subrow_vals_3.dat"
         "c.accelerate.autotvin_subrow_col_indices_0.dat"
         "c.accelerate.autotvin_subrow_col_indices_1.dat"
         "c.accelerate.autotvin_subrow_col_indices_2.dat"
         "c.accelerate.autotvin_subrow_col_indices_3.dat"
         "c.accelerate.autotvin_mult_enables_0.dat"
         "c.accelerate.autotvin_mult_enables_1.dat"
         "c.accelerate.autotvin_mult_enables_2.dat"
         "c.accelerate.autotvin_mult_enables_3.dat"
         "c.accelerate.autotvin_label_r.dat"
         "c.accelerate.autotvin_init_vector_0.dat"
         "c.accelerate.autotvin_init_vector_1.dat"
         "c.accelerate.autotvin_init_vector_2.dat"
         "c.accelerate.autotvin_init_vector_3.dat"
         "c.accelerate.autotvin_init_vector_4.dat"
         "c.accelerate.autotvin_init_vector_5.dat"
         "c.accelerate.autotvin_init_vector_6.dat"
         "c.accelerate.autotvin_init_vector_7.dat"
         "c.accelerate.autotvin_init_vector_8.dat"
         "c.accelerate.autotvin_init_vector_9.dat"
         "c.accelerate.autotvin_init_vector_10.dat"
         "c.accelerate.autotvin_init_vector_11.dat"
         "c.accelerate.autotvin_init_vector_12.dat"
         "c.accelerate.autotvin_init_vector_13.dat"
         "c.accelerate.autotvin_init_vector_14.dat"
         "c.accelerate.autotvin_init_vector_15.dat"
         "c.accelerate.autotvin_init_vector_16.dat"
         "c.accelerate.autotvin_init_vector_17.dat"
         "c.accelerate.autotvin_init_vector_18.dat"
         "c.accelerate.autotvin_init_vector_19.dat"
         "c.accelerate.autotvin_init_vector_20.dat"
         "c.accelerate.autotvin_init_vector_21.dat"
         "c.accelerate.autotvin_init_vector_22.dat"
         "c.accelerate.autotvin_init.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ::AP::printMsg ERR COSIM 320 COSIM_320_994
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}

proc check_tvout_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "rtl.accelerate.autotvout_out_r.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ::AP::printMsg ERR COSIM 303 COSIM_303_996
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}
