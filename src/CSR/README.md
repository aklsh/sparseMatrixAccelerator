# Sparse Matrix-Vector Computation Accelerator in Vitis HLS

The code in the folder corresponds to an adaptation of the basic architecture presented in [1].

## Directory Structure
```terminal
.
├── accelerator           # all accelerator design files
│   ├── accelerator.cpp   # top-level module
│   ├── accelerator.hpp
│   ├── constants.hpp
│   ├── reducer.cpp       # reducer circuit module
│   └── reducer.hpp
├── encoded_data.hpp      # CSR encoded data and other related parameters
├── encoder.cpp           # main encoder function
├── encoding              # encoder related functions
│   └── csr.h
├── main.cpp              # accelerator test-bench/CPU code
└── matrices              # matrices dataset
    └── matrix.hpp
```

## References
[1] Ling Zhuo and Viktor K. Prasanna. 2005. Sparse Matrix-Vector multiplication on FPGAs. In <i>Proceedings of the 2005 ACM/SIGDA 13th international symposium on Field-programmable gate arrays</i> (<i>FPGA '05</i>). Association for Computing Machinery, New York, NY, USA, 63–74. https://doi.org/10.1145/1046192.1046202
