# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# ==============================================================
CSIM_DESIGN = 1

__SIM_FPO__ = 1

__SIM_MATHHLS__ = 1

__SIM_FFT__ = 1

__SIM_FIR__ = 1

__SIM_DDS__ = 1

__USE_CLANG__ = 1

ObjDir = obj

HLS_SOURCES = ../../../../SPMV_CSR_src/main.cpp ../../../../SPMV_CSR_src/accelerator/accelerator.cpp ../../../../SPMV_CSR_src/accelerator/reducer.cpp

override TARGET := csim.exe

AUTOPILOT_ROOT := /opt/Xilinx/Vitis_HLS/2021.2
AUTOPILOT_MACH := lnx64
ifdef AP_GCC_M32
  AUTOPILOT_MACH := Linux_x86
  IFLAG += -m32
endif
IFLAG += -fPIC
ifndef AP_GCC_PATH
  AP_GCC_PATH := /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0/bin
endif
AUTOPILOT_TOOL := ${AUTOPILOT_ROOT}/${AUTOPILOT_MACH}/tools
AP_CLANG_PATH := ${AUTOPILOT_TOOL}/clang-3.9-csynth/bin
AUTOPILOT_TECH := ${AUTOPILOT_ROOT}/common/technology


IFLAG += -I "${AUTOPILOT_TOOL}/systemc/include"
IFLAG += -I "${AUTOPILOT_ROOT}/include"
IFLAG += -I "${AUTOPILOT_ROOT}/include/ap_sysc"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC/AESL_FP_comp"
IFLAG += -I "${AUTOPILOT_TECH}/generic/SystemC/AESL_comp"
IFLAG += -I "${AUTOPILOT_TOOL}/auto_cc/include"
IFLAG += -D__VITIS_HLS__

IFLAG += -D__SIM_FPO__

IFLAG += -D__SIM_FFT__

IFLAG += -D__SIM_FIR__

IFLAG += -D__SIM_DDS__

IFLAG += -D__DSP48E1__
IFLAG += -Wno-unknown-pragmas 
AP_ENABLE_OPTIMIZED := 1
DFLAG += -D__xilinx_ip_top= -DAESL_TB
CCFLAG += -Werror=return-type
TOOLCHAIN += 
CCFLAG += -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0
LFLAG += -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0
CCFLAG += -fno-exceptions
LFLAG += -fno-exceptions
CCFLAG += -fprofile-instr-generate="code-%m.profraw"
LFLAG += -fprofile-instr-generate="code-%m.profraw"
CCFLAG += -Wno-c++11-narrowing
CCFLAG += -Werror=uninitialized
CCFLAG += -std=c++11
LFLAG += -std=c++11



include ./Makefile.rules

all: $(TARGET)



$(ObjDir)/main.o: ../../../../SPMV_CSR_src/main.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../SPMV_CSR_src/main.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CXX) ${CCFLAG} -c -MMD -Wno-unknown-pragmas -Wno-unknown-pragmas  $(IFLAG) $(DFLAG) -DNDEBUG $< -o $@ ; \

-include $(ObjDir)/main.d

$(ObjDir)/accelerator.o: ../../../../SPMV_CSR_src/accelerator/accelerator.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../SPMV_CSR_src/accelerator/accelerator.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CXX) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) -DNDEBUG $< -o $@ ; \

-include $(ObjDir)/accelerator.d

$(ObjDir)/reducer.o: ../../../../SPMV_CSR_src/accelerator/reducer.cpp $(ObjDir)/.dir
	$(Echo) "   Compiling ../../../../SPMV_CSR_src/accelerator/reducer.cpp in $(BuildMode) mode" $(AVE_DIR_DLOG)
	$(Verb)  $(CXX) ${CCFLAG} -c -MMD  $(IFLAG) $(DFLAG) -DNDEBUG $< -o $@ ; \

-include $(ObjDir)/reducer.d
pObjDir=pobj
POBJECTS := $(basename $(notdir $(HLS_SOURCES)))
POBJECTS := $(POBJECTS:%=$(pObjDir)/%.bc)

