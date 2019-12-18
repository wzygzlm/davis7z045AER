set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {DVSAERData_AI_0[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports ChipBiasAddrSelect_SBO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ChipBiasBitIn_DO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ChipBiasClock_CBO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ChipBiasDiagSelect_SO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ChipBiasEnable_SO_0]
set_property IOSTANDARD LVCMOS18 [get_ports ChipBiasLatch_SBO_0]
set_property IOSTANDARD LVCMOS18 [get_ports DVSAERAck_SBO_0]
set_property IOSTANDARD LVCMOS18 [get_ports DVSAERReq_ABI_0]
set_property IOSTANDARD LVCMOS18 [get_ports DVSAERReset_SBO_0]
set_property IOSTANDARD LVCMOS18 [get_ports IMUClock_CZO_0]
set_property IOSTANDARD LVCMOS18 [get_ports IMUData_DZIO_0]
set_property IOSTANDARD LVCMOS18 [get_ports IMUFSync_SO_0]
set_property IOSTANDARD LVCMOS18 [get_ports IMUInterrupt_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SPIClock_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SPIMISO_DZO_0]
set_property IOSTANDARD LVCMOS18 [get_ports SPIMOSI_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SPISlaveSelect_ABI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SyncInClock_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SyncInSignal1_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SyncInSignal2_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SyncInSignal_AI_0]
set_property IOSTANDARD LVCMOS18 [get_ports SyncOutClock_CO_0]
set_property IOSTANDARD LVCMOS18 [get_ports SyncOutSignal_SO_0]
#set_property IOSTANDARD LVCMOS18 [get_ports USBClock_CI_0]

set_property PACKAGE_PIN K16 [get_ports {DVSAERData_AI_0[10]}]
set_property PACKAGE_PIN L15 [get_ports {DVSAERData_AI_0[9]}]
set_property PACKAGE_PIN L14 [get_ports {DVSAERData_AI_0[8]}]
set_property PACKAGE_PIN J13 [get_ports {DVSAERData_AI_0[7]}]
set_property PACKAGE_PIN H13 [get_ports {DVSAERData_AI_0[6]}]
set_property PACKAGE_PIN L13 [get_ports {DVSAERData_AI_0[5]}]
set_property PACKAGE_PIN K13 [get_ports {DVSAERData_AI_0[4]}]
set_property PACKAGE_PIN J14 [get_ports {DVSAERData_AI_0[3]}]
set_property PACKAGE_PIN H14 [get_ports {DVSAERData_AI_0[2]}]
set_property PACKAGE_PIN K15 [get_ports {DVSAERData_AI_0[1]}]
set_property PACKAGE_PIN J15 [get_ports {DVSAERData_AI_0[0]}]
set_property PACKAGE_PIN J16 [get_ports DVSAERReq_ABI_0]

set_property PULLDOWN true [get_ports {DVSAERData_AI_0[10]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[9]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[8]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[7]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[6]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[5]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[4]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[3]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[2]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[1]}]
set_property PULLDOWN true [get_ports {DVSAERData_AI_0[0]}]
set_property PULLUP true [get_ports DVSAERReq_ABI_0]

set_property PACKAGE_PIN A17 [get_ports DVSAERAck_SBO_0]
set_property PACKAGE_PIN D14 [get_ports ChipBiasAddrSelect_SBO_0]
set_property PACKAGE_PIN E16 [get_ports ChipBiasBitIn_DO_0]
set_property PACKAGE_PIN E15 [get_ports ChipBiasClock_CBO_0]
set_property PACKAGE_PIN F17 [get_ports ChipBiasDiagSelect_SO_0]
set_property PACKAGE_PIN E17 [get_ports ChipBiasEnable_SO_0]
set_property PACKAGE_PIN D15 [get_ports ChipBiasLatch_SBO_0]
create_interface Bias
set_property INTERFACE Bias [get_ports { ChipBiasLatch_SBO_0 ChipBiasAddrSelect_SBO_0 ChipBiasBitIn_DO_0 ChipBiasClock_CBO_0 ChipBiasDiagSelect_SO_0 ChipBiasEnable_SO_0 }]

set_property PACKAGE_PIN C14 [get_ports DVSAERReset_SBO_0]
set_property PACKAGE_PIN B16 [get_ports IMUClock_CZO_0]
set_property PACKAGE_PIN G17 [get_ports IMUData_DZIO_0]
set_property PACKAGE_PIN B17 [get_ports IMUFSync_SO_0]
set_property PACKAGE_PIN H16 [get_ports IMUInterrupt_AI_0]
set_property PACKAGE_PIN L4 [get_ports SPIClock_AI_0]
set_property PACKAGE_PIN A2 [get_ports SPIMISO_DZO_0]
set_property PACKAGE_PIN A3 [get_ports SPIMOSI_AI_0]
set_property PACKAGE_PIN B1 [get_ports SPISlaveSelect_ABI_0]
set_property PACKAGE_PIN B2 [get_ports SyncInClock_AI_0]
set_property PACKAGE_PIN C1 [get_ports SyncInSignal1_AI_0]
set_property PACKAGE_PIN C2 [get_ports SyncInSignal2_AI_0]
set_property PACKAGE_PIN A4 [get_ports SyncInSignal_AI_0]
set_property PACKAGE_PIN A5 [get_ports SyncOutClock_CO_0]
set_property PACKAGE_PIN B4 [get_ports SyncOutSignal_SO_0]


set_property IOSTANDARD LVCMOS33 [get_ports {led_0[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_0[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_0[0]}]
set_property PACKAGE_PIN Y26 [get_ports {led_0[5]}]
set_property PACKAGE_PIN AB29 [get_ports {led_0[4]}]
set_property PACKAGE_PIN AB30 [get_ports {led_0[3]}]
set_property PACKAGE_PIN AA30 [get_ports {led_0[2]}]
set_property PACKAGE_PIN Y30 [get_ports {led_0[1]}]
set_property PACKAGE_PIN Y25 [get_ports {led_0[0]}]

#Data
# GPIO2PIN18 ----  R5 --- PMODR0
set_property PACKAGE_PIN W29 [get_ports {vid_data[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[20]}]
# GPIO2PIN16 ----  R6 --- PMODR1
set_property PACKAGE_PIN V28 [get_ports {vid_data[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[21]}]
# GPIO2PIN14 ----  R7 --- PMODR2
set_property PACKAGE_PIN R28 [get_ports {vid_data[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[22]}]
# GPIO2PIN12 ----  R8 --- PMODR3
set_property PACKAGE_PIN T29 [get_ports {vid_data[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[23]}]
# R0
set_property PACKAGE_PIN W30 [get_ports {vid_data[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[16]}]
# R1
set_property PACKAGE_PIN V27 [get_ports {vid_data[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[17]}]
# R2
set_property PACKAGE_PIN W28 [get_ports {vid_data[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[18]}]
# R3
set_property PACKAGE_PIN W25 [get_ports {vid_data[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[19]}]

# GPIO2PIN10 ---- G5 --- PMODG0
set_property PACKAGE_PIN N29 [get_ports {vid_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[4]}]
# GPIO2PIN8 ---- G6 --- PMODG1
set_property PACKAGE_PIN N28 [get_ports {vid_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[5]}]
# GPIO2PIN6 ---- G7 --- PMODG2
set_property PACKAGE_PIN T30 [get_ports {vid_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[6]}]
# GPIO2PIN4 ---- G8 --- PMODG3
set_property PACKAGE_PIN P30 [get_ports {vid_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[7]}]
# G0
set_property PACKAGE_PIN P25 [get_ports {vid_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[0]}]
# G1
set_property PACKAGE_PIN P26 [get_ports {vid_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[1]}]
# G2
set_property PACKAGE_PIN T24 [get_ports {vid_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[2]}]
# G3
set_property PACKAGE_PIN T25 [get_ports {vid_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[3]}]

# GPIO2PIN17 ---- B5 --- PMODB0
set_property PACKAGE_PIN V29 [get_ports {vid_data[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[12]}]
# GPIO2PIN15 ---- B6 --- PMODB1
set_property PACKAGE_PIN T28 [get_ports {vid_data[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[13]}]
# GPIO2PIN13 ---- B7 --- PMODB2
set_property PACKAGE_PIN U29 [get_ports {vid_data[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[14]}]
# GPIO2PIN11 ---- B8 --- PMODB3
set_property PACKAGE_PIN P29 [get_ports {vid_data[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[15]}]
# B0
set_property PACKAGE_PIN U22 [get_ports {vid_data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[8]}]
# B1
set_property PACKAGE_PIN V22 [get_ports {vid_data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[9]}]
# B2
set_property PACKAGE_PIN U24 [get_ports {vid_data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[10]}]
# B3
set_property PACKAGE_PIN V24 [get_ports {vid_data[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vid_data[11]}]

#Sync signals
# GPIO2PIN9 --- PMOD2_7
set_property PACKAGE_PIN P28 [get_ports vid_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vid_hsync]
# GPIO2PIN7 --- PMOD2_8
set_property PACKAGE_PIN U30 [get_ports vid_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vid_vsync]



set_property PACKAGE_PIN G1 [get_ports {extIn_V_0[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {extIn_V_0[0]}]
set_property PULLUP true [get_ports {extIn_V_0[0]}]

################# USB Constraints ####################

set_property LOC AJ15 [ get_ports ULPI_next]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_next]

set_property LOC AK16 [ get_ports ULPI_stop]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_stop]

create_clock -period "16.667" -name clk_out1_0 [get_ports "clk_out1_0"]

set_property LOC AC28 [ get_ports clk_in1_0]
set_property IOSTANDARD LVCMOS33 [ get_ports clk_in1_0]

create_clock -period "16.667" -name clk_in1_0 [get_ports "clk_in1_0"]

#set_property LOC AC28 [ get_ports ULPI_clk]
#set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_clk]

set_property LOC AK15 [ get_ports ULPI_dir]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_dir]

set_property LOC AH17 [ get_ports ULPI_rst]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_rst]

set_property LOC AH16 [ get_ports ulpiNotReset]
set_property IOSTANDARD LVCMOS33 [ get_ports ulpiNotReset]

set_property LOC AJ16 [ get_ports ULPI_data_io[7]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[7]]

set_property LOC AJ13 [ get_ports ULPI_data_io[6]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[6]]

set_property LOC AJ14 [ get_ports ULPI_data_io[5]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[5]]

set_property LOC AJ18 [ get_ports ULPI_data_io[4]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[4]]

set_property LOC AH18 [ get_ports ULPI_data_io[3]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[3]]

set_property LOC AK12 [ get_ports ULPI_data_io[2]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[2]]

set_property LOC AK13 [ get_ports ULPI_data_io[1]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[1]]

set_property LOC AA13 [ get_ports ULPI_data_io[0]]
set_property IOSTANDARD LVCMOS33 [ get_ports ULPI_data_io[0]]

set ulpi_input {ULPI_data* ULPI_dir ULPI_next}
set ulpi_output {ULPI_data* ULPI_stop}
#set_input_delay  -min 0.2 -clock [get_clocks -of_objects [get_pins -hier *clk_in1_0]] $ulpi_input
#set_input_delay  -max 4.5 -clock [get_clocks -of_objects [get_pins -hier *clk_in1_0]] $ulpi_input
#set_output_delay -min -6 -clock [get_clocks -of_objects [get_pins -hier *clk_in1_0]] $ulpi_output
#set_output_delay -max 1 -clock [get_clocks -of_objects [get_pins -hier *clk_in1_0]] $ulpi_output
#set_multicycle_path -to [get_ports ULPI_data*] 2
#set_max_delay 24 -from [get_ports ULPI_dir] -to [get_ports ULPI_data_io[*]] -datapath_only

#set_input_delay  -min 0.2 -clock [get_clocks -of_objects [get_pins -hier *FCLK_CLK0_0]] $ulpi_input
#set_input_delay  -max 4.5 -clock [get_clocks -of_objects [get_pins -hier *FCLK_CLK0_0]] $ulpi_input
#set_output_delay -max 4 -clock [get_clocks -of_objects [get_pins -hier *ULPI_clk]] $ulpi_output


