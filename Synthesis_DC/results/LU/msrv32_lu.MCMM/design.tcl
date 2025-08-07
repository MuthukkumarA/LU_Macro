if { [namespace current] != {::67C040B7} } { error {This script [file tail [info script]] should not be sourced directly}; }
###################################################################

# Created by write_script -format dctcl for global constraints on Thu Feb 27   \
16:08:47 2025

###################################################################

# Set the current_design #
current_design msrv32_lu

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_local_link_library                                                         \
{../../../ref/DBs/saed32lvt_ss0p95v125c.db,../../../ref/DBs/saed32hvt_ss0p75v125c.db,../../../ref/DBs/saed32rvt_ss0p95v125c.db,../../../ref/DBs/saed32sramlp_ss0p95v125c_i0p95v.db}
set_register_merging [current_design] 17
set_multibit_options -mode non_timing_driven
set_register_merging [get_cells {lu_output_reg[0]}] 17
set_register_merging [get_cells {lu_output_reg[1]}] 17
set_register_merging [get_cells {lu_output_reg[2]}] 17
set_register_merging [get_cells {lu_output_reg[3]}] 17
set_register_merging [get_cells {lu_output_reg[4]}] 17
set_register_merging [get_cells {lu_output_reg[5]}] 17
set_register_merging [get_cells {lu_output_reg[6]}] 17
set_register_merging [get_cells {lu_output_reg[7]}] 17
set_register_merging [get_cells {lu_output_reg[8]}] 17
set_register_merging [get_cells {lu_output_reg[9]}] 17
set_register_merging [get_cells {lu_output_reg[10]}] 17
set_register_merging [get_cells {lu_output_reg[11]}] 17
set_register_merging [get_cells {lu_output_reg[12]}] 17
set_register_merging [get_cells {lu_output_reg[13]}] 17
set_register_merging [get_cells {lu_output_reg[14]}] 17
set_register_merging [get_cells {lu_output_reg[15]}] 17
set_register_merging [get_cells {lu_output_reg[16]}] 17
set_register_merging [get_cells {lu_output_reg[17]}] 17
set_register_merging [get_cells {lu_output_reg[18]}] 17
set_register_merging [get_cells {lu_output_reg[19]}] 17
set_register_merging [get_cells {lu_output_reg[20]}] 17
set_register_merging [get_cells {lu_output_reg[21]}] 17
set_register_merging [get_cells {lu_output_reg[22]}] 17
set_register_merging [get_cells {lu_output_reg[23]}] 17
set_register_merging [get_cells {lu_output_reg[24]}] 17
set_register_merging [get_cells {lu_output_reg[25]}] 17
set_register_merging [get_cells {lu_output_reg[26]}] 17
set_register_merging [get_cells {lu_output_reg[27]}] 17
set_register_merging [get_cells {lu_output_reg[28]}] 17
set_register_merging [get_cells {lu_output_reg[29]}] 17
set_register_merging [get_cells {lu_output_reg[30]}] 17
set_register_merging [get_cells {lu_output_reg[31]}] 17
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0