$(pObjDir)/main.bc: ../../../../SPMV_CSR_src/main.cpp $(pObjDir)/.dir
	$(Echo) $(CXX)  -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0 -fno-exceptions -fprofile-instr-use=code.profdata -emit-llvm -c -Wno-unknown-pragmas -Wno-unknown-pragmas  $(IFLAG) $(DFLAG) $< -o $@ ;
	$(Verb) $(CXX)  -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0 -fno-exceptions -fprofile-instr-use=code.profdata -emit-llvm -c -Wno-unknown-pragmas -Wno-unknown-pragmas  $(IFLAG) $(DFLAG) $< -o $@ ;

$(pObjDir)/accelerator.bc: ../../../../SPMV_CSR_src/accelerator/accelerator.cpp $(pObjDir)/.dir
	$(Echo) $(CXX)  -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0 -fno-exceptions -fprofile-instr-use=code.profdata -emit-llvm -c  $(IFLAG) $(DFLAG) $< -o $@ ;
	$(Verb) $(CXX)  -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0 -fno-exceptions -fprofile-instr-use=code.profdata -emit-llvm -c  $(IFLAG) $(DFLAG) $< -o $@ ;

$(pObjDir)/reducer.bc: ../../../../SPMV_CSR_src/accelerator/reducer.cpp $(pObjDir)/.dir
	$(Echo) $(CXX)  -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0 -fno-exceptions -fprofile-instr-use=code.profdata -emit-llvm -c  $(IFLAG) $(DFLAG) $< -o $@ ;
	$(Verb) $(CXX)  -gcc-toolchain /opt/Xilinx/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0 -fno-exceptions -fprofile-instr-use=code.profdata -emit-llvm -c  $(IFLAG) $(DFLAG) $< -o $@ ;

profile_data: *.profraw
	${AP_CLANG_PATH}/llvm-profdata merge -output=code.profdata *.profraw

profile_all: profile_data $(POBJECTS)
	${AP_CLANG_PATH}/llvm-link -o LinkFile.bc ${POBJECTS} -f; \
	${MKDIR} /home/akileshkannan/SPMV_CSR/solution1/.autopilot/db/dot ; \
	${CP} -r ${pObjDir} /home/akileshkannan/SPMV_CSR/solution1/.autopilot/db/dot ; \
	${CP} LinkFile.bc /home/akileshkannan/SPMV_CSR/solution1/.autopilot/db/dot ; \
	${CD} /home/akileshkannan/SPMV_CSR/solution1/.autopilot/db/dot ; \
	${AP_CLANG_PATH}/opt -dot-callgraph-hls -cfg-hier-userfilelist "/home/akileshkannan/SPMV_CSR_src/main.cpp /home/akileshkannan/SPMV_CSR_src/accelerator/accelerator.cpp /home/akileshkannan/SPMV_CSR_src/accelerator/accelerator.hpp /home/akileshkannan/SPMV_CSR_src/accelerator/constants.hpp /home/akileshkannan/SPMV_CSR_src/encoded_data.hpp /home/akileshkannan/SPMV_CSR_src/accelerator/reducer.cpp /home/akileshkannan/SPMV_CSR_src/accelerator/reducer.hpp" -csim-top-function-name=accelerate LinkFile.bc -o LinkFile_fid.bc ; \
	${AP_CLANG_PATH}/opt -dot-cfg-hier-only -cfg-hier-userfilelist "/home/akileshkannan/SPMV_CSR_src/main.cpp /home/akileshkannan/SPMV_CSR_src/accelerator/accelerator.cpp /home/akileshkannan/SPMV_CSR_src/accelerator/accelerator.hpp /home/akileshkannan/SPMV_CSR_src/accelerator/constants.hpp /home/akileshkannan/SPMV_CSR_src/encoded_data.hpp /home/akileshkannan/SPMV_CSR_src/accelerator/reducer.cpp /home/akileshkannan/SPMV_CSR_src/accelerator/reducer.hpp" -cfg-hier-type csim LinkFile_fid.bc -o LinkFile_pp.bc ; 
