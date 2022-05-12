#include "reducer.hpp"

reducer_data::reducer_data(int value_init, int label_init){
	value = value_init;
	label = label_init;
}

reducer_level::add(){
	if(num_items == 2){
		num_items = 0;
		valid = true;
		return reducer_data(buffer[0].value + buffer[1].value, buffer[0].label);
	}
	else if(num_items == 1){
		if(buffer[0].label < (1<<curr_level) + 1){
			num_items = 0;
			valid = true;
			return buffer[0];
		}
	}
	else if (num_items == 0){
		valid = false;
		return reducer_data(0, 0);
	}
}

reducer_level::insert(reducer_data new_data){
	buffer[num_items] = new_data;
	num_items += 1;
}

reducer::reduce(reducer_data new_data){
	levels[0].insert(new_data);
	for(int i=1;i<=NUM_REDUCER_LEVELS;i++){
		level_out = levels[i-1].add();
		if(levels[i-1].valid)
			levels[i].insert(level_out);
	}
	out = levels[NUM_REDUCERS_LEVELS-1].add();
	if(levels[NUM_REDUCERS_LEVELS-1].valid == true)
		return out.value;
}
