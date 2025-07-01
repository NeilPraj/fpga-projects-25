transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog {C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog/Binary_To_7seg.sv}
vlog -sv -work work +incdir+C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog {C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog/Enable_1hz.sv}
vlog -sv -work work +incdir+C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog {C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog/Top.sv}

vlog -sv -work work +incdir+C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog {C:/Users/neilp/Documents/Projects_25/FPGA_STUFF/Seven_seg_verilog/Top_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Top_tb

add wave *
view structure
view signals
run 1 sec
