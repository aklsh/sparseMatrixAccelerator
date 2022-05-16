// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcounter.h"

extern XCounter_Config XCounter_ConfigTable[];

XCounter_Config *XCounter_LookupConfig(u16 DeviceId) {
	XCounter_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCOUNTER_NUM_INSTANCES; Index++) {
		if (XCounter_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCounter_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCounter_Initialize(XCounter *InstancePtr, u16 DeviceId) {
	XCounter_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCounter_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCounter_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

