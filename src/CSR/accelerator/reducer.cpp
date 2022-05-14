#include "reducer.hpp"

// Reducer circuit data structure - (value, label)
reducer_data::reducer_data(int value_init, int label_init){
	value = value_init;
	label = label_init;
}

// Add values present in the buffer and update label to be max(label1, label2)
void reducer_level::add(reducer_data &out, int curr_level){
	if(num_items == 2){
		num_items = 0;
		valid = true;
		out.value = buffer[0].value + buffer[1].value;
		out.label = buffer[0].label;
	}
	else if(num_items == 1){
		if(buffer[0].label < (1<<curr_level) + 1){
			num_items = 0;
			valid = true;
			out.value = buffer[0].value;
			out.label = buffer[0].label;
		}
	}
	else if (num_items == 0){
		valid = false;
		out.value = 0;
		out.label = 0;
	}
}

// Insert new value into buffer
void reducer_level::insert(reducer_data new_data){
	buffer[num_items] = new_data;
	num_items++;
}

// Reducer circuit - takes a new sum
void reducer::reduce(int &out, int value, int label){
	reducer_data out_data, level_out, new_data;
	new_data.label = label;
	new_data.value = value;

	adder_levels[0].insert(new_data);
	reducer_loop: for(int b=1;b<NUM_REDUCER_LEVELS;b++){
		#pragma HLS UNROLL
		adder_levels[b-1].add(level_out, b-1);
		if(adder_levels[b-1].valid)
			adder_levels[b].insert(level_out);
	}

	adder_levels[NUM_REDUCER_LEVELS-1].add(out_data, NUM_REDUCER_LEVELS-1);
	if(adder_levels[NUM_REDUCER_LEVELS-1].valid)
		out = out_data.value;
}
