## Generated SDC file "top_pipeline.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

## DATE    "Wed Jan 13 02:30:31 2016"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {B_CLOCK} -source [get_ports {CLOCK_50}] -master_clock {CLOCK} [get_registers {b_clk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {KEY[0]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {KEY[1]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {KEY[2]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {KEY[3]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[0]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[1]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[2]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[3]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[4]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[5]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[6]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[7]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[8]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[9]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[10]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[11]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[12]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[13]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[14]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[15]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[16]}]
set_input_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {SW[17]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[0]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[1]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[2]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[3]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[4]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[5]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[6]}]
set_output_delay -add_delay -rise -max -clock [get_clocks {CLOCK}]  2.000 [get_ports {LEDG[7]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_clocks {B_CLOCK}]  -to  [get_clocks {CLOCK}]
set_false_path  -from  [get_clocks {CLOCK}]  -to  [get_clocks {B_CLOCK}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

