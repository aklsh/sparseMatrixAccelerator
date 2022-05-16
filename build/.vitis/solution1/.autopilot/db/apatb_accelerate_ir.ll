; ModuleID = '/home/akileshkannan/SPMV_CSR/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_accelerate_ir(float* %out, float* %subrow_vals, i32* %subrow_col_indices, i1* %mult_enables, i32 %label, float* %init_vector, i1 %init) local_unnamed_addr #0 {
entry:
  %out_copy = alloca float, align 512
  %subrow_vals_copy_0 = alloca float, align 512
  %subrow_vals_copy_1 = alloca float, align 512
  %subrow_vals_copy_2 = alloca float, align 512
  %subrow_vals_copy_3 = alloca float, align 512
  %subrow_col_indices_copy_0 = alloca i32, align 512
  %subrow_col_indices_copy_1 = alloca i32, align 512
  %subrow_col_indices_copy_2 = alloca i32, align 512
  %subrow_col_indices_copy_3 = alloca i32, align 512
  %mult_enables_copy_0 = alloca i1, align 512
  %mult_enables_copy_1 = alloca i1, align 512
  %mult_enables_copy_2 = alloca i1, align 512
  %mult_enables_copy_3 = alloca i1, align 512
  %init_vector_copy_0 = alloca float, align 512
  %init_vector_copy_1 = alloca float, align 512
  %init_vector_copy_2 = alloca float, align 512
  %init_vector_copy_3 = alloca float, align 512
  %init_vector_copy_4 = alloca float, align 512
  %init_vector_copy_5 = alloca float, align 512
  %init_vector_copy_6 = alloca float, align 512
  %init_vector_copy_7 = alloca float, align 512
  %init_vector_copy_8 = alloca float, align 512
  %init_vector_copy_9 = alloca float, align 512
  %init_vector_copy_10 = alloca float, align 512
  %init_vector_copy_11 = alloca float, align 512
  %init_vector_copy_12 = alloca float, align 512
  %init_vector_copy_13 = alloca float, align 512
  %init_vector_copy_14 = alloca float, align 512
  %init_vector_copy_15 = alloca float, align 512
  %init_vector_copy_16 = alloca float, align 512
  %init_vector_copy_17 = alloca float, align 512
  %init_vector_copy_18 = alloca float, align 512
  %init_vector_copy_19 = alloca float, align 512
  %init_vector_copy_20 = alloca float, align 512
  %init_vector_copy_21 = alloca float, align 512
  %init_vector_copy_22 = alloca float, align 512
  %0 = bitcast float* %subrow_vals to [4 x float]*
  %1 = bitcast i32* %subrow_col_indices to [4 x i32]*
  %2 = bitcast i1* %mult_enables to [4 x i1]*
  %3 = bitcast float* %init_vector to [23 x float]*
  call void @copy_in(float* %out, float* nonnull align 512 %out_copy, [4 x float]* %0, float* nonnull align 512 %subrow_vals_copy_0, float* nonnull align 512 %subrow_vals_copy_1, float* nonnull align 512 %subrow_vals_copy_2, float* nonnull align 512 %subrow_vals_copy_3, [4 x i32]* %1, i32* nonnull align 512 %subrow_col_indices_copy_0, i32* nonnull align 512 %subrow_col_indices_copy_1, i32* nonnull align 512 %subrow_col_indices_copy_2, i32* nonnull align 512 %subrow_col_indices_copy_3, [4 x i1]* %2, i1* nonnull align 512 %mult_enables_copy_0, i1* nonnull align 512 %mult_enables_copy_1, i1* nonnull align 512 %mult_enables_copy_2, i1* nonnull align 512 %mult_enables_copy_3, [23 x float]* %3, float* nonnull align 512 %init_vector_copy_0, float* nonnull align 512 %init_vector_copy_1, float* nonnull align 512 %init_vector_copy_2, float* nonnull align 512 %init_vector_copy_3, float* nonnull align 512 %init_vector_copy_4, float* nonnull align 512 %init_vector_copy_5, float* nonnull align 512 %init_vector_copy_6, float* nonnull align 512 %init_vector_copy_7, float* nonnull align 512 %init_vector_copy_8, float* nonnull align 512 %init_vector_copy_9, float* nonnull align 512 %init_vector_copy_10, float* nonnull align 512 %init_vector_copy_11, float* nonnull align 512 %init_vector_copy_12, float* nonnull align 512 %init_vector_copy_13, float* nonnull align 512 %init_vector_copy_14, float* nonnull align 512 %init_vector_copy_15, float* nonnull align 512 %init_vector_copy_16, float* nonnull align 512 %init_vector_copy_17, float* nonnull align 512 %init_vector_copy_18, float* nonnull align 512 %init_vector_copy_19, float* nonnull align 512 %init_vector_copy_20, float* nonnull align 512 %init_vector_copy_21, float* nonnull align 512 %init_vector_copy_22)
  call void @apatb_accelerate_hw(float* %out_copy, float* %subrow_vals_copy_0, float* %subrow_vals_copy_1, float* %subrow_vals_copy_2, float* %subrow_vals_copy_3, i32* %subrow_col_indices_copy_0, i32* %subrow_col_indices_copy_1, i32* %subrow_col_indices_copy_2, i32* %subrow_col_indices_copy_3, i1* %mult_enables_copy_0, i1* %mult_enables_copy_1, i1* %mult_enables_copy_2, i1* %mult_enables_copy_3, i32 %label, float* %init_vector_copy_0, float* %init_vector_copy_1, float* %init_vector_copy_2, float* %init_vector_copy_3, float* %init_vector_copy_4, float* %init_vector_copy_5, float* %init_vector_copy_6, float* %init_vector_copy_7, float* %init_vector_copy_8, float* %init_vector_copy_9, float* %init_vector_copy_10, float* %init_vector_copy_11, float* %init_vector_copy_12, float* %init_vector_copy_13, float* %init_vector_copy_14, float* %init_vector_copy_15, float* %init_vector_copy_16, float* %init_vector_copy_17, float* %init_vector_copy_18, float* %init_vector_copy_19, float* %init_vector_copy_20, float* %init_vector_copy_21, float* %init_vector_copy_22, i1 %init)
  call void @copy_out(float* %out, float* nonnull align 512 %out_copy, [4 x float]* %0, float* nonnull align 512 %subrow_vals_copy_0, float* nonnull align 512 %subrow_vals_copy_1, float* nonnull align 512 %subrow_vals_copy_2, float* nonnull align 512 %subrow_vals_copy_3, [4 x i32]* %1, i32* nonnull align 512 %subrow_col_indices_copy_0, i32* nonnull align 512 %subrow_col_indices_copy_1, i32* nonnull align 512 %subrow_col_indices_copy_2, i32* nonnull align 512 %subrow_col_indices_copy_3, [4 x i1]* %2, i1* nonnull align 512 %mult_enables_copy_0, i1* nonnull align 512 %mult_enables_copy_1, i1* nonnull align 512 %mult_enables_copy_2, i1* nonnull align 512 %mult_enables_copy_3, [23 x float]* %3, float* nonnull align 512 %init_vector_copy_0, float* nonnull align 512 %init_vector_copy_1, float* nonnull align 512 %init_vector_copy_2, float* nonnull align 512 %init_vector_copy_3, float* nonnull align 512 %init_vector_copy_4, float* nonnull align 512 %init_vector_copy_5, float* nonnull align 512 %init_vector_copy_6, float* nonnull align 512 %init_vector_copy_7, float* nonnull align 512 %init_vector_copy_8, float* nonnull align 512 %init_vector_copy_9, float* nonnull align 512 %init_vector_copy_10, float* nonnull align 512 %init_vector_copy_11, float* nonnull align 512 %init_vector_copy_12, float* nonnull align 512 %init_vector_copy_13, float* nonnull align 512 %init_vector_copy_14, float* nonnull align 512 %init_vector_copy_15, float* nonnull align 512 %init_vector_copy_16, float* nonnull align 512 %init_vector_copy_17, float* nonnull align 512 %init_vector_copy_18, float* nonnull align 512 %init_vector_copy_19, float* nonnull align 512 %init_vector_copy_20, float* nonnull align 512 %init_vector_copy_21, float* nonnull align 512 %init_vector_copy_22)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0f32(float* noalias align 512, float* noalias readonly) unnamed_addr #1 {
