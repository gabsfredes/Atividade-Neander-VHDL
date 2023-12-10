onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /topo/clk
add wave -noupdate -radix hexadecimal /topo/reset
add wave -noupdate -radix hexadecimal /topo/count_load
add wave -noupdate -radix hexadecimal /topo/enable_ula
add wave -noupdate -radix hexadecimal /topo/flag_negative
add wave -noupdate -radix hexadecimal /topo/flag_zero
add wave -noupdate -radix hexadecimal /topo/decoder
add wave -noupdate -divider Neander
add wave -noupdate -radix hexadecimal /topo/neander_inst/reset
add wave -noupdate -radix hexadecimal /topo/neander_inst/clk
add wave -noupdate -radix hexadecimal /topo/neander_inst/count_load
add wave -noupdate -radix hexadecimal /topo/neander_inst/en_ULA
add wave -noupdate -radix hexadecimal /topo/neander_inst/Z
add wave -noupdate -radix hexadecimal /topo/neander_inst/N
add wave -noupdate -radix hexadecimal /topo/neander_inst/decoder
add wave -noupdate -radix hexadecimal /topo/neander_inst/memoria
add wave -noupdate -radix hexadecimal /topo/neander_inst/MUX
add wave -noupdate -radix hexadecimal /topo/neander_inst/SOMA
add wave -noupdate -radix hexadecimal /topo/neander_inst/SUB
add wave -noupdate -radix hexadecimal /topo/neander_inst/MULT
add wave -noupdate -radix hexadecimal /topo/neander_inst/PC
add wave -noupdate -radix hexadecimal /topo/neander_inst/ACC
add wave -noupdate -radix hexadecimal /topo/neander_inst/RDM
add wave -noupdate -radix hexadecimal /topo/neander_inst/flagZ
add wave -noupdate -radix hexadecimal /topo/neander_inst/flagN
add wave -noupdate -divider FSM
add wave -noupdate -radix hexadecimal /topo/fsm_inst/clk
add wave -noupdate -radix hexadecimal /topo/fsm_inst/reset
add wave -noupdate -radix hexadecimal /topo/fsm_inst/flag_zero
add wave -noupdate -radix hexadecimal /topo/fsm_inst/flag_negative
add wave -noupdate -radix hexadecimal /topo/fsm_inst/decoder
add wave -noupdate -radix hexadecimal /topo/fsm_inst/count_load
add wave -noupdate -radix hexadecimal /topo/fsm_inst/enable_ula
add wave -noupdate /topo/fsm_inst/state
add wave -noupdate /topo/fsm_inst/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8619 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {105 ns}
