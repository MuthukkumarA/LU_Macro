###################### Setup file for the MC Block ###################

#####################Technology file #######################
set technology_file "../../../ref/tech/saed32nm_1p9m.tf"

#################### synthetic .slib ####################
set synthetic_file dw_foundation.sldb

####################Referance file #######################
set referance_file "../../../../router_pnr_flow/synthysis_DC/libs/mw_libs/saed32_io_fc \
			../../../../router_pnr_flow/synthysis_DC/libs/mw_libs/saed32nm_lvt_1p9m "

#################### create a milky way library ################
set mw_lib LU_lib.mw

##################### Creating the lib###################
create_mw_lib $mw_lib -technology $technology_file -mw_reference_library $referance_file -open

###################### target_library ###############

set target_library { ../../../ref/DBs/saed32lvt_ss0p95v125c.db \
		../../../ref/DBs/saed32hvt_ss0p75v125c.db \
		../../../ref/DBs/saed32rvt_ss0p95v125c.db \
		../../../ref/DBs/saed32sramlp_ss0p95v125c_i0p95v.db }

##################### link library ###############

set link_library { ../../../ref/DBs/saed32lvt_ss0p95v125c.db \
                ../../../ref/DBs/saed32hvt_ss0p75v125c.db \
                ../../../ref/DBs/saed32rvt_ss0p95v125c.db \
                ../../../ref/DBs/saed32sramlp_ss0p95v125c_i0p95v.db }

###################### referance library ##############

set referance_library { ../../../ref/DBs/saed32lvt_ss0p95v125c.db \
                ../../../ref/DBs/saed32hvt_ss0p75v125c.db \
                ../../../ref/DBs/saed32rvt_ss0p95v125c.db \
                ../../../ref/DBs/saed32sramlp_ss0p95v125c_i0p95v.db }


###################### parasitic files #####################

set_tlu_plus_files\
   		-max_tluplus ../../../ref/tech/saed32nm_1p9m_Cmax.lv.tluplus \
     		-min_tluplus ../../../ref/tech/saed32nm_1p9m_Cmin.lv.tluplus