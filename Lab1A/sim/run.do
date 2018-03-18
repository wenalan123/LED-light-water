#create work library
vlib work


vlog	"./*.v"
vsim -L xilinxcorelib_ver -L unisims_ver -L unimacro_ver -L secureip -lib work -voptargs=\"+acc\" -t 1ps work.tb_top 
#vsim	-voptargs=+acc work.tb_top    #不带ip核的可以使用，带ip核的就得使用上面那句***

# Set the window types
view wave
view structure
view signals


add wave -divider {tb_top}
add wave tb_top/*
add wave -divider {}
add wave tb_top/_inst/*

.main clear

run 10us