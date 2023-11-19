
set verilogout_no_tri "true"
set library_path "/nas/pdk/asap7/asap7-master/asap7sc7p5t_27/LIB/NLDM/"
lappend search_path $library_path

set target_library [list \
"asap7sc7p5t_AO_LVT_TT_nldm_201020.db" \
"asap7sc7p5t_INVBUF_LVT_TT_nldm_201020.db" \
"asap7sc7p5t_OA_LVT_TT_nldm_201020.db" \
"asap7sc7p5t_SIMPLE_LVT_TT_nldm_201020.db" \
"asap7sc7p5t_SEQ_LVT_TT_nldm_201020_mod.db" \
]
set synthetic_library "dw_foundation.sldb"
set link_library [list  $target_library $synthetic_library]

set hdlin_unsigned_integers "false"

read_file -format sverilog ../rtl/COUNTER32/COUNTER32.sv
check_design
source ../rtl/COUNTER32/COUNTER32.sdc
set_max_area 0
compile -ungroup_all
define_name_rules verilog -allowed "A-Z0-9_"
change_names -rules verilog -hierarchy
write -f verilog -hier -o COUNTER32_net.v
write -f ddc -hier -o COUNTER32.ddc
# SDFを書き出す
write_sdf -version 1.0 COUNTER32.sdf
# タイミング, 面積等を出力. 
redirect COUNTER32.max.timing.log { report_timing -delay max -max_paths 20 }
redirect COUNTER32.min.timing.log { report_timing -delay min -max_paths 20 }
redirect COUNTER32.area.log { report_area }
quit

