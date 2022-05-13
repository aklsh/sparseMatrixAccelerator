#ifndef __ACCELERATOR_UNIT__
#define __ACCELERATOR_UNIT__

#include "constants.hpp"
#include "encoded_data.hpp"
#include "reducer.hpp"

class accelerator{
	public:
		#pragma HLS array_partition variable=multiplier_outs type=complete
		#pragma HLS array_partition variable=storage type=complete
		int multiplier_outs[K];
		int storage[N];

		reducer reducer_circuit;

		void set_storage(int*);
		void accelerate(int*, int* , int* , bool*, int, int);
};

#endif
