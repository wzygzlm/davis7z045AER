--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_13e4.bd
--Design : bd_13e4
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_13e4 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_13e4 : entity is "bd_13e4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_13e4,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_13e4 : entity is "brd_system_ila_0_0.hwdef";
end bd_13e4;

architecture STRUCTURE of bd_13e4 is
  component bd_13e4_ila_lib_0 is
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
    probe21 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    probe22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe23 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe24 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe28 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe29 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe30 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe32 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe33 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe34 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe36 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe37 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_13e4_ila_lib_0;
  component bd_13e4_g_inst_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    slot_0_axis_tvalid : in STD_LOGIC;
    slot_0_axis_tready : in STD_LOGIC;
    slot_0_axis_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    slot_0_axis_tstrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    slot_0_axis_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    slot_0_axis_tlast : in STD_LOGIC;
    slot_0_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_0_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_0_axis_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    slot_1_axis_tvalid : in STD_LOGIC;
    slot_1_axis_tready : in STD_LOGIC;
    slot_1_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    slot_1_axis_tlast : in STD_LOGIC;
    slot_2_axis_tvalid : in STD_LOGIC;
    slot_2_axis_tready : in STD_LOGIC;
    slot_2_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    slot_2_axis_tlast : in STD_LOGIC;
    m_slot_0_axis_tvalid : out STD_LOGIC;
    m_slot_0_axis_tready : out STD_LOGIC;
    m_slot_0_axis_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_slot_0_axis_tstrb : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_slot_0_axis_tkeep : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_slot_0_axis_tlast : out STD_LOGIC;
    m_slot_0_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_0_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_0_axis_tuser : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axis_tvalid : out STD_LOGIC;
    m_slot_1_axis_tready : out STD_LOGIC;
    m_slot_1_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_slot_1_axis_tlast : out STD_LOGIC;
    m_slot_2_axis_tvalid : out STD_LOGIC;
    m_slot_2_axis_tready : out STD_LOGIC;
    m_slot_2_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_slot_2_axis_tlast : out STD_LOGIC
  );
  end component bd_13e4_g_inst_0;
  signal Conn1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Conn1_TLAST : STD_LOGIC;
  signal Conn1_TREADY : STD_LOGIC;
  signal Conn1_TVALID : STD_LOGIC;
  signal Conn2_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Conn2_TLAST : STD_LOGIC;
  signal Conn2_TREADY : STD_LOGIC;
  signal Conn2_TVALID : STD_LOGIC;
  signal Conn_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal Conn_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn_TID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn_TKEEP : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn_TLAST : STD_LOGIC;
  signal Conn_TREADY : STD_LOGIC;
  signal Conn_TSTRB : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn_TUSER : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn_TVALID : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal net_slot_0_axis_tdata : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal net_slot_0_axis_tdest : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_0_axis_tid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_0_axis_tkeep : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_0_axis_tlast : STD_LOGIC;
  signal net_slot_0_axis_tready : STD_LOGIC;
  signal net_slot_0_axis_tstrb : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_0_axis_tuser : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axis_tvalid : STD_LOGIC;
  signal net_slot_1_axis_tdata : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal net_slot_1_axis_tlast : STD_LOGIC;
  signal net_slot_1_axis_tready : STD_LOGIC;
  signal net_slot_1_axis_tvalid : STD_LOGIC;
  signal net_slot_2_axis_tdata : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal net_slot_2_axis_tlast : STD_LOGIC;
  signal net_slot_2_axis_tready : STD_LOGIC;
  signal net_slot_2_axis_tvalid : STD_LOGIC;
  signal probe0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal probe10_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal probe11_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal probe12_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe13_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe14_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe15_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe16_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe17_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe18_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe19_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe20_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe2_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal probe3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe4_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe5_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal probe6_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe7_1 : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal probe8_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal probe9_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal resetn_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tlast : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TREADY";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID";
  attribute X_INTERFACE_INFO of SLOT_1_AXIS_tlast : signal is "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TLAST";
  attribute X_INTERFACE_INFO of SLOT_1_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TREADY";
  attribute X_INTERFACE_INFO of SLOT_1_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TVALID";
  attribute X_INTERFACE_INFO of SLOT_2_AXIS_tlast : signal is "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TLAST";
  attribute X_INTERFACE_INFO of SLOT_2_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TREADY";
  attribute X_INTERFACE_INFO of SLOT_2_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TVALID";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS:SLOT_1_AXIS:SLOT_2_AXIS, ASSOCIATED_RESET resetn, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 RST.RESETN RST";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME RST.RESETN, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of SLOT_0_AXIS_tdata : signal is "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 24 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TUSER_WIDTH 2}, PHASE 0.000, TDATA_NUM_BYTES 3, TDEST_WIDTH 1, TID_WIDTH 1, TUSER_WIDTH 2";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tdest : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDEST";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tid : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TID";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tkeep : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TKEEP";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tstrb : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TSTRB";
  attribute X_INTERFACE_INFO of SLOT_0_AXIS_tuser : signal is "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TUSER";
  attribute X_INTERFACE_INFO of SLOT_1_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of SLOT_1_AXIS_tdata : signal is "XIL_INTERFACENAME SLOT_1_AXIS, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 16}, PHASE 0.000, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of SLOT_2_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of SLOT_2_AXIS_tdata : signal is "XIL_INTERFACENAME SLOT_2_AXIS, CLK_DOMAIN brd_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 16}, PHASE 0.000, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  Conn1_TDATA(15 downto 0) <= SLOT_1_AXIS_tdata(15 downto 0);
  Conn1_TLAST <= SLOT_1_AXIS_tlast;
  Conn1_TREADY <= SLOT_1_AXIS_tready;
  Conn1_TVALID <= SLOT_1_AXIS_tvalid;
  Conn2_TDATA(15 downto 0) <= SLOT_2_AXIS_tdata(15 downto 0);
  Conn2_TLAST <= SLOT_2_AXIS_tlast;
  Conn2_TREADY <= SLOT_2_AXIS_tready;
  Conn2_TVALID <= SLOT_2_AXIS_tvalid;
  Conn_TDATA(23 downto 0) <= SLOT_0_AXIS_tdata(23 downto 0);
  Conn_TDEST(0) <= SLOT_0_AXIS_tdest(0);
  Conn_TID(0) <= SLOT_0_AXIS_tid(0);
  Conn_TKEEP(2 downto 0) <= SLOT_0_AXIS_tkeep(2 downto 0);
  Conn_TLAST <= SLOT_0_AXIS_tlast;
  Conn_TREADY <= SLOT_0_AXIS_tready;
  Conn_TSTRB(2 downto 0) <= SLOT_0_AXIS_tstrb(2 downto 0);
  Conn_TUSER(1 downto 0) <= SLOT_0_AXIS_tuser(1 downto 0);
  Conn_TVALID <= SLOT_0_AXIS_tvalid;
  clk_1 <= clk;
  probe0_1(15 downto 0) <= probe0(15 downto 0);
  probe10_1(15 downto 0) <= probe10(15 downto 0);
  probe11_1(15 downto 0) <= probe11(15 downto 0);
  probe12_1(0) <= probe12(0);
  probe13_1(0) <= probe13(0);
  probe14_1(0) <= probe14(0);
  probe15_1(0) <= probe15(0);
  probe16_1(0) <= probe16(0);
  probe17_1(0) <= probe17(0);
  probe18_1(0) <= probe18(0);
  probe19_1(0) <= probe19(0);
  probe1_1(0) <= probe1(0);
  probe20_1(0) <= probe20(0);
  probe2_1(15 downto 0) <= probe2(15 downto 0);
  probe3_1(0) <= probe3(0);
  probe4_1(0) <= probe4(0);
  probe5_1(15 downto 0) <= probe5(15 downto 0);
  probe6_1(0) <= probe6(0);
  probe7_1(63 downto 0) <= probe7(63 downto 0);
  probe8_1(0) <= probe8(0);
  probe9_1(0) <= probe9(0);
  resetn_1 <= resetn;
