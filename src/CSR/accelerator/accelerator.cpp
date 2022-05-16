#include <stdio.h>
#include "accelerator.hpp"

// Initialize storage with vector, set levels of reducer circuit
void initialise(data_t storage[N], data_t init_vector[N], bool init){
	if(init){
		set_storage_loop: for(int j=0;j<N;j++){
			#pragma HLS UNROLL
			storage[j] = init_vector[j];
		}
	}
}

// Multiplier nodes
void multipliers(data_t multiplier_outs[K], data_t storage[N], data_t subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K]){
	#pragma HLS ALLOCATION operation instances=fmul limit=25
	#pragma HLS ALLOCATION operation instances=fadd limit=25
	multipliers_loop: for(int c=0;c<K;c++){
		#pragma HLS UNROLL
		if(mult_enables[c])
			multiplier_outs[c] = subrow_vals[c]*storage[subrow_col_indices[c]];
		else
			multiplier_outs[c] = (data_t)0;
	}
}

// Adder Tree
void adders(data_t &sum, data_t multiplier_outs[K]){
	data_t x = 0;
	adder_tree: for(int p=0;p<K;p++){
		#pragma HLS EXPRESSION_BALANCE
		x+=multiplier_outs[p];
	}
	sum = x;
}

// Main compute
void accelerate(data_t &out, data_t subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K], int label, data_t init_vector[N], bool init){
	#pragma HLS TOP name=accelerate

	static data_t storage[N];
	static reducer reducer_circuit;
	static data_t multiplier_outs[K];
	static data_t sum;

	#pragma HLS PIPELINE
	initialise(storage, init_vector, init);
	multipliers(multiplier_outs, storage, subrow_vals, subrow_col_indices, mult_enables);
	printf("mult outs: ");
	for(int u=0;u<K;u++)
		printf("%f ", multiplier_outs[u]);
	printf("\n");
	adders(sum, multiplier_outs);
	printf("sum: %f\n", sum);
	reducer_circuit.reduce(out, sum, label);
}
