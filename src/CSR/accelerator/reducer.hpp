#ifndef __REDUCER_UNIT__
#define __REDUCER_UNIT__

#include "constants.hpp"
#include "../encoded_data.hpp"

class reducer_data{
	public:
		data_t value;
		int label;
		reducer_data(data_t=0, int=0);
};

class reducer_level{
	public:
		reducer_data buffer[2];
		int num_items;
		bool valid;
		void add(reducer_data&, int);
		void insert(reducer_data);
};

class reducer{
	public:
		reducer_level adder_levels[NUM_REDUCER_LEVELS];
		bool valid;
		void reduce(data_t&, data_t, int);
};

#endif
