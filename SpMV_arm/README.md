## SpMV on Cortex-A9

1. Implement CSR-encoding and row-wise Sparse Matrix-Vector Multiplication on the ARM Cortex-A9 Processor of the Zynq7000 SoC (Digilent Zybo Z7-20 eval board).
2. HLS Implementation of a 2:4 structured sparsity multiplier unit (WiP) 

### Implementation includes:
#### Software SpMV for any sparsity pattern:
- encoding of a Sparse Matrix in CSR format: sequential and SIMD versions; latter uses Armv7 NEON SIMD intrinsics (128-bit vector registers)
- multiplication of CSR-encoded matrix with input vectors: sequential and SIMD versions; parallelize row-wise multiply accumulate using SIMD
- testbench: compare functional correctness against standard Matrix Multiply of the sparse Matrix with input vectors
- profiling: HLS module to count clock cycles (WiP)

#### HLS Module to perform SpMV for matrices with 2:4 structured sparsity (WiP)
- software encoding of 2:4 sparse matrix into matrices holding data values and meta-data (position index: 2-bits per non-zero element)
