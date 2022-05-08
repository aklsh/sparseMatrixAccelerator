set moduleName HLS_CISR_spmv_accel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {HLS_CISR_spmv_accel}
set C_modelType { void 0 }
set C_modelArgList {
	{ cmd_start uint 1 regular  }
	{ inp_vec int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ slot_data_arr int 64 regular {array 2 { 1 3 } 1 1 }  }
	{ slot_arr_row_len int 32 regular {array 2 { 1 3 } 1 1 }  }
	{ output_vec int 32 regular {array 8 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "cmd_start", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "cmd_start","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "inp_vec", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "inp_vec","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "slot_data_arr", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "slot_data_arr","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "slot_arr_row_len", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "slot_arr_row_len","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "output_vec", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "output_vec","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cmd_start sc_in sc_lv 1 signal 0 } 
	{ inp_vec_address0 sc_out sc_lv 3 signal 1 } 
	{ inp_vec_ce0 sc_out sc_logic 1 signal 1 } 
	{ inp_vec_q0 sc_in sc_lv 32 signal 1 } 
	{ slot_data_arr_address0 sc_out sc_lv 1 signal 2 } 
	{ slot_data_arr_ce0 sc_out sc_logic 1 signal 2 } 
	{ slot_data_arr_q0 sc_in sc_lv 64 signal 2 } 
	{ slot_arr_row_len_address0 sc_out sc_lv 1 signal 3 } 
	{ slot_arr_row_len_ce0 sc_out sc_logic 1 signal 3 } 
	{ slot_arr_row_len_q0 sc_in sc_lv 32 signal 3 } 
	{ output_vec_address0 sc_out sc_lv 3 signal 4 } 
	{ output_vec_ce0 sc_out sc_logic 1 signal 4 } 
	{ output_vec_we0 sc_out sc_logic 1 signal 4 } 
	{ output_vec_d0 sc_out sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cmd_start", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmd_start", "role": "default" }} , 
 	{ "name": "inp_vec_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "inp_vec", "role": "address0" }} , 
 	{ "name": "inp_vec_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inp_vec", "role": "ce0" }} , 
 	{ "name": "inp_vec_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inp_vec", "role": "q0" }} , 
 	{ "name": "slot_data_arr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "slot_data_arr", "role": "address0" }} , 
 	{ "name": "slot_data_arr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "slot_data_arr", "role": "ce0" }} , 
 	{ "name": "slot_data_arr_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "slot_data_arr", "role": "q0" }} , 
 	{ "name": "slot_arr_row_len_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "slot_arr_row_len", "role": "address0" }} , 
 	{ "name": "slot_arr_row_len_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "slot_arr_row_len", "role": "ce0" }} , 
 	{ "name": "slot_arr_row_len_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "slot_arr_row_len", "role": "q0" }} , 
 	{ "name": "output_vec_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "output_vec", "role": "address0" }} , 
 	{ "name": "output_vec_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_vec", "role": "ce0" }} , 
 	{ "name": "output_vec_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_vec", "role": "we0" }} , 
 	{ "name": "output_vec_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_vec", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "HLS_CISR_spmv_accel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "cmd_start", "Type" : "None", "Direction" : "I"},
			{"Name" : "inp_vec", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "slot_data_arr", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "slot_arr_row_len", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_vec", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_row_id", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "row_len_slot_arr", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "slot_counter_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_counter_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_row_counter_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_row_counter_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_row_len_id_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_row_len_id_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_res_arr_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_res_arr_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_row_id_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "slot_row_id_1", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.row_len_slot_arr_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	HLS_CISR_spmv_accel {
		cmd_start {Type I LastRead 0 FirstWrite -1}
		inp_vec {Type I LastRead 8 FirstWrite -1}
		slot_data_arr {Type I LastRead 7 FirstWrite -1}
		slot_arr_row_len {Type I LastRead 3 FirstWrite -1}
		output_vec {Type O LastRead -1 FirstWrite 17}
		max_row_id {Type IO LastRead -1 FirstWrite -1}
		row_len_slot_arr {Type IO LastRead -1 FirstWrite -1}
		slot_counter_0 {Type IO LastRead -1 FirstWrite -1}
		slot_counter_1 {Type IO LastRead -1 FirstWrite -1}
		slot_row_counter_0 {Type IO LastRead -1 FirstWrite -1}
		slot_row_counter_1 {Type IO LastRead -1 FirstWrite -1}
		slot_row_len_id_0 {Type IO LastRead -1 FirstWrite -1}
		slot_row_len_id_1 {Type IO LastRead -1 FirstWrite -1}
		slot_res_arr_0 {Type IO LastRead -1 FirstWrite -1}
		slot_res_arr_1 {Type IO LastRead -1 FirstWrite -1}
		slot_row_id_0 {Type IO LastRead -1 FirstWrite -1}
		slot_row_id_1 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19", "Max" : "24"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "25"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	cmd_start { ap_none {  { cmd_start in_data 0 1 } } }
	inp_vec { ap_memory {  { inp_vec_address0 mem_address 1 3 }  { inp_vec_ce0 mem_ce 1 1 }  { inp_vec_q0 mem_dout 0 32 } } }
	slot_data_arr { ap_memory {  { slot_data_arr_address0 mem_address 1 1 }  { slot_data_arr_ce0 mem_ce 1 1 }  { slot_data_arr_q0 mem_dout 0 64 } } }
	slot_arr_row_len { ap_memory {  { slot_arr_row_len_address0 mem_address 1 1 }  { slot_arr_row_len_ce0 mem_ce 1 1 }  { slot_arr_row_len_q0 mem_dout 0 32 } } }
	output_vec { ap_memory {  { output_vec_address0 mem_address 1 3 }  { output_vec_ce0 mem_ce 1 1 }  { output_vec_we0 mem_we 1 1 }  { output_vec_d0 mem_din 1 32 } } }
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
