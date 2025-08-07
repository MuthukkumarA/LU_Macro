#################L M Shell ##########

create_workspace -tech ../../../ref/tech/saed32nm_1p9m.tf -flow normal LU_workspace

read_gds ../Inputs/LU.gds

set_attribute [get_lib_cells msrv32_lu] design_type macro

check_workspace 

commit_workspace -output LU_workspace.ndm

####see open and see 
open_lib LU_workspace.ndm

open_block msrv32_lu.frame