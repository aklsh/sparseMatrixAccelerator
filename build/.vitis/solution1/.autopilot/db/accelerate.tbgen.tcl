set moduleName accelerate
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {accelerate}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_r int 32 regular {pointer 1}  }
	{ subrow_vals_0 int 32 regular {pointer 0}  }
	{ subrow_vals_1 int 32 regular {pointer 0}  }
	{ subrow_vals_2 int 32 regular {pointer 0}  }
	{ subrow_vals_3 int 32 regular {pointer 0}  }
	{ subrow_col_indices_0 int 32 regular {pointer 0}  }
	{ subrow_col_indices_1 int 32 regular {pointer 0}  }
	{ subrow_col_indices_2 int 32 regular {pointer 0}  }
	{ subrow_col_indices_3 int 32 regular {pointer 0}  }
	{ mult_enables_0 int 1 regular {pointer 0}  }
	{ mult_enables_1 int 1 regular {pointer 0}  }
	{ mult_enables_2 int 1 regular {pointer 0}  }
	{ mult_enables_3 int 1 regular {pointer 0}  }
	{ label_r int 32 regular  }
	{ init_vector_0 int 32 regular {pointer 0}  }
	{ init_vector_1 int 32 regular {pointer 0}  }
	{ init_vector_2 int 32 regular {pointer 0}  }
	{ init_vector_3 int 32 regular {pointer 0}  }
	{ init_vector_4 int 32 regular {pointer 0}  }
	{ init_vector_5 int 32 regular {pointer 0}  }
	{ init_vector_6 int 32 regular {pointer 0}  }
	{ init_vector_7 int 32 regular {pointer 0}  }
	{ init_vector_8 int 32 regular {pointer 0}  }
	{ init_vector_9 int 32 regular {pointer 0}  }
	{ init_vector_10 int 32 regular {pointer 0}  }
	{ init_vector_11 int 32 regular {pointer 0}  }
	{ init_vector_12 int 32 regular {pointer 0}  }
	{ init_vector_13 int 32 regular {pointer 0}  }
	{ init_vector_14 int 32 regular {pointer 0}  }
	{ init_vector_15 int 32 regular {pointer 0}  }
	{ init_vector_16 int 32 regular {pointer 0}  }
	{ init_vector_17 int 32 regular {pointer 0}  }
	{ init_vector_18 int 32 regular {pointer 0}  }
	{ init_vector_19 int 32 regular {pointer 0}  }
	{ init_vector_20 int 32 regular {pointer 0}  }
	{ init_vector_21 int 32 regular {pointer 0}  }
	{ init_vector_22 int 32 regular {pointer 0}  }
	{ init uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "out_r", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "subrow_vals_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_vals_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_vals_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_vals_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_col_indices_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_col_indices_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_col_indices_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_col_indices_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mult_enables_0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mult_enables_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mult_enables_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mult_enables_3", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "label_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_9", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_12", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_13", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_14", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_15", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_16", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_17", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_18", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_19", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_20", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_21", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector_22", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 48
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_local_deadlock sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_r sc_out sc_lv 32 signal 0 } 
	{ out_r_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ subrow_vals_0 sc_in sc_lv 32 signal 1 } 
	{ subrow_vals_1 sc_in sc_lv 32 signal 2 } 
	{ subrow_vals_2 sc_in sc_lv 32 signal 3 } 
	{ subrow_vals_3 sc_in sc_lv 32 signal 4 } 
	{ subrow_col_indices_0 sc_in sc_lv 32 signal 5 } 
	{ subrow_col_indices_1 sc_in sc_lv 32 signal 6 } 
	{ subrow_col_indices_2 sc_in sc_lv 32 signal 7 } 
	{ subrow_col_indices_3 sc_in sc_lv 32 signal 8 } 
	{ mult_enables_0 sc_in sc_logic 1 signal 9 } 
	{ mult_enables_1 sc_in sc_logic 1 signal 10 } 
	{ mult_enables_2 sc_in sc_logic 1 signal 11 } 
	{ mult_enables_3 sc_in sc_logic 1 signal 12 } 
	{ label_r sc_in sc_lv 32 signal 13 } 
	{ init_vector_0 sc_in sc_lv 32 signal 14 } 
	{ init_vector_1 sc_in sc_lv 32 signal 15 } 
	{ init_vector_2 sc_in sc_lv 32 signal 16 } 
	{ init_vector_3 sc_in sc_lv 32 signal 17 } 
	{ init_vector_4 sc_in sc_lv 32 signal 18 } 
	{ init_vector_5 sc_in sc_lv 32 signal 19 } 
	{ init_vector_6 sc_in sc_lv 32 signal 20 } 
	{ init_vector_7 sc_in sc_lv 32 signal 21 } 
	{ init_vector_8 sc_in sc_lv 32 signal 22 } 
	{ init_vector_9 sc_in sc_lv 32 signal 23 } 
	{ init_vector_10 sc_in sc_lv 32 signal 24 } 
	{ init_vector_11 sc_in sc_lv 32 signal 25 } 
	{ init_vector_12 sc_in sc_lv 32 signal 26 } 
	{ init_vector_13 sc_in sc_lv 32 signal 27 } 
	{ init_vector_14 sc_in sc_lv 32 signal 28 } 
	{ init_vector_15 sc_in sc_lv 32 signal 29 } 
	{ init_vector_16 sc_in sc_lv 32 signal 30 } 
	{ init_vector_17 sc_in sc_lv 32 signal 31 } 
	{ init_vector_18 sc_in sc_lv 32 signal 32 } 
	{ init_vector_19 sc_in sc_lv 32 signal 33 } 
	{ init_vector_20 sc_in sc_lv 32 signal 34 } 
	{ init_vector_21 sc_in sc_lv 32 signal 35 } 
	{ init_vector_22 sc_in sc_lv 32 signal 36 } 
	{ init sc_in sc_logic 1 signal 37 } 
	{ out_r_ap_lwr sc_out sc_logic 1 outlwr 0 } 
}
set NewPortList {[ 
	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_local_deadlock", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_deadlock", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_r", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_r", "role": "default" }} , 
 	{ "name": "out_r_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "ap_vld" }} , 
 	{ "name": "subrow_vals_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_vals_0", "role": "default" }} , 
 	{ "name": "subrow_vals_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_vals_1", "role": "default" }} , 
 	{ "name": "subrow_vals_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_vals_2", "role": "default" }} , 
 	{ "name": "subrow_vals_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_vals_3", "role": "default" }} , 
 	{ "name": "subrow_col_indices_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_col_indices_0", "role": "default" }} , 
 	{ "name": "subrow_col_indices_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_col_indices_1", "role": "default" }} , 
 	{ "name": "subrow_col_indices_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_col_indices_2", "role": "default" }} , 
 	{ "name": "subrow_col_indices_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_col_indices_3", "role": "default" }} , 
 	{ "name": "mult_enables_0", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables_0", "role": "default" }} , 
 	{ "name": "mult_enables_1", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables_1", "role": "default" }} , 
 	{ "name": "mult_enables_2", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables_2", "role": "default" }} , 
 	{ "name": "mult_enables_3", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables_3", "role": "default" }} , 
 	{ "name": "label_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "label_r", "role": "default" }} , 
 	{ "name": "init_vector_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_0", "role": "default" }} , 
 	{ "name": "init_vector_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_1", "role": "default" }} , 
 	{ "name": "init_vector_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_2", "role": "default" }} , 
 	{ "name": "init_vector_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_3", "role": "default" }} , 
 	{ "name": "init_vector_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_4", "role": "default" }} , 
 	{ "name": "init_vector_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_5", "role": "default" }} , 
 	{ "name": "init_vector_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_6", "role": "default" }} , 
 	{ "name": "init_vector_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_7", "role": "default" }} , 
 	{ "name": "init_vector_8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_8", "role": "default" }} , 
 	{ "name": "init_vector_9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_9", "role": "default" }} , 
 	{ "name": "init_vector_10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_10", "role": "default" }} , 
 	{ "name": "init_vector_11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_11", "role": "default" }} , 
 	{ "name": "init_vector_12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_12", "role": "default" }} , 
 	{ "name": "init_vector_13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_13", "role": "default" }} , 
 	{ "name": "init_vector_14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_14", "role": "default" }} , 
 	{ "name": "init_vector_15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_15", "role": "default" }} , 
 	{ "name": "init_vector_16", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_16", "role": "default" }} , 
 	{ "name": "init_vector_17", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_17", "role": "default" }} , 
 	{ "name": "init_vector_18", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_18", "role": "default" }} , 
 	{ "name": "init_vector_19", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_19", "role": "default" }} , 
 	{ "name": "init_vector_20", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_20", "role": "default" }} , 
 	{ "name": "init_vector_21", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_21", "role": "default" }} , 
 	{ "name": "init_vector_22", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector_22", "role": "default" }} , 
 	{ "name": "init", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init", "role": "default" }} , 
 	{ "name": "out_r_ap_lwr", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outlwr", "bundle":{"name": "out_r", "role": "ap_lwr" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "accelerate",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "6", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_r", "Type" : "OVld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "out_r"}]},
			{"Name" : "subrow_vals_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_vals_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_vals_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_vals_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_col_indices_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_col_indices_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_col_indices_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "subrow_col_indices_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "mult_enables_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "mult_enables_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "mult_enables_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "mult_enables_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "label_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "init", "Type" : "None", "Direction" : "I"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "accelerate_int_int_int_bool_int_int_bool_storage_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_17", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_18", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_20", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_21", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_22", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_num_items_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_num_items_0"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_0_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_buffer_value_0_0"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_label_0_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_buffer_label_0_0"}]},
			{"Name" : "reducer_circuit_adder_levels_num_items_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_num_items_1"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_1_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_buffer_value_1_0"}]},
			{"Name" : "reducer_circuit_adder_levels_valid_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_valid_0"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_0_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_buffer_value_0_1"}]},
			{"Name" : "reducer_circuit_adder_levels_valid_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_valid_1"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_1_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_buffer_value_1_1"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_label_1_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_reduce_fu_624", "Port" : "reducer_circuit_adder_levels_buffer_label_1_0"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_fu_624", "Parent" : "0",
		"CDFG" : "reduce",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_r", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "value_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "label_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "reducer_circuit_adder_levels_num_items_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_0_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_buffer_label_0_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_num_items_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_1_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_valid_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_0_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_valid_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_1_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_buffer_label_1_0", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_2332_32_1_1_U4", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_2332_32_1_1_U5", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_2332_32_1_1_U6", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_2332_32_1_1_U7", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U8", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U9", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U10", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U11", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	accelerate {
		out_r {Type O LastRead -1 FirstWrite 2}
		subrow_vals_0 {Type I LastRead 0 FirstWrite -1}
		subrow_vals_1 {Type I LastRead 0 FirstWrite -1}
		subrow_vals_2 {Type I LastRead 0 FirstWrite -1}
		subrow_vals_3 {Type I LastRead 0 FirstWrite -1}
		subrow_col_indices_0 {Type I LastRead 0 FirstWrite -1}
		subrow_col_indices_1 {Type I LastRead 0 FirstWrite -1}
		subrow_col_indices_2 {Type I LastRead 0 FirstWrite -1}
		subrow_col_indices_3 {Type I LastRead 0 FirstWrite -1}
		mult_enables_0 {Type I LastRead 0 FirstWrite -1}
		mult_enables_1 {Type I LastRead 0 FirstWrite -1}
		mult_enables_2 {Type I LastRead 0 FirstWrite -1}
		mult_enables_3 {Type I LastRead 0 FirstWrite -1}
		label_r {Type I LastRead 0 FirstWrite -1}
		init_vector_0 {Type I LastRead 0 FirstWrite -1}
		init_vector_1 {Type I LastRead 0 FirstWrite -1}
		init_vector_2 {Type I LastRead 0 FirstWrite -1}
		init_vector_3 {Type I LastRead 0 FirstWrite -1}
		init_vector_4 {Type I LastRead 0 FirstWrite -1}
		init_vector_5 {Type I LastRead 0 FirstWrite -1}
		init_vector_6 {Type I LastRead 0 FirstWrite -1}
		init_vector_7 {Type I LastRead 0 FirstWrite -1}
		init_vector_8 {Type I LastRead 0 FirstWrite -1}
		init_vector_9 {Type I LastRead 0 FirstWrite -1}
		init_vector_10 {Type I LastRead 0 FirstWrite -1}
		init_vector_11 {Type I LastRead 0 FirstWrite -1}
		init_vector_12 {Type I LastRead 0 FirstWrite -1}
		init_vector_13 {Type I LastRead 0 FirstWrite -1}
		init_vector_14 {Type I LastRead 0 FirstWrite -1}
		init_vector_15 {Type I LastRead 0 FirstWrite -1}
		init_vector_16 {Type I LastRead 0 FirstWrite -1}
		init_vector_17 {Type I LastRead 0 FirstWrite -1}
		init_vector_18 {Type I LastRead 0 FirstWrite -1}
		init_vector_19 {Type I LastRead 0 FirstWrite -1}
		init_vector_20 {Type I LastRead 0 FirstWrite -1}
		init_vector_21 {Type I LastRead 0 FirstWrite -1}
		init_vector_22 {Type I LastRead 0 FirstWrite -1}
		init {Type I LastRead 0 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_1 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_2 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_3 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_4 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_5 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_6 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_7 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_8 {Type IO LastRead -1 FirstWrite -1}
		accelerate_int_int_int_bool_int_int_bool_storage_9 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_10 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_11 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_12 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_13 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_14 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_15 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_16 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_17 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_18 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_19 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_20 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_21 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ10accelerateRiPiS0_PbiS0_bE7storage_22 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_num_items_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_0_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_label_0_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_num_items_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_1_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_valid_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_0_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_valid_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_1_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_label_1_0 {Type IO LastRead -1 FirstWrite -1}}
	reduce {
		out_r {Type O LastRead -1 FirstWrite 2}
		value_r {Type I LastRead 0 FirstWrite -1}
		label_r {Type I LastRead 0 FirstWrite -1}
		reducer_circuit_adder_levels_num_items_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_0_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_label_0_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_num_items_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_1_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_valid_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_0_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_valid_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_value_1_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_adder_levels_buffer_label_1_0 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_r { ap_ovld {  { out_r out_data 1 32 }  { out_r_ap_vld out_vld 1 1 }  { out_r_ap_lwr out_lwr 1 1 } } }
	subrow_vals_0 { ap_none {  { subrow_vals_0 in_data 0 32 } } }
	subrow_vals_1 { ap_none {  { subrow_vals_1 in_data 0 32 } } }
	subrow_vals_2 { ap_none {  { subrow_vals_2 in_data 0 32 } } }
	subrow_vals_3 { ap_none {  { subrow_vals_3 in_data 0 32 } } }
	subrow_col_indices_0 { ap_none {  { subrow_col_indices_0 in_data 0 32 } } }
	subrow_col_indices_1 { ap_none {  { subrow_col_indices_1 in_data 0 32 } } }
	subrow_col_indices_2 { ap_none {  { subrow_col_indices_2 in_data 0 32 } } }
	subrow_col_indices_3 { ap_none {  { subrow_col_indices_3 in_data 0 32 } } }
	mult_enables_0 { ap_none {  { mult_enables_0 in_data 0 1 } } }
	mult_enables_1 { ap_none {  { mult_enables_1 in_data 0 1 } } }
	mult_enables_2 { ap_none {  { mult_enables_2 in_data 0 1 } } }
	mult_enables_3 { ap_none {  { mult_enables_3 in_data 0 1 } } }
	label_r { ap_none {  { label_r in_data 0 32 } } }
	init_vector_0 { ap_none {  { init_vector_0 in_data 0 32 } } }
	init_vector_1 { ap_none {  { init_vector_1 in_data 0 32 } } }
	init_vector_2 { ap_none {  { init_vector_2 in_data 0 32 } } }
	init_vector_3 { ap_none {  { init_vector_3 in_data 0 32 } } }
	init_vector_4 { ap_none {  { init_vector_4 in_data 0 32 } } }
	init_vector_5 { ap_none {  { init_vector_5 in_data 0 32 } } }
	init_vector_6 { ap_none {  { init_vector_6 in_data 0 32 } } }
	init_vector_7 { ap_none {  { init_vector_7 in_data 0 32 } } }
	init_vector_8 { ap_none {  { init_vector_8 in_data 0 32 } } }
	init_vector_9 { ap_none {  { init_vector_9 in_data 0 32 } } }
	init_vector_10 { ap_none {  { init_vector_10 in_data 0 32 } } }
	init_vector_11 { ap_none {  { init_vector_11 in_data 0 32 } } }
	init_vector_12 { ap_none {  { init_vector_12 in_data 0 32 } } }
	init_vector_13 { ap_none {  { init_vector_13 in_data 0 32 } } }
	init_vector_14 { ap_none {  { init_vector_14 in_data 0 32 } } }
	init_vector_15 { ap_none {  { init_vector_15 in_data 0 32 } } }
	init_vector_16 { ap_none {  { init_vector_16 in_data 0 32 } } }
	init_vector_17 { ap_none {  { init_vector_17 in_data 0 32 } } }
	init_vector_18 { ap_none {  { init_vector_18 in_data 0 32 } } }
	init_vector_19 { ap_none {  { init_vector_19 in_data 0 32 } } }
	init_vector_20 { ap_none {  { init_vector_20 in_data 0 32 } } }
	init_vector_21 { ap_none {  { init_vector_21 in_data 0 32 } } }
	init_vector_22 { ap_none {  { init_vector_22 in_data 0 32 } } }
	init { ap_none {  { init in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
