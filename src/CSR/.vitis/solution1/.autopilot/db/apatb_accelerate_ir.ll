; ModuleID = '/home/akileshkannan/SPMV_CSR/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_accelerate_ir(i32* %out, i32* %subrow_vals, i32* %subrow_col_indices, i1* %mult_enables, i32 %label, i1 %init_vector, i32* %vector) local_unnamed_addr #0 {
entry:
  %out_copy = alloca i32, align 512
  %subrow_vals_copy = alloca i32, align 512
  %subrow_col_indices_copy = alloca i32, align 512
  %mult_enables_copy = alloca [4 x i1], align 512
  %vector_copy_0 = alloca i32, align 512
  %vector_copy_1 = alloca i32, align 512
  %vector_copy_2 = alloca i32, align 512
  %vector_copy_3 = alloca i32, align 512
  %vector_copy_4 = alloca i32, align 512
  %vector_copy_5 = alloca i32, align 512
  %vector_copy_6 = alloca i32, align 512
  %vector_copy_7 = alloca i32, align 512
  %vector_copy_8 = alloca i32, align 512
  %vector_copy_9 = alloca i32, align 512
  %vector_copy_10 = alloca i32, align 512
  %vector_copy_11 = alloca i32, align 512
  %vector_copy_12 = alloca i32, align 512
  %vector_copy_13 = alloca i32, align 512
  %vector_copy_14 = alloca i32, align 512
  %vector_copy_15 = alloca i32, align 512
  %vector_copy_16 = alloca i32, align 512
  %vector_copy_17 = alloca i32, align 512
  %vector_copy_18 = alloca i32, align 512
  %vector_copy_19 = alloca i32, align 512
  %vector_copy_20 = alloca i32, align 512
  %vector_copy_21 = alloca i32, align 512
  %vector_copy_22 = alloca i32, align 512
  %0 = bitcast i1* %mult_enables to [4 x i1]*
  %1 = bitcast i32* %vector to [23 x i32]*
  call void @copy_in(i32* %out, i32* nonnull align 512 %out_copy, i32* %subrow_vals, i32* nonnull align 512 %subrow_vals_copy, i32* %subrow_col_indices, i32* nonnull align 512 %subrow_col_indices_copy, [4 x i1]* %0, [4 x i1]* nonnull align 512 %mult_enables_copy, [23 x i32]* %1, i32* nonnull align 512 %vector_copy_0, i32* nonnull align 512 %vector_copy_1, i32* nonnull align 512 %vector_copy_2, i32* nonnull align 512 %vector_copy_3, i32* nonnull align 512 %vector_copy_4, i32* nonnull align 512 %vector_copy_5, i32* nonnull align 512 %vector_copy_6, i32* nonnull align 512 %vector_copy_7, i32* nonnull align 512 %vector_copy_8, i32* nonnull align 512 %vector_copy_9, i32* nonnull align 512 %vector_copy_10, i32* nonnull align 512 %vector_copy_11, i32* nonnull align 512 %vector_copy_12, i32* nonnull align 512 %vector_copy_13, i32* nonnull align 512 %vector_copy_14, i32* nonnull align 512 %vector_copy_15, i32* nonnull align 512 %vector_copy_16, i32* nonnull align 512 %vector_copy_17, i32* nonnull align 512 %vector_copy_18, i32* nonnull align 512 %vector_copy_19, i32* nonnull align 512 %vector_copy_20, i32* nonnull align 512 %vector_copy_21, i32* nonnull align 512 %vector_copy_22)
  %2 = getelementptr inbounds [4 x i1], [4 x i1]* %mult_enables_copy, i32 0, i32 0
  call void @apatb_accelerate_hw(i32* %out_copy, i32* %subrow_vals_copy, i32* %subrow_col_indices_copy, i1* %2, i32 %label, i1 %init_vector, i32* %vector_copy_0, i32* %vector_copy_1, i32* %vector_copy_2, i32* %vector_copy_3, i32* %vector_copy_4, i32* %vector_copy_5, i32* %vector_copy_6, i32* %vector_copy_7, i32* %vector_copy_8, i32* %vector_copy_9, i32* %vector_copy_10, i32* %vector_copy_11, i32* %vector_copy_12, i32* %vector_copy_13, i32* %vector_copy_14, i32* %vector_copy_15, i32* %vector_copy_16, i32* %vector_copy_17, i32* %vector_copy_18, i32* %vector_copy_19, i32* %vector_copy_20, i32* %vector_copy_21, i32* %vector_copy_22)
  call void @copy_out(i32* %out, i32* nonnull align 512 %out_copy, i32* %subrow_vals, i32* nonnull align 512 %subrow_vals_copy, i32* %subrow_col_indices, i32* nonnull align 512 %subrow_col_indices_copy, [4 x i1]* %0, [4 x i1]* nonnull align 512 %mult_enables_copy, [23 x i32]* %1, i32* nonnull align 512 %vector_copy_0, i32* nonnull align 512 %vector_copy_1, i32* nonnull align 512 %vector_copy_2, i32* nonnull align 512 %vector_copy_3, i32* nonnull align 512 %vector_copy_4, i32* nonnull align 512 %vector_copy_5, i32* nonnull align 512 %vector_copy_6, i32* nonnull align 512 %vector_copy_7, i32* nonnull align 512 %vector_copy_8, i32* nonnull align 512 %vector_copy_9, i32* nonnull align 512 %vector_copy_10, i32* nonnull align 512 %vector_copy_11, i32* nonnull align 512 %vector_copy_12, i32* nonnull align 512 %vector_copy_13, i32* nonnull align 512 %vector_copy_14, i32* nonnull align 512 %vector_copy_15, i32* nonnull align 512 %vector_copy_16, i32* nonnull align 512 %vector_copy_17, i32* nonnull align 512 %vector_copy_18, i32* nonnull align 512 %vector_copy_19, i32* nonnull align 512 %vector_copy_20, i32* nonnull align 512 %vector_copy_21, i32* nonnull align 512 %vector_copy_22)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #1 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load i32, i32* %1, align 4
  store i32 %5, i32* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a4i1([4 x i1]* noalias align 512, [4 x i1]* noalias readonly) unnamed_addr #1 {
