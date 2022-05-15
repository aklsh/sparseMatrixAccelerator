; ModuleID = '/home/akileshkannan/SPMV_CSR/solution2/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_accelerate_ir(i32* %out, i32* %subrow_vals, i32* %subrow_col_indices, i1* %mult_enables, i32 %label, i32* %init_vector, i1 %init) local_unnamed_addr #0 {
entry:
  %out_copy = alloca i32, align 512
  %subrow_vals_copy = alloca [4 x i32], align 512
  %subrow_col_indices_copy = alloca [4 x i32], align 512
  %mult_enables_copy = alloca [4 x i1], align 512
  %init_vector_copy = alloca [23 x i32], align 512
  %0 = bitcast i32* %subrow_vals to [4 x i32]*
  %1 = bitcast i32* %subrow_col_indices to [4 x i32]*
  %2 = bitcast i1* %mult_enables to [4 x i1]*
  %3 = bitcast i32* %init_vector to [23 x i32]*
  call fastcc void @copy_in(i32* %out, i32* nonnull align 512 %out_copy, [4 x i32]* %0, [4 x i32]* nonnull align 512 %subrow_vals_copy, [4 x i32]* %1, [4 x i32]* nonnull align 512 %subrow_col_indices_copy, [4 x i1]* %2, [4 x i1]* nonnull align 512 %mult_enables_copy, [23 x i32]* %3, [23 x i32]* nonnull align 512 %init_vector_copy)
  %4 = getelementptr inbounds [4 x i32], [4 x i32]* %subrow_vals_copy, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i32], [4 x i32]* %subrow_col_indices_copy, i32 0, i32 0
  %6 = getelementptr inbounds [4 x i1], [4 x i1]* %mult_enables_copy, i32 0, i32 0
  %7 = getelementptr inbounds [23 x i32], [23 x i32]* %init_vector_copy, i32 0, i32 0
  call void @apatb_accelerate_hw(i32* %out_copy, i32* %4, i32* %5, i1* %6, i32 %label, i32* %7, i1 %init)
  call fastcc void @copy_out(i32* %out, i32* nonnull align 512 %out_copy, [4 x i32]* %0, [4 x i32]* nonnull align 512 %subrow_vals_copy, [4 x i32]* %1, [4 x i32]* nonnull align 512 %subrow_col_indices_copy, [4 x i1]* %2, [4 x i1]* nonnull align 512 %mult_enables_copy, [23 x i32]* %3, [23 x i32]* nonnull align 512 %init_vector_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(i32* readonly, i32* noalias align 512, [4 x i32]* readonly, [4 x i32]* noalias align 512, [4 x i32]* readonly, [4 x i32]* noalias align 512, [4 x i1]* readonly, [4 x i1]* noalias align 512, [23 x i32]* readonly, [23 x i32]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %1, i32* %0)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* align 512 %3, [4 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* align 512 %5, [4 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a4i1([4 x i1]* align 512 %7, [4 x i1]* %6)
  call fastcc void @onebyonecpy_hls.p0a23i32([23 x i32]* align 512 %9, [23 x i32]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #2 {
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
define internal fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* noalias align 512, [4 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [4 x i32]* %0, null
  %3 = icmp eq [4 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4 x i32], [4 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [4 x i32], [4 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a4i1([4 x i1]* noalias align 512, [4 x i1]* noalias readonly) unnamed_addr #2 {
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

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a23i32([23 x i32]* noalias align 512, [23 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [23 x i32]* %0, null
  %3 = icmp eq [23 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [23 x i32], [23 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [23 x i32], [23 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 23
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(i32*, i32* noalias readonly align 512, [4 x i32]*, [4 x i32]* noalias readonly align 512, [4 x i32]*, [4 x i32]* noalias readonly align 512, [4 x i1]*, [4 x i1]* noalias readonly align 512, [23 x i32]*, [23 x i32]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* %0, i32* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* %2, [4 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a4i32([4 x i32]* %4, [4 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a4i1([4 x i1]* %6, [4 x i1]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a23i32([23 x i32]* %8, [23 x i32]* align 512 %9)
  ret void
}

declare void @apatb_accelerate_hw(i32*, i32*, i32*, i1*, i32, i32*, i1)

define void @accelerate_hw_stub_wrapper(i32*, i32*, i32*, i1*, i32, i32*, i1) #4 {
entry:
  %7 = bitcast i32* %1 to [4 x i32]*
  %8 = bitcast i32* %2 to [4 x i32]*
  %9 = bitcast i1* %3 to [4 x i1]*
  %10 = bitcast i32* %5 to [23 x i32]*
  call void @copy_out(i32* null, i32* %0, [4 x i32]* null, [4 x i32]* %7, [4 x i32]* null, [4 x i32]* %8, [4 x i1]* null, [4 x i1]* %9, [23 x i32]* null, [23 x i32]* %10)
  %11 = bitcast [4 x i32]* %7 to i32*
  %12 = bitcast [4 x i32]* %8 to i32*
  %13 = bitcast [4 x i1]* %9 to i1*
  %14 = bitcast [23 x i32]* %10 to i32*
  call void @accelerate_hw_stub(i32* %0, i32* %11, i32* %12, i1* %13, i32 %4, i32* %14, i1 %6)
  call void @copy_in(i32* null, i32* %0, [4 x i32]* null, [4 x i32]* %7, [4 x i32]* null, [4 x i32]* %8, [4 x i1]* null, [4 x i1]* %9, [23 x i32]* null, [23 x i32]* %10)
  ret void
}

declare void @accelerate_hw_stub(i32*, i32*, i32*, i1*, i32, i32*, i1)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
