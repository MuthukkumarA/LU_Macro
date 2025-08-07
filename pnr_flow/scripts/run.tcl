####################### Welcome to MUTHUKKUMAR A Major Project ##########################

########################### RISC V TOP Creation ###################

####################### Regular flow from RTL to GDSII #######################

##################setup file #########################

##########################create a design library ################################
set tech ../../ref/tech/saed32nm_1p9m.tf

set refe "../../ref/CLIBs/saed32_1p9m_tech.ndm ../../ref/CLIBs/saed32_hvt.ndm  \
../../ref/CLIBs/saed32_lvt.ndm ../../ref/CLIBs/saed32_rvt.ndm  \
../../ref/CLIBs/saed32_sram_lp.ndm ../../../Macro/ALU_Macro/Library_manager/work/alu_workspace.ndm \
../../../Macro/Machine_Counter/Library_manager/work/MC_workspace.ndm \
 ../../../Macro/LU_Macro/Library_Manager/work/LU_workspace.ndm "

create_lib -technology $tech -ref_libs $refe RISC_V1.dlib

############################# RTL reading ###############################
read_verilog ../Inputs/risc.v 
#read_sdc ../Inputs/risc.sdc

######################## SDC ########################

create_clock [get_ports ms_riscv32_mp_clk_in]  -name clk  -period 5  -waveform {0 2.5}

current_design
###################### RC parasitic model ##########################
 
read_parasitic_tech -layermap ../../ref/tech/saed32nm_tf_itf_tluplus.map -tlup ../../ref/tech/saed32nm_1p9m_Cmax.lv.nxtgrd -name maxTLU
read_parasitic_tech -layermap ../../ref/tech/saed32nm_tf_itf_tluplus.map -tlup ../../ref/tech/saed32nm_1p9m_Cmin.lv.nxtgrd -name minTLU
report_lib -parasitic_tech RISC_V1.dlib

####################### Symmetry for the design ########################

get_site_defs
set_attribute [get_site_defs unit] symmetry Y
set_attribute [get_site_defs unit] is_default true

##################### Layer directions ############################

set_attribute [get_layers {M1 M3 M5 M7 M9}] routing_direction horizontal
set_attribute [get_layers {M2 M4 M6 M8}] routing_direction vertical
get_attribute [get_layers M?] routing_direction

report_ignored_layers
set_ignored_layers -max_routing_layer M6
report_ignored_layers

######################### UPF (unified power format)#############################

load_upf ../Inputs/risc.upf
commit_upf
check_mv_design

######################## MCMM (multi corner multi mode)##############################

set corner default
set_process_number 0.99 -corner default
set_temperature 125 -corner default
set_voltage 0.95 -object_list VDD -corner default
set_voltage 0 -object_list VSS -corner default

current_mode
current_corner


set_scenario_status default -active true -setup true -hold true -max_transition true -max_capacitance true -min_capacitance true -leakage_power true  \
-dynamic_power true

report_scenarios
report_parasitic_parameters
set_parasitic_parameters -corners default -early_spec minTLU -late_spec maxTLU

report_pvt

########################### Floor planining #############################
initialize_floorplan -core_utilization 0.6 -side_ratio {1 1} -core_offset {10}
#initialize_floorplan -core_utilization 0.6 -coincident_boundary false -side_ratio {1 1}
place_pins -self

########################### Power planning ##############################

source -echo ../scripts/pns.tcl

########################### Placement ################################### 

#TIE cells
get_lib_cells -filter "function_id==a0.0"
get_lib_cells -filter "function_id==Ia0.0"
set_dont_touch [get_lib_cells */TIE*] false
set_lib_cell_purpose -include optimization [get_lib_cells */TIE*]

check_netlist

#pre_placement_checks 
check_design -checks pre_placement_stage

#create_placement -floorplan 

place_opt

#step3;
compile_fusion -from initial_place -to initial_place

#step4;
compile_fusion -from initial_drc -to initial_drc

#step5;
compile_fusion -from initial_opto -to initial_opto

#step6;
compile_fusion -from final_place -to final_place

#step7;
compile_fusion -from final_opto -to final_opto

check_legality
report_qor -summary
report_power
report_constraints -all_violators
report_congestion

########################### CTS #########################

set CTS_CELLS [get_lib_cells "*/NBUFF*LVT */NBUFF*RVT */INVX*_LVT */INVX*_RVT */CGL* */LSUP* */*DFF*"]
set_dont_touch $CTS_CELLS false
set_lib_cell_purpose -exclude cts [get_lib_cells] 
set_lib_cell_purpose -include cts $CTS_CELLS

source ../scripts/clock_ndr.tcl
source ../scripts/cts_include_refs.tcl

check_design -checks pre_clock_tree_stage

clock_opt

report_timing 
report_timing -delay_type min

########################## Routing ######################

check_design -checks pre_route_stage 

source ../../ref/tech/saed32nm_ant_1p9m.tcl
report_app_options route.detail.*antenna*

route_auto

route_opt

route_eco

check_routes
report_qor
report_constraints -all_violators > ../reports/all_violators
report_congestion > ../reports/congestion
report_utilization > ../reports/utilization

######################### sign off ######################
check_lvs > ../reports/lvs_rpt

check_pg_drc
check_pg_missing_vias
check_pg_connectivity
############################output files#############
report_timing -delay_type max > ../reports/setup_timing
report_timing -delay_type min > ../reports/hold_timing

write_gds ../results/MC.gds



eco_opt

################3sample
create_keepout_margin ALU -type hard -outer {5 5 5 5}
create_keepout_margin CSRF/MC -type hard -outer {5 5 5 5}
create_keepout_margin ALU -type hard -outer {4 4 4 4} -layers M6
create_keepout_margin CSRF/MC -type hard -outer {4 4 4 4} -layers M6
#########final ####################################
create_keepout_margin CSRF/MC -type hard -outer {4 4 4 4} -layers {M1 M2 M3 M4 M5 M6 M7 M8 M9 MRDL}
create_keepout_margin ALU -type hard -outer {4 4 4 4} -layers {M1 M2 M3 M4 M5 M6 M7 M8 M9 MRDL}

###################final one given ############################
create_keepout_margin ALU -type hard -outer {3 3 3 3}
create_keepout_margin CSRF/MC -type hard -outer {3 3 3 3}

###########################final ######################
create_keepout_margin LU -type hard -outer {2 2 2 2}
create_keepout_margin CSRF/MC -type hard -outer {2 2 2 2}
create_keepout_margin ALU -type hard -outer {2 2 2 2}