entry:
  %2 = icmp eq [4 x i1]* %0, null
  %3 = icmp eq [4 x i1]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x i1], [4 x i1]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [4 x i1], [4 x i1]* %1, i64 0, i64 %for.loop.idx1
  %5 = bitcast i1* %src.addr to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: nounwind
declare void @llvm.assume(i1) #2

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a23i32.39.40(i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_4, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_5, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_6, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_7, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_8, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_9, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_10, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_11, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_12, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_13, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_14, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_15, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_16, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_17, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_18, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_19, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_20, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_21, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_22, [23 x i32]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #1 {
entry:
  %1 = icmp eq i32* %_0, null
  %2 = icmp eq [23 x i32]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [23 x i32], [23 x i32]* %0, i64 0, i64 %for.loop.idx1
  %4 = load i32, i32* %src.addr, align 4
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

dst.addr.case.4:                                  ; preds = %for.loop
  store i32 %4, i32* %_4, align 512
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  store i32 %4, i32* %_5, align 512
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  store i32 %4, i32* %_6, align 512
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  store i32 %4, i32* %_7, align 512
  br label %dst.addr.exit

dst.addr.case.8:                                  ; preds = %for.loop
  store i32 %4, i32* %_8, align 512
  br label %dst.addr.exit

dst.addr.case.9:                                  ; preds = %for.loop
  store i32 %4, i32* %_9, align 512
  br label %dst.addr.exit

dst.addr.case.10:                                 ; preds = %for.loop
  store i32 %4, i32* %_10, align 512
  br label %dst.addr.exit

dst.addr.case.11:                                 ; preds = %for.loop
  store i32 %4, i32* %_11, align 512
  br label %dst.addr.exit

dst.addr.case.12:                                 ; preds = %for.loop
  store i32 %4, i32* %_12, align 512
  br label %dst.addr.exit

dst.addr.case.13:                                 ; preds = %for.loop
  store i32 %4, i32* %_13, align 512
  br label %dst.addr.exit

dst.addr.case.14:                                 ; preds = %for.loop
  store i32 %4, i32* %_14, align 512
  br label %dst.addr.exit

dst.addr.case.15:                                 ; preds = %for.loop
  store i32 %4, i32* %_15, align 512
  br label %dst.addr.exit

dst.addr.case.16:                                 ; preds = %for.loop
  store i32 %4, i32* %_16, align 512
  br label %dst.addr.exit

dst.addr.case.17:                                 ; preds = %for.loop
  store i32 %4, i32* %_17, align 512
  br label %dst.addr.exit

dst.addr.case.18:                                 ; preds = %for.loop
  store i32 %4, i32* %_18, align 512
  br label %dst.addr.exit

dst.addr.case.19:                                 ; preds = %for.loop
  store i32 %4, i32* %_19, align 512
  br label %dst.addr.exit

dst.addr.case.20:                                 ; preds = %for.loop
  store i32 %4, i32* %_20, align 512
  br label %dst.addr.exit

dst.addr.case.21:                                 ; preds = %for.loop
  store i32 %4, i32* %_21, align 512
  br label %dst.addr.exit

dst.addr.case.22:                                 ; preds = %for.loop
  %6 = icmp eq i5 %5, -10
  call void @llvm.assume(i1 %6)
  store i32 %4, i32* %_22, align 512
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.22, %dst.addr.case.21, %dst.addr.case.20, %dst.addr.case.19, %dst.addr.case.18, %dst.addr.case.17, %dst.addr.case.16, %dst.addr.case.15, %dst.addr.case.14, %dst.addr.case.13, %dst.addr.case.12, %dst.addr.case.11, %dst.addr.case.10, %dst.addr.case.9, %dst.addr.case.8, %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 23
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in(i32* readonly "orig.arg.no"="0", i32* noalias align 512 "orig.arg.no"="1", i32* readonly "orig.arg.no"="2", i32* noalias align 512 "orig.arg.no"="3", i32* readonly "orig.arg.no"="4", i32* noalias align 512 "orig.arg.no"="5", [4 x i1]* readonly "orig.arg.no"="6", [4 x i1]* noalias align 512 "orig.arg.no"="7", [23 x i32]* readonly "orig.arg.no"="8", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_0, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_1, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_2, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_3, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_4, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_5, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_6, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_7, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_8, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_9, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_10, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_11, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_12, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_13, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_14, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_15, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_16, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_17, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_19, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_20, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_21, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_22) #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %1, i32* %0)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %3, i32* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
  call fastcc void @onebyonecpy_hls.p0a4i1([4 x i1]* align 512 %7, [4 x i1]* %6)
  call void @onebyonecpy_hls.p0a23i32.39.40(i32* align 512 %_0, i32* align 512 %_1, i32* align 512 %_2, i32* align 512 %_3, i32* align 512 %_4, i32* align 512 %_5, i32* align 512 %_6, i32* align 512 %_7, i32* align 512 %_8, i32* align 512 %_9, i32* align 512 %_10, i32* align 512 %_11, i32* align 512 %_12, i32* align 512 %_13, i32* align 512 %_14, i32* align 512 %_15, i32* align 512 %_16, i32* align 512 %_17, i32* align 512 %_18, i32* align 512 %_19, i32* align 512 %_20, i32* align 512 %_21, i32* align 512 %_22, [23 x i32]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a23i32.45.46([23 x i32]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_4, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_5, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_6, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_7, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_8, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_9, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_10, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_11, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_12, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_13, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_14, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_15, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_16, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_17, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_18, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_19, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_20, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_21, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_22) #1 {
entry:
  %1 = icmp eq [23 x i32]* %0, null
  %2 = icmp eq i32* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [23 x i32], [23 x i32]* %0, i64 0, i64 %for.loop.idx1
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
  %_01 = load i32, i32* %_0, align 512
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_110 = load i32, i32* %_1, align 512
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_211 = load i32, i32* %_2, align 512
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %_312 = load i32, i32* %_3, align 512
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  %_413 = load i32, i32* %_4, align 512
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  %_514 = load i32, i32* %_5, align 512
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  %_615 = load i32, i32* %_6, align 512
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  %_716 = load i32, i32* %_7, align 512
  br label %src.addr.exit

src.addr.case.8:                                  ; preds = %for.loop
  %_817 = load i32, i32* %_8, align 512
  br label %src.addr.exit

src.addr.case.9:                                  ; preds = %for.loop
  %_918 = load i32, i32* %_9, align 512
  br label %src.addr.exit

src.addr.case.10:                                 ; preds = %for.loop
  %_1019 = load i32, i32* %_10, align 512
  br label %src.addr.exit

src.addr.case.11:                                 ; preds = %for.loop
  %_1120 = load i32, i32* %_11, align 512
  br label %src.addr.exit

src.addr.case.12:                                 ; preds = %for.loop
  %_1221 = load i32, i32* %_12, align 512
  br label %src.addr.exit

src.addr.case.13:                                 ; preds = %for.loop
  %_1322 = load i32, i32* %_13, align 512
  br label %src.addr.exit

src.addr.case.14:                                 ; preds = %for.loop
  %_1423 = load i32, i32* %_14, align 512
  br label %src.addr.exit

src.addr.case.15:                                 ; preds = %for.loop
  %_1524 = load i32, i32* %_15, align 512
  br label %src.addr.exit

src.addr.case.16:                                 ; preds = %for.loop
  %_1625 = load i32, i32* %_16, align 512
  br label %src.addr.exit

src.addr.case.17:                                 ; preds = %for.loop
  %_1726 = load i32, i32* %_17, align 512
  br label %src.addr.exit

src.addr.case.18:                                 ; preds = %for.loop
  %_1827 = load i32, i32* %_18, align 512
  br label %src.addr.exit

src.addr.case.19:                                 ; preds = %for.loop
  %_1928 = load i32, i32* %_19, align 512
  br label %src.addr.exit

src.addr.case.20:                                 ; preds = %for.loop
  %_2029 = load i32, i32* %_20, align 512
  br label %src.addr.exit

src.addr.case.21:                                 ; preds = %for.loop
  %_2130 = load i32, i32* %_21, align 512
  br label %src.addr.exit

src.addr.case.22:                                 ; preds = %for.loop
  %5 = icmp eq i5 %4, -10
  call void @llvm.assume(i1 %5)
  %_2231 = load i32, i32* %_22, align 512
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.22, %src.addr.case.21, %src.addr.case.20, %src.addr.case.19, %src.addr.case.18, %src.addr.case.17, %src.addr.case.16, %src.addr.case.15, %src.addr.case.14, %src.addr.case.13, %src.addr.case.12, %src.addr.case.11, %src.addr.case.10, %src.addr.case.9, %src.addr.case.8, %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %6 = phi i32 [ %_01, %src.addr.case.0 ], [ %_110, %src.addr.case.1 ], [ %_211, %src.addr.case.2 ], [ %_312, %src.addr.case.3 ], [ %_413, %src.addr.case.4 ], [ %_514, %src.addr.case.5 ], [ %_615, %src.addr.case.6 ], [ %_716, %src.addr.case.7 ], [ %_817, %src.addr.case.8 ], [ %_918, %src.addr.case.9 ], [ %_1019, %src.addr.case.10 ], [ %_1120, %src.addr.case.11 ], [ %_1221, %src.addr.case.12 ], [ %_1322, %src.addr.case.13 ], [ %_1423, %src.addr.case.14 ], [ %_1524, %src.addr.case.15 ], [ %_1625, %src.addr.case.16 ], [ %_1726, %src.addr.case.17 ], [ %_1827, %src.addr.case.18 ], [ %_1928, %src.addr.case.19 ], [ %_2029, %src.addr.case.20 ], [ %_2130, %src.addr.case.21 ], [ %_2231, %src.addr.case.22 ]
  store i32 %6, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 23
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out(i32* "orig.arg.no"="0", i32* noalias readonly align 512 "orig.arg.no"="1", i32* "orig.arg.no"="2", i32* noalias readonly align 512 "orig.arg.no"="3", i32* "orig.arg.no"="4", i32* noalias readonly align 512 "orig.arg.no"="5", [4 x i1]* "orig.arg.no"="6", [4 x i1]* noalias readonly align 512 "orig.arg.no"="7", [23 x i32]* "orig.arg.no"="8", i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_0, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_1, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_2, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_3, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_4, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_5, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_6, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_7, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_8, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_9, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_10, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_11, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_12, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_13, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_14, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_15, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_16, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_17, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_18, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_19, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_20, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_21, i32* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="9" %_22) #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* %0, i32* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %2, i32* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a4i1([4 x i1]* %6, [4 x i1]* align 512 %7)
  call void @onebyonecpy_hls.p0a23i32.45.46([23 x i32]* %8, i32* align 512 %_0, i32* align 512 %_1, i32* align 512 %_2, i32* align 512 %_3, i32* align 512 %_4, i32* align 512 %_5, i32* align 512 %_6, i32* align 512 %_7, i32* align 512 %_8, i32* align 512 %_9, i32* align 512 %_10, i32* align 512 %_11, i32* align 512 %_12, i32* align 512 %_13, i32* align 512 %_14, i32* align 512 %_15, i32* align 512 %_16, i32* align 512 %_17, i32* align 512 %_18, i32* align 512 %_19, i32* align 512 %_20, i32* align 512 %_21, i32* align 512 %_22)
  ret void
}

declare void @apatb_accelerate_hw(i32*, i32*, i32*, i1*, i32, i1, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

define void @accelerate_hw_stub_wrapper(i32*, i32*, i32*, i1*, i32, i1, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*) #5 {
entry:
  %29 = alloca [23 x i32]
  %30 = bitcast i1* %3 to [4 x i1]*
  call void @copy_out(i32* null, i32* %0, i32* null, i32* %1, i32* null, i32* %2, [4 x i1]* null, [4 x i1]* %30, [23 x i32]* %29, i32* %6, i32* %7, i32* %8, i32* %9, i32* %10, i32* %11, i32* %12, i32* %13, i32* %14, i32* %15, i32* %16, i32* %17, i32* %18, i32* %19, i32* %20, i32* %21, i32* %22, i32* %23, i32* %24, i32* %25, i32* %26, i32* %27, i32* %28)
  %31 = bitcast [4 x i1]* %30 to i1*
  %32 = bitcast [23 x i32]* %29 to i32*
  call void @accelerate_hw_stub(i32* %0, i32* %1, i32* %2, i1* %31, i32 %4, i1 %5, i32* %32)
  call void @copy_in(i32* null, i32* %0, i32* null, i32* %1, i32* null, i32* %2, [4 x i1]* null, [4 x i1]* %30, [23 x i32]* %29, i32* %6, i32* %7, i32* %8, i32* %9, i32* %10, i32* %11, i32* %12, i32* %13, i32* %14, i32* %15, i32* %16, i32* %17, i32* %18, i32* %19, i32* %20, i32* %21, i32* %22, i32* %23, i32* %24, i32* %25, i32* %26, i32* %27, i32* %28)
  ret void
}

declare void @accelerate_hw_stub(i32*, i32*, i32*, i1*, i32, i1, i32*)

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
