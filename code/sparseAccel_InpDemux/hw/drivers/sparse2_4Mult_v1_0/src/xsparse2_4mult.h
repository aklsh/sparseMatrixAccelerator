// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSPARSE2_4MULT_H
#define XSPARSE2_4MULT_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsparse2_4mult_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XSparse2_4mult_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSparse2_4mult;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSparse2_4mult_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSparse2_4mult_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSparse2_4mult_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSparse2_4mult_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSparse2_4mult_Initialize(XSparse2_4mult *InstancePtr, u16 DeviceId);
XSparse2_4mult_Config* XSparse2_4mult_LookupConfig(u16 DeviceId);
int XSparse2_4mult_CfgInitialize(XSparse2_4mult *InstancePtr, XSparse2_4mult_Config *ConfigPtr);
#else
int XSparse2_4mult_Initialize(XSparse2_4mult *InstancePtr, const char* InstanceName);
int XSparse2_4mult_Release(XSparse2_4mult *InstancePtr);
#endif

void XSparse2_4mult_Start(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_IsDone(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_IsIdle(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_IsReady(XSparse2_4mult *InstancePtr);
void XSparse2_4mult_EnableAutoRestart(XSparse2_4mult *InstancePtr);
void XSparse2_4mult_DisableAutoRestart(XSparse2_4mult *InstancePtr);

u32 XSparse2_4mult_Get_dotProd(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_dotProd_vld(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_indices_BaseAddress(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_indices_HighAddress(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_indices_TotalBytes(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_indices_BitWidth(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_indices_Depth(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Write_indices_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length);
u32 XSparse2_4mult_Read_indices_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length);
u32 XSparse2_4mult_Write_indices_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length);
u32 XSparse2_4mult_Read_indices_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length);
u32 XSparse2_4mult_Get_dataValues_BaseAddress(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_dataValues_HighAddress(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_dataValues_TotalBytes(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_dataValues_BitWidth(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_dataValues_Depth(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Write_dataValues_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length);
u32 XSparse2_4mult_Read_dataValues_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length);
u32 XSparse2_4mult_Write_dataValues_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length);
u32 XSparse2_4mult_Read_dataValues_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length);
u32 XSparse2_4mult_Get_inp_vector_BaseAddress(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_inp_vector_HighAddress(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_inp_vector_TotalBytes(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_inp_vector_BitWidth(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Get_inp_vector_Depth(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_Write_inp_vector_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length);
u32 XSparse2_4mult_Read_inp_vector_Words(XSparse2_4mult *InstancePtr, int offset, word_type *data, int length);
u32 XSparse2_4mult_Write_inp_vector_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length);
u32 XSparse2_4mult_Read_inp_vector_Bytes(XSparse2_4mult *InstancePtr, int offset, char *data, int length);

void XSparse2_4mult_InterruptGlobalEnable(XSparse2_4mult *InstancePtr);
void XSparse2_4mult_InterruptGlobalDisable(XSparse2_4mult *InstancePtr);
void XSparse2_4mult_InterruptEnable(XSparse2_4mult *InstancePtr, u32 Mask);
void XSparse2_4mult_InterruptDisable(XSparse2_4mult *InstancePtr, u32 Mask);
void XSparse2_4mult_InterruptClear(XSparse2_4mult *InstancePtr, u32 Mask);
u32 XSparse2_4mult_InterruptGetEnabled(XSparse2_4mult *InstancePtr);
u32 XSparse2_4mult_InterruptGetStatus(XSparse2_4mult *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
