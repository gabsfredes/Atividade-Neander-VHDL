onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_neander/clk
add wave -noupdate /tb_neander/reset
add wave -noupdate -radix hexadecimal /tb_neander/clk
add wave -noupdate -radix hexadecimal /tb_neander/reset
add wave -noupdate -divider Neander
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/reset
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/count_load
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/en_ULA
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/Z
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/N
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/memoria
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/SOMA
add wave -noupdate -radix decimal /tb_neander/arquivo/neander_inst/SUB
add wave -noupdate -radix decimal /tb_neander/arquivo/neander_inst/MULT
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/PC
add wave -noupdate -radix decimal /tb_neander/arquivo/neander_inst/MUX
add wave -noupdate -radix decimal /tb_neander/arquivo/neander_inst/decoder
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/RDM
add wave -noupdate -radix decimal /tb_neander/arquivo/neander_inst/ACC
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/clk
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/flagZ
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/neander_inst/flagN
add wave -noupdate -divider FSM
add wave -noupdate /tb_neander/arquivo/fsm_inst/state
add wave -noupdate /tb_neander/arquivo/fsm_inst/next_state
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/fsm_inst/clk
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/fsm_inst/reset
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/fsm_inst/flag_zero
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/fsm_inst/flag_negative
add wave -noupdate -radix hexadecimal /tb_neander/arquivo/fsm_inst/decoder
add wave -noupdate -format Literal -radix decimal /tb_neander/arquivo/fsm_inst/count_load
add wave -noupdate -format Literal -radix hexadecimal /tb_neander/arquivo/fsm_inst/enable_ula
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93510 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 267
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {157500 ps}
