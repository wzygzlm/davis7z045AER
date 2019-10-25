--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_13e4_wrapper.bd
--Design : bd_13e4_wrapper
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_13e4_wrapper is
  port (
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    SLOT_0_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_0_AXIS_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_0_AXIS_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_0_AXIS_tstrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_0_AXIS_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_1_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_1_AXIS_tlast : in STD_LOGIC;
    SLOT_1_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXIS_tvalid : in STD_LOGIC;
    SLOT_2_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_2_AXIS_tlast : in STD_LOGIC;
    SLOT_2_AXIS_tready : in STD_LOGIC;
    SLOT_2_AXIS_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetn : in STD_LOGIC
  );
end bd_13e4_wrapper;

architecture STRUCTURE of bd_13e4_wrapper is
  component bd_13e4 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe20 : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetn : in STD_LOGIC;
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    SLOT_0_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_0_AXIS_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_0_AXIS_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_0_AXIS_tstrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_0_AXIS_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_1_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_1_AXIS_tlast : in STD_LOGIC;
    SLOT_1_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXIS_tvalid : in STD_LOGIC;
    SLOT_2_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_2_AXIS_tlast : in STD_LOGIC;
    SLOT_2_AXIS_tready : in STD_LOGIC;
    SLOT_2_AXIS_tvalid : in STD_LOGIC
  );
  end component bd_13e4;
begin
bd_13e4_i: component bd_13e4
     port map (
      SLOT_0_AXIS_tdata(23 downto 0) => SLOT_0_AXIS_tdata(23 downto 0),
      SLOT_0_AXIS_tdest(0) => SLOT_0_AXIS_tdest(0),
      SLOT_0_AXIS_tid(0) => SLOT_0_AXIS_tid(0),
      SLOT_0_AXIS_tkeep(2 downto 0) => SLOT_0_AXIS_tkeep(2 downto 0),
      SLOT_0_AXIS_tlast => SLOT_0_AXIS_tlast,
      SLOT_0_AXIS_tready => SLOT_0_AXIS_tready,
      SLOT_0_AXIS_tstrb(2 downto 0) => SLOT_0_AXIS_tstrb(2 downto 0),
      SLOT_0_AXIS_tuser(1 downto 0) => SLOT_0_AXIS_tuser(1 downto 0),
      SLOT_0_AXIS_tvalid => SLOT_0_AXIS_tvalid,
      SLOT_1_AXIS_tdata(15 downto 0) => SLOT_1_AXIS_tdata(15 downto 0),
      SLOT_1_AXIS_tlast => SLOT_1_AXIS_tlast,
      SLOT_1_AXIS_tready => SLOT_1_AXIS_tready,
      SLOT_1_AXIS_tvalid => SLOT_1_AXIS_tvalid,
      SLOT_2_AXIS_tdata(15 downto 0) => SLOT_2_AXIS_tdata(15 downto 0),
      SLOT_2_AXIS_tlast => SLOT_2_AXIS_tlast,
      SLOT_2_AXIS_tready => SLOT_2_AXIS_tready,
      SLOT_2_AXIS_tvalid => SLOT_2_AXIS_tvalid,
      clk => clk,
      probe0(15 downto 0) => probe0(15 downto 0),
      probe1(0) => probe1(0),
      probe10(15 downto 0) => probe10(15 downto 0),
      probe11(15 downto 0) => probe11(15 downto 0),
      probe12(0) => probe12(0),
      probe13(0) => probe13(0),
      probe14(0) => probe14(0),
      probe15(0) => probe15(0),
      probe16(0) => probe16(0),
      probe17(0) => probe17(0),
      probe18(0) => probe18(0),
      probe19(0) => probe19(0),
      probe2(15 downto 0) => probe2(15 downto 0),
      probe20(0) => probe20(0),
      probe3(0) => probe3(0),
      probe4(0) => probe4(0),
      probe5(15 downto 0) => probe5(15 downto 0),
      probe6(0) => probe6(0),
      probe7(63 downto 0) => probe7(63 downto 0),
      probe8(0) => probe8(0),
      probe9(0) => probe9(0),
      resetn => resetn
    );
end STRUCTURE;
