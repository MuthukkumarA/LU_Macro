################# ALU run file #####################

################### read the rtl file #########

read_verilog ../rtl/msrv32_lu.v
current_design

################## reading the floor plan constraints ###########
source ../constraints/floorplan_constraints.pcon
source ../constraints/constraints_file.sdc
################ svf file #############
set_svf LU.svf

############## compile ultra ###########
compile_ultra -no_autoungroup -no_boundary_optimization

##############output files ###################
write_icc2_files -output ../results/LU  -force

write -hierarchy -format ddc -output ../results/LU.ddc 
report_area > ../reports/LU_area.rpt

report_hierarchy > ../reports/LU_hie.rpt

report_design > ../reports/LU_design.rpt

report_timing -path full > ../reports/LU_timing.rpt

write -hierarchy -format verilog -output ../results/LU.v

write_sdf  ../reports/LU_sdf.sdf

write_parasitics -output ../results/LU_v_parastics_8_6
write_sdc ../results/LU.sdc 
write -format ddc -h -o ../results/LU.ddc 

