#include "mult_node.hpp"

int mult_node::multiply(int value, int col_index){
	return storage[col_index] * value;
}
