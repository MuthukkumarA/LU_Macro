set _DCG_ICC2_DIR_ [file dirname [file normalize [info script]]]



##################################################################
# Read Design
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/msrv32_lu.v]} {
read_verilog ${_DCG_ICC2_DIR_}/msrv32_lu.v -top msrv32_lu
}



##################################################################
# Read settings
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/msrv32_lu.settings.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/msrv32_lu.settings.tcl 
}



##################################################################
# Read SDC
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/msrv32_lu.MCMM/top.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/msrv32_lu.MCMM/top.tcl 
}



##################################################################
# Read Floorplan
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/msrv32_lu.floorplan/floorplan.tcl]} {
source -continue_on_error ${_DCG_ICC2_DIR_}/msrv32_lu.floorplan/floorplan.tcl 
}



##################################################################
# Read scan DEF
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/msrv32_lu.scan.def]} {
read_def ${_DCG_ICC2_DIR_}/msrv32_lu.scan.def 
}



##################################################################
# Read cell expansion data
##################################################################
if {[file exists ${_DCG_ICC2_DIR_}/msrv32_lu.cell.exp]} {
read_cell_expansion -input ${_DCG_ICC2_DIR_}/msrv32_lu.cell.exp 
}