entry:
  %2 = icmp eq float* %0, null
  %3 = icmp eq float* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load float, float* %1, align 4
  store float %5, float* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: nounwind
declare void @llvm.assume(i1) #2

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4f32.39.40(float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, [4 x float]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #1 {
entry:
  %1 = icmp eq float* %_0, null
  %2 = icmp eq [4 x float]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [4 x float], [4 x float]* %0, i64 0, i64 %for.loop.idx1
  %4 = load float, float* %src.addr, align 4
  %5 = trunc i64 %for.loop.idx1 to i2
  switch i2 %5, label %dst.addr.case.3 [
    i2 0, label %dst.addr.case.0
    i2 1, label %dst.addr.case.1
    i2 -2, label %dst.addr.case.2
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store float %4, float* %_0, align 512
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store float %4, float* %_1, align 512
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store float %4, float* %_2, align 512
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store float %4, float* %_3, align 512
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4i32.41.42(i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, [4 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #1 {
entry:
  %1 = icmp eq i32* %_0, null
  %2 = icmp eq [4 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [4 x i32], [4 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = load i32, i32* %src.addr, align 4
  %5 = trunc i64 %for.loop.idx1 to i2
  switch i2 %5, label %dst.addr.case.3 [
    i2 0, label %dst.addr.case.0
    i2 1, label %dst.addr.case.1
    i2 -2, label %dst.addr.case.2
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store i32 %4, i32* %_0, align 512
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store i32 %4, i32* %_1, align 512
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store i32 %4, i32* %_2, align 512
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store i32 %4, i32* %_3, align 512
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4i1.43.44(i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, [4 x i1]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #1 {
entry:
  %1 = icmp eq i1* %_0, null
  %2 = icmp eq [4 x i1]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [4 x i1], [4 x i1]* %0, i64 0, i64 %for.loop.idx1
  %4 = bitcast i1* %src.addr to i8*
  %5 = load i8, i8* %4
  %6 = trunc i8 %5 to i1
  %7 = trunc i64 %for.loop.idx1 to i2
  switch i2 %7, label %dst.addr.case.3 [
    i2 0, label %dst.addr.case.0
    i2 1, label %dst.addr.case.1
    i2 -2, label %dst.addr.case.2
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store i1 %6, i1* %_0, align 512
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store i1 %6, i1* %_1, align 512
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store i1 %6, i1* %_2, align 512
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store i1 %6, i1* %_3, align 512
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a23f32.45.46(float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_4, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_5, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_6, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_7, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_8, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_9, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_10, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_11, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_12, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_13, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_14, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_15, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_16, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_17, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_18, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_19, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_20, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_21, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_22, [23 x float]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #1 {
entry:
  %1 = icmp eq float* %_0, null
  %2 = icmp eq [23 x float]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [23 x float], [23 x float]* %0, i64 0, i64 %for.loop.idx1
  %4 = load float, float* %src.addr, align 4
  %5 = trunc i64 %for.loop.idx1 to i5
  switch i5 %5, label %dst.addr.case.22 [
    i5 0, label %dst.addr.case.0
    i5 1, label %dst.addr.case.1
    i5 2, label %dst.addr.case.2
    i5 3, label %dst.addr.case.3
    i5 4, label %dst.addr.case.4
    i5 5, label %dst.addr.case.5
    i5 6, label %dst.addr.case.6
    i5 7, label %dst.addr.case.7
    i5 8, label %dst.addr.case.8
    i5 9, label %dst.addr.case.9
    i5 10, label %dst.addr.case.10
    i5 11, label %dst.addr.case.11
    i5 12, label %dst.addr.case.12
    i5 13, label %dst.addr.case.13
    i5 14, label %dst.addr.case.14
    i5 15, label %dst.addr.case.15
    i5 -16, label %dst.addr.case.16
    i5 -15, label %dst.addr.case.17
    i5 -14, label %dst.addr.case.18
    i5 -13, label %dst.addr.case.19
    i5 -12, label %dst.addr.case.20
    i5 -11, label %dst.addr.case.21
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store float %4, float* %_0, align 512
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store float %4, float* %_1, align 512
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store float %4, float* %_2, align 512
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  store float %4, float* %_3, align 512
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  store float %4, float* %_4, align 512
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  store float %4, float* %_5, align 512
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  store float %4, float* %_6, align 512
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  store float %4, float* %_7, align 512
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  store float %4, float* %_8, align 512
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  store float %4, float* %_9, align 512
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  store float %4, float* %_10, align 512
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  store float %4, float* %_11, align 512
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  store float %4, float* %_12, align 512
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  store float %4, float* %_13, align 512
  br label %dst.addr.exit

dst.addr.case.14:                                 ; preds = %for.loop
  store float %4, float* %_14, align 512
  br label %dst.addr.exit

dst.addr.case.15:                                 ; preds = %for.loop
  store float %4, float* %_15, align 512
  br label %dst.addr.exit

dst.addr.case.16:                                 ; preds = %for.loop
  store float %4, float* %_16, align 512
  br label %dst.addr.exit

dst.addr.case.17:                                 ; preds = %for.loop
  store float %4, float* %_17, align 512
  br label %dst.addr.exit

dst.addr.case.18:                                 ; preds = %for.loop
  store float %4, float* %_18, align 512
  br label %dst.addr.exit

dst.addr.case.19:                                 ; preds = %for.loop
  store float %4, float* %_19, align 512
  br label %dst.addr.exit

dst.addr.case.20:                                 ; preds = %for.loop
  store float %4, float* %_20, align 512
  br label %dst.addr.exit

dst.addr.case.21:                                 ; preds = %for.loop
  store float %4, float* %_21, align 512
  br label %dst.addr.exit

dst.addr.case.22:                                 ; preds = %for.loop
  %6 = icmp eq i5 %5, -10
  call void @llvm.assume(i1 %6)
  store float %4, float* %_22, align 512
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.22, %dst.addr.case.21, %dst.addr.case.20, %dst.addr.case.19, %dst.addr.case.18, %dst.addr.case.17, %dst.addr.case.16, %dst.addr.case.15, %dst.addr.case.14, %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 23
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in(float* readonly "orig.arg.no"="0", float* noalias align 512 "orig.arg.no"="1", [4 x float]* readonly "orig.arg.no"="2", float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_2, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_3, [4 x i32]* readonly "orig.arg.no"="4", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_23, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_34, [4 x i1]* readonly "orig.arg.no"="6", i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16, i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_27, i1* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_38, [23 x float]* readonly "orig.arg.no"="8", float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_09, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_110, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_211, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_312, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_4, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_5, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_6, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_7, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_8, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_9, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_10, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_11, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_1213, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_13, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_14, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_15, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_1614, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_17, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_19, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_20, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_21, float* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_22) #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %1, float* %0)
  call void @onebyonecpy_hls.p0a4f32.39.40(float* align 512 %_0, float* align 512 %_1, float* align 512 %_2, float* align 512 %_3, [4 x float]* %2)
  call void @onebyonecpy_hls.p0a4i32.41.42(i32* align 512 %_01, i32* align 512 %_12, i32* align 512 %_23, i32* align 512 %_34, [4 x i32]* %3)
  call void @onebyonecpy_hls.p0a4i1.43.44(i1* align 512 %_05, i1* align 512 %_16, i1* align 512 %_27, i1* align 512 %_38, [4 x i1]* %4)
  call void @onebyonecpy_hls.p0a23f32.45.46(float* align 512 %_09, float* align 512 %_110, float* align 512 %_211, float* align 512 %_312, float* align 512 %_4, float* align 512 %_5, float* align 512 %_6, float* align 512 %_7, float* align 512 %_8, float* align 512 %_9, float* align 512 %_10, float* align 512 %_11, float* align 512 %_1213, float* align 512 %_13, float* align 512 %_14, float* align 512 %_15, float* align 512 %_1614, float* align 512 %_17, float* align 512 %_18, float* align 512 %_19, float* align 512 %_20, float* align 512 %_21, float* align 512 %_22, [23 x float]* %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4f32.51.52([4 x float]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3) #1 {
entry:
  %1 = icmp eq [4 x float]* %0, null
  %2 = icmp eq float* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [4 x float], [4 x float]* %0, i64 0, i64 %for.loop.idx1
  %4 = trunc i64 %for.loop.idx1 to i2
  switch i2 %4, label %src.addr.case.3 [
    i2 0, label %src.addr.case.0
    i2 1, label %src.addr.case.1
    i2 -2, label %src.addr.case.2
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_01 = load float, float* %_0, align 512
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_12 = load float, float* %_1, align 512
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_23 = load float, float* %_2, align 512
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_34 = load float, float* %_3, align 512
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %5 = phi float [ %_01, %src.addr.case.0 ], [ %_12, %src.addr.case.1 ], [ %_23, %src.addr.case.2 ], [ %_34, %src.addr.case.3 ]
  store float %5, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4i32.53.54([4 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3) #1 {
entry:
  %1 = icmp eq [4 x i32]* %0, null
  %2 = icmp eq i32* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [4 x i32], [4 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = trunc i64 %for.loop.idx1 to i2
  switch i2 %4, label %src.addr.case.3 [
    i2 0, label %src.addr.case.0
    i2 1, label %src.addr.case.1
    i2 -2, label %src.addr.case.2
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_01 = load i32, i32* %_0, align 512
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_12 = load i32, i32* %_1, align 512
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_23 = load i32, i32* %_2, align 512
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_34 = load i32, i32* %_3, align 512
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %5 = phi i32 [ %_01, %src.addr.case.0 ], [ %_12, %src.addr.case.1 ], [ %_23, %src.addr.case.2 ], [ %_34, %src.addr.case.3 ]
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a4i1.55.56([4 x i1]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3) #1 {
entry:
  %1 = icmp eq [4 x i1]* %0, null
  %2 = icmp eq i1* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [4 x i1], [4 x i1]* %0, i64 0, i64 %for.loop.idx1
  %4 = trunc i64 %for.loop.idx1 to i2
  switch i2 %4, label %src.addr.case.3 [
    i2 0, label %src.addr.case.0
    i2 1, label %src.addr.case.1
    i2 -2, label %src.addr.case.2
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %5 = bitcast i1* %_0 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %8 = bitcast i1* %_1 to i8*
  %9 = load i8, i8* %8
  %10 = trunc i8 %9 to i1
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %11 = bitcast i1* %_2 to i8*
  %12 = load i8, i8* %11
  %13 = trunc i8 %12 to i1
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %14 = bitcast i1* %_3 to i8*
  %15 = load i8, i8* %14
  %16 = trunc i8 %15 to i1
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %17 = phi i1 [ %7, %src.addr.case.0 ], [ %10, %src.addr.case.1 ], [ %13, %src.addr.case.2 ], [ %16, %src.addr.case.3 ]
  store i1 %17, i1* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a23f32.57.58([23 x float]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_4, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_5, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_6, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_7, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_8, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_9, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_10, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_11, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_12, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_13, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_14, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_15, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_16, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_17, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_18, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_19, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_20, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_21, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_22) #1 {
entry:
  %1 = icmp eq [23 x float]* %0, null
  %2 = icmp eq float* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [23 x float], [23 x float]* %0, i64 0, i64 %for.loop.idx1
  %4 = trunc i64 %for.loop.idx1 to i5
  switch i5 %4, label %src.addr.case.22 [
    i5 0, label %src.addr.case.0
    i5 1, label %src.addr.case.1
    i5 2, label %src.addr.case.2
    i5 3, label %src.addr.case.3
    i5 4, label %src.addr.case.4
    i5 5, label %src.addr.case.5
    i5 6, label %src.addr.case.6
    i5 7, label %src.addr.case.7
    i5 8, label %src.addr.case.8
    i5 9, label %src.addr.case.9
    i5 10, label %src.addr.case.10
    i5 11, label %src.addr.case.11
    i5 12, label %src.addr.case.12
    i5 13, label %src.addr.case.13
    i5 14, label %src.addr.case.14
    i5 15, label %src.addr.case.15
    i5 -16, label %src.addr.case.16
    i5 -15, label %src.addr.case.17
    i5 -14, label %src.addr.case.18
    i5 -13, label %src.addr.case.19
    i5 -12, label %src.addr.case.20
    i5 -11, label %src.addr.case.21
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_01 = load float, float* %_0, align 512
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_110 = load float, float* %_1, align 512
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_211 = load float, float* %_2, align 512
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_312 = load float, float* %_3, align 512
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  %_413 = load float, float* %_4, align 512
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  %_514 = load float, float* %_5, align 512
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  %_615 = load float, float* %_6, align 512
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  %_716 = load float, float* %_7, align 512
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  %_817 = load float, float* %_8, align 512
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  %_918 = load float, float* %_9, align 512
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  %_1019 = load float, float* %_10, align 512
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  %_1120 = load float, float* %_11, align 512
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  %_1221 = load float, float* %_12, align 512
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  %_1322 = load float, float* %_13, align 512
  br label %src.addr.exit

src.addr.case.14:                                 ; preds = %for.loop
  %_1423 = load float, float* %_14, align 512
  br label %src.addr.exit

src.addr.case.15:                                 ; preds = %for.loop
  %_1524 = load float, float* %_15, align 512
  br label %src.addr.exit

src.addr.case.16:                                 ; preds = %for.loop
  %_1625 = load float, float* %_16, align 512
  br label %src.addr.exit

src.addr.case.17:                                 ; preds = %for.loop
  %_1726 = load float, float* %_17, align 512
  br label %src.addr.exit

src.addr.case.18:                                 ; preds = %for.loop
  %_1827 = load float, float* %_18, align 512
  br label %src.addr.exit

src.addr.case.19:                                 ; preds = %for.loop
  %_1928 = load float, float* %_19, align 512
  br label %src.addr.exit

src.addr.case.20:                                 ; preds = %for.loop
  %_2029 = load float, float* %_20, align 512
  br label %src.addr.exit

src.addr.case.21:                                 ; preds = %for.loop
  %_2130 = load float, float* %_21, align 512
  br label %src.addr.exit

src.addr.case.22:                                 ; preds = %for.loop
  %5 = icmp eq i5 %4, -10
  call void @llvm.assume(i1 %5)
  %_2231 = load float, float* %_22, align 512
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.22, %src.addr.case.21, %src.addr.case.20, %src.addr.case.19, %src.addr.case.18, %src.addr.case.17, %src.addr.case.16, %src.addr.case.15, %src.addr.case.14, %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %6 = phi float [ %_01, %src.addr.case.0 ], [ %_110, %src.addr.case.1 ], [ %_211, %src.addr.case.2 ], [ %_312, %src.addr.case.3 ], [ %_413, %src.addr.case.4 ], [ %_514, %src.addr.case.5 ], [ %_615, %src.addr.case.6 ], [ %_716, %src.addr.case.7 ], [ %_817, %src.addr.case.8 ], [ %_918, %src.addr.case.9 ], [ %_1019, %src.addr.case.10 ], [ %_1120, %src.addr.case.11 ], [ %_1221, %src.addr.case.12 ], [ %_1322, %src.addr.case.13 ], [ %_1423, %src.addr.case.14 ], [ %_1524, %src.addr.case.15 ], [ %_1625, %src.addr.case.16 ], [ %_1726, %src.addr.case.17 ], [ %_1827, %src.addr.case.18 ], [ %_1928, %src.addr.case.19 ], [ %_2029, %src.addr.case.20 ], [ %_2130, %src.addr.case.21 ], [ %_2231, %src.addr.case.22 ]
  store float %6, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 23
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out(float* "orig.arg.no"="0", float* noalias readonly align 512 "orig.arg.no"="1", [4 x float]* "orig.arg.no"="2", float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_2, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_3, [4 x i32]* "orig.arg.no"="4", i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_23, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_34, [4 x i1]* "orig.arg.no"="6", i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_05, i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_16, i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_27, i1* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_38, [23 x float]* "orig.arg.no"="8", float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_09, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_110, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_211, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_312, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_4, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_5, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_6, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_7, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_8, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_9, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_10, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_11, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_1213, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_13, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_14, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_15, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_1614, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_17, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_19, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_20, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_21, float* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_22) #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0f32(float* %0, float* align 512 %1)
  call void @onebyonecpy_hls.p0a4f32.51.52([4 x float]* %2, float* align 512 %_0, float* align 512 %_1, float* align 512 %_2, float* align 512 %_3)
  call void @onebyonecpy_hls.p0a4i32.53.54([4 x i32]* %3, i32* align 512 %_01, i32* align 512 %_12, i32* align 512 %_23, i32* align 512 %_34)
  call void @onebyonecpy_hls.p0a4i1.55.56([4 x i1]* %4, i1* align 512 %_05, i1* align 512 %_16, i1* align 512 %_27, i1* align 512 %_38)
  call void @onebyonecpy_hls.p0a23f32.57.58([23 x float]* %5, float* align 512 %_09, float* align 512 %_110, float* align 512 %_211, float* align 512 %_312, float* align 512 %_4, float* align 512 %_5, float* align 512 %_6, float* align 512 %_7, float* align 512 %_8, float* align 512 %_9, float* align 512 %_10, float* align 512 %_11, float* align 512 %_1213, float* align 512 %_13, float* align 512 %_14, float* align 512 %_15, float* align 512 %_1614, float* align 512 %_17, float* align 512 %_18, float* align 512 %_19, float* align 512 %_20, float* align 512 %_21, float* align 512 %_22)
  ret void
}

declare void @apatb_accelerate_hw(float*, float*, float*, float*, float*, i32*, i32*, i32*, i32*, i1*, i1*, i1*, i1*, i32, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i1)

define void @accelerate_hw_stub_wrapper(float*, float*, float*, float*, float*, i32*, i32*, i32*, i32*, i1*, i1*, i1*, i1*, i32, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i1) #5 {
entry:
  %38 = alloca [4 x float]
  %39 = alloca [4 x i32]
  %40 = alloca [4 x i1]
  %41 = alloca [23 x float]
  call void @copy_out(float* null, float* %0, [4 x float]* %38, float* %1, float* %2, float* %3, float* %4, [4 x i32]* %39, i32* %5, i32* %6, i32* %7, i32* %8, [4 x i1]* %40, i1* %9, i1* %10, i1* %11, i1* %12, [23 x float]* %41, float* %14, float* %15, float* %16, float* %17, float* %18, float* %19, float* %20, float* %21, float* %22, float* %23, float* %24, float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31, float* %32, float* %33, float* %34, float* %35, float* %36)
  %42 = bitcast [4 x float]* %38 to float*
  %43 = bitcast [4 x i32]* %39 to i32*
  %44 = bitcast [4 x i1]* %40 to i1*
  %45 = bitcast [23 x float]* %41 to float*
  call void @accelerate_hw_stub(float* %0, float* %42, i32* %43, i1* %44, i32 %13, float* %45, i1 %37)
  call void @copy_in(float* null, float* %0, [4 x float]* %38, float* %1, float* %2, float* %3, float* %4, [4 x i32]* %39, i32* %5, i32* %6, i32* %7, i32* %8, [4 x i1]* %40, i1* %9, i1* %10, i1* %11, i1* %12, [23 x float]* %41, float* %14, float* %15, float* %16, float* %17, float* %18, float* %19, float* %20, float* %21, float* %22, float* %23, float* %24, float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31, float* %32, float* %33, float* %34, float* %35, float* %36)
  ret void
}

declare void @accelerate_hw_stub(float*, float*, i32*, i1*, i32, float*, i1)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #2 = { nounwind }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
