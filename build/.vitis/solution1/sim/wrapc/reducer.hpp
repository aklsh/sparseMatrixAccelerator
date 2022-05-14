#ifndef __REDUCER_UNIT__
#define __REDUCER_UNIT__

#include "constants.hpp"
#include "../encoded_data.hpp"

class reducer_data{
	public:
		int value;
		int label;
		reducer_data(int=0, int=0);
};

class reducer_level{
	public:
		int curr_level;
		reducer_data buffer[2];
		int num_items;
		bool valid;
		void add(reducer_data&);
		void insert(reducer_data);
};

class reducer{
	public:
		reducer_level adder_levels[NUM_REDUCER_LEVELS];
		bool valid;
		void reduce(int&, int, int);
		void set_levels();
};

#endif
