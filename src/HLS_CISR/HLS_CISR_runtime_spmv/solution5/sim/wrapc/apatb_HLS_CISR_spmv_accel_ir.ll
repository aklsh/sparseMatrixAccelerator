; ModuleID = '/home/shivaubuntu/HLS_project/sparseMatrixAccelerator/src/HLS_CISR/HLS_CISR_runtime_spmv/solution5/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.slot_data = type { float, i32 }

; Function Attrs: noinline
define void @apatb_HLS_CISR_spmv_accel_ir(i1 %cmd_start, float* %inp_vec, %struct.slot_data* %slot_data_arr, i32* %slot_arr_row_len, float* %output_vec) local_unnamed_addr #0 {
entry:
  %inp_vec_copy = alloca [8 x float], align 512
  %slot_data_arr_copy = alloca [2 x %struct.slot_data], align 512
  %slot_arr_row_len_copy = alloca [2 x i32], align 512
  %output_vec_copy = alloca [8 x float], align 512
  %0 = bitcast float* %inp_vec to [8 x float]*
  %1 = bitcast %struct.slot_data* %slot_data_arr to [2 x %struct.slot_data]*
  %2 = bitcast i32* %slot_arr_row_len to [2 x i32]*
  %3 = bitcast float* %output_vec to [8 x float]*
  call fastcc void @copy_in([8 x float]* %0, [8 x float]* nonnull align 512 %inp_vec_copy, [2 x %struct.slot_data]* %1, [2 x %struct.slot_data]* nonnull align 512 %slot_data_arr_copy, [2 x i32]* %2, [2 x i32]* nonnull align 512 %slot_arr_row_len_copy, [8 x float]* %3, [8 x float]* nonnull align 512 %output_vec_copy)
  %4 = getelementptr inbounds [8 x float], [8 x float]* %inp_vec_copy, i32 0, i32 0
  %5 = getelementptr inbounds [2 x %struct.slot_data], [2 x %struct.slot_data]* %slot_data_arr_copy, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %slot_arr_row_len_copy, i32 0, i32 0
  %7 = getelementptr inbounds [8 x float], [8 x float]* %output_vec_copy, i32 0, i32 0
  call void @apatb_HLS_CISR_spmv_accel_hw(i1 %cmd_start, float* %4, %struct.slot_data* %5, i32* %6, float* %7)
  call fastcc void @copy_out([8 x float]* %0, [8 x float]* nonnull align 512 %inp_vec_copy, [2 x %struct.slot_data]* %1, [2 x %struct.slot_data]* nonnull align 512 %slot_data_arr_copy, [2 x i32]* %2, [2 x i32]* nonnull align 512 %slot_arr_row_len_copy, [8 x float]* %3, [8 x float]* nonnull align 512 %output_vec_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([8 x float]* readonly, [8 x float]* noalias align 512, [2 x %struct.slot_data]* readonly, [2 x %struct.slot_data]* noalias align 512, [2 x i32]* readonly, [2 x i32]* noalias align 512, [8 x float]* readonly, [8 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8f32([8 x float]* align 512 %1, [8 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a2struct.slot_data([2 x %struct.slot_data]* align 512 %3, [2 x %struct.slot_data]* %2)
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* align 512 %5, [2 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a8f32([8 x float]* align 512 %7, [8 x float]* %6)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a8f32([8 x float]* noalias align 512, [8 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [8 x float]* %0, null
  %3 = icmp eq [8 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [8 x float], [8 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [8 x float], [8 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a2struct.slot_data([2 x %struct.slot_data]* noalias align 512, [2 x %struct.slot_data]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2 x %struct.slot_data]* %0, null
  %3 = icmp eq [2 x %struct.slot_data]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx9 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.02.gep5 = getelementptr [2 x %struct.slot_data], [2 x %struct.slot_data]* %0, i64 0, i64 %for.loop.idx9, i32 0
  %5 = bitcast float* %dst.addr.02.gep5 to i8*
  %src.addr.01.gep6 = getelementptr [2 x %struct.slot_data], [2 x %struct.slot_data]* %1, i64 0, i64 %for.loop.idx9, i32 0
  %6 = bitcast float* %src.addr.01.gep6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %dst.addr.14.gep7 = getelementptr [2 x %struct.slot_data], [2 x %struct.slot_data]* %0, i64 0, i64 %for.loop.idx9, i32 1
  %7 = bitcast i32* %dst.addr.14.gep7 to i8*
  %src.addr.13.gep8 = getelementptr [2 x %struct.slot_data], [2 x %struct.slot_data]* %1, i64 0, i64 %for.loop.idx9, i32 1
  %8 = bitcast i32* %src.addr.13.gep8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %8, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx9, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* noalias align 512, [2 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2 x i32]* %0, null
  %3 = icmp eq [2 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [2 x i32], [2 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [2 x i32], [2 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([8 x float]*, [8 x float]* noalias readonly align 512, [2 x %struct.slot_data]*, [2 x %struct.slot_data]* noalias readonly align 512, [2 x i32]*, [2 x i32]* noalias readonly align 512, [8 x float]*, [8 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8f32([8 x float]* %0, [8 x float]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a2struct.slot_data([2 x %struct.slot_data]* %2, [2 x %struct.slot_data]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* %4, [2 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a8f32([8 x float]* %6, [8 x float]* align 512 %7)
  ret void
}

declare void @apatb_HLS_CISR_spmv_accel_hw(i1, float*, %struct.slot_data*, i32*, float*)

define void @HLS_CISR_spmv_accel_hw_stub_wrapper(i1, float*, %struct.slot_data*, i32*, float*) #5 {
entry:
  %5 = bitcast float* %1 to [8 x float]*
  %6 = bitcast %struct.slot_data* %2 to [2 x %struct.slot_data]*
  %7 = bitcast i32* %3 to [2 x i32]*
  %8 = bitcast float* %4 to [8 x float]*
  call void @copy_out([8 x float]* null, [8 x float]* %5, [2 x %struct.slot_data]* null, [2 x %struct.slot_data]* %6, [2 x i32]* null, [2 x i32]* %7, [8 x float]* null, [8 x float]* %8)
  %9 = bitcast [8 x float]* %5 to float*
  %10 = bitcast [2 x %struct.slot_data]* %6 to %struct.slot_data*
  %11 = bitcast [2 x i32]* %7 to i32*
  %12 = bitcast [8 x float]* %8 to float*
  call void @HLS_CISR_spmv_accel_hw_stub(i1 %0, float* %9, %struct.slot_data* %10, i32* %11, float* %12)
  call void @copy_in([8 x float]* null, [8 x float]* %5, [2 x %struct.slot_data]* null, [2 x %struct.slot_data]* %6, [2 x i32]* null, [2 x i32]* %7, [8 x float]* null, [8 x float]* %8)
  ret void
}

declare void @HLS_CISR_spmv_accel_hw_stub(i1, float*, %struct.slot_data*, i32*, float*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
