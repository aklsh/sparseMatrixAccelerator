// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsparse2_4mult.h"

extern XSparse2_4mult_Config XSparse2_4mult_ConfigTable[];

XSparse2_4mult_Config *XSparse2_4mult_LookupConfig(u16 DeviceId) {
	XSparse2_4mult_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSPARSE2_4MULT_NUM_INSTANCES; Index++) {
		if (XSparse2_4mult_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSparse2_4mult_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSparse2_4mult_Initialize(XSparse2_4mult *InstancePtr, u16 DeviceId) {
	XSparse2_4mult_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSparse2_4mult_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSparse2_4mult_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

