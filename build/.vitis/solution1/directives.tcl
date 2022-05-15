############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_partition -type complete -dim 1 "initialise" init_vector
set_directive_array_partition -type complete -dim 1 "initialise" storage
set_directive_array_partition -type complete -dim 1 "multipliers" multiplier_outs
set_directive_array_partition -type complete -dim 1 "multipliers" mult_enables
set_directive_array_partition -type complete -dim 1 "multipliers" subrow_vals
set_directive_array_partition -type complete -dim 1 "multipliers" subrow_col_indices
set_directive_array_partition -type complete -dim 1 "multipliers" storage
set_directive_array_partition -type complete -dim 1 "adders" multiplier_outs
set_directive_array_partition -type complete -dim 1 "accelerate" subrow_vals
set_directive_array_partition -type complete -dim 1 "accelerate" subrow_col_indices
set_directive_top -name accelerate "accelerate"
