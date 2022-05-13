#ifndef __ACCELERATOR_UNIT__
#define __ACCELERATOR_UNIT__

#include "constants.hpp"
#include "../encoded_data.hpp"
#include "reducer.hpp"

class accelerator{
	public:
		int multiplier_outs[K];
		int storage[N];

		reducer reducer_circuit;

		void set_storage(int*);
		void multipliers(int*, int*, bool*);
		void adders(int*);
};

#endif
