#include <stdio.h>
#include "accelerator.hpp"

// Initialize storage with vector, set levels of reducer circuit
void initialise(int storage[N], int init_vector[N], bool init){
	if(init){
		set_storage_loop: for(int j=0;j<N;j++){
			#pragma HLS UNROLL
			storage[j] = init_vector[j];
		}
	}
}

// Multiplier nodes
void multipliers(int multiplier_outs[K], int storage[N], int subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K]){
	multipliers_loop: for(int c=0;c<K;c++){
		#pragma HLS UNROLL
		if(mult_enables[c])
			multiplier_outs[c] = subrow_vals[c]*storage[subrow_col_indices[c]];
		else
			multiplier_outs[c] = 0;
	}
}

// Adder Tree
void adders(int &sum, int multiplier_outs[K]){
	#pragma HLS EXPRESSION_BALANCE
	int x = 0;
	adder_tree: for(int p=0;p<K;p++){
		x+=multiplier_outs[p];
	}
	sum = x;
}

// Main compute
void accelerate(int &out, int subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K], int label, int init_vector[N], bool init){
	#pragma HLS TOP name=accelerate

	static int storage[N];
	static reducer reducer_circuit;
	static int multiplier_outs[K];
	static int sum;

	#pragma HLS PIPELINE
	initialise(storage, init_vector, init);
	multipliers(multiplier_outs, storage, subrow_vals, subrow_col_indices, mult_enables);
	printf("mult outs: ");
	for(int u=0;u<K;u++)
		printf("%d ", multiplier_outs[u]);
	printf("\n");
	adders(sum, multiplier_outs);
	printf("sum: %d\n", sum);
	reducer_circuit.reduce(out, sum, label);
}
