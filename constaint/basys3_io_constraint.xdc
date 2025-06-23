# Clock signal
#Bank = 34, Pin name = ,					Sch name = CLK100MHZ
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk_100m]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk_100m]

# Switches
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];
#set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }];
#set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }];
#set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { SW[4] }];
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { SW[5] }];
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { SW[6] }];
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { SW[7] }];
#set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { SW[8] }];
#set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports { SW[9] }];
#set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports { SW[10] }];
#set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports { SW[11] }];
#set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports { SW[12] }];
#set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { SW[13] }];
#set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { SW[14] }];
#set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { SW[15] }];

# LEDs
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {xadc_out[0]}]
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {xadc_out[1]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {xadc_out[2]}]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {xadc_out[3]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {xadc_out[4]}]
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {xadc_out[5]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {xadc_out[6]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {xadc_out[7]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {xadc_out[8]}]
set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports {xadc_out[9]}]
set_property -dict {PACKAGE_PIN W3 IOSTANDARD LVCMOS33} [get_ports {xadc_out[10]}]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports {xadc_out[11]}]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports {xadc_out[12]}]
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports {xadc_out[13]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {xadc_out[14]}]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {xadc_out[15]}]

# Buttons
#Bank = 14, Pin name = ,					Sch name = BTNC
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports rst]

## Pmod Header JXADC

# Bank = 15, Pin name = IO_L9P_T1_DQS_AD3P_15,              Sch name = XADC1_P -> XA1_P
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports vp]
# Bank = 15, Pin name = IO_L9N_T1_DQS_AD3N_15,              Sch name = XADC1_N -> XA1_N
set_property -dict {PACKAGE_PIN K3 IOSTANDARD LVCMOS33} [get_ports vn]
#
## Bank = 15, Pin name = IO_L8P_T1_AD10P_15,                 Sch name = XADC2_P -> XA2_P
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { JXADC[1] }];
## Bank = 15, Pin name = IO_L8N_T1_AD10N_15,                 Sch name = XADC2_N -> XA2_N
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { JXADC[5] }];
#
## Bank = 15, Pin name = IO_L7P_T1_AD2P_15,                  Sch name = XADC3_P -> XA3_P
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { JXADC[2] }];
## Bank = 15, Pin name = IO_L7N_T1_AD2N_15,                  Sch name = XADC3_N -> XA3_N
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { JXADC[6] }];
#
## Bank = 15, Pin name = IO_L10P_T1_AD11P_15,                Sch name = XADC4_P -> XA4_P
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { JXADC[3] }];
## Bank = 15, Pin name = IO_L10N_T1_AD11N_15,                Sch name = XADC4_N -> XA4_N
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { JXADC[7] }];

set_property DONT_TOUCH true [get_cells xadc_inst/U0/AXI_XADC_CORE_I/drp_to_axi4stream_inst/FIFO18E1_inst_data_i_1]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_100m_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {xadc_out_OBUF[0]} {xadc_out_OBUF[1]} {xadc_out_OBUF[2]} {xadc_out_OBUF[3]} {xadc_out_OBUF[4]} {xadc_out_OBUF[5]} {xadc_out_OBUF[6]} {xadc_out_OBUF[7]} {xadc_out_OBUF[8]} {xadc_out_OBUF[9]} {xadc_out_OBUF[10]} {xadc_out_OBUF[11]} {xadc_out_OBUF[12]} {xadc_out_OBUF[13]} {xadc_out_OBUF[14]} {xadc_out_OBUF[15]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_100m_IBUF_BUFG]
