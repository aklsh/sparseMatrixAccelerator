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
	{ subrow_vals int 32 regular {array 4 { 1 1 } 1 1 }  }
	{ subrow_col_indices int 32 regular {array 4 { 1 1 } 1 1 }  }
	{ mult_enables int 1 regular {array 4 { 1 1 } 1 1 }  }
	{ label_r int 32 regular  }
	{ init_vector int 32 regular {array 23 { 1 1 } 1 1 }  }
	{ init uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "out_r", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "subrow_vals", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subrow_col_indices", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mult_enables", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "label_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init_vector", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "init", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 36
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
	{ subrow_vals_address0 sc_out sc_lv 2 signal 1 } 
	{ subrow_vals_ce0 sc_out sc_logic 1 signal 1 } 
	{ subrow_vals_q0 sc_in sc_lv 32 signal 1 } 
	{ subrow_vals_address1 sc_out sc_lv 2 signal 1 } 
	{ subrow_vals_ce1 sc_out sc_logic 1 signal 1 } 
	{ subrow_vals_q1 sc_in sc_lv 32 signal 1 } 
	{ subrow_col_indices_address0 sc_out sc_lv 2 signal 2 } 
	{ subrow_col_indices_ce0 sc_out sc_logic 1 signal 2 } 
	{ subrow_col_indices_q0 sc_in sc_lv 32 signal 2 } 
	{ subrow_col_indices_address1 sc_out sc_lv 2 signal 2 } 
	{ subrow_col_indices_ce1 sc_out sc_logic 1 signal 2 } 
	{ subrow_col_indices_q1 sc_in sc_lv 32 signal 2 } 
	{ mult_enables_address0 sc_out sc_lv 2 signal 3 } 
	{ mult_enables_ce0 sc_out sc_logic 1 signal 3 } 
	{ mult_enables_q0 sc_in sc_lv 1 signal 3 } 
	{ mult_enables_address1 sc_out sc_lv 2 signal 3 } 
	{ mult_enables_ce1 sc_out sc_logic 1 signal 3 } 
	{ mult_enables_q1 sc_in sc_lv 1 signal 3 } 
	{ label_r sc_in sc_lv 32 signal 4 } 
	{ init_vector_address0 sc_out sc_lv 5 signal 5 } 
	{ init_vector_ce0 sc_out sc_logic 1 signal 5 } 
	{ init_vector_q0 sc_in sc_lv 32 signal 5 } 
	{ init_vector_address1 sc_out sc_lv 5 signal 5 } 
	{ init_vector_ce1 sc_out sc_logic 1 signal 5 } 
	{ init_vector_q1 sc_in sc_lv 32 signal 5 } 
	{ init sc_in sc_logic 1 signal 6 } 
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
 	{ "name": "subrow_vals_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "subrow_vals", "role": "address0" }} , 
 	{ "name": "subrow_vals_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "subrow_vals", "role": "ce0" }} , 
 	{ "name": "subrow_vals_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_vals", "role": "q0" }} , 
 	{ "name": "subrow_vals_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "subrow_vals", "role": "address1" }} , 
 	{ "name": "subrow_vals_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "subrow_vals", "role": "ce1" }} , 
 	{ "name": "subrow_vals_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_vals", "role": "q1" }} , 
 	{ "name": "subrow_col_indices_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "subrow_col_indices", "role": "address0" }} , 
 	{ "name": "subrow_col_indices_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "subrow_col_indices", "role": "ce0" }} , 
 	{ "name": "subrow_col_indices_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_col_indices", "role": "q0" }} , 
 	{ "name": "subrow_col_indices_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "subrow_col_indices", "role": "address1" }} , 
 	{ "name": "subrow_col_indices_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "subrow_col_indices", "role": "ce1" }} , 
 	{ "name": "subrow_col_indices_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "subrow_col_indices", "role": "q1" }} , 
 	{ "name": "mult_enables_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mult_enables", "role": "address0" }} , 
 	{ "name": "mult_enables_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables", "role": "ce0" }} , 
 	{ "name": "mult_enables_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables", "role": "q0" }} , 
 	{ "name": "mult_enables_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mult_enables", "role": "address1" }} , 
 	{ "name": "mult_enables_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables", "role": "ce1" }} , 
 	{ "name": "mult_enables_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mult_enables", "role": "q1" }} , 
 	{ "name": "label_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "label_r", "role": "default" }} , 
 	{ "name": "init_vector_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "init_vector", "role": "address0" }} , 
 	{ "name": "init_vector_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_vector", "role": "ce0" }} , 
 	{ "name": "init_vector_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector", "role": "q0" }} , 
 	{ "name": "init_vector_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "init_vector", "role": "address1" }} , 
 	{ "name": "init_vector_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_vector", "role": "ce1" }} , 
 	{ "name": "init_vector_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "init_vector", "role": "q1" }} , 
 	{ "name": "init", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "accelerate",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "25",
		"VariableLatency" : "0", "ExactLatency" : "34", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_r", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "out_r"}]},
			{"Name" : "subrow_vals", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "subrow_col_indices", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mult_enables", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "label_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "init_vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "init", "Type" : "None", "Direction" : "I"},
			{"Name" : "storage", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "reducer_circuit_adder_levels_num_items_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_num_items_0"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_0_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_buffer_value_0_0"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_label_0_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_buffer_label_0_0"}]},
			{"Name" : "reducer_circuit_adder_levels_num_items_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_num_items_1"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_1_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_buffer_value_1_0"}]},
			{"Name" : "reducer_circuit_adder_levels_valid_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_valid_0"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_0_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_buffer_value_0_1"}]},
			{"Name" : "reducer_circuit_adder_levels_valid_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_valid_1"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_value_1_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_buffer_value_1_1"}]},
			{"Name" : "reducer_circuit_adder_levels_buffer_label_1_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_reduce_fu_590", "Port" : "reducer_circuit_adder_levels_buffer_label_1_0"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.storage_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_fu_590", "Parent" : "0",
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
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U4", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U5", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U6", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U7", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	accelerate {
		out_r {Type O LastRead -1 FirstWrite 2}
		subrow_vals {Type I LastRead 2 FirstWrite -1}
		subrow_col_indices {Type I LastRead 2 FirstWrite -1}
		mult_enables {Type I LastRead 2 FirstWrite -1}
		label_r {Type I LastRead 24 FirstWrite -1}
		init_vector {Type I LastRead 12 FirstWrite -1}
		init {Type I LastRead 0 FirstWrite -1}
		storage {Type IO LastRead -1 FirstWrite -1}
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
	{"Name" : "Latency", "Min" : "34", "Max" : "34"}
	, {"Name" : "Interval", "Min" : "25", "Max" : "25"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_r { ap_vld {  { out_r out_data 1 32 }  { out_r_ap_vld out_vld 1 1 } } }
	subrow_vals { ap_memory {  { subrow_vals_address0 mem_address 1 2 }  { subrow_vals_ce0 mem_ce 1 1 }  { subrow_vals_q0 mem_dout 0 32 }  { subrow_vals_address1 MemPortADDR2 1 2 }  { subrow_vals_ce1 MemPortCE2 1 1 }  { subrow_vals_q1 MemPortDOUT2 0 32 } } }
	subrow_col_indices { ap_memory {  { subrow_col_indices_address0 mem_address 1 2 }  { subrow_col_indices_ce0 mem_ce 1 1 }  { subrow_col_indices_q0 mem_dout 0 32 }  { subrow_col_indices_address1 MemPortADDR2 1 2 }  { subrow_col_indices_ce1 MemPortCE2 1 1 }  { subrow_col_indices_q1 MemPortDOUT2 0 32 } } }
	mult_enables { ap_memory {  { mult_enables_address0 mem_address 1 2 }  { mult_enables_ce0 mem_ce 1 1 }  { mult_enables_q0 mem_dout 0 1 }  { mult_enables_address1 MemPortADDR2 1 2 }  { mult_enables_ce1 MemPortCE2 1 1 }  { mult_enables_q1 MemPortDOUT2 0 1 } } }
	label_r { ap_none {  { label_r in_data 0 32 } } }
	init_vector { ap_memory {  { init_vector_address0 mem_address 1 5 }  { init_vector_ce0 mem_ce 1 1 }  { init_vector_q0 mem_dout 0 32 }  { init_vector_address1 MemPortADDR2 1 5 }  { init_vector_ce1 MemPortCE2 1 1 }  { init_vector_q1 in_data 0 32 } } }
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
