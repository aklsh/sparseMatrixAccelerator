int counter(){
	/*
	 * Perf counter to count number of clk cycles elapsed between two functions
	 * 		- AXILITE interface auto-generates C drivers to initialize and read the counter
	 */
#pragma HLS INTERFACE s_axilite port=return
	static int ctr = 0;
	ctr = ctr + 1;
	return ctr;
}
