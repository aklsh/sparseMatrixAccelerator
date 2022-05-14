#ifndef __ACCELERATOR_UNIT__
#define __ACCELERATOR_UNIT__

#include "stdbool.h"

#include "constants.hpp"
#include "../encoded_data.hpp"
#include "reducer.hpp"

static int storage[N];
static reducer reducer_circuit;
static int multiplier_outs[K];
static int sum;


void initialise(int[N], bool);
void set_storage(int[N], int[N], bool);
void multipliers(int[K], int[N], int[K], int[K], bool[K]);
void adders(int&, int[K]);
void accelerate(int&, int[K], int[K], bool[K], int, int[N], bool);


#endif
