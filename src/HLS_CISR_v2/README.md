## CISR Encoding Based Runtime SPMV Accelerator Version 2
### Working
#### How is row index decoding done?-
#### What is the point of number of nonzero vals in each row?

#### Version specific design details 

#### The modules or functions of the accelerator:
1. Initialize:  This is initially called once before the start of the computation, it basically initializes various arrays and pointers/ids to arrays:
a) slot\_res\_arr - For each slot it has to have a register to store accumulated values
b) row\_len\_slot\_arr - Each slot needs to have its row\_len\_arr data - ie, number of non-zero values in different rows that the slot is mapped to do. There are various pointers to this that are also initialized like- slot\_counter and slot\_row\_len\_id, etc. which are concerned with decoding/storing the row\_len\_arr data to different slots.
c) slot\_row\_counter- Each slot needs to be aware of how many non-zero values left to 'MAC' and this counter is used in that regard.
d) slot\_row\_id- Each slot works on a current row and needs to know its current row\_id.

2. Store\_row\_len\_arr:  As the name suggests, this module is responsible to push the different 'row\_len\_arr' data - ie, the number of non-zero values in different rows mapped to a slot into an array for every slot('row\_len\_slot\_arr'). This is done until we exhaust total number of rows in original matrix.

3.  CISR\_decoder: This is responsible to perform row\_id decoding whenever a slot is mapped to a new row (ie, when its done with its old row). It essentially goes through all the slots sequentially, checks if the slot is done with its particular row or not, if it is done then a new row can be taken up for it. So, now it looks into 'row\_len\_slot\_arr' and says to the slot it has to work on these many non-zero values for this new row and also gives that slot its new row\_id. We have already seen how it gives the new row\_id - essentially using a 'max\_row\_id' variable which acts like a global variable to see the latest row being worked on currently. This whole process is done for every slot.

4. Compute: This is the most basic module. It is simply concerned with doing the appropriate fp multiply and accumulate for the matrix value and the right input vector value looking at the col\_id and row\_id (decoded) and stores into a slot\_res\_arr (for different slots). After this, the  slot\_row\_counter is decremented to signify it has done 1 MAC operation.

5. Output\_write: This module simply deals with writing the slot\_res\_arr into the output\_vec regularly with every iteration. After all iterations output\_vec will have the right result values for the SPMV.
 

## Design Solutions
Given below is a summary table of different solutions explored with the same code, by varying - the number of "HLS unroll" pragmas in different modules, the maximum Tclk allowed, number of slots.
| Solution no. |              |     |      |      |                                                                                                              |           |                  |                |
|--------------|--------------|-----|------|------|--------------------------------------------------------------------------------------------------------------|-----------|------------------|----------------|
|              | Latency (ns) | DSP | FF   | LUT  | Description ( Initialize module- no unroll)                                                                  | Num slots | Target Tclk (ns) | Verified cosim |
| 1            | 310          | 5   | 1323 | 2010 | Store row_len_arr,compute,output_write- unroll and CISR decode- pipeline                                     | 4         | 10               | yes            |
| 2            | 330          | 5   | 1330 | 1889 | Only compute and output_write have unroll pragmas(Store row_len_arr, CISR decode is pipelined automatically) | 4         | 10               | yes            |
| 6            | 290          | 5   | 1713 | 2355 | Store row_len_arr,compute,output_write  and CISR decode-- unroll                                             | 4         | 10               | yes            |
| 4            | 270          | 5   | 936  | 1627 | Only compute and output_write have unroll pragmas(Store row_len_arr, CISR decode is pipelined automatically) | 2         | 10               | yes            |
| 5            | 230          | 5   | 1125 | 1634 | Store row_len_arr,compute,output_write  and CISR decode-- unroll                                             | 2         | 10               | yes            |
Note- DSP slices in all cases are- 5 = ( 2 fadd 3 fmul)
Latency provided here is the max latency of the hardware upon one function call/ transaction in an iteration from testbench or host.
Solutions 3,4,5 and 1,2, 6 are separately pareto optimal wrt Latency vs FF usage vs LUT usage
# Design Descriptions and Pareto-optimality
We vary the presence or absence of pragmas like- HLS unroll and HLS PIPELINE in the four main functions/modules and see how our solution's performance and resource usage estimates vary. 
Note- It is observed that a loop / function with no pragma is automatically pipelined with some initiation interval.
### Num_slots 4
### Num_slots 2