g_inst: component bd_13e4_g_inst_0
     port map (
      aclk => clk_1,
      aresetn => resetn_1,
      m_slot_0_axis_tdata(23 downto 0) => net_slot_0_axis_tdata(23 downto 0),
      m_slot_0_axis_tdest(0) => net_slot_0_axis_tdest(0),
      m_slot_0_axis_tid(0) => net_slot_0_axis_tid(0),
      m_slot_0_axis_tkeep(2 downto 0) => net_slot_0_axis_tkeep(2 downto 0),
      m_slot_0_axis_tlast => net_slot_0_axis_tlast,
      m_slot_0_axis_tready => net_slot_0_axis_tready,
      m_slot_0_axis_tstrb(2 downto 0) => net_slot_0_axis_tstrb(2 downto 0),
      m_slot_0_axis_tuser(1 downto 0) => net_slot_0_axis_tuser(1 downto 0),
      m_slot_0_axis_tvalid => net_slot_0_axis_tvalid,
      m_slot_1_axis_tdata(15 downto 0) => net_slot_1_axis_tdata(15 downto 0),
      m_slot_1_axis_tlast => net_slot_1_axis_tlast,
      m_slot_1_axis_tready => net_slot_1_axis_tready,
      m_slot_1_axis_tvalid => net_slot_1_axis_tvalid,
      m_slot_2_axis_tdata(15 downto 0) => net_slot_2_axis_tdata(15 downto 0),
      m_slot_2_axis_tlast => net_slot_2_axis_tlast,
      m_slot_2_axis_tready => net_slot_2_axis_tready,
      m_slot_2_axis_tvalid => net_slot_2_axis_tvalid,
      slot_0_axis_tdata(23 downto 0) => Conn_TDATA(23 downto 0),
      slot_0_axis_tdest(0) => Conn_TDEST(0),
      slot_0_axis_tid(0) => Conn_TID(0),
      slot_0_axis_tkeep(2 downto 0) => Conn_TKEEP(2 downto 0),
      slot_0_axis_tlast => Conn_TLAST,
      slot_0_axis_tready => Conn_TREADY,
      slot_0_axis_tstrb(2 downto 0) => Conn_TSTRB(2 downto 0),
      slot_0_axis_tuser(1 downto 0) => Conn_TUSER(1 downto 0),
      slot_0_axis_tvalid => Conn_TVALID,
      slot_1_axis_tdata(15 downto 0) => Conn1_TDATA(15 downto 0),
      slot_1_axis_tlast => Conn1_TLAST,
      slot_1_axis_tready => Conn1_TREADY,
      slot_1_axis_tvalid => Conn1_TVALID,
      slot_2_axis_tdata(15 downto 0) => Conn2_TDATA(15 downto 0),
      slot_2_axis_tlast => Conn2_TLAST,
      slot_2_axis_tready => Conn2_TREADY,
      slot_2_axis_tvalid => Conn2_TVALID
    );
