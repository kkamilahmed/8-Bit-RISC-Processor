onerror {quit -f}
vlib work
vlog -work work STORAGELE.vo
vlog -work work STORAGELE.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.STORAGELE_vlg_vec_tst
vcd file -direction STORAGELE.msim.vcd
vcd add -internal STORAGELE_vlg_vec_tst/*
vcd add -internal STORAGELE_vlg_vec_tst/i1/*
add wave /*
run -all
