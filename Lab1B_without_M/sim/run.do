#create work library
vlib work


vlog	"./*.v"
vsim -L xilinxcorelib_ver -L unisims_ver -L unimacro_ver -L secureip -lib work -voptargs=\"+acc\" -t 1ps work.tb_counter 
#vsim	-voptargs=+acc work.tb_counter    #不带ip核的可以使用，带ip核的就得使用上面那句***

# Set the window types
view wave
view structure
view signals


add wave -divider {tb_counter}
add wave tb_counter/*
add wave -divider {counter}
add wave tb_counter/counter_inst/*

.main clear

run 10us