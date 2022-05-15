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
