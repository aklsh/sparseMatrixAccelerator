#include "accelerator.hpp"

void accelerator::set_storage(int *init_vector){
	*storage = *init_vector;
}

void accelerator::accelerate(int* out, int* subrow_vals, int* subrow_col_indices, bool* mult_enables, int curr_num_subrows, int curr_subrow){
	#pragma HLS DATAFLOW

	int sum = 0;
	reducer_data *reducer_in;

	#pragma HLS UNROLL
	multipliers: for(int i=0;i<K;i++){
		if(mult_enables[i])
			#pragma HLS PIPELINE
			multiplier_outs[i] = subrow_vals[i]*storage[subrow_col_indices[i]];
		else
			multiplier_outs[i] = 0;
	}

	#pragma HLS EXPRESSION_BALANCE
	adder_tree: for(int p=0;p<K;p++)
		sum+=multiplier_outs[p];

	reducer_in->value = sum;
	reducer_in->label = curr_num_subrows-curr_subrow;
	reducer_circuit.reduce(out, reducer_in);
}
