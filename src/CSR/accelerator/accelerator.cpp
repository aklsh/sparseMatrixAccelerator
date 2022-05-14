#include <stdio.h>
#include "accelerator.hpp"

// Initialize storage with vector, set levels of reducer circuit
void initialise(int init_vector[N], bool init){
	#pragma HLS array_partition variable=init_vector type=complete
	#pragma HLS array_partition variable=storage type=complete

	if(init){
		set_storage_loop: for(int j=0;j<N;j++){
			#pragma HLS UNROLL
			storage[j] = init_vector[j];
		}
		set_levels_loop: for(int i=0;i<NUM_REDUCER_LEVELS;i++){
			#pragma HLS UNROLL
			reducer_circuit.adder_levels[i].curr_level = i;
		}
	}
}

// Multiplier nodes
void multipliers(int subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K]){
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
void adders(){
	#pragma HLS EXPRESSION_BALANCE
	#pragma HLS array_partition variable=multiplier_outs type=complete

	int x = 0;
	adder_tree: for(int p=0;p<K;p++){
		#pragma HLS PIPELINE
		x+=multiplier_outs[p];
	}
	sum = x;
}

// Main compute
void accelerate(int &out, int subrow_vals[K], int subrow_col_indices[K], bool mult_enables[K], int label){
	#pragma HLS array_partition variable=subrow_vals type=complete
	#pragma HLS array_partition variable=subrow_col_indices type=complete

	#pragma HLS PIPELINE
	multipliers(subrow_vals, subrow_col_indices, mult_enables);
	printf("mult outs: ");
	for(int u=0;u<K;u++)
		printf("%d ", multiplier_outs[u]);
	printf("\n");
	adders();
	printf("sum: %d\n", sum);
	reducer_circuit.reduce(out, sum, label);

}