ila_lib: component bd_13e4_ila_lib_0
     port map (
      clk => clk_1,
      probe0(15 downto 0) => probe0_1(15 downto 0),
      probe1(0) => probe1_1(0),
      probe10(15 downto 0) => probe10_1(15 downto 0),
      probe11(15 downto 0) => probe11_1(15 downto 0),
      probe12(0) => probe12_1(0),
      probe13(0) => probe13_1(0),
      probe14(0) => probe14_1(0),
      probe15(0) => probe15_1(0),
      probe16(0) => probe16_1(0),
      probe17(0) => probe17_1(0),
      probe18(0) => probe18_1(0),
      probe19(0) => probe19_1(0),
      probe2(15 downto 0) => probe2_1(15 downto 0),
      probe20(0) => probe20_1(0),
      probe21(23 downto 0) => net_slot_0_axis_tdata(23 downto 0),
      probe22(0) => net_slot_0_axis_tdest(0),
      probe23(0) => net_slot_0_axis_tid(0),
      probe24(2 downto 0) => net_slot_0_axis_tkeep(2 downto 0),
      probe25(2 downto 0) => net_slot_0_axis_tstrb(2 downto 0),
      probe26(1 downto 0) => net_slot_0_axis_tuser(1 downto 0),
      probe27(0) => net_slot_0_axis_tvalid,
      probe28(0) => net_slot_0_axis_tready,
      probe29(0) => net_slot_0_axis_tlast,
      probe3(0) => probe3_1(0),
      probe30(15 downto 0) => net_slot_1_axis_tdata(15 downto 0),
      probe31(0) => net_slot_1_axis_tvalid,
      probe32(0) => net_slot_1_axis_tready,
      probe33(0) => net_slot_1_axis_tlast,
      probe34(15 downto 0) => net_slot_2_axis_tdata(15 downto 0),
      probe35(0) => net_slot_2_axis_tvalid,
      probe36(0) => net_slot_2_axis_tready,
      probe37(0) => net_slot_2_axis_tlast,
      probe4(0) => probe4_1(0),
      probe5(15 downto 0) => probe5_1(15 downto 0),
      probe6(0) => probe6_1(0),
      probe7(63 downto 0) => probe7_1(63 downto 0),
      probe8(0) => probe8_1(0),
      probe9(0) => probe9_1(0)
    );
end STRUCTURE;
