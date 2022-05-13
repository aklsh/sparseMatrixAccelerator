#include "accelerator.hpp"

// Initialize storage with vector
void set_storage(int storage[N], int init_vector[N], bool init){
	#pragma HLS array_partition variable=init_vector type=complete
	#pragma HLS array_partition variable=storage type=complete

	if(init)
		set_storage_loop: for(int i=0;i<N;i++){
			#pragma HLS UNROLL
			storage[i] = init_vector[i];
		}
}

// Multiplier nodes
void multipliers(int multiplier_outs[K], int storage[N], int *subrow_vals, int *subrow_col_indices, bool *mult_enables){
	#pragma HLS array_partition variable=multiplier_outs type=complete
	#pragma HLS array_partition variable=storage type=complete

	multipliers_loop: for(int i=0;i<K;i++){
		#pragma HLS UNROLL
		if(mult_enables[i]){
			multiplier_outs[i] = subrow_vals[i]*storage[subrow_col_indices[i]];
		}
		else
			multiplier_outs[i] = 0;
	}
}

// Adder Tree
void adders(int &sum, int multiplier_outs[K]){
	#pragma HLS EXPRESSION_BALANCE
	#pragma HLS array_partition variable=multiplier_outs type=complete

	adder_tree: for(int p=0;p<K;p++){
		#pragma HLS PIPELINE
		sum+=multiplier_outs[p];
	}
}

// Main compute
void accelerate(int &out, int *subrow_vals, int *subrow_col_indices, bool mult_enables[K], int label, bool init_vector, int vector[N]){
	static int multiplier_outs[K];
	static int storage[N];
	static int sum;

	static reducer reducer_circuit;

	#pragma HLS PIPELINE
	set_storage(storage, vector, init_vector);
	multipliers(multiplier_outs, storage, subrow_vals, subrow_col_indices, mult_enables);
	adders(sum, multiplier_outs);
	reducer_circuit.reduce(out, sum, label);
}
