onerror {quit -f}
vlib work
vlog -work work DECODER.vo
vlog -work work DECODER.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DECODER_vlg_vec_tst
vcd file -direction DECODER.msim.vcd
vcd add -internal DECODER_vlg_vec_tst/*
vcd add -internal DECODER_vlg_vec_tst/i1/*
add wave /*
run -all
