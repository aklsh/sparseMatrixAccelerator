#include "accelerator.hpp"

// Initialize storage with vector
void accelerator::set_storage(int *init_vector){
	*storage = *init_vector;
}

// Multiplier nodes
void accelerator::multipliers(int *subrow_vals, int *subrow_col_indices, bool *mult_enables){
	#pragma HLS array_partition variable=multiplier_outs type=complete
	#pragma HLS array_partition variable=storage type=complete

	multipliers: for(int i=0;i<K;i++){
		#pragma HLS UNROLL
		if(mult_enables[i]){
			multiplier_outs[i] = subrow_vals[i]*storage[subrow_col_indices[i]];
		}
		else
			multiplier_outs[i] = 0;
	}
}

// Adder Tree
void accelerator::adders(int *sum){
	#pragma HLS EXPRESSION_BALANCE
	#pragma HLS PIPELINE
	adder_tree: for(int p=0;p<K;p++)
		*sum+=multiplier_outs[p];
}

// Main compute
void accelerate(int &out, int *subrow_vals, int *subrow_col_indices, bool *mult_enables, int label){
	accelerator *accel;

	int sum = 0;

	accel->multipliers(subrow_vals, subrow_col_indices, mult_enables);
	accel->adders(&sum);
	out = accel->reducer_circuit.reduce(sum, label);
}
