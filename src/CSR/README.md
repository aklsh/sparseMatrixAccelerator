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

## Design
![Accelerator Design](/doc/design.png)

## High-level overview of the algorithm
This is a design that use both CPU and FPGA to perform sparse matrix-vector multiplication. The CPU pushes the data, i.e., the non-zero element and it's column index onto the FPGA design for every row, in order. This is because this is the simplest schedule, as well as the most efficient in terms of storage overhead to store intermediates, of which there is none in this case. This shall be explained in subsequent paragraphs.

Initially, before the start of the actual computation, the vector is pushed into the FPGA, in order to not fetch each entry from memory later on during computation. This also helps us to adapt the design to a streaming input situation, where we need to perform some matrix multiplication with an incoming vector. After the computation for the current vector is complete, we can just initialize the storage in the FPGA with the new vector, and we can proceed.

The multiplier nodes multiply the non-zero element and the correspond entry from the stored vector, using the column index to index into the storage. These outputs are the passed on to the adder tree, which computes the sum of these partial products.

Normally, the computation of the output element stops here. But, usually the matrix A (NxN) is very large, with N being in the order of 1000s or more, with each sparse row having about 10%-20% non-zero elements . This requires us to have as many multipliers as the _maximum number of non-zero_ elements in a single row in the array, which requires us to know about the sparsity structure of the matrix beforehand.

To combat this, we process at most K elements in each iteration, dividing each row into subrows of K elements (except for one, which may contain less than K elements) - while this has the downside of increasing the number of cycles for the computation of a single output, it is more easily scalable. Since a row might have multiple subrows, we need to have some circuitry that allows us to add the partial sums from these subrows. This is done by the reducer circuit in the diagram.

The reducer circuit scales logarithmically with N (⌈log2(N/K)⌉), but the neat part is that, we _don't need to have exactly ⌈log2(N/K)⌉ adders_. Given a rough range on the size of the input matrix(-ces) we want to target, we can have more adders than necessary. This doesn't affect throughput, and only adds an initial delay to the pipeline.

The reducer circuit greatly reduces the amount of hardware required - without this, we need to have separate "trees", which compute each of the subrows in parallel, and another adder tree to add these partial sums from the trees as shown below [1].

![Alternate to reducer circuit](https://user-images.githubusercontent.com/45280368/168476220-a9a93a71-5dfe-4e10-8a56-51287590dccb.png)

Another reason to further show the need for a subrow-style processing design is due to the limited number of I/O pins in the FPGA. If we are to not have a subrow-style design, then we need to have an I/O pin for each non-zero element in the row, which in the worst case might be equal to N !! This might actually not be possible for very large NxN matrices, even with N in the order of 100s.

Using HLS pragmas, we can pipeline this design and also have II=1, which will allow us to send one subrow every clock cycle*. Hence, the number of clock cycle required for the computation of the product of the full matrix will be ⌈N/K⌉\*N (number of subrows/row * number of rows).

## Solutions & Pareto-optimality
### Integer
### Floating-point

## Usage
### Changing between integer/floating-point design
- Use `data_t` in `accelerator/constants.hpp` to use integer values or floating point.

## Areas to improve/future work
- While the optimal integer design (solution1) has an II=1, the corresponding floating point design has an II=6, due to the reducer circuit. This needs to be improved with better architectures for the reduction circuit, that allows us to use the pipelined nature of the FP adder more efficiently without stalls.
- The design can also be extended with support for block multiplication, where the large NxN matrix is broken down into smaller matrices, which are then used to perform the multiplication with the existing design. This is not a simple extension, as care needs to be taken to identify efficient blocking lengths in order to identify more no. of zero matrices, which will be helpful to minimise the number of actual matrices to do the computation with. Another thing to keep in mind is that 2 or more sub-matrices might contribute to the same output element, and hence some sort of "reducer circuit"-like hardware is needed to aggregate these sums.

## References
[1] Ling Zhuo and Viktor K. Prasanna. 2005. Sparse Matrix-Vector multiplication on FPGAs. In <i>Proceedings of the 2005 ACM/SIGDA 13th international symposium on Field-programmable gate arrays</i> (<i>FPGA '05</i>). Association for Computing Machinery, New York, NY, USA, 63–74. https://doi.org/10.1145/1046192.1046202
