if { [namespace current] != {::67C040B7} } { error {This script [file tail [info script]] should not be sourced directly}; }
###################################################################

# Created by write_script -format dctcl for scenario constraints on Thu Feb 27 \
16:08:47 2025

###################################################################

# Set the current_design #
current_design msrv32_lu


set_tlu_plus_files -max_tluplus                                                \
../../../ref/tech/saed32nm_1p9m_Cmax.lv.tluplus -min_tluplus                   \
../../../ref/tech/saed32nm_1p9m_Cmin.lv.tluplus 
set_switching_activity -period 1 -toggle_rate 0.0199951 -static_probability    \
0.49823 [get_pins {lu_output_reg[0]/QN}]
set_switching_activity -period 1 -toggle_rate 0.019397 -static_probability     \
0.507935 [get_pins {lu_output_reg[1]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0195068 -static_probability    \
0.484543 [get_pins {lu_output_reg[2]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0199158 -static_probability    \
0.505814 [get_pins {lu_output_reg[3]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0194763 -static_probability    \
0.503998 [get_pins {lu_output_reg[4]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0193298 -static_probability    \
0.495544 [get_pins {lu_output_reg[5]/QN}]
set_switching_activity -period 1 -toggle_rate 0.019519 -static_probability     \
0.512238 [get_pins {lu_output_reg[6]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0193237 -static_probability    \
0.477814 [get_pins {lu_output_reg[7]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0198303 -static_probability    \
0.545364 [get_pins {lu_output_reg[8]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0201355 -static_probability    \
0.567947 [get_pins {lu_output_reg[9]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0200439 -static_probability    \
0.555664 [get_pins {lu_output_reg[10]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0201538 -static_probability    \
0.569687 [get_pins {lu_output_reg[11]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0202332 -static_probability    \
0.564957 [get_pins {lu_output_reg[12]/QN}]
set_switching_activity -period 1 -toggle_rate 0.019574 -static_probability     \
0.565887 [get_pins {lu_output_reg[13]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0199097 -static_probability    \
0.542862 [get_pins {lu_output_reg[14]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0194763 -static_probability    \
0.559616 [get_pins {lu_output_reg[15]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0185425 -static_probability    \
0.618988 [get_pins {lu_output_reg[16]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0189758 -static_probability    \
0.618347 [get_pins {lu_output_reg[17]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0191834 -static_probability    \
0.626389 [get_pins {lu_output_reg[18]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0187988 -static_probability    \
0.624268 [get_pins {lu_output_reg[19]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0192322 -static_probability    \
0.624451 [get_pins {lu_output_reg[20]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0187195 -static_probability    \
0.626938 [get_pins {lu_output_reg[21]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0188965 -static_probability    \
0.639771 [get_pins {lu_output_reg[22]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0188843 -static_probability    \
0.615891 [get_pins {lu_output_reg[23]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0187195 -static_probability    \
0.636551 [get_pins {lu_output_reg[24]/QN}]
set_switching_activity -period 1 -toggle_rate 0.018689 -static_probability     \
0.624695 [get_pins {lu_output_reg[25]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0195435 -static_probability    \
0.616104 [get_pins {lu_output_reg[26]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0190063 -static_probability    \
0.635742 [get_pins {lu_output_reg[27]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0187744 -static_probability    \
0.639618 [get_pins {lu_output_reg[28]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0187012 -static_probability    \
0.634323 [get_pins {lu_output_reg[29]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0189453 -static_probability    \
0.620926 [get_pins {lu_output_reg[30]/QN}]
set_switching_activity -period 1 -toggle_rate 0.0179016 -static_probability    \
0.624069 [get_pins {lu_output_reg[31]/QN}]
create_clock [get_ports clk_in]  -name clk  -period 5  -waveform {0 2.5}
set compile_inbound_cell_optimization false
set compile_inbound_max_cell_percentage 10.0
