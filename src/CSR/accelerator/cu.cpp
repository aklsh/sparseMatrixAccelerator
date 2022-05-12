#include "cu.hpp"

int cu::increment_i2(bool write_output){
	if(write_output)
		i2 = i2 + 1;
	else
		i2 = i2;
}
