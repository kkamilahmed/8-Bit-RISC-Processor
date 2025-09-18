onerror {quit -f}
vlib work
vlog -work work MODIFIEDPROCESSOR.vo
vlog -work work MODIFIEDPROCESSOR.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.MODIFIEDPROCESSOR_vlg_vec_tst
vcd file -direction MODIFIEDPROCESSOR.msim.vcd
vcd add -internal MODIFIEDPROCESSOR_vlg_vec_tst/*
vcd add -internal MODIFIEDPROCESSOR_vlg_vec_tst/i1/*
add wave /*
run -all
