set moduleName reduce
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {reduce}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_r int 32 regular {pointer 1}  }
	{ value_r int 32 regular  }
	{ label_r int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "out_r", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "label_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_r sc_out sc_lv 32 signal 0 } 
	{ out_r_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ value_r sc_in sc_lv 32 signal 1 } 
	{ label_r sc_in sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_r", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_r", "role": "default" }} , 
 	{ "name": "out_r_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "ap_vld" }} , 
 	{ "name": "value_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "default" }} , 
 	{ "name": "label_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "label_r", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "reducer_circuit_levels_num_items_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_buffer_value_0_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_buffer_label_0_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_num_items_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_buffer_value_1_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_valid_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_buffer_value_0_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_valid_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_buffer_value_1_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "reducer_circuit_levels_buffer_label_1_0", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	reduce {
		out_r {Type O LastRead -1 FirstWrite 2}
		value_r {Type I LastRead 0 FirstWrite -1}
		label_r {Type I LastRead 0 FirstWrite -1}
		reducer_circuit_levels_num_items_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_buffer_value_0_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_buffer_label_0_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_num_items_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_buffer_value_1_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_valid_0 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_buffer_value_0_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_valid_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_buffer_value_1_1 {Type IO LastRead -1 FirstWrite -1}
		reducer_circuit_levels_buffer_label_1_0 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_r { ap_vld {  { out_r out_data 1 32 }  { out_r_ap_vld out_vld 1 1 } } }
	value_r { ap_none {  { value_r in_data 0 32 } } }
	label_r { ap_none {  { label_r in_data 0 32 } } }
}
