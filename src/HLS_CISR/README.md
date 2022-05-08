## CISR Encoding Based Runtime SPMV Accelerator Version 1
### Working
The basic outline of version 1 of the CISR encoding based runtime spmv accelerator is given as follows:
There are 'num\_slots number of compute units- made of basically a floating point multiplier and fp adder. Each slot is concerned with doing the computation on separate rows fully before moving on. As mentioned in the README of CISR based encoding, the whole logic behind CISR encoding is to make the scheduling easier. The sparse matrix data is organized in conseucitve sets of 'num\_slots' non-zero values and these are the first non-zero values for every row corresponding to different slots. So, the final idea is to push 'num\_slots' number of values to 'num\_slots' compute units so that they can easily do the computation in parallel without worrying about conflicts. Then, the next set of non-zero values for every row and different slots is pushed and so on. What we have also seen is that for each of these values pushed, it comes along with it's corresponding 'col\_index' in the matrix. So, we only have to worry about the row index decoding now. 
#### How is row index decoding done?-
We first need to know about Row length array- As we already know from the basic working, all slots will get different rows until they exhaust all rows in the matrix. So, this means every slot is concerned with a certain number of non-zero values in its mapped row. This data is also stored in the CISR encoded data for the input matrix- in the form of row length array and it's size is essentially = total number of rows in the matrix. The important thing here is that whenever a new row is mapped to a slot, a 'max\_row\_id' variable is incremented to signify the latest row id currently being worked on, and ofcourse the slot will capture the old 'max\_row\_id' - which is the row id of the new row mapped to it. This way the row id can be decoded for a slot. 
#### What is the point of number of nonzero vals in each row?
As we already know each slot will be working on its mapped row. It obviously needs to know how long it needs to be doing this- and this is essentially for 'num\_non\_zero' number of values in that row.

#### Version specific design details 
An important point to note is that this architecture has the compute units accepting 'num\_slots' number of values once, computing them and giving the result. Similarly each slot will take in it's 'row\_len\_arr' data which is number of nonzero values to the row it is or will be mapped to. All this is just one iteration ( for 'num\_slots' number of values to be pushed), and the host/ testbench will repeatedly call this accelerator function many times to finish the full computation

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
| Solution no. |              |     |      |      |                                                                   |           |                  |                |
|--------------|--------------|-----|------|------|-------------------------------------------------------------------|-----------|------------------|----------------|
|              | Latency (ns) | DSP | FF   | LUT  | Description ( Initialize module- no unroll)                       | Num slots | Target Tclk (ns) | Verified cosim |
| 1            | 290          | 5   | 1713 | 2355 | All funcs hls unroll                                              | 4         | 10               | yes            |
| 2            | 340          | 5   | 1367 | 1907 | Only compute and output\_write have unroll                         | 4         | 10               |                |
| 6            | 360          | 5   | 1290 | 2010 | Compute, output\_write and store\_row\_len array modules have unroll | 4         | 12               | yes            |
| 3            | 230          | 5   | 1125 | 1634 | All funcs hls unroll                                              | 2         | 10               |                |
| 4            | 270          | 5   | 936  | 1627 | Only compute and output\_write have unroll                         | 2         | 10               |                |
| 5            | 288          | 5   | 898  | 1608 | Compute, output\_write and store\_row\_len array modules have unroll | 2         | 12               | yes            |
Note- DSP slices in all cases are- 5 = ( 2 fadd 3 fmul)
Solutions 3,4,5 and 1,2, 6 are separately pareto optimal wrt Latency vs FF usage vs LUT usage
# Design Descriptions and Pareto-optimality
1. 
2. 
3.
4.
5.
6.

