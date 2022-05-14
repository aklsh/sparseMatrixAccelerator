#include "accelerator.hpp"
#include <stdio.h>

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
void multipliers(int multiplier_outs[K], int storage[N], int subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K]){
	#pragma HLS array_partition variable=multiplier_outs type=complete
	#pragma HLS array_partition variable=mult_enables type=complete
	#pragma HLS array_partition variable=subrow_vals type=complete
	#pragma HLS array_partition variable=subrow_col_indices type=complete
	#pragma HLS array_partition variable=storage type=complete

	multipliers_loop: for(int c=0;c<K;c++){
		#pragma HLS UNROLL
		if(mult_enables[c]){
			multiplier_outs[c] = subrow_vals[c]*storage[subrow_col_indices[c]];
		}
		else
			multiplier_outs[c] = 0;
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
void accelerate(int &out, int subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K], int label, int init_vector[N], bool init){
	#pragma HLS array_partition variable=subrow_vals type=complete
	#pragma HLS array_partition variable=subrow_col_indices type=complete

	static int multiplier_outs[K];
	static int storage[N];
	static int sum;

	static reducer reducer_circuit;

	#pragma HLS PIPELINE
	if(init){
		set_storage(storage, init_vector, init);
		printf("storage array: ");
		for(int u=0;u<N;u++)
			printf("%d ", storage[u]);
		printf("\n");
		reducer_circuit.set_levels();
	}
	else{
		multipliers(multiplier_outs, storage, subrow_vals, subrow_col_indices, mult_enables);
		printf("mult outs: ");
		for(int u=0;u<K;u++)
			printf("%d ", multiplier_outs[u]);
		printf("\n");
		adders(sum, multiplier_outs);
		reducer_circuit.reduce(out, sum, label);
	}
}
