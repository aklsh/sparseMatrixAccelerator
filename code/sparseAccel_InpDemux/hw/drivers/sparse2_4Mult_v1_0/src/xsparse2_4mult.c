// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsparse2_4mult.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSparse2_4mult_CfgInitialize(XSparse2_4mult *InstancePtr, XSparse2_4mult_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSparse2_4mult_Start(XSparse2_4mult *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSparse2_4mult_IsDone(XSparse2_4mult *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSparse2_4mult_IsIdle(XSparse2_4mult *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSparse2_4mult_IsReady(XSparse2_4mult *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSparse2_4mult_EnableAutoRestart(XSparse2_4mult *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSparse2_4mult_DisableAutoRestart(XSparse2_4mult *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XSparse2_4mult_Get_dotProd(XSparse2_4mult *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_DOTPROD_DATA);
    return Data;
}

u32 XSparse2_4mult_Get_dotProd_vld(XSparse2_4mult *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_DOTPROD_CTRL);
    return Data & 0x1;
}

u32 XSparse2_4mult_Get_indices_BaseAddress(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE);
}

u32 XSparse2_4mult_Get_indices_HighAddress(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH);
}

u32 XSparse2_4mult_Get_indices_TotalBytes(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + 1);
}

u32 XSparse2_4mult_Get_indices_BitWidth(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPARSE2_4MULT_CONTROL_WIDTH_INDICES;
}

u32 XSparse2_4mult_Get_indices_Depth(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPARSE2_4MULT_CONTROL_DEPTH_INDICES;
}

u32 XSparse2_4mult_Write_indices_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSparse2_4mult_Read_indices_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSparse2_4mult_Write_indices_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSparse2_4mult_Read_indices_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPARSE2_4MULT_CONTROL_ADDR_INDICES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INDICES_BASE + offset + i);
    }
    return length;
}

u32 XSparse2_4mult_Get_dataValues_BaseAddress(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE);
}

u32 XSparse2_4mult_Get_dataValues_HighAddress(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH);
}

u32 XSparse2_4mult_Get_dataValues_TotalBytes(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + 1);
}

u32 XSparse2_4mult_Get_dataValues_BitWidth(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPARSE2_4MULT_CONTROL_WIDTH_DATAVALUES;
}

u32 XSparse2_4mult_Get_dataValues_Depth(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPARSE2_4MULT_CONTROL_DEPTH_DATAVALUES;
}

u32 XSparse2_4mult_Write_dataValues_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSparse2_4mult_Read_dataValues_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSparse2_4mult_Write_dataValues_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSparse2_4mult_Read_dataValues_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_DATAVALUES_BASE + offset + i);
    }
    return length;
}

u32 XSparse2_4mult_Get_inp_vector_BaseAddress(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE);
}

u32 XSparse2_4mult_Get_inp_vector_HighAddress(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH);
}

u32 XSparse2_4mult_Get_inp_vector_TotalBytes(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + 1);
}

u32 XSparse2_4mult_Get_inp_vector_BitWidth(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPARSE2_4MULT_CONTROL_WIDTH_INP_VECTOR;
}

u32 XSparse2_4mult_Get_inp_vector_Depth(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSPARSE2_4MULT_CONTROL_DEPTH_INP_VECTOR;
}

u32 XSparse2_4mult_Write_inp_vector_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XSparse2_4mult_Read_inp_vector_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + (offset + i)*4);
    }
    return length;
}

u32 XSparse2_4mult_Write_inp_vector_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XSparse2_4mult_Read_inp_vector_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_HIGH - XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XSPARSE2_4MULT_CONTROL_ADDR_INP_VECTOR_BASE + offset + i);
    }
    return length;
}

void XSparse2_4mult_InterruptGlobalEnable(XSparse2_4mult *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_GIE, 1);
}

void XSparse2_4mult_InterruptGlobalDisable(XSparse2_4mult *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_GIE, 0);
}

void XSparse2_4mult_InterruptEnable(XSparse2_4mult *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_IER);
    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_IER, Register | Mask);
}

void XSparse2_4mult_InterruptDisable(XSparse2_4mult *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_IER);
    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSparse2_4mult_InterruptClear(XSparse2_4mult *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSparse2_4mult_WriteReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_ISR, Mask);
}

u32 XSparse2_4mult_InterruptGetEnabled(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_IER);
}

u32 XSparse2_4mult_InterruptGetStatus(XSparse2_4mult *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSparse2_4mult_ReadReg(InstancePtr->Control_BaseAddress, XSPARSE2_4MULT_CONTROL_ADDR_ISR);
}

