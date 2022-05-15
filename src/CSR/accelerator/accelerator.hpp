#ifndef __ACCELERATOR_UNIT__
#define __ACCELERATOR_UNIT__

#include "stdbool.h"

#include "constants.hpp"
#include "../encoded_data.hpp"
#include "reducer.hpp"

//static int storage[N];
//static reducer reducer_circuit;
//static int multiplier_outs[K];
//static int sum;


void initialise(data_t[N], data_t[N], bool);
void multipliers(data_t[K], data_t[N], data_t[K], int[K], bool[K]);
void adders(data_t&, data_t[K]);
void accelerate(data_t&, data_t[K], int[K], bool[K], int, data_t[N], bool);


#endif
