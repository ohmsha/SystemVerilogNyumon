create_clock {CK} -name CK -period 2500 -waveform { 0  1250 }
set_input_delay 0 -clock CK {RB}
set_output_delay 0 -clock CK [all_outputs]
set_driving_cell -lib_cell INVx1_ASAP7_75t_L -pin Y [all_inputs]
set_load [expr 4 * [load_of [get_lib_pins asap7sc7p5t_INVBUF_LVT_TT_nldm_201020/INVx1_ASAP7_75t_L/A]]] [all_outputs]
