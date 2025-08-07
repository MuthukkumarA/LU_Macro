remove_pg_strategies -all
remove_pg_patterns -all
remove_pg_regions -all
remove_pg_via_master_rules -all
remove_pg_strategy_via_rules -all
remove_routes -net_types {power ground} -ring -stripe -macro_pin_connect -lib_cell_pin_connect

connect_pg_net

#################Creating the Ring ################
                    
create_pg_ring_pattern ring_pattern -horizontal_layer M5 -horizontal_width {2} -horizontal_spacing {1.5} -vertical_layer M6 -vertical_width {2} -vertical_spacing {1.5} -corner_bridge true
set_pg_strategy core_ring -pattern {{name: ring_pattern} {nets: {VDD VSS}} {offset: {2 2}}} -core -extension {{{side:1} {direction:B } {nets:VDD} {stop:design_boundary_and_generate_pin}}\
									{{side:2} {direction:L} {nets:VSS} {stop:design_boundary_and_generate_pin}}}

compile_pg -strategies core_ring

################# Creating the Mesh_pattern to the design#####################

create_pg_mesh_pattern mesh_pattern -layers {{{horizontal_layer: M5} {width: 0.16} {pitch: 12} {spacing:interleaving} {offset:4}} \
				{{vertical_layer: M6} {width: 0.26} {pitch:12} {spacing:interleaving} {offset: 4}}} \
			 -via_rule {{intersection : all} {via_master: default}} 

set_pg_strategy M5M6_mesh -pattern {{name: mesh_pattern} {nets: VDD VSS}} -core -extension {{stop:first_target}}

compile_pg -strategies M5M6_mesh

##################lower mesh connection ##############################
#pitch25
create_pg_mesh_pattern low_mesh_pattern -layer {{vertical_layer: M2} {width: 0.096} {pitch:15} {spacing:interleaving} {offset:5} {trim:true}}\
				-via_rule {{intersection : all} {via_master: default}}

set_pg_strategy M2_low_mesh -pattern {{name:low_mesh_pattern} {nets: VDD VSS}} -core -extension {{stop:outermost_ring}}

compile_pg -strategies M2_low_mesh 

###################### Macro power connection ######################
set macros [get_cells -physical_context -filter "is_hard_macro  && !is_physical_only"] 

create_pg_macro_conn_pattern macro_connect_pattern -pin_conn_type ring_pin -pitch {4 4} -width {0.3 0.3} -layers {M5 M6} -spacing {1 1} \
					-via_rule {{intersection:all} {via_master: default}}

set_pg_strategy macro_connect -pattern {{name: macro_connect_pattern} {nets: VDD VSS}} -macros "$macros"

compile_pg -strategies macro_connect


##############################creating the ring for all the hard macro #################################3
set macros [get_cells -hierarchical -physical_context -filter "is_hard_macro  && !is_physical_only"] 


create_pg_ring_pattern P_HM_ring -horizontal_layer M5 -horizontal_width {1} -vertical_layer M6 -vertical_width {1} -corner_bridge false
set_pg_strategy S_HM_ring_top  -macros $macros  -pattern { {pattern: P_HM_ring} {nets: {VSS VDD}}  {offset: {0.3 0.3}} }

set_pg_strategy_via_rule S_ring_vias -via_rule { \
	{{{strategies: {S_HM_ring_top }} {layers: {M5}}} {existing: {strap }}{via_master: {default}}} \
	{{{strategies: {S_HM_ring_top }} {layers: {M6}}} {existing: {strap }}{via_master: {default}}} \
}

compile_pg -strategies {S_HM_ring_top} -via_rule S_ring_vias


create_pg_macro_conn_pattern macro_connect_pattern -pin_conn_type scattered_pin -layers {M5 M6} 

set_pg_strategy macro_connect -pattern {{name: macro_connect_pattern} {nets: VSS VDD}} -macros "$macros"

compile_pg -strategies macro_connect


#set_pg_strategy S_HM_ring_top  -macros $hm(top)       -pattern { {pattern: P_HM_ring} {nets: {VSS VDD}}  {offset: {0.3 0.3}} }
#set_pg_strategy S_HM_ring_risc -macros $hm(risc_core) -pattern { {pattern: P_HM_ring} {nets: {VSS VDDH}} {offset: {0.3 0.3}} }
#set_pg_strategy_via_rule S_ring_vias -via_rule { \
#	{{{strategies: {S_HM_ring_top S_HM_ring_risc}} {layers: {M5}}} {existing: {strap }}{via_master: {default}}} \
#	{{{strategies: {S_HM_ring_top S_HM_ring_risc}} {layers: {M6}}} {existing: {strap }}{via_master: {default}}} \
#}
#compile_pg -strategies {S_HM_ring_top S_HM_ring_risc} -via_rule S_ring_vias

create_pg_macro_conn_pattern P_HM_pin -pin_conn_type scattered_pin -layers {M5 M4}
set_pg_strategy S_HM_top_pins -macros $hm(top) -pattern { {pattern: P_HM_pin} {nets: {VSS VDD}} }
set_pg_strategy S_HM_risc_pins -macros $hm(risc_core) -pattern { {pattern: P_HM_pin} {nets: {VSS VDDH}} }

compile_pg -strategies {S_HM_top_pins S_HM_risc_pins}



############################ creatin the via #################### mam said this .


create_pg_macro_conn_pattern hm_pattern -pin_conn_type scattered_pin \
               -layers {M5 M6} -nets {VSS} -pin_layers {M3}

set_app_options -name plan.pgroute.treat_pad_as_macro -value true

set_pg_strategy macro_conn -macros [get_cells IO_E1VCC_0]\
               -pattern {{name: hm_pattern} {nets: {VDD VSS}}}

set_pg_strategy_via_rule macro_conn_via_rule \
              -via_rule { \
                 {{{strategies: macro_conn}}{{existing: all} {layers: M4}} \
                   {via_master: default}} \
                  {{intersection: undefined}{via_master: NIL}} \
            }

compile_pg -strategies macro_conn -via_rule macro_conn_via_rule -tag test
                        

#################Creating the Rails ########################

create_pg_std_cell_conn_pattern std_rail_conn1  -layers M1
#-rail_width 0.0325
set_pg_strategy std_rail_1 -pattern {{name : std_rail_conn1} {nets:VDD VSS}} -core \
					-blockage {{macros_with_keepout : ALU CSRF/MC LU}}

compile_pg -strategies std_rail_1

################Creating of vias between rails and PG straps ###########################
#for alu and MC i not use this below line 

create_pg_vias -nets {VDD VSS} -from_layers M1 -to_layers M6 -drc no_check

####################check any error are there####################
check_pg_drc
check_pg_missing_vias
check_pg_drc -ignore_std_cells
check_pg_connectivity -check_std_cell_pins none