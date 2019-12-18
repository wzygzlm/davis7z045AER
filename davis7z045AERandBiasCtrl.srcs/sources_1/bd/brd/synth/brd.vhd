--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Wed Dec 18 15:37:29 2019
--Host        : DESKTOP-3TNSMFC running 64-bit major release  (build 9200)
--Command     : generate_target brd.bd
--Design      : brd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_7NK3JT is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_7NK3JT;

architecture STRUCTURE of m00_couplers_imp_7NK3JT is
  component brd_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= m00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_pc_WREADY;
  auto_pc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => m00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m00_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m00_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m00_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m00_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m00_couplers_to_auto_pc_AWVALID,
      s_axi_bready => m00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => m00_couplers_to_auto_pc_RLAST,
      s_axi_rready => m00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m00_couplers_to_auto_pc_WLAST,
      s_axi_wready => m00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1IXSFWC is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1IXSFWC;

architecture STRUCTURE of m01_couplers_imp_1IXSFWC is
  component brd_auto_pc_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_1;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m01_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m01_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m01_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m01_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m01_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m01_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m01_couplers_WVALID : STD_LOGIC;
  signal m01_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m01_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m01_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m01_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m01_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m01_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m01_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m01_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m01_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m01_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m01_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m01_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m01_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m01_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m01_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= auto_pc_to_m01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m01_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m01_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= m01_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m01_couplers_to_auto_pc_WREADY;
  auto_pc_to_m01_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m01_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m01_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m01_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m01_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m01_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m01_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m01_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m01_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m01_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m01_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m01_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m01_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m01_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m01_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m01_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m01_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m01_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m01_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m01_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m01_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_1
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m01_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m01_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m01_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m01_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m01_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m01_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m01_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m01_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m01_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m01_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m01_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => NLW_auto_pc_m_axi_wstrb_UNCONNECTED(3 downto 0),
      m_axi_wvalid => auto_pc_to_m01_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m01_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m01_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m01_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => m01_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m01_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m01_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m01_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m01_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m01_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m01_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m01_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m01_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m01_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m01_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m01_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m01_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m01_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m01_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m01_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m01_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m01_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m01_couplers_to_auto_pc_AWVALID,
      s_axi_bready => m01_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m01_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m01_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m01_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => m01_couplers_to_auto_pc_RLAST,
      s_axi_rready => m01_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m01_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m01_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m01_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m01_couplers_to_auto_pc_WLAST,
      s_axi_wready => m01_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m01_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m01_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_YCJ54I is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_YCJ54I;

architecture STRUCTURE of m02_couplers_imp_YCJ54I is
  component brd_auto_pc_2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_2;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m02_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m02_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m02_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m02_couplers_WVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m02_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m02_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m02_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m02_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m02_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m02_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m02_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m02_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m02_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m02_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m02_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m02_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m02_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m02_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= m02_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m02_couplers_to_auto_pc_WREADY;
  auto_pc_to_m02_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m02_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m02_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m02_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m02_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m02_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m02_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m02_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m02_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m02_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m02_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m02_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m02_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m02_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m02_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m02_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m02_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m02_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m02_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m02_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m02_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_2
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m02_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m02_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m02_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m02_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m02_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m02_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m02_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m02_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m02_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m02_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m02_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m02_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m02_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m02_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m02_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m02_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m02_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => m02_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m02_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m02_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m02_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m02_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m02_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m02_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m02_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m02_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m02_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m02_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m02_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m02_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m02_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m02_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m02_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m02_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m02_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m02_couplers_to_auto_pc_AWVALID,
      s_axi_bready => m02_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m02_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m02_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m02_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => m02_couplers_to_auto_pc_RLAST,
      s_axi_rready => m02_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m02_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m02_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m02_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m02_couplers_to_auto_pc_WLAST,
      s_axi_wready => m02_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m02_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m02_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1A5Q2PJ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1A5Q2PJ;

architecture STRUCTURE of m03_couplers_imp_1A5Q2PJ is
  component brd_auto_pc_3 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_3;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m03_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m03_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m03_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m03_couplers_WVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m03_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m03_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m03_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m03_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m03_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m03_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m03_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m03_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m03_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m03_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m03_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m03_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= m03_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m03_couplers_to_auto_pc_WREADY;
  auto_pc_to_m03_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m03_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m03_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m03_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m03_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m03_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m03_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m03_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m03_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m03_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m03_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m03_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m03_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m03_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m03_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m03_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m03_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m03_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m03_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m03_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m03_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m03_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m03_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_3
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m03_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m03_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m03_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m03_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m03_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m03_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m03_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m03_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m03_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m03_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m03_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m03_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m03_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m03_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m03_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m03_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m03_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => m03_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m03_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m03_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m03_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m03_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m03_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m03_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m03_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m03_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m03_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m03_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m03_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m03_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m03_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m03_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m03_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m03_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m03_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m03_couplers_to_auto_pc_AWVALID,
      s_axi_bready => m03_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m03_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m03_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m03_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => m03_couplers_to_auto_pc_RLAST,
      s_axi_rready => m03_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m03_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m03_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m03_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m03_couplers_to_auto_pc_WLAST,
      s_axi_wready => m03_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m03_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m03_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_1OTDC33 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m04_couplers_imp_1OTDC33;

architecture STRUCTURE of m04_couplers_imp_1OTDC33 is
  component brd_auto_pc_4 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_4;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m04_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m04_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m04_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m04_couplers_WVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m04_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m04_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m04_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m04_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m04_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m04_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m04_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m04_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m04_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m04_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m04_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m04_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m04_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m04_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m04_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m04_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= m04_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m04_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m04_couplers_to_auto_pc_WREADY;
  auto_pc_to_m04_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m04_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m04_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m04_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m04_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m04_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m04_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m04_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m04_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m04_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m04_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m04_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m04_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m04_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m04_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m04_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m04_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m04_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m04_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m04_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m04_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m04_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m04_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m04_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m04_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_4
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m04_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m04_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m04_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m04_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m04_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m04_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m04_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m04_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m04_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m04_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m04_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m04_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m04_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m04_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m04_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m04_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m04_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => m04_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m04_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m04_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m04_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m04_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m04_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m04_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m04_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m04_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m04_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m04_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m04_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m04_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m04_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m04_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m04_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m04_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m04_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m04_couplers_to_auto_pc_AWVALID,
      s_axi_bready => m04_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m04_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m04_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m04_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => m04_couplers_to_auto_pc_RLAST,
      s_axi_rready => m04_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m04_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m04_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m04_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m04_couplers_to_auto_pc_WLAST,
      s_axi_wready => m04_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m04_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m04_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_1V6RCA is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_1V6RCA;

architecture STRUCTURE of m05_couplers_imp_1V6RCA is
  component brd_auto_pc_5 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_5;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m05_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m05_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m05_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m05_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m05_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m05_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m05_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m05_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m05_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m05_couplers_WVALID : STD_LOGIC;
  signal m05_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m05_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m05_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m05_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m05_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m05_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m05_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m05_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m05_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m05_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m05_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m05_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m05_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m05_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_pc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= auto_pc_to_m05_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= auto_pc_to_m05_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m05_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_m05_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m05_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m05_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rlast <= m05_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m05_couplers_to_auto_pc_WREADY;
  auto_pc_to_m05_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m05_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m05_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m05_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m05_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m05_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m05_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m05_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m05_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m05_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m05_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m05_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m05_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m05_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m05_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m05_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m05_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m05_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m05_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m05_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m05_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m05_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m05_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_5
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m05_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => NLW_auto_pc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_pc_to_m05_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_m05_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m05_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_pc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_pc_to_m05_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_m05_couplers_AWVALID,
      m_axi_bready => auto_pc_to_m05_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m05_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_m05_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m05_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_m05_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_m05_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_m05_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_m05_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m05_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m05_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m05_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => m05_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m05_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m05_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m05_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m05_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m05_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m05_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m05_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m05_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m05_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m05_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => m05_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m05_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m05_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m05_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m05_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m05_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m05_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m05_couplers_to_auto_pc_AWVALID,
      s_axi_bready => m05_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m05_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m05_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => m05_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rlast => m05_couplers_to_auto_pc_RLAST,
      s_axi_rready => m05_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m05_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m05_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => m05_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => m05_couplers_to_auto_pc_WLAST,
      s_axi_wready => m05_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => m05_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => m05_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_1G0EH44 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC;
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC;
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC;
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC;
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m06_couplers_imp_1G0EH44;

architecture STRUCTURE of m06_couplers_imp_1G0EH44 is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m06_couplers_to_m06_couplers_ARLOCK : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m06_couplers_to_m06_couplers_AWLOCK : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RLAST : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WLAST : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= m06_couplers_to_m06_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= m06_couplers_to_m06_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= m06_couplers_to_m06_couplers_ARLEN(7 downto 0);
  M_AXI_arlock <= m06_couplers_to_m06_couplers_ARLOCK;
  M_AXI_arprot(2 downto 0) <= m06_couplers_to_m06_couplers_ARPROT(2 downto 0);
  M_AXI_arsize(2 downto 0) <= m06_couplers_to_m06_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= m06_couplers_to_m06_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= m06_couplers_to_m06_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= m06_couplers_to_m06_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= m06_couplers_to_m06_couplers_AWLEN(7 downto 0);
  M_AXI_awlock <= m06_couplers_to_m06_couplers_AWLOCK;
  M_AXI_awprot(2 downto 0) <= m06_couplers_to_m06_couplers_AWPROT(2 downto 0);
  M_AXI_awsize(2 downto 0) <= m06_couplers_to_m06_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= m06_couplers_to_m06_couplers_AWVALID;
  M_AXI_bready <= m06_couplers_to_m06_couplers_BREADY;
  M_AXI_rready <= m06_couplers_to_m06_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= m06_couplers_to_m06_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m06_couplers_to_m06_couplers_WVALID;
  S_AXI_arready <= m06_couplers_to_m06_couplers_ARREADY;
  S_AXI_awready <= m06_couplers_to_m06_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m06_couplers_to_m06_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rlast <= m06_couplers_to_m06_couplers_RLAST;
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m06_couplers_to_m06_couplers_RVALID;
  S_AXI_wready <= m06_couplers_to_m06_couplers_WREADY;
  m06_couplers_to_m06_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m06_couplers_to_m06_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m06_couplers_to_m06_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m06_couplers_to_m06_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m06_couplers_to_m06_couplers_ARLOCK <= S_AXI_arlock;
  m06_couplers_to_m06_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m06_couplers_to_m06_couplers_ARREADY <= M_AXI_arready;
  m06_couplers_to_m06_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m06_couplers_to_m06_couplers_ARVALID <= S_AXI_arvalid;
  m06_couplers_to_m06_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m06_couplers_to_m06_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m06_couplers_to_m06_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m06_couplers_to_m06_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m06_couplers_to_m06_couplers_AWLOCK <= S_AXI_awlock;
  m06_couplers_to_m06_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m06_couplers_to_m06_couplers_AWREADY <= M_AXI_awready;
  m06_couplers_to_m06_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m06_couplers_to_m06_couplers_AWVALID <= S_AXI_awvalid;
  m06_couplers_to_m06_couplers_BREADY <= S_AXI_bready;
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID <= M_AXI_bvalid;
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RLAST <= M_AXI_rlast;
  m06_couplers_to_m06_couplers_RREADY <= S_AXI_rready;
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID <= M_AXI_rvalid;
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WLAST <= S_AXI_wlast;
  m06_couplers_to_m06_couplers_WREADY <= M_AXI_wready;
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1DJAG1V is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1DJAG1V;

architecture STRUCTURE of s00_couplers_imp_1DJAG1V is
  component brd_auto_pc_6 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component brd_auto_pc_6;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal auto_pc_to_s00_couplers_RLAST : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WLAST : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
  signal NLW_auto_pc_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_auto_pc_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_pc_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_pc_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(11 downto 0) <= auto_pc_to_s00_couplers_ARID(11 downto 0);
  M_AXI_arlen(7 downto 0) <= auto_pc_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= auto_pc_to_s00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_pc_to_s00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_pc_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_pc_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_pc_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(11 downto 0) <= auto_pc_to_s00_couplers_AWID(11 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_pc_to_s00_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_pc_to_s00_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_pc_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_pc_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= auto_pc_to_s00_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(11 downto 0) <= s00_couplers_to_auto_pc_BID(11 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(11 downto 0) <= s00_couplers_to_auto_pc_RID(11 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BID(11 downto 0) <= M_AXI_bid(11 downto 0);
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RID(11 downto 0) <= M_AXI_rid(11 downto 0);
  auto_pc_to_s00_couplers_RLAST <= M_AXI_rlast;
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(11 downto 0) <= S_AXI_arid(11 downto 0);
  s00_couplers_to_auto_pc_ARLEN(3 downto 0) <= S_AXI_arlen(3 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(1 downto 0) <= S_AXI_arlock(1 downto 0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(11 downto 0) <= S_AXI_awid(11 downto 0);
  s00_couplers_to_auto_pc_AWLEN(3 downto 0) <= S_AXI_awlen(3 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(1 downto 0) <= S_AXI_awlock(1 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WID(11 downto 0) <= S_AXI_wid(11 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component brd_auto_pc_6
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_pc_to_s00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_pc_to_s00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(11 downto 0) => auto_pc_to_s00_couplers_ARID(11 downto 0),
      m_axi_arlen(7 downto 0) => auto_pc_to_s00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => auto_pc_to_s00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_pc_to_s00_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_auto_pc_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => auto_pc_to_s00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_s00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_s00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(11 downto 0) => auto_pc_to_s00_couplers_AWID(11 downto 0),
      m_axi_awlen(7 downto 0) => auto_pc_to_s00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_pc_to_s00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_s00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_pc_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_pc_to_s00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bid(11 downto 0) => auto_pc_to_s00_couplers_BID(11 downto 0),
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rid(11 downto 0) => auto_pc_to_s00_couplers_RID(11 downto 0),
      m_axi_rlast => auto_pc_to_s00_couplers_RLAST,
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wlast => auto_pc_to_s00_couplers_WLAST,
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_auto_pc_ARID(11 downto 0),
      s_axi_arlen(3 downto 0) => s00_couplers_to_auto_pc_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => s00_couplers_to_auto_pc_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_auto_pc_AWID(11 downto 0),
      s_axi_awlen(3 downto 0) => s00_couplers_to_auto_pc_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => s00_couplers_to_auto_pc_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_auto_pc_BID(11 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_auto_pc_RID(11 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wid(11 downto 0) => s00_couplers_to_auto_pc_WID(11 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity brd_ps7_0_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M06_AXI_arlock : out STD_LOGIC;
    M06_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M06_AXI_awlock : out STD_LOGIC;
    M06_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rlast : in STD_LOGIC;
    M06_AXI_rready : out STD_LOGIC;
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wlast : out STD_LOGIC;
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end brd_ps7_0_axi_periph_0;

architecture STRUCTURE of brd_ps7_0_axi_periph_0 is
  component brd_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 55 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 13 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 13 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 55 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 13 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 13 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component brd_xbar_0;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC;
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC;
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC;
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC;
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m04_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m05_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_ARLOCK : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_AWLOCK : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_RLAST : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_WLAST : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m06_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_ACLK_net : STD_LOGIC;
  signal ps7_0_axi_periph_ARESETN_net : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_RLAST : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_WLAST : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_ARCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_ARSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWBURST : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal xbar_to_m01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWLEN : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal xbar_to_m01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWQOS : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWREGION : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARBURST : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal xbar_to_m02_couplers_ARCACHE : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARLEN : STD_LOGIC_VECTOR ( 23 downto 16 );
  signal xbar_to_m02_couplers_ARLOCK : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARQOS : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARREGION : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_ARSIZE : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWBURST : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal xbar_to_m02_couplers_AWCACHE : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWLEN : STD_LOGIC_VECTOR ( 23 downto 16 );
  signal xbar_to_m02_couplers_AWLOCK : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWQOS : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWREGION : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_AWSIZE : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WLAST : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARBURST : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal xbar_to_m03_couplers_ARCACHE : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARLEN : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal xbar_to_m03_couplers_ARLOCK : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARQOS : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARREGION : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_ARSIZE : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWBURST : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal xbar_to_m03_couplers_AWCACHE : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWLEN : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal xbar_to_m03_couplers_AWLOCK : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWQOS : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWREGION : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_AWSIZE : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WLAST : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARBURST : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal xbar_to_m04_couplers_ARCACHE : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARLEN : STD_LOGIC_VECTOR ( 39 downto 32 );
  signal xbar_to_m04_couplers_ARLOCK : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARQOS : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARREGION : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_ARSIZE : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWBURST : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal xbar_to_m04_couplers_AWCACHE : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWLEN : STD_LOGIC_VECTOR ( 39 downto 32 );
  signal xbar_to_m04_couplers_AWLOCK : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWQOS : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWREGION : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_AWSIZE : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WLAST : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARBURST : STD_LOGIC_VECTOR ( 11 downto 10 );
  signal xbar_to_m05_couplers_ARCACHE : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARLEN : STD_LOGIC_VECTOR ( 47 downto 40 );
  signal xbar_to_m05_couplers_ARLOCK : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARQOS : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARREGION : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_ARSIZE : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWBURST : STD_LOGIC_VECTOR ( 11 downto 10 );
  signal xbar_to_m05_couplers_AWCACHE : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWLEN : STD_LOGIC_VECTOR ( 47 downto 40 );
  signal xbar_to_m05_couplers_AWLOCK : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWQOS : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWREGION : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_AWSIZE : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WLAST : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARBURST : STD_LOGIC_VECTOR ( 13 downto 12 );
  signal xbar_to_m06_couplers_ARCACHE : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_ARLEN : STD_LOGIC_VECTOR ( 55 downto 48 );
  signal xbar_to_m06_couplers_ARLOCK : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_ARSIZE : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWBURST : STD_LOGIC_VECTOR ( 13 downto 12 );
  signal xbar_to_m06_couplers_AWCACHE : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_AWLEN : STD_LOGIC_VECTOR ( 55 downto 48 );
  signal xbar_to_m06_couplers_AWLOCK : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_AWSIZE : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WLAST : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal NLW_xbar_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal NLW_xbar_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal NLW_xbar_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal NLW_xbar_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 27 downto 24 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_ps7_0_axi_periph_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_ps7_0_axi_periph_AWVALID;
  M00_AXI_bready <= m00_couplers_to_ps7_0_axi_periph_BREADY;
  M00_AXI_rready <= m00_couplers_to_ps7_0_axi_periph_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_ps7_0_axi_periph_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_ps7_0_axi_periph_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_ps7_0_axi_periph_AWVALID;
  M01_AXI_bready <= m01_couplers_to_ps7_0_axi_periph_BREADY;
  M01_AXI_rready <= m01_couplers_to_ps7_0_axi_periph_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_ps7_0_axi_periph_WVALID;
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1 <= M02_ARESETN;
  M02_AXI_araddr(31 downto 0) <= m02_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_ps7_0_axi_periph_ARVALID;
  M02_AXI_awaddr(31 downto 0) <= m02_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_ps7_0_axi_periph_AWVALID;
  M02_AXI_bready <= m02_couplers_to_ps7_0_axi_periph_BREADY;
  M02_AXI_rready <= m02_couplers_to_ps7_0_axi_periph_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_ps7_0_axi_periph_WVALID;
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1 <= M03_ARESETN;
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_ps7_0_axi_periph_ARVALID;
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_ps7_0_axi_periph_AWVALID;
  M03_AXI_bready <= m03_couplers_to_ps7_0_axi_periph_BREADY;
  M03_AXI_rready <= m03_couplers_to_ps7_0_axi_periph_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_ps7_0_axi_periph_WVALID;
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1 <= M04_ARESETN;
  M04_AXI_araddr(31 downto 0) <= m04_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M04_AXI_arvalid <= m04_couplers_to_ps7_0_axi_periph_ARVALID;
  M04_AXI_awaddr(31 downto 0) <= m04_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M04_AXI_awvalid <= m04_couplers_to_ps7_0_axi_periph_AWVALID;
  M04_AXI_bready <= m04_couplers_to_ps7_0_axi_periph_BREADY;
  M04_AXI_rready <= m04_couplers_to_ps7_0_axi_periph_RREADY;
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M04_AXI_wvalid <= m04_couplers_to_ps7_0_axi_periph_WVALID;
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1 <= M05_ARESETN;
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_ps7_0_axi_periph_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_ps7_0_axi_periph_AWVALID;
  M05_AXI_bready <= m05_couplers_to_ps7_0_axi_periph_BREADY;
  M05_AXI_rready <= m05_couplers_to_ps7_0_axi_periph_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_ps7_0_axi_periph_WVALID;
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1 <= M06_ARESETN;
  M06_AXI_araddr(31 downto 0) <= m06_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M06_AXI_arburst(1 downto 0) <= m06_couplers_to_ps7_0_axi_periph_ARBURST(1 downto 0);
  M06_AXI_arcache(3 downto 0) <= m06_couplers_to_ps7_0_axi_periph_ARCACHE(3 downto 0);
  M06_AXI_arlen(7 downto 0) <= m06_couplers_to_ps7_0_axi_periph_ARLEN(7 downto 0);
  M06_AXI_arlock <= m06_couplers_to_ps7_0_axi_periph_ARLOCK;
  M06_AXI_arprot(2 downto 0) <= m06_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0);
  M06_AXI_arsize(2 downto 0) <= m06_couplers_to_ps7_0_axi_periph_ARSIZE(2 downto 0);
  M06_AXI_arvalid <= m06_couplers_to_ps7_0_axi_periph_ARVALID;
  M06_AXI_awaddr(31 downto 0) <= m06_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M06_AXI_awburst(1 downto 0) <= m06_couplers_to_ps7_0_axi_periph_AWBURST(1 downto 0);
  M06_AXI_awcache(3 downto 0) <= m06_couplers_to_ps7_0_axi_periph_AWCACHE(3 downto 0);
  M06_AXI_awlen(7 downto 0) <= m06_couplers_to_ps7_0_axi_periph_AWLEN(7 downto 0);
  M06_AXI_awlock <= m06_couplers_to_ps7_0_axi_periph_AWLOCK;
  M06_AXI_awprot(2 downto 0) <= m06_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0);
  M06_AXI_awsize(2 downto 0) <= m06_couplers_to_ps7_0_axi_periph_AWSIZE(2 downto 0);
  M06_AXI_awvalid <= m06_couplers_to_ps7_0_axi_periph_AWVALID;
  M06_AXI_bready <= m06_couplers_to_ps7_0_axi_periph_BREADY;
  M06_AXI_rready <= m06_couplers_to_ps7_0_axi_periph_RREADY;
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M06_AXI_wlast <= m06_couplers_to_ps7_0_axi_periph_WLAST;
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M06_AXI_wvalid <= m06_couplers_to_ps7_0_axi_periph_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= ps7_0_axi_periph_to_s00_couplers_ARREADY;
  S00_AXI_awready <= ps7_0_axi_periph_to_s00_couplers_AWREADY;
  S00_AXI_bid(11 downto 0) <= ps7_0_axi_periph_to_s00_couplers_BID(11 downto 0);
  S00_AXI_bresp(1 downto 0) <= ps7_0_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= ps7_0_axi_periph_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= ps7_0_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(11 downto 0) <= ps7_0_axi_periph_to_s00_couplers_RID(11 downto 0);
  S00_AXI_rlast <= ps7_0_axi_periph_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= ps7_0_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= ps7_0_axi_periph_to_s00_couplers_RVALID;
  S00_AXI_wready <= ps7_0_axi_periph_to_s00_couplers_WREADY;
  m00_couplers_to_ps7_0_axi_periph_ARREADY <= M00_AXI_arready;
  m00_couplers_to_ps7_0_axi_periph_AWREADY <= M00_AXI_awready;
  m00_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_ps7_0_axi_periph_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_ps7_0_axi_periph_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_ps7_0_axi_periph_WREADY <= M00_AXI_wready;
  m01_couplers_to_ps7_0_axi_periph_ARREADY <= M01_AXI_arready;
  m01_couplers_to_ps7_0_axi_periph_AWREADY <= M01_AXI_awready;
  m01_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_ps7_0_axi_periph_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_ps7_0_axi_periph_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_ps7_0_axi_periph_WREADY <= M01_AXI_wready;
  m02_couplers_to_ps7_0_axi_periph_ARREADY <= M02_AXI_arready;
  m02_couplers_to_ps7_0_axi_periph_AWREADY <= M02_AXI_awready;
  m02_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_ps7_0_axi_periph_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_ps7_0_axi_periph_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_ps7_0_axi_periph_WREADY <= M02_AXI_wready;
  m03_couplers_to_ps7_0_axi_periph_ARREADY <= M03_AXI_arready;
  m03_couplers_to_ps7_0_axi_periph_AWREADY <= M03_AXI_awready;
  m03_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_ps7_0_axi_periph_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_ps7_0_axi_periph_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_ps7_0_axi_periph_WREADY <= M03_AXI_wready;
  m04_couplers_to_ps7_0_axi_periph_ARREADY <= M04_AXI_arready;
  m04_couplers_to_ps7_0_axi_periph_AWREADY <= M04_AXI_awready;
  m04_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_ps7_0_axi_periph_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_ps7_0_axi_periph_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_ps7_0_axi_periph_WREADY <= M04_AXI_wready;
  m05_couplers_to_ps7_0_axi_periph_ARREADY <= M05_AXI_arready;
  m05_couplers_to_ps7_0_axi_periph_AWREADY <= M05_AXI_awready;
  m05_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_ps7_0_axi_periph_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_ps7_0_axi_periph_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_ps7_0_axi_periph_WREADY <= M05_AXI_wready;
  m06_couplers_to_ps7_0_axi_periph_ARREADY <= M06_AXI_arready;
  m06_couplers_to_ps7_0_axi_periph_AWREADY <= M06_AXI_awready;
  m06_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_ps7_0_axi_periph_BVALID <= M06_AXI_bvalid;
  m06_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_ps7_0_axi_periph_RLAST <= M06_AXI_rlast;
  m06_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_ps7_0_axi_periph_RVALID <= M06_AXI_rvalid;
  m06_couplers_to_ps7_0_axi_periph_WREADY <= M06_AXI_wready;
  ps7_0_axi_periph_ACLK_net <= ACLK;
  ps7_0_axi_periph_ARESETN_net <= ARESETN;
  ps7_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARID(11 downto 0) <= S00_AXI_arid(11 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARLEN(3 downto 0) <= S00_AXI_arlen(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARLOCK(1 downto 0) <= S00_AXI_arlock(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  ps7_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWID(11 downto 0) <= S00_AXI_awid(11 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWLEN(3 downto 0) <= S00_AXI_awlen(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWLOCK(1 downto 0) <= S00_AXI_awlock(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  ps7_0_axi_periph_to_s00_couplers_BREADY <= S00_AXI_bready;
  ps7_0_axi_periph_to_s00_couplers_RREADY <= S00_AXI_rready;
  ps7_0_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  ps7_0_axi_periph_to_s00_couplers_WID(11 downto 0) <= S00_AXI_wid(11 downto 0);
  ps7_0_axi_periph_to_s00_couplers_WLAST <= S00_AXI_wlast;
  ps7_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_WVALID <= S00_AXI_wvalid;
m00_couplers: entity work.m00_couplers_imp_7NK3JT
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m00_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m00_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m00_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m00_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m00_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m00_couplers_RLAST,
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1IXSFWC
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m01_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m01_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m01_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m01_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m01_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wvalid => m01_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arburst(1 downto 0) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      S_AXI_arcache(3 downto 0) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      S_AXI_arlen(7 downto 0) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      S_AXI_arlock(0) => xbar_to_m01_couplers_ARLOCK(1),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arqos(3 downto 0) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      S_AXI_arsize(2 downto 0) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awburst(1 downto 0) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      S_AXI_awcache(3 downto 0) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      S_AXI_awlen(7 downto 0) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      S_AXI_awlock(0) => xbar_to_m01_couplers_AWLOCK(1),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awqos(3 downto 0) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      S_AXI_awsize(2 downto 0) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m01_couplers_RLAST,
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wlast => xbar_to_m01_couplers_WLAST(1),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_YCJ54I
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN => M02_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m02_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m02_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m02_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m02_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m02_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m02_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arburst(1 downto 0) => xbar_to_m02_couplers_ARBURST(5 downto 4),
      S_AXI_arcache(3 downto 0) => xbar_to_m02_couplers_ARCACHE(11 downto 8),
      S_AXI_arlen(7 downto 0) => xbar_to_m02_couplers_ARLEN(23 downto 16),
      S_AXI_arlock(0) => xbar_to_m02_couplers_ARLOCK(2),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arqos(3 downto 0) => xbar_to_m02_couplers_ARQOS(11 downto 8),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m02_couplers_ARREGION(11 downto 8),
      S_AXI_arsize(2 downto 0) => xbar_to_m02_couplers_ARSIZE(8 downto 6),
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awburst(1 downto 0) => xbar_to_m02_couplers_AWBURST(5 downto 4),
      S_AXI_awcache(3 downto 0) => xbar_to_m02_couplers_AWCACHE(11 downto 8),
      S_AXI_awlen(7 downto 0) => xbar_to_m02_couplers_AWLEN(23 downto 16),
      S_AXI_awlock(0) => xbar_to_m02_couplers_AWLOCK(2),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awqos(3 downto 0) => xbar_to_m02_couplers_AWQOS(11 downto 8),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m02_couplers_AWREGION(11 downto 8),
      S_AXI_awsize(2 downto 0) => xbar_to_m02_couplers_AWSIZE(8 downto 6),
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m02_couplers_RLAST,
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wlast => xbar_to_m02_couplers_WLAST(2),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1A5Q2PJ
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN => M03_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m03_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m03_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m03_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m03_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m03_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arburst(1 downto 0) => xbar_to_m03_couplers_ARBURST(7 downto 6),
      S_AXI_arcache(3 downto 0) => xbar_to_m03_couplers_ARCACHE(15 downto 12),
      S_AXI_arlen(7 downto 0) => xbar_to_m03_couplers_ARLEN(31 downto 24),
      S_AXI_arlock(0) => xbar_to_m03_couplers_ARLOCK(3),
      S_AXI_arprot(2 downto 0) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      S_AXI_arqos(3 downto 0) => xbar_to_m03_couplers_ARQOS(15 downto 12),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m03_couplers_ARREGION(15 downto 12),
      S_AXI_arsize(2 downto 0) => xbar_to_m03_couplers_ARSIZE(11 downto 9),
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awburst(1 downto 0) => xbar_to_m03_couplers_AWBURST(7 downto 6),
      S_AXI_awcache(3 downto 0) => xbar_to_m03_couplers_AWCACHE(15 downto 12),
      S_AXI_awlen(7 downto 0) => xbar_to_m03_couplers_AWLEN(31 downto 24),
      S_AXI_awlock(0) => xbar_to_m03_couplers_AWLOCK(3),
      S_AXI_awprot(2 downto 0) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      S_AXI_awqos(3 downto 0) => xbar_to_m03_couplers_AWQOS(15 downto 12),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m03_couplers_AWREGION(15 downto 12),
      S_AXI_awsize(2 downto 0) => xbar_to_m03_couplers_AWSIZE(11 downto 9),
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m03_couplers_RLAST,
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wlast => xbar_to_m03_couplers_WLAST(3),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_1OTDC33
     port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN => M04_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m04_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m04_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m04_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m04_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m04_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m04_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m04_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m04_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m04_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m04_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m04_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m04_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m04_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m04_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m04_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m04_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      S_AXI_arburst(1 downto 0) => xbar_to_m04_couplers_ARBURST(9 downto 8),
      S_AXI_arcache(3 downto 0) => xbar_to_m04_couplers_ARCACHE(19 downto 16),
      S_AXI_arlen(7 downto 0) => xbar_to_m04_couplers_ARLEN(39 downto 32),
      S_AXI_arlock(0) => xbar_to_m04_couplers_ARLOCK(4),
      S_AXI_arprot(2 downto 0) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      S_AXI_arqos(3 downto 0) => xbar_to_m04_couplers_ARQOS(19 downto 16),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m04_couplers_ARREGION(19 downto 16),
      S_AXI_arsize(2 downto 0) => xbar_to_m04_couplers_ARSIZE(14 downto 12),
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(31 downto 0) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      S_AXI_awburst(1 downto 0) => xbar_to_m04_couplers_AWBURST(9 downto 8),
      S_AXI_awcache(3 downto 0) => xbar_to_m04_couplers_AWCACHE(19 downto 16),
      S_AXI_awlen(7 downto 0) => xbar_to_m04_couplers_AWLEN(39 downto 32),
      S_AXI_awlock(0) => xbar_to_m04_couplers_AWLOCK(4),
      S_AXI_awprot(2 downto 0) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      S_AXI_awqos(3 downto 0) => xbar_to_m04_couplers_AWQOS(19 downto 16),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m04_couplers_AWREGION(19 downto 16),
      S_AXI_awsize(2 downto 0) => xbar_to_m04_couplers_AWSIZE(14 downto 12),
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m04_couplers_RLAST,
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wlast => xbar_to_m04_couplers_WLAST(4),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1V6RCA
     port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN => M05_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m05_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m05_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m05_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m05_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m05_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m05_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m05_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arburst(1 downto 0) => xbar_to_m05_couplers_ARBURST(11 downto 10),
      S_AXI_arcache(3 downto 0) => xbar_to_m05_couplers_ARCACHE(23 downto 20),
      S_AXI_arlen(7 downto 0) => xbar_to_m05_couplers_ARLEN(47 downto 40),
      S_AXI_arlock(0) => xbar_to_m05_couplers_ARLOCK(5),
      S_AXI_arprot(2 downto 0) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      S_AXI_arqos(3 downto 0) => xbar_to_m05_couplers_ARQOS(23 downto 20),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m05_couplers_ARREGION(23 downto 20),
      S_AXI_arsize(2 downto 0) => xbar_to_m05_couplers_ARSIZE(17 downto 15),
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awburst(1 downto 0) => xbar_to_m05_couplers_AWBURST(11 downto 10),
      S_AXI_awcache(3 downto 0) => xbar_to_m05_couplers_AWCACHE(23 downto 20),
      S_AXI_awlen(7 downto 0) => xbar_to_m05_couplers_AWLEN(47 downto 40),
      S_AXI_awlock(0) => xbar_to_m05_couplers_AWLOCK(5),
      S_AXI_awprot(2 downto 0) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      S_AXI_awqos(3 downto 0) => xbar_to_m05_couplers_AWQOS(23 downto 20),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m05_couplers_AWREGION(23 downto 20),
      S_AXI_awsize(2 downto 0) => xbar_to_m05_couplers_AWSIZE(17 downto 15),
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m05_couplers_RLAST,
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wlast => xbar_to_m05_couplers_WLAST(5),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_1G0EH44
     port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN => M06_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m06_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m06_couplers_to_ps7_0_axi_periph_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m06_couplers_to_ps7_0_axi_periph_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => m06_couplers_to_ps7_0_axi_periph_ARLEN(7 downto 0),
      M_AXI_arlock => m06_couplers_to_ps7_0_axi_periph_ARLOCK,
      M_AXI_arprot(2 downto 0) => m06_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m06_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arsize(2 downto 0) => m06_couplers_to_ps7_0_axi_periph_ARSIZE(2 downto 0),
      M_AXI_arvalid => m06_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m06_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m06_couplers_to_ps7_0_axi_periph_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m06_couplers_to_ps7_0_axi_periph_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => m06_couplers_to_ps7_0_axi_periph_AWLEN(7 downto 0),
      M_AXI_awlock => m06_couplers_to_ps7_0_axi_periph_AWLOCK,
      M_AXI_awprot(2 downto 0) => m06_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m06_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awsize(2 downto 0) => m06_couplers_to_ps7_0_axi_periph_AWSIZE(2 downto 0),
      M_AXI_awvalid => m06_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m06_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m06_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m06_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m06_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rlast => m06_couplers_to_ps7_0_axi_periph_RLAST,
      M_AXI_rready => m06_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m06_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m06_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m06_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wlast => m06_couplers_to_ps7_0_axi_periph_WLAST,
      M_AXI_wready => m06_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m06_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      S_AXI_arburst(1 downto 0) => xbar_to_m06_couplers_ARBURST(13 downto 12),
      S_AXI_arcache(3 downto 0) => xbar_to_m06_couplers_ARCACHE(27 downto 24),
      S_AXI_arlen(7 downto 0) => xbar_to_m06_couplers_ARLEN(55 downto 48),
      S_AXI_arlock => xbar_to_m06_couplers_ARLOCK(6),
      S_AXI_arprot(2 downto 0) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      S_AXI_arready => xbar_to_m06_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => xbar_to_m06_couplers_ARSIZE(20 downto 18),
      S_AXI_arvalid => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(31 downto 0) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      S_AXI_awburst(1 downto 0) => xbar_to_m06_couplers_AWBURST(13 downto 12),
      S_AXI_awcache(3 downto 0) => xbar_to_m06_couplers_AWCACHE(27 downto 24),
      S_AXI_awlen(7 downto 0) => xbar_to_m06_couplers_AWLEN(55 downto 48),
      S_AXI_awlock => xbar_to_m06_couplers_AWLOCK(6),
      S_AXI_awprot(2 downto 0) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      S_AXI_awready => xbar_to_m06_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => xbar_to_m06_couplers_AWSIZE(20 downto 18),
      S_AXI_awvalid => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m06_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rlast => xbar_to_m06_couplers_RLAST,
      S_AXI_rready => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m06_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wlast => xbar_to_m06_couplers_WLAST(6),
      S_AXI_wready => xbar_to_m06_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid => xbar_to_m06_couplers_WVALID(6)
    );
s00_couplers: entity work.s00_couplers_imp_1DJAG1V
     port map (
      M_ACLK => ps7_0_axi_periph_ACLK_net,
      M_ARESETN => ps7_0_axi_periph_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arid(11 downto 0) => s00_couplers_to_xbar_ARID(11 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awid(11 downto 0) => s00_couplers_to_xbar_AWID(11 downto 0),
      M_AXI_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bid(11 downto 0) => s00_couplers_to_xbar_BID(11 downto 0),
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rid(11 downto 0) => s00_couplers_to_xbar_RID(11 downto 0),
      M_AXI_rlast => s00_couplers_to_xbar_RLAST(0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wlast => s00_couplers_to_xbar_WLAST,
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARID(11 downto 0),
      S_AXI_arlen(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARLEN(3 downto 0),
      S_AXI_arlock(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARLOCK(1 downto 0),
      S_AXI_arprot(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => ps7_0_axi_periph_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => ps7_0_axi_periph_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWID(11 downto 0),
      S_AXI_awlen(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWLEN(3 downto 0),
      S_AXI_awlock(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWLOCK(1 downto 0),
      S_AXI_awprot(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => ps7_0_axi_periph_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => ps7_0_axi_periph_to_s00_couplers_AWVALID,
      S_AXI_bid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_BID(11 downto 0),
      S_AXI_bready => ps7_0_axi_periph_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => ps7_0_axi_periph_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_RID(11 downto 0),
      S_AXI_rlast => ps7_0_axi_periph_to_s00_couplers_RLAST,
      S_AXI_rready => ps7_0_axi_periph_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => ps7_0_axi_periph_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_WID(11 downto 0),
      S_AXI_wlast => ps7_0_axi_periph_to_s00_couplers_WLAST,
      S_AXI_wready => ps7_0_axi_periph_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => ps7_0_axi_periph_to_s00_couplers_WVALID
    );
xbar: component brd_xbar_0
     port map (
      aclk => ps7_0_axi_periph_ACLK_net,
      aresetn => ps7_0_axi_periph_ARESETN_net,
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(13 downto 12) => xbar_to_m06_couplers_ARBURST(13 downto 12),
      m_axi_arburst(11 downto 10) => xbar_to_m05_couplers_ARBURST(11 downto 10),
      m_axi_arburst(9 downto 8) => xbar_to_m04_couplers_ARBURST(9 downto 8),
      m_axi_arburst(7 downto 6) => xbar_to_m03_couplers_ARBURST(7 downto 6),
      m_axi_arburst(5 downto 4) => xbar_to_m02_couplers_ARBURST(5 downto 4),
      m_axi_arburst(3 downto 2) => xbar_to_m01_couplers_ARBURST(3 downto 2),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(27 downto 24) => xbar_to_m06_couplers_ARCACHE(27 downto 24),
      m_axi_arcache(23 downto 20) => xbar_to_m05_couplers_ARCACHE(23 downto 20),
      m_axi_arcache(19 downto 16) => xbar_to_m04_couplers_ARCACHE(19 downto 16),
      m_axi_arcache(15 downto 12) => xbar_to_m03_couplers_ARCACHE(15 downto 12),
      m_axi_arcache(11 downto 8) => xbar_to_m02_couplers_ARCACHE(11 downto 8),
      m_axi_arcache(7 downto 4) => xbar_to_m01_couplers_ARCACHE(7 downto 4),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(55 downto 48) => xbar_to_m06_couplers_ARLEN(55 downto 48),
      m_axi_arlen(47 downto 40) => xbar_to_m05_couplers_ARLEN(47 downto 40),
      m_axi_arlen(39 downto 32) => xbar_to_m04_couplers_ARLEN(39 downto 32),
      m_axi_arlen(31 downto 24) => xbar_to_m03_couplers_ARLEN(31 downto 24),
      m_axi_arlen(23 downto 16) => xbar_to_m02_couplers_ARLEN(23 downto 16),
      m_axi_arlen(15 downto 8) => xbar_to_m01_couplers_ARLEN(15 downto 8),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(6) => xbar_to_m06_couplers_ARLOCK(6),
      m_axi_arlock(5) => xbar_to_m05_couplers_ARLOCK(5),
      m_axi_arlock(4) => xbar_to_m04_couplers_ARLOCK(4),
      m_axi_arlock(3) => xbar_to_m03_couplers_ARLOCK(3),
      m_axi_arlock(2) => xbar_to_m02_couplers_ARLOCK(2),
      m_axi_arlock(1) => xbar_to_m01_couplers_ARLOCK(1),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(20 downto 18) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      m_axi_arprot(17 downto 15) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      m_axi_arprot(14 downto 12) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      m_axi_arprot(11 downto 9) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(27 downto 24) => NLW_xbar_m_axi_arqos_UNCONNECTED(27 downto 24),
      m_axi_arqos(23 downto 20) => xbar_to_m05_couplers_ARQOS(23 downto 20),
      m_axi_arqos(19 downto 16) => xbar_to_m04_couplers_ARQOS(19 downto 16),
      m_axi_arqos(15 downto 12) => xbar_to_m03_couplers_ARQOS(15 downto 12),
      m_axi_arqos(11 downto 8) => xbar_to_m02_couplers_ARQOS(11 downto 8),
      m_axi_arqos(7 downto 4) => xbar_to_m01_couplers_ARQOS(7 downto 4),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY,
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arregion(27 downto 24) => NLW_xbar_m_axi_arregion_UNCONNECTED(27 downto 24),
      m_axi_arregion(23 downto 20) => xbar_to_m05_couplers_ARREGION(23 downto 20),
      m_axi_arregion(19 downto 16) => xbar_to_m04_couplers_ARREGION(19 downto 16),
      m_axi_arregion(15 downto 12) => xbar_to_m03_couplers_ARREGION(15 downto 12),
      m_axi_arregion(11 downto 8) => xbar_to_m02_couplers_ARREGION(11 downto 8),
      m_axi_arregion(7 downto 4) => xbar_to_m01_couplers_ARREGION(7 downto 4),
      m_axi_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      m_axi_arsize(20 downto 18) => xbar_to_m06_couplers_ARSIZE(20 downto 18),
      m_axi_arsize(17 downto 15) => xbar_to_m05_couplers_ARSIZE(17 downto 15),
      m_axi_arsize(14 downto 12) => xbar_to_m04_couplers_ARSIZE(14 downto 12),
      m_axi_arsize(11 downto 9) => xbar_to_m03_couplers_ARSIZE(11 downto 9),
      m_axi_arsize(8 downto 6) => xbar_to_m02_couplers_ARSIZE(8 downto 6),
      m_axi_arsize(5 downto 3) => xbar_to_m01_couplers_ARSIZE(5 downto 3),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(13 downto 12) => xbar_to_m06_couplers_AWBURST(13 downto 12),
      m_axi_awburst(11 downto 10) => xbar_to_m05_couplers_AWBURST(11 downto 10),
      m_axi_awburst(9 downto 8) => xbar_to_m04_couplers_AWBURST(9 downto 8),
      m_axi_awburst(7 downto 6) => xbar_to_m03_couplers_AWBURST(7 downto 6),
      m_axi_awburst(5 downto 4) => xbar_to_m02_couplers_AWBURST(5 downto 4),
      m_axi_awburst(3 downto 2) => xbar_to_m01_couplers_AWBURST(3 downto 2),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(27 downto 24) => xbar_to_m06_couplers_AWCACHE(27 downto 24),
      m_axi_awcache(23 downto 20) => xbar_to_m05_couplers_AWCACHE(23 downto 20),
      m_axi_awcache(19 downto 16) => xbar_to_m04_couplers_AWCACHE(19 downto 16),
      m_axi_awcache(15 downto 12) => xbar_to_m03_couplers_AWCACHE(15 downto 12),
      m_axi_awcache(11 downto 8) => xbar_to_m02_couplers_AWCACHE(11 downto 8),
      m_axi_awcache(7 downto 4) => xbar_to_m01_couplers_AWCACHE(7 downto 4),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(55 downto 48) => xbar_to_m06_couplers_AWLEN(55 downto 48),
      m_axi_awlen(47 downto 40) => xbar_to_m05_couplers_AWLEN(47 downto 40),
      m_axi_awlen(39 downto 32) => xbar_to_m04_couplers_AWLEN(39 downto 32),
      m_axi_awlen(31 downto 24) => xbar_to_m03_couplers_AWLEN(31 downto 24),
      m_axi_awlen(23 downto 16) => xbar_to_m02_couplers_AWLEN(23 downto 16),
      m_axi_awlen(15 downto 8) => xbar_to_m01_couplers_AWLEN(15 downto 8),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(6) => xbar_to_m06_couplers_AWLOCK(6),
      m_axi_awlock(5) => xbar_to_m05_couplers_AWLOCK(5),
      m_axi_awlock(4) => xbar_to_m04_couplers_AWLOCK(4),
      m_axi_awlock(3) => xbar_to_m03_couplers_AWLOCK(3),
      m_axi_awlock(2) => xbar_to_m02_couplers_AWLOCK(2),
      m_axi_awlock(1) => xbar_to_m01_couplers_AWLOCK(1),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(20 downto 18) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      m_axi_awprot(17 downto 15) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      m_axi_awprot(14 downto 12) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      m_axi_awprot(11 downto 9) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(27 downto 24) => NLW_xbar_m_axi_awqos_UNCONNECTED(27 downto 24),
      m_axi_awqos(23 downto 20) => xbar_to_m05_couplers_AWQOS(23 downto 20),
      m_axi_awqos(19 downto 16) => xbar_to_m04_couplers_AWQOS(19 downto 16),
      m_axi_awqos(15 downto 12) => xbar_to_m03_couplers_AWQOS(15 downto 12),
      m_axi_awqos(11 downto 8) => xbar_to_m02_couplers_AWQOS(11 downto 8),
      m_axi_awqos(7 downto 4) => xbar_to_m01_couplers_AWQOS(7 downto 4),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY,
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awregion(27 downto 24) => NLW_xbar_m_axi_awregion_UNCONNECTED(27 downto 24),
      m_axi_awregion(23 downto 20) => xbar_to_m05_couplers_AWREGION(23 downto 20),
      m_axi_awregion(19 downto 16) => xbar_to_m04_couplers_AWREGION(19 downto 16),
      m_axi_awregion(15 downto 12) => xbar_to_m03_couplers_AWREGION(15 downto 12),
      m_axi_awregion(11 downto 8) => xbar_to_m02_couplers_AWREGION(11 downto 8),
      m_axi_awregion(7 downto 4) => xbar_to_m01_couplers_AWREGION(7 downto 4),
      m_axi_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      m_axi_awsize(20 downto 18) => xbar_to_m06_couplers_AWSIZE(20 downto 18),
      m_axi_awsize(17 downto 15) => xbar_to_m05_couplers_AWSIZE(17 downto 15),
      m_axi_awsize(14 downto 12) => xbar_to_m04_couplers_AWSIZE(14 downto 12),
      m_axi_awsize(11 downto 9) => xbar_to_m03_couplers_AWSIZE(11 downto 9),
      m_axi_awsize(8 downto 6) => xbar_to_m02_couplers_AWSIZE(8 downto 6),
      m_axi_awsize(5 downto 3) => xbar_to_m01_couplers_AWSIZE(5 downto 3),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID,
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rlast(6) => xbar_to_m06_couplers_RLAST,
      m_axi_rlast(5) => xbar_to_m05_couplers_RLAST,
      m_axi_rlast(4) => xbar_to_m04_couplers_RLAST,
      m_axi_rlast(3) => xbar_to_m03_couplers_RLAST,
      m_axi_rlast(2) => xbar_to_m02_couplers_RLAST,
      m_axi_rlast(1) => xbar_to_m01_couplers_RLAST,
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST,
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID,
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wlast(6) => xbar_to_m06_couplers_WLAST(6),
      m_axi_wlast(5) => xbar_to_m05_couplers_WLAST(5),
      m_axi_wlast(4) => xbar_to_m04_couplers_WLAST(4),
      m_axi_wlast(3) => xbar_to_m03_couplers_WLAST(3),
      m_axi_wlast(2) => xbar_to_m02_couplers_WLAST(2),
      m_axi_wlast(1) => xbar_to_m01_couplers_WLAST(1),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY,
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_xbar_ARID(11 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlock(0) => s00_couplers_to_xbar_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_xbar_ARQOS(3 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_xbar_AWID(11 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlock(0) => s00_couplers_to_xbar_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_xbar_BID(11 downto 0),
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_xbar_RID(11 downto 0),
      s_axi_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wlast(0) => s00_couplers_to_xbar_WLAST,
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity brd is
  port (
    ChipBiasAddrSelect_SBO_0 : out STD_LOGIC;
    ChipBiasBitIn_DO_0 : out STD_LOGIC;
    ChipBiasClock_CBO_0 : out STD_LOGIC;
    ChipBiasDiagSelect_SO_0 : out STD_LOGIC;
    ChipBiasEnable_SO_0 : out STD_LOGIC;
    ChipBiasLatch_SBO_0 : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DVSAERAck_SBO_0 : out STD_LOGIC;
    DVSAERData_AI_0 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DVSAERReq_ABI_0 : in STD_LOGIC;
    DVSAERReset_SBO_0 : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    IMUClock_CZO_0 : out STD_LOGIC;
    IMUData_DZIO_0 : inout STD_LOGIC;
    IMUFSync_SO_0 : out STD_LOGIC;
    IMUInterrupt_AI_0 : in STD_LOGIC;
    SyncInClock_AI_0 : in STD_LOGIC;
    SyncInSignal1_AI_0 : in STD_LOGIC;
    SyncInSignal2_AI_0 : in STD_LOGIC;
    SyncInSignal_AI_0 : in STD_LOGIC;
    SyncOutClock_CO_0 : out STD_LOGIC;
    SyncOutSignal_SO_0 : out STD_LOGIC;
    ULPI_data_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ULPI_data_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ULPI_data_t : out STD_LOGIC;
    ULPI_dir : in STD_LOGIC;
    ULPI_next : in STD_LOGIC;
    ULPI_rst : out STD_LOGIC;
    ULPI_stop : out STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    led_0 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    vid_data : out STD_LOGIC_VECTOR ( 23 downto 0 );
    vid_hsync : out STD_LOGIC;
    vid_vsync : out STD_LOGIC
  );
  attribute core_generation_info : string;
  attribute core_generation_info of brd : entity is "brd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=brd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=43,numReposBlks=34,numNonXlnxBlks=0,numHierBlks=9,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=4,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=20,da_clkrst_cnt=3,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of brd : entity is "brd.hwdef";
end brd;

architecture STRUCTURE of brd is
  component brd_axi_gpio_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_axi_gpio_0_0;
  component brd_axi_vdma_0_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axis_mm2s_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    s_axis_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mm2s_frame_ptr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s2mm_frame_ptr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_mm2s_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_s2mm_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component brd_axi_vdma_0_0;
  component brd_const_HIGH_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_const_HIGH_0;
  component brd_const_VCC_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_const_VCC_0;
  component brd_proc_sys_reset_0_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_proc_sys_reset_0_0;
  component brd_proc_sys_reset_1_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_proc_sys_reset_1_0;
  component brd_processing_system7_0_0 is
  port (
    I2C1_SDA_I : in STD_LOGIC;
    I2C1_SDA_O : out STD_LOGIC;
    I2C1_SDA_T : out STD_LOGIC;
    I2C1_SCL_I : in STD_LOGIC;
    I2C1_SCL_O : out STD_LOGIC;
    I2C1_SCL_T : out STD_LOGIC;
    SPI0_SCLK_I : in STD_LOGIC;
    SPI0_SCLK_O : out STD_LOGIC;
    SPI0_SCLK_T : out STD_LOGIC;
    SPI0_MOSI_I : in STD_LOGIC;
    SPI0_MOSI_O : out STD_LOGIC;
    SPI0_MOSI_T : out STD_LOGIC;
    SPI0_MISO_I : in STD_LOGIC;
    SPI0_MISO_O : out STD_LOGIC;
    SPI0_MISO_T : out STD_LOGIC;
    SPI0_SS_I : in STD_LOGIC;
    SPI0_SS_O : out STD_LOGIC;
    SPI0_SS1_O : out STD_LOGIC;
    SPI0_SS2_O : out STD_LOGIC;
    SPI0_SS_T : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    USB1_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB1_VBUS_PWRSELECT : out STD_LOGIC;
    USB1_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    IRQ_F2P : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_CLK1 : out STD_LOGIC;
    FCLK_CLK2 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component brd_processing_system7_0_0;
  component brd_v_axi4s_vid_out_0_0 is
  port (
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_video_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_video_tvalid : in STD_LOGIC;
    s_axis_video_tready : out STD_LOGIC;
    s_axis_video_tuser : in STD_LOGIC;
    s_axis_video_tlast : in STD_LOGIC;
    fid : in STD_LOGIC;
    vid_io_out_clk : in STD_LOGIC;
    vid_io_out_ce : in STD_LOGIC;
    vid_io_out_reset : in STD_LOGIC;
    vid_active_video : out STD_LOGIC;
    vid_vsync : out STD_LOGIC;
    vid_hsync : out STD_LOGIC;
    vid_vblank : out STD_LOGIC;
    vid_hblank : out STD_LOGIC;
    vid_field_id : out STD_LOGIC;
    vid_data : out STD_LOGIC_VECTOR ( 23 downto 0 );
    vtg_vsync : in STD_LOGIC;
    vtg_hsync : in STD_LOGIC;
    vtg_vblank : in STD_LOGIC;
    vtg_hblank : in STD_LOGIC;
    vtg_active_video : in STD_LOGIC;
    vtg_field_id : in STD_LOGIC;
    vtg_ce : out STD_LOGIC;
    locked : out STD_LOGIC;
    overflow : out STD_LOGIC;
    underflow : out STD_LOGIC;
    status : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_v_axi4s_vid_out_0_0;
  component brd_v_tc_0_0 is
  port (
    clk : in STD_LOGIC;
    clken : in STD_LOGIC;
    gen_clken : in STD_LOGIC;
    hsync_out : out STD_LOGIC;
    hblank_out : out STD_LOGIC;
    vsync_out : out STD_LOGIC;
    vblank_out : out STD_LOGIC;
    active_video_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    fsync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_v_tc_0_0;
  component brd_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_xlslice_0_0;
  component brd_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_xlslice_1_0;
  component brd_const_ZERO_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component brd_const_ZERO_0;
  component brd_LEDShifter_0_0 is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component brd_LEDShifter_0_0;
  component brd_axi_smc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_wlast : in STD_LOGIC;
    S01_AXI_wvalid : in STD_LOGIC;
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    S02_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_awvalid : in STD_LOGIC;
    S02_AXI_awready : out STD_LOGIC;
    S02_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_wlast : in STD_LOGIC;
    S02_AXI_wvalid : in STD_LOGIC;
    S02_AXI_wready : out STD_LOGIC;
    S02_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_bvalid : out STD_LOGIC;
    S02_AXI_bready : in STD_LOGIC;
    S02_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S02_AXI_arvalid : in STD_LOGIC;
    S02_AXI_arready : out STD_LOGIC;
    S02_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S02_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S02_AXI_rlast : out STD_LOGIC;
    S02_AXI_rvalid : out STD_LOGIC;
    S02_AXI_rready : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC
  );
  end component brd_axi_smc_0;
  component brd_testAERDVSSM_0_0 is
  port (
    USBClock_CI : in STD_LOGIC;
    LogicClk_CI : in STD_LOGIC;
    ADCClk_CI : in STD_LOGIC;
    Reset_RI : in STD_LOGIC;
    SPISlaveSelect_ABI : in STD_LOGIC;
    SPIClock_AI : in STD_LOGIC;
    SPIMOSI_AI : in STD_LOGIC;
    SPIMISO_DZO : out STD_LOGIC;
    ChipBiasEnable_SO : out STD_LOGIC;
    ChipBiasDiagSelect_SO : out STD_LOGIC;
    ChipBiasAddrSelect_SBO : out STD_LOGIC;
    ChipBiasClock_CBO : out STD_LOGIC;
    ChipBiasBitIn_DO : out STD_LOGIC;
    ChipBiasLatch_SBO : out STD_LOGIC;
    DVSAERData_AI : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DVSAERReq_ABI : in STD_LOGIC;
    DVSAERAck_SBO : out STD_LOGIC;
    DVSAERReset_SBO : out STD_LOGIC;
    IMUClock_CZO : out STD_LOGIC;
    IMUData_DZIO : inout STD_LOGIC;
    IMUInterrupt_AI : in STD_LOGIC;
    IMUFSync_SO : out STD_LOGIC;
    SyncOutClock_CO : out STD_LOGIC;
    SyncOutSignal_SO : out STD_LOGIC;
    SyncInClock_AI : in STD_LOGIC;
    SyncInSignal_AI : in STD_LOGIC;
    SyncInSignal1_AI : in STD_LOGIC;
    SyncInSignal2_AI : in STD_LOGIC;
    AERSMFifoAlmostFull_AI : in STD_LOGIC;
    AERSMFifoFull_AI : in STD_LOGIC;
    AERSMOutFifoWrite_SO : out STD_LOGIC;
    AERSMOutFifoData_DO : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component brd_testAERDVSSM_0_0;
  component brd_system_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe13 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe15 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_0_AXIS_tlast : in STD_LOGIC;
    SLOT_0_AXIS_tvalid : in STD_LOGIC;
    SLOT_0_AXIS_tready : in STD_LOGIC;
    SLOT_1_AXIS_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SLOT_1_AXIS_tlast : in STD_LOGIC;
    SLOT_1_AXIS_tvalid : in STD_LOGIC;
    SLOT_1_AXIS_tready : in STD_LOGIC;
    SLOT_2_AXIS_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXIS_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_2_AXIS_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    SLOT_2_AXIS_tstrb : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXIS_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_2_AXIS_tlast : in STD_LOGIC;
    SLOT_2_AXIS_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_2_AXIS_tvalid : in STD_LOGIC;
    SLOT_2_AXIS_tready : in STD_LOGIC;
    SLOT_3_AXIS_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    SLOT_3_AXIS_tlast : in STD_LOGIC;
    SLOT_3_AXIS_tvalid : in STD_LOGIC;
    SLOT_3_AXIS_tready : in STD_LOGIC;
    SLOT_4_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_4_AXIS_tlast : in STD_LOGIC;
    SLOT_4_AXIS_tvalid : in STD_LOGIC;
    SLOT_4_AXIS_tready : in STD_LOGIC;
    SLOT_5_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_5_AXIS_tlast : in STD_LOGIC;
    SLOT_5_AXIS_tvalid : in STD_LOGIC;
    SLOT_5_AXIS_tready : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
  end component brd_system_ila_0_0;
  component brd_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_axis_data_fifo_0_0;
  component brd_axis_data_fifo_1_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_axis_data_fifo_1_0;
  component brd_axis_data_fifo_1_1 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_axis_data_fifo_1_1;
  component brd_axis_data_fifo_1_2 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_axis_data_fifo_1_2;
  component brd_EVMUXDataToXYTSStream_0_0 is
  port (
    dataReg_V_ap_vld : out STD_LOGIC;
    xRegReg_V_ap_vld : out STD_LOGIC;
    yRegReg_V_ap_vld : out STD_LOGIC;
    tsRegReg_V_ap_vld : out STD_LOGIC;
    polRegReg_V_ap_vld : out STD_LOGIC;
    tsWrapRegReg_V_ap_vld : out STD_LOGIC;
    s_axi_config_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_config_AWVALID : in STD_LOGIC;
    s_axi_config_AWREADY : out STD_LOGIC;
    s_axi_config_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_config_WVALID : in STD_LOGIC;
    s_axi_config_WREADY : out STD_LOGIC;
    s_axi_config_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_BVALID : out STD_LOGIC;
    s_axi_config_BREADY : in STD_LOGIC;
    s_axi_config_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_config_ARVALID : in STD_LOGIC;
    s_axi_config_ARREADY : out STD_LOGIC;
    s_axi_config_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_RVALID : out STD_LOGIC;
    s_axi_config_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    tsStreamOut_V_V_TVALID : out STD_LOGIC;
    tsStreamOut_V_V_TREADY : in STD_LOGIC;
    tsStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    yStreamOut_V_V_TVALID : out STD_LOGIC;
    yStreamOut_V_V_TREADY : in STD_LOGIC;
    yStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xStreamOut_V_V_TVALID : out STD_LOGIC;
    xStreamOut_V_V_TREADY : in STD_LOGIC;
    xStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    polStreamOut_V_V_TVALID : out STD_LOGIC;
    polStreamOut_V_V_TREADY : in STD_LOGIC;
    polStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    eventFIFOIn_V : in STD_LOGIC_VECTOR ( 15 downto 0 );
    eventFIFODataValid_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    dataReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    xRegReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    yRegReg_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tsRegReg_V : out STD_LOGIC_VECTOR ( 63 downto 0 );
    polRegReg_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    tsWrapRegReg_V : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  end component brd_EVMUXDataToXYTSStream_0_0;
  component brd_EVFastCornerStream_0_0 is
  port (
    s_axi_config_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_config_AWVALID : in STD_LOGIC;
    s_axi_config_AWREADY : out STD_LOGIC;
    s_axi_config_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_config_WVALID : in STD_LOGIC;
    s_axi_config_WREADY : out STD_LOGIC;
    s_axi_config_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_BVALID : out STD_LOGIC;
    s_axi_config_BREADY : in STD_LOGIC;
    s_axi_config_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_config_ARVALID : in STD_LOGIC;
    s_axi_config_ARREADY : out STD_LOGIC;
    s_axi_config_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_RVALID : out STD_LOGIC;
    s_axi_config_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    xStreamIn_V_V_TVALID : in STD_LOGIC;
    xStreamIn_V_V_TREADY : out STD_LOGIC;
    xStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    yStreamIn_V_V_TVALID : in STD_LOGIC;
    yStreamIn_V_V_TREADY : out STD_LOGIC;
    yStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    tsStreamIn_V_V_TVALID : in STD_LOGIC;
    tsStreamIn_V_V_TREADY : out STD_LOGIC;
    tsStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    polStreamIn_V_V_TVALID : in STD_LOGIC;
    polStreamIn_V_V_TREADY : out STD_LOGIC;
    polStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xStreamOut_V_V_TVALID : out STD_LOGIC;
    xStreamOut_V_V_TREADY : in STD_LOGIC;
    xStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    yStreamOut_V_V_TVALID : out STD_LOGIC;
    yStreamOut_V_V_TREADY : in STD_LOGIC;
    yStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tsStreamOut_V_V_TVALID : out STD_LOGIC;
    tsStreamOut_V_V_TREADY : in STD_LOGIC;
    tsStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    polStreamOut_V_V_TVALID : out STD_LOGIC;
    polStreamOut_V_V_TREADY : in STD_LOGIC;
    polStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pixelDataStream_V_V_TVALID : out STD_LOGIC;
    pixelDataStream_V_V_TREADY : in STD_LOGIC;
    pixelDataStream_V_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component brd_EVFastCornerStream_0_0;
  component brd_EVABMOFStream_0_0 is
  port (
    s_axi_config_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_config_AWVALID : in STD_LOGIC;
    s_axi_config_AWREADY : out STD_LOGIC;
    s_axi_config_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_config_WVALID : in STD_LOGIC;
    s_axi_config_WREADY : out STD_LOGIC;
    s_axi_config_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_BVALID : out STD_LOGIC;
    s_axi_config_BREADY : in STD_LOGIC;
    s_axi_config_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_config_ARVALID : in STD_LOGIC;
    s_axi_config_ARREADY : out STD_LOGIC;
    s_axi_config_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_RVALID : out STD_LOGIC;
    s_axi_config_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    xStreamIn_V_V_TVALID : in STD_LOGIC;
    xStreamIn_V_V_TREADY : out STD_LOGIC;
    xStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    yStreamIn_V_V_TVALID : in STD_LOGIC;
    yStreamIn_V_V_TREADY : out STD_LOGIC;
    yStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    tsStreamIn_V_V_TVALID : in STD_LOGIC;
    tsStreamIn_V_V_TREADY : out STD_LOGIC;
    tsStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    polStreamIn_V_V_TVALID : in STD_LOGIC;
    polStreamIn_V_V_TREADY : out STD_LOGIC;
    polStreamIn_V_V_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xStreamOut_V_V_TVALID : out STD_LOGIC;
    xStreamOut_V_V_TREADY : in STD_LOGIC;
    xStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    yStreamOut_V_V_TVALID : out STD_LOGIC;
    yStreamOut_V_V_TREADY : in STD_LOGIC;
    yStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tsStreamOut_V_V_TVALID : out STD_LOGIC;
    tsStreamOut_V_V_TREADY : in STD_LOGIC;
    tsStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    polStreamOut_V_V_TVALID : out STD_LOGIC;
    polStreamOut_V_V_TREADY : in STD_LOGIC;
    polStreamOut_V_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pixelDataStream_V_V_TVALID : out STD_LOGIC;
    pixelDataStream_V_V_TREADY : in STD_LOGIC;
    pixelDataStream_V_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component brd_EVABMOFStream_0_0;
  component brd_axi_usb2_device_0_0 is
  port (
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_awlock : out STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_arlock : out STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    usb_irpt : out STD_LOGIC;
    ulpi_clock : in STD_LOGIC;
    ulpi_dir : in STD_LOGIC;
    ulpi_next : in STD_LOGIC;
    ulpi_stop : out STD_LOGIC;
    ulpi_reset : out STD_LOGIC;
    ulpi_data_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ulpi_data_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ulpi_data_t : out STD_LOGIC
  );
  end component brd_axi_usb2_device_0_0;
  component brd_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component brd_xlconcat_0_0;
  component brd_eventStreamToConstEn_0_1 is
  port (
    count_V_ap_vld : out STD_LOGIC;
    vgaEn_V_ap_vld : out STD_LOGIC;
    vCnt_V_ap_vld : out STD_LOGIC;
    hCnt_V_ap_vld : out STD_LOGIC;
    regX_V_ap_vld : out STD_LOGIC;
    regY_V_ap_vld : out STD_LOGIC;
    polReg_V_ap_vld : out STD_LOGIC;
    skipFlgOutput_V_ap_vld : out STD_LOGIC;
    tsReg_V_ap_vld : out STD_LOGIC;
    s_axi_config_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_config_AWVALID : in STD_LOGIC;
    s_axi_config_AWREADY : out STD_LOGIC;
    s_axi_config_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_config_WVALID : in STD_LOGIC;
    s_axi_config_WREADY : out STD_LOGIC;
    s_axi_config_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_BVALID : out STD_LOGIC;
    s_axi_config_BREADY : in STD_LOGIC;
    s_axi_config_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_config_ARVALID : in STD_LOGIC;
    s_axi_config_ARREADY : out STD_LOGIC;
    s_axi_config_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_config_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_config_RVALID : out STD_LOGIC;
    s_axi_config_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    frameStream_TVALID : out STD_LOGIC;
    frameStream_TREADY : in STD_LOGIC;
    frameStream_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 );
    frameStream_TDATA : out STD_LOGIC_VECTOR ( 23 downto 0 );
    frameStream_TKEEP : out STD_LOGIC_VECTOR ( 2 downto 0 );
    frameStream_TSTRB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    frameStream_TUSER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    frameStream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    frameStream_TID : out STD_LOGIC_VECTOR ( 0 to 0 );
    xStream_V_V_TVALID : in STD_LOGIC;
    xStream_V_V_TREADY : out STD_LOGIC;
    xStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    yStream_V_V_TVALID : in STD_LOGIC;
    yStream_V_V_TREADY : out STD_LOGIC;
    yStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    polStream_V_V_TVALID : in STD_LOGIC;
    polStream_V_V_TREADY : out STD_LOGIC;
    polStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tsStream_V_V_TVALID : in STD_LOGIC;
    tsStream_V_V_TREADY : out STD_LOGIC;
    tsStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    custDataStream_V_V_TVALID : in STD_LOGIC;
    custDataStream_V_V_TREADY : out STD_LOGIC;
    custDataStream_V_V_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    count_V : out STD_LOGIC_VECTOR ( 63 downto 0 );
    vgaEn_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    vCnt_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    hCnt_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    regX_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    regY_V : out STD_LOGIC_VECTOR ( 15 downto 0 );
    polReg_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    skipFlgOutput_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    tsReg_V : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component brd_eventStreamToConstEn_0_1;
  signal DVSAERData_AI_0_1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal DVSAERReq_ABI_0_1 : STD_LOGIC;
  signal EVABMOFStream_0_pixelDataStream_V_V_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of EVABMOFStream_0_pixelDataStream_V_V_TDATA : signal is std.standard.true;
  attribute conn_bus_info : string;
  attribute conn_bus_info of EVABMOFStream_0_pixelDataStream_V_V_TDATA : signal is "EVABMOFStream_0_pixelDataStream_V_V xilinx.com:interface:axis:1.0 None TDATA";
  attribute debug : string;
  attribute debug of EVABMOFStream_0_pixelDataStream_V_V_TDATA : signal is "true";
  signal EVABMOFStream_0_pixelDataStream_V_V_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_pixelDataStream_V_V_TREADY : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_pixelDataStream_V_V_TREADY : signal is "EVABMOFStream_0_pixelDataStream_V_V xilinx.com:interface:axis:1.0 None TREADY";
  attribute debug of EVABMOFStream_0_pixelDataStream_V_V_TREADY : signal is "true";
  signal EVABMOFStream_0_pixelDataStream_V_V_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_pixelDataStream_V_V_TVALID : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_pixelDataStream_V_V_TVALID : signal is "EVABMOFStream_0_pixelDataStream_V_V xilinx.com:interface:axis:1.0 None TVALID";
  attribute debug of EVABMOFStream_0_pixelDataStream_V_V_TVALID : signal is "true";
  signal EVABMOFStream_0_polStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute MARK_DEBUG of EVABMOFStream_0_polStreamOut_V_V_TDATA : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_polStreamOut_V_V_TDATA : signal is "EVABMOFStream_0_polStreamOut_V_V xilinx.com:interface:axis:1.0 None TDATA";
  attribute debug of EVABMOFStream_0_polStreamOut_V_V_TDATA : signal is "true";
  signal EVABMOFStream_0_polStreamOut_V_V_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_polStreamOut_V_V_TREADY : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_polStreamOut_V_V_TREADY : signal is "EVABMOFStream_0_polStreamOut_V_V xilinx.com:interface:axis:1.0 None TREADY";
  attribute debug of EVABMOFStream_0_polStreamOut_V_V_TREADY : signal is "true";
  signal EVABMOFStream_0_polStreamOut_V_V_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_polStreamOut_V_V_TVALID : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_polStreamOut_V_V_TVALID : signal is "EVABMOFStream_0_polStreamOut_V_V xilinx.com:interface:axis:1.0 None TVALID";
  attribute debug of EVABMOFStream_0_polStreamOut_V_V_TVALID : signal is "true";
  signal EVABMOFStream_0_tsStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  attribute MARK_DEBUG of EVABMOFStream_0_tsStreamOut_V_V_TDATA : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_tsStreamOut_V_V_TDATA : signal is "EVABMOFStream_0_tsStreamOut_V_V xilinx.com:interface:axis:1.0 None TDATA";
  attribute debug of EVABMOFStream_0_tsStreamOut_V_V_TDATA : signal is "true";
  signal EVABMOFStream_0_tsStreamOut_V_V_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_tsStreamOut_V_V_TREADY : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_tsStreamOut_V_V_TREADY : signal is "EVABMOFStream_0_tsStreamOut_V_V xilinx.com:interface:axis:1.0 None TREADY";
  attribute debug of EVABMOFStream_0_tsStreamOut_V_V_TREADY : signal is "true";
  signal EVABMOFStream_0_tsStreamOut_V_V_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_tsStreamOut_V_V_TVALID : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_tsStreamOut_V_V_TVALID : signal is "EVABMOFStream_0_tsStreamOut_V_V xilinx.com:interface:axis:1.0 None TVALID";
  attribute debug of EVABMOFStream_0_tsStreamOut_V_V_TVALID : signal is "true";
  signal EVABMOFStream_0_xStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of EVABMOFStream_0_xStreamOut_V_V_TDATA : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_xStreamOut_V_V_TDATA : signal is "EVABMOFStream_0_xStreamOut_V_V xilinx.com:interface:axis:1.0 None TDATA";
  attribute debug of EVABMOFStream_0_xStreamOut_V_V_TDATA : signal is "true";
  signal EVABMOFStream_0_xStreamOut_V_V_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_xStreamOut_V_V_TREADY : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_xStreamOut_V_V_TREADY : signal is "EVABMOFStream_0_xStreamOut_V_V xilinx.com:interface:axis:1.0 None TREADY";
  attribute debug of EVABMOFStream_0_xStreamOut_V_V_TREADY : signal is "true";
  signal EVABMOFStream_0_xStreamOut_V_V_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_xStreamOut_V_V_TVALID : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_xStreamOut_V_V_TVALID : signal is "EVABMOFStream_0_xStreamOut_V_V xilinx.com:interface:axis:1.0 None TVALID";
  attribute debug of EVABMOFStream_0_xStreamOut_V_V_TVALID : signal is "true";
  signal EVABMOFStream_0_yStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of EVABMOFStream_0_yStreamOut_V_V_TDATA : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_yStreamOut_V_V_TDATA : signal is "EVABMOFStream_0_yStreamOut_V_V xilinx.com:interface:axis:1.0 None TDATA";
  attribute debug of EVABMOFStream_0_yStreamOut_V_V_TDATA : signal is "true";
  signal EVABMOFStream_0_yStreamOut_V_V_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_yStreamOut_V_V_TREADY : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_yStreamOut_V_V_TREADY : signal is "EVABMOFStream_0_yStreamOut_V_V xilinx.com:interface:axis:1.0 None TREADY";
  attribute debug of EVABMOFStream_0_yStreamOut_V_V_TREADY : signal is "true";
  signal EVABMOFStream_0_yStreamOut_V_V_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of EVABMOFStream_0_yStreamOut_V_V_TVALID : signal is std.standard.true;
  attribute conn_bus_info of EVABMOFStream_0_yStreamOut_V_V_TVALID : signal is "EVABMOFStream_0_yStreamOut_V_V xilinx.com:interface:axis:1.0 None TVALID";
  attribute debug of EVABMOFStream_0_yStreamOut_V_V_TVALID : signal is "true";
  signal EVFastCornerStream_0_polStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EVFastCornerStream_0_polStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVFastCornerStream_0_polStreamOut_V_V_TVALID : STD_LOGIC;
  signal EVFastCornerStream_0_tsStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal EVFastCornerStream_0_tsStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVFastCornerStream_0_tsStreamOut_V_V_TVALID : STD_LOGIC;
  signal EVFastCornerStream_0_xStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EVFastCornerStream_0_xStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVFastCornerStream_0_xStreamOut_V_V_TVALID : STD_LOGIC;
  signal EVFastCornerStream_0_yStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EVFastCornerStream_0_yStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVFastCornerStream_0_yStreamOut_V_V_TVALID : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TREADY : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TVALID : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TVALID : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_xStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EVMUXDataToXYTSStream_0_xStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_xStreamOut_V_V_TVALID : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_yStreamOut_V_V_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EVMUXDataToXYTSStream_0_yStreamOut_V_V_TREADY : STD_LOGIC;
  signal EVMUXDataToXYTSStream_0_yStreamOut_V_V_TVALID : STD_LOGIC;
  signal IMUInterrupt_AI_0_1 : STD_LOGIC;
  signal LEDShifter_0_led : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Net : STD_LOGIC;
  signal Net1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Net2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SyncInClock_AI_0_1 : STD_LOGIC;
  signal SyncInSignal1_AI_0_1 : STD_LOGIC;
  signal SyncInSignal2_AI_0_1 : STD_LOGIC;
  signal SyncInSignal_AI_0_1 : STD_LOGIC;
  signal ULPI_0_1_DATA_I : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ULPI_0_1_DATA_O : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ULPI_0_1_DATA_T : STD_LOGIC;
  signal ULPI_0_1_DIR : STD_LOGIC;
  signal ULPI_0_1_NEXT : STD_LOGIC;
  signal ULPI_0_1_RST : STD_LOGIC;
  signal ULPI_0_1_STOP : STD_LOGIC;
  signal axi_gpio_0_gpio_io_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_gpio_0_ip2intc_irpt : STD_LOGIC;
  signal axi_smc_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_smc_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_smc_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_smc_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_BREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_BVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_smc_M00_AXI_RLAST : STD_LOGIC;
  signal axi_smc_M00_AXI_RREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_smc_M00_AXI_RVALID : STD_LOGIC;
  signal axi_smc_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_smc_M00_AXI_WLAST : STD_LOGIC;
  signal axi_smc_M00_AXI_WREADY : STD_LOGIC;
  signal axi_smc_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_smc_M00_AXI_WVALID : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_usb2_device_0_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_usb2_device_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_usb2_device_0_M_AXI_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_usb2_device_0_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_usb2_device_0_M_AXI_ARLOCK : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_usb2_device_0_M_AXI_ARREADY : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_usb2_device_0_M_AXI_ARVALID : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_usb2_device_0_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_usb2_device_0_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_usb2_device_0_M_AXI_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_usb2_device_0_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_usb2_device_0_M_AXI_AWLOCK : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_usb2_device_0_M_AXI_AWREADY : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_usb2_device_0_M_AXI_AWVALID : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_usb2_device_0_M_AXI_BREADY : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_usb2_device_0_M_AXI_BVALID : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_usb2_device_0_M_AXI_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_usb2_device_0_M_AXI_RLAST : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_RREADY : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_usb2_device_0_M_AXI_RVALID : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_usb2_device_0_M_AXI_WLAST : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_WREADY : STD_LOGIC;
  signal axi_usb2_device_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_usb2_device_0_M_AXI_WVALID : STD_LOGIC;
  signal axi_usb2_device_0_usb_irpt : STD_LOGIC;
  signal axi_vdma_0_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal axi_vdma_0_M_AXIS_MM2S_TLAST : STD_LOGIC;
  signal axi_vdma_0_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal axi_vdma_0_M_AXIS_MM2S_TUSER : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_vdma_0_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal axi_vdma_0_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal axi_vdma_0_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal axi_vdma_0_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal axi_vdma_0_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal axi_vdma_0_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_vdma_0_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_vdma_0_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_vdma_0_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axis_data_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of axis_data_count : signal is std.standard.true;
  attribute debug of axis_data_count : signal is "true";
  signal axis_data_fifo_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_1_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_1_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_2_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_2_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_2_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_3_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_data_fifo_3_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_3_M_AXIS_TVALID : STD_LOGIC;
  signal axis_rd_data_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of axis_rd_data_count : signal is std.standard.true;
  attribute debug of axis_rd_data_count : signal is "true";
  signal axis_wr_data_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of axis_wr_data_count : signal is std.standard.true;
  attribute debug of axis_wr_data_count : signal is "true";
  signal const_VCC_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count_V : STD_LOGIC_VECTOR ( 63 downto 0 );
  attribute MARK_DEBUG of count_V : signal is std.standard.true;
  attribute debug of count_V : signal is "true";
  signal dataReg_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of dataReg_V : signal is std.standard.true;
  attribute debug of dataReg_V : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TDATA : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TDATA : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TDATA";
  attribute debug of eventStreamToConstEn_0_frameStream_TDATA : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TDEST : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TDEST : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TDEST : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TDEST";
  attribute debug of eventStreamToConstEn_0_frameStream_TDEST : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TID : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TID : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TID : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TID";
  attribute debug of eventStreamToConstEn_0_frameStream_TID : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TKEEP : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TKEEP : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TKEEP : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TKEEP";
  attribute debug of eventStreamToConstEn_0_frameStream_TKEEP : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TLAST : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TLAST : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TLAST";
  attribute debug of eventStreamToConstEn_0_frameStream_TLAST : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TREADY : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TREADY : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TREADY";
  attribute debug of eventStreamToConstEn_0_frameStream_TREADY : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TSTRB : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TSTRB : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TSTRB : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TSTRB";
  attribute debug of eventStreamToConstEn_0_frameStream_TSTRB : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TUSER : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TUSER : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TUSER : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TUSER";
  attribute debug of eventStreamToConstEn_0_frameStream_TUSER : signal is "true";
  signal eventStreamToConstEn_0_frameStream_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of eventStreamToConstEn_0_frameStream_TVALID : signal is std.standard.true;
  attribute conn_bus_info of eventStreamToConstEn_0_frameStream_TVALID : signal is "eventStreamToConstEn_0_frameStream xilinx.com:interface:axis:1.0 None TVALID";
  attribute debug of eventStreamToConstEn_0_frameStream_TVALID : signal is "true";
  signal hCnt_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of hCnt_V : signal is std.standard.true;
  attribute debug of hCnt_V : signal is "true";
  signal polRegReg_V : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of polRegReg_V : signal is std.standard.true;
  attribute debug of polRegReg_V : signal is "true";
  signal polReg_V : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of polReg_V : signal is std.standard.true;
  attribute debug of polReg_V : signal is "true";
  signal proc_sys_reset_0_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_0_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_1_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK1 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal processing_system7_0_SPI0_MOSI_O : STD_LOGIC;
  signal processing_system7_0_SPI0_SCLK_O : STD_LOGIC;
  signal processing_system7_0_SPI0_SS1_O : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M04_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M05_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_ARLOCK : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_AWLOCK : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_RLAST : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_WLAST : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M06_AXI_WVALID : STD_LOGIC;
  signal regX_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of regX_V : signal is std.standard.true;
  attribute debug of regX_V : signal is "true";
  signal regY_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of regY_V : signal is std.standard.true;
  attribute debug of regY_V : signal is "true";
  signal skipFlgOutput_V : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of skipFlgOutput_V : signal is std.standard.true;
  attribute debug of skipFlgOutput_V : signal is "true";
  signal testAERDVSSM_0_AERSMOutFifoData_DO : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of testAERDVSSM_0_AERSMOutFifoData_DO : signal is std.standard.true;
  attribute debug of testAERDVSSM_0_AERSMOutFifoData_DO : signal is "true";
  signal testAERDVSSM_0_AERSMOutFifoWrite_SO : STD_LOGIC;
  attribute MARK_DEBUG of testAERDVSSM_0_AERSMOutFifoWrite_SO : signal is std.standard.true;
  attribute debug of testAERDVSSM_0_AERSMOutFifoWrite_SO : signal is "true";
  signal testAERDVSSM_0_ChipBiasAddrSelect_SBO : STD_LOGIC;
  signal testAERDVSSM_0_ChipBiasBitIn_DO : STD_LOGIC;
  signal testAERDVSSM_0_ChipBiasClock_CBO : STD_LOGIC;
  signal testAERDVSSM_0_ChipBiasDiagSelect_SO : STD_LOGIC;
  signal testAERDVSSM_0_ChipBiasEnable_SO : STD_LOGIC;
  signal testAERDVSSM_0_ChipBiasLatch_SBO : STD_LOGIC;
  signal testAERDVSSM_0_DVSAERAck_SBO : STD_LOGIC;
  signal testAERDVSSM_0_DVSAERReset_SBO : STD_LOGIC;
  signal testAERDVSSM_0_IMUClock_CZO : STD_LOGIC;
  signal testAERDVSSM_0_IMUFSync_SO : STD_LOGIC;
  signal testAERDVSSM_0_SPIMISO_DZO : STD_LOGIC;
  signal testAERDVSSM_0_SyncOutClock_CO : STD_LOGIC;
  signal testAERDVSSM_0_SyncOutSignal_SO : STD_LOGIC;
  signal tsRegReg_V : STD_LOGIC_VECTOR ( 63 downto 0 );
  attribute MARK_DEBUG of tsRegReg_V : signal is std.standard.true;
  attribute debug of tsRegReg_V : signal is "true";
  signal tsReg_V : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of tsReg_V : signal is std.standard.true;
  attribute debug of tsReg_V : signal is "true";
  signal tsWrapRegReg_V : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal ulpi_clock_0_1 : STD_LOGIC;
  signal vCnt_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of vCnt_V : signal is std.standard.true;
  attribute debug of vCnt_V : signal is "true";
  signal v_axi4s_vid_out_0_vid_data : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal v_axi4s_vid_out_0_vid_hsync : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_vsync : STD_LOGIC;
  signal v_axi4s_vid_out_0_vtg_ce : STD_LOGIC;
  signal v_tc_0_vtiming_out_ACTIVE_VIDEO : STD_LOGIC;
  signal v_tc_0_vtiming_out_HBLANK : STD_LOGIC;
  signal v_tc_0_vtiming_out_HSYNC : STD_LOGIC;
  signal v_tc_0_vtiming_out_VBLANK : STD_LOGIC;
  signal v_tc_0_vtiming_out_VSYNC : STD_LOGIC;
  signal vgaEn_V : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute MARK_DEBUG of vgaEn_V : signal is std.standard.true;
  attribute debug of vgaEn_V : signal is "true";
  signal xRegReg_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of xRegReg_V : signal is std.standard.true;
  attribute debug of xRegReg_V : signal is "true";
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal yRegReg_V : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute MARK_DEBUG of yRegReg_V : signal is std.standard.true;
  attribute debug of yRegReg_V : signal is "true";
  signal NLW_EVABMOFStream_0_ap_done_UNCONNECTED : STD_LOGIC;
  signal NLW_EVABMOFStream_0_ap_idle_UNCONNECTED : STD_LOGIC;
  signal NLW_EVABMOFStream_0_ap_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_EVFastCornerStream_0_ap_done_UNCONNECTED : STD_LOGIC;
  signal NLW_EVFastCornerStream_0_ap_idle_UNCONNECTED : STD_LOGIC;
  signal NLW_EVFastCornerStream_0_ap_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_EVFastCornerStream_0_pixelDataStream_V_V_TVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_EVFastCornerStream_0_pixelDataStream_V_V_TDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_EVMUXDataToXYTSStream_0_ap_done_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_ap_idle_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_ap_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_dataReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_polRegReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_tsRegReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_tsWrapRegReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_xRegReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_EVMUXDataToXYTSStream_0_yRegReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_vdma_0_mm2s_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_vdma_0_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_vdma_0_m_axis_mm2s_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_axi_vdma_0_mm2s_frame_ptr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axi_vdma_0_s2mm_frame_ptr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axis_data_fifo_1_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_1_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_1_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_2_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_2_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_2_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_3_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_3_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_3_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_eventStreamToConstEn_0_ap_done_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_ap_idle_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_ap_ready_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_count_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_hCnt_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_polReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_regX_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_regY_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_skipFlgOutput_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_tsReg_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_vCnt_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_eventStreamToConstEn_0_vgaEn_V_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_processing_system7_0_FCLK_CLK2_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_I2C1_SCL_O_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_I2C1_SCL_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_I2C1_SDA_O_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_I2C1_SDA_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_MISO_O_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_MISO_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_MOSI_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_SCLK_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_SS2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_SS_O_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_SPI0_SS_T_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB1_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_USB1_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_v_axi4s_vid_out_0_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_active_video_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_field_id_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_hblank_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_vblank_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_v_tc_0_fsync_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of DDR_cas_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute x_interface_info of DDR_ck_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute x_interface_info of DDR_ck_p : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute x_interface_info of DDR_cke : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute x_interface_info of DDR_cs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute x_interface_info of DDR_odt : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute x_interface_info of DDR_ras_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute x_interface_info of DDR_reset_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute x_interface_info of DDR_we_n : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute x_interface_info of FIXED_IO_ddr_vrn : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of FIXED_IO_ddr_vrn : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute x_interface_info of FIXED_IO_ddr_vrp : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute x_interface_info of FIXED_IO_ps_clk : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute x_interface_info of FIXED_IO_ps_porb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute x_interface_info of FIXED_IO_ps_srstb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute x_interface_info of ULPI_data_t : signal is "xilinx.com:interface:ulpi:1.0 ULPI DATA_T";
  attribute x_interface_info of ULPI_dir : signal is "xilinx.com:interface:ulpi:1.0 ULPI DIR";
  attribute x_interface_info of ULPI_next : signal is "xilinx.com:interface:ulpi:1.0 ULPI NEXT";
  attribute x_interface_info of ULPI_rst : signal is "xilinx.com:interface:ulpi:1.0 ULPI RST";
  attribute x_interface_info of ULPI_stop : signal is "xilinx.com:interface:ulpi:1.0 ULPI STOP";
  attribute x_interface_info of clk_in1_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK";
  attribute x_interface_parameter of clk_in1_0 : signal is "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN brd_ulpi_clock_0, FREQ_HZ 60000000, PHASE 0.000";
  attribute x_interface_info of DDR_addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute x_interface_parameter of DDR_addr : signal is "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250";
  attribute x_interface_info of DDR_ba : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute x_interface_info of DDR_dm : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute x_interface_info of DDR_dq : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute x_interface_info of DDR_dqs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute x_interface_info of DDR_dqs_p : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute x_interface_info of FIXED_IO_mio : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
  attribute x_interface_info of ULPI_data_i : signal is "xilinx.com:interface:ulpi:1.0 ULPI DATA_I";
  attribute x_interface_info of ULPI_data_o : signal is "xilinx.com:interface:ulpi:1.0 ULPI DATA_O";
begin
  ChipBiasAddrSelect_SBO_0 <= testAERDVSSM_0_ChipBiasAddrSelect_SBO;
  ChipBiasBitIn_DO_0 <= testAERDVSSM_0_ChipBiasBitIn_DO;
  ChipBiasClock_CBO_0 <= testAERDVSSM_0_ChipBiasClock_CBO;
  ChipBiasDiagSelect_SO_0 <= testAERDVSSM_0_ChipBiasDiagSelect_SO;
  ChipBiasEnable_SO_0 <= testAERDVSSM_0_ChipBiasEnable_SO;
  ChipBiasLatch_SBO_0 <= testAERDVSSM_0_ChipBiasLatch_SBO;
  DVSAERAck_SBO_0 <= testAERDVSSM_0_DVSAERAck_SBO;
  DVSAERData_AI_0_1(10 downto 0) <= DVSAERData_AI_0(10 downto 0);
  DVSAERReq_ABI_0_1 <= DVSAERReq_ABI_0;
  DVSAERReset_SBO_0 <= testAERDVSSM_0_DVSAERReset_SBO;
  IMUClock_CZO_0 <= testAERDVSSM_0_IMUClock_CZO;
  IMUFSync_SO_0 <= testAERDVSSM_0_IMUFSync_SO;
  IMUInterrupt_AI_0_1 <= IMUInterrupt_AI_0;
  SyncInClock_AI_0_1 <= SyncInClock_AI_0;
  SyncInSignal1_AI_0_1 <= SyncInSignal1_AI_0;
  SyncInSignal2_AI_0_1 <= SyncInSignal2_AI_0;
  SyncInSignal_AI_0_1 <= SyncInSignal_AI_0;
  SyncOutClock_CO_0 <= testAERDVSSM_0_SyncOutClock_CO;
  SyncOutSignal_SO_0 <= testAERDVSSM_0_SyncOutSignal_SO;
  ULPI_0_1_DATA_I(7 downto 0) <= ULPI_data_i(7 downto 0);
  ULPI_0_1_DIR <= ULPI_dir;
  ULPI_0_1_NEXT <= ULPI_next;
  ULPI_data_o(7 downto 0) <= ULPI_0_1_DATA_O(7 downto 0);
  ULPI_data_t <= ULPI_0_1_DATA_T;
  ULPI_rst <= ULPI_0_1_RST;
  ULPI_stop <= ULPI_0_1_STOP;
  led_0(5 downto 0) <= LEDShifter_0_led(5 downto 0);
  ulpi_clock_0_1 <= clk_in1_0;
  vid_data(23 downto 0) <= v_axi4s_vid_out_0_vid_data(23 downto 0);
  vid_hsync <= v_axi4s_vid_out_0_vid_hsync;
  vid_vsync <= v_axi4s_vid_out_0_vid_vsync;
EVABMOFStream_0: component brd_EVABMOFStream_0_0
     port map (
      ap_clk => processing_system7_0_FCLK_CLK0,
      ap_done => NLW_EVABMOFStream_0_ap_done_UNCONNECTED,
      ap_idle => NLW_EVABMOFStream_0_ap_idle_UNCONNECTED,
      ap_ready => NLW_EVABMOFStream_0_ap_ready_UNCONNECTED,
      ap_rst_n => proc_sys_reset_0_peripheral_aresetn(0),
      ap_start => xlslice_1_Dout(0),
      pixelDataStream_V_V_TDATA(7 downto 0) => EVABMOFStream_0_pixelDataStream_V_V_TDATA(7 downto 0),
      pixelDataStream_V_V_TREADY => EVABMOFStream_0_pixelDataStream_V_V_TREADY,
      pixelDataStream_V_V_TVALID => EVABMOFStream_0_pixelDataStream_V_V_TVALID,
      polStreamIn_V_V_TDATA(7 downto 0) => axis_data_fifo_3_M_AXIS_TDATA(7 downto 0),
      polStreamIn_V_V_TREADY => axis_data_fifo_3_M_AXIS_TREADY,
      polStreamIn_V_V_TVALID => axis_data_fifo_3_M_AXIS_TVALID,
      polStreamOut_V_V_TDATA(7 downto 0) => EVABMOFStream_0_polStreamOut_V_V_TDATA(7 downto 0),
      polStreamOut_V_V_TREADY => EVABMOFStream_0_polStreamOut_V_V_TREADY,
      polStreamOut_V_V_TVALID => EVABMOFStream_0_polStreamOut_V_V_TVALID,
      s_axi_config_ARADDR(4 downto 0) => ps7_0_axi_periph_M04_AXI_ARADDR(4 downto 0),
      s_axi_config_ARREADY => ps7_0_axi_periph_M04_AXI_ARREADY,
      s_axi_config_ARVALID => ps7_0_axi_periph_M04_AXI_ARVALID,
      s_axi_config_AWADDR(4 downto 0) => ps7_0_axi_periph_M04_AXI_AWADDR(4 downto 0),
      s_axi_config_AWREADY => ps7_0_axi_periph_M04_AXI_AWREADY,
      s_axi_config_AWVALID => ps7_0_axi_periph_M04_AXI_AWVALID,
      s_axi_config_BREADY => ps7_0_axi_periph_M04_AXI_BREADY,
      s_axi_config_BRESP(1 downto 0) => ps7_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      s_axi_config_BVALID => ps7_0_axi_periph_M04_AXI_BVALID,
      s_axi_config_RDATA(31 downto 0) => ps7_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      s_axi_config_RREADY => ps7_0_axi_periph_M04_AXI_RREADY,
      s_axi_config_RRESP(1 downto 0) => ps7_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      s_axi_config_RVALID => ps7_0_axi_periph_M04_AXI_RVALID,
      s_axi_config_WDATA(31 downto 0) => ps7_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      s_axi_config_WREADY => ps7_0_axi_periph_M04_AXI_WREADY,
      s_axi_config_WSTRB(3 downto 0) => ps7_0_axi_periph_M04_AXI_WSTRB(3 downto 0),
      s_axi_config_WVALID => ps7_0_axi_periph_M04_AXI_WVALID,
      tsStreamIn_V_V_TDATA(63 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(63 downto 0),
      tsStreamIn_V_V_TREADY => axis_data_fifo_2_M_AXIS_TREADY,
      tsStreamIn_V_V_TVALID => axis_data_fifo_2_M_AXIS_TVALID,
      tsStreamOut_V_V_TDATA(63 downto 0) => EVABMOFStream_0_tsStreamOut_V_V_TDATA(63 downto 0),
      tsStreamOut_V_V_TREADY => EVABMOFStream_0_tsStreamOut_V_V_TREADY,
      tsStreamOut_V_V_TVALID => EVABMOFStream_0_tsStreamOut_V_V_TVALID,
      xStreamIn_V_V_TDATA(15 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(15 downto 0),
      xStreamIn_V_V_TREADY => axis_data_fifo_0_M_AXIS_TREADY,
      xStreamIn_V_V_TVALID => axis_data_fifo_0_M_AXIS_TVALID,
      xStreamOut_V_V_TDATA(15 downto 0) => EVABMOFStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      xStreamOut_V_V_TREADY => EVABMOFStream_0_xStreamOut_V_V_TREADY,
      xStreamOut_V_V_TVALID => EVABMOFStream_0_xStreamOut_V_V_TVALID,
      yStreamIn_V_V_TDATA(15 downto 0) => axis_data_fifo_1_M_AXIS_TDATA(15 downto 0),
      yStreamIn_V_V_TREADY => axis_data_fifo_1_M_AXIS_TREADY,
      yStreamIn_V_V_TVALID => axis_data_fifo_1_M_AXIS_TVALID,
      yStreamOut_V_V_TDATA(15 downto 0) => EVABMOFStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      yStreamOut_V_V_TREADY => EVABMOFStream_0_yStreamOut_V_V_TREADY,
      yStreamOut_V_V_TVALID => EVABMOFStream_0_yStreamOut_V_V_TVALID
    );
EVFastCornerStream_0: component brd_EVFastCornerStream_0_0
     port map (
      ap_clk => processing_system7_0_FCLK_CLK0,
      ap_done => NLW_EVFastCornerStream_0_ap_done_UNCONNECTED,
      ap_idle => NLW_EVFastCornerStream_0_ap_idle_UNCONNECTED,
      ap_ready => NLW_EVFastCornerStream_0_ap_ready_UNCONNECTED,
      ap_rst_n => proc_sys_reset_0_peripheral_aresetn(0),
      ap_start => const_VCC_dout(0),
      pixelDataStream_V_V_TDATA(7 downto 0) => NLW_EVFastCornerStream_0_pixelDataStream_V_V_TDATA_UNCONNECTED(7 downto 0),
      pixelDataStream_V_V_TREADY => '1',
      pixelDataStream_V_V_TVALID => NLW_EVFastCornerStream_0_pixelDataStream_V_V_TVALID_UNCONNECTED,
      polStreamIn_V_V_TDATA(7 downto 0) => EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TDATA(7 downto 0),
      polStreamIn_V_V_TREADY => EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TREADY,
      polStreamIn_V_V_TVALID => EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TVALID,
      polStreamOut_V_V_TDATA(7 downto 0) => EVFastCornerStream_0_polStreamOut_V_V_TDATA(7 downto 0),
      polStreamOut_V_V_TREADY => EVFastCornerStream_0_polStreamOut_V_V_TREADY,
      polStreamOut_V_V_TVALID => EVFastCornerStream_0_polStreamOut_V_V_TVALID,
      s_axi_config_ARADDR(5 downto 0) => ps7_0_axi_periph_M03_AXI_ARADDR(5 downto 0),
      s_axi_config_ARREADY => ps7_0_axi_periph_M03_AXI_ARREADY,
      s_axi_config_ARVALID => ps7_0_axi_periph_M03_AXI_ARVALID,
      s_axi_config_AWADDR(5 downto 0) => ps7_0_axi_periph_M03_AXI_AWADDR(5 downto 0),
      s_axi_config_AWREADY => ps7_0_axi_periph_M03_AXI_AWREADY,
      s_axi_config_AWVALID => ps7_0_axi_periph_M03_AXI_AWVALID,
      s_axi_config_BREADY => ps7_0_axi_periph_M03_AXI_BREADY,
      s_axi_config_BRESP(1 downto 0) => ps7_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      s_axi_config_BVALID => ps7_0_axi_periph_M03_AXI_BVALID,
      s_axi_config_RDATA(31 downto 0) => ps7_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      s_axi_config_RREADY => ps7_0_axi_periph_M03_AXI_RREADY,
      s_axi_config_RRESP(1 downto 0) => ps7_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      s_axi_config_RVALID => ps7_0_axi_periph_M03_AXI_RVALID,
      s_axi_config_WDATA(31 downto 0) => ps7_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      s_axi_config_WREADY => ps7_0_axi_periph_M03_AXI_WREADY,
      s_axi_config_WSTRB(3 downto 0) => ps7_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      s_axi_config_WVALID => ps7_0_axi_periph_M03_AXI_WVALID,
      tsStreamIn_V_V_TDATA(63 downto 0) => EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TDATA(63 downto 0),
      tsStreamIn_V_V_TREADY => EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TREADY,
      tsStreamIn_V_V_TVALID => EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TVALID,
      tsStreamOut_V_V_TDATA(63 downto 0) => EVFastCornerStream_0_tsStreamOut_V_V_TDATA(63 downto 0),
      tsStreamOut_V_V_TREADY => EVFastCornerStream_0_tsStreamOut_V_V_TREADY,
      tsStreamOut_V_V_TVALID => EVFastCornerStream_0_tsStreamOut_V_V_TVALID,
      xStreamIn_V_V_TDATA(15 downto 0) => EVMUXDataToXYTSStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      xStreamIn_V_V_TREADY => EVMUXDataToXYTSStream_0_xStreamOut_V_V_TREADY,
      xStreamIn_V_V_TVALID => EVMUXDataToXYTSStream_0_xStreamOut_V_V_TVALID,
      xStreamOut_V_V_TDATA(15 downto 0) => EVFastCornerStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      xStreamOut_V_V_TREADY => EVFastCornerStream_0_xStreamOut_V_V_TREADY,
      xStreamOut_V_V_TVALID => EVFastCornerStream_0_xStreamOut_V_V_TVALID,
      yStreamIn_V_V_TDATA(15 downto 0) => EVMUXDataToXYTSStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      yStreamIn_V_V_TREADY => EVMUXDataToXYTSStream_0_yStreamOut_V_V_TREADY,
      yStreamIn_V_V_TVALID => EVMUXDataToXYTSStream_0_yStreamOut_V_V_TVALID,
      yStreamOut_V_V_TDATA(15 downto 0) => EVFastCornerStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      yStreamOut_V_V_TREADY => EVFastCornerStream_0_yStreamOut_V_V_TREADY,
      yStreamOut_V_V_TVALID => EVFastCornerStream_0_yStreamOut_V_V_TVALID
    );
EVMUXDataToXYTSStream_0: component brd_EVMUXDataToXYTSStream_0_0
     port map (
      ap_clk => processing_system7_0_FCLK_CLK0,
      ap_done => NLW_EVMUXDataToXYTSStream_0_ap_done_UNCONNECTED,
      ap_idle => NLW_EVMUXDataToXYTSStream_0_ap_idle_UNCONNECTED,
      ap_ready => NLW_EVMUXDataToXYTSStream_0_ap_ready_UNCONNECTED,
      ap_rst_n => proc_sys_reset_0_peripheral_aresetn(0),
      ap_start => const_VCC_dout(0),
      dataReg_V(15 downto 0) => dataReg_V(15 downto 0),
      dataReg_V_ap_vld => NLW_EVMUXDataToXYTSStream_0_dataReg_V_ap_vld_UNCONNECTED,
      eventFIFODataValid_V(0) => testAERDVSSM_0_AERSMOutFifoWrite_SO,
      eventFIFOIn_V(15 downto 0) => testAERDVSSM_0_AERSMOutFifoData_DO(15 downto 0),
      polRegReg_V(0) => polRegReg_V(0),
      polRegReg_V_ap_vld => NLW_EVMUXDataToXYTSStream_0_polRegReg_V_ap_vld_UNCONNECTED,
      polStreamOut_V_V_TDATA(7 downto 0) => EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TDATA(7 downto 0),
      polStreamOut_V_V_TREADY => EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TREADY,
      polStreamOut_V_V_TVALID => EVMUXDataToXYTSStream_0_polStreamOut_V_V1_TVALID,
      s_axi_config_ARADDR(5 downto 0) => ps7_0_axi_periph_M05_AXI_ARADDR(5 downto 0),
      s_axi_config_ARREADY => ps7_0_axi_periph_M05_AXI_ARREADY,
      s_axi_config_ARVALID => ps7_0_axi_periph_M05_AXI_ARVALID,
      s_axi_config_AWADDR(5 downto 0) => ps7_0_axi_periph_M05_AXI_AWADDR(5 downto 0),
      s_axi_config_AWREADY => ps7_0_axi_periph_M05_AXI_AWREADY,
      s_axi_config_AWVALID => ps7_0_axi_periph_M05_AXI_AWVALID,
      s_axi_config_BREADY => ps7_0_axi_periph_M05_AXI_BREADY,
      s_axi_config_BRESP(1 downto 0) => ps7_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      s_axi_config_BVALID => ps7_0_axi_periph_M05_AXI_BVALID,
      s_axi_config_RDATA(31 downto 0) => ps7_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      s_axi_config_RREADY => ps7_0_axi_periph_M05_AXI_RREADY,
      s_axi_config_RRESP(1 downto 0) => ps7_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      s_axi_config_RVALID => ps7_0_axi_periph_M05_AXI_RVALID,
      s_axi_config_WDATA(31 downto 0) => ps7_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      s_axi_config_WREADY => ps7_0_axi_periph_M05_AXI_WREADY,
      s_axi_config_WSTRB(3 downto 0) => ps7_0_axi_periph_M05_AXI_WSTRB(3 downto 0),
      s_axi_config_WVALID => ps7_0_axi_periph_M05_AXI_WVALID,
      tsRegReg_V(63 downto 0) => tsRegReg_V(63 downto 0),
      tsRegReg_V_ap_vld => NLW_EVMUXDataToXYTSStream_0_tsRegReg_V_ap_vld_UNCONNECTED,
      tsStreamOut_V_V_TDATA(63 downto 0) => EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TDATA(63 downto 0),
      tsStreamOut_V_V_TREADY => EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TREADY,
      tsStreamOut_V_V_TVALID => EVMUXDataToXYTSStream_0_tsStreamOut_V_V_TVALID,
      tsWrapRegReg_V(47 downto 0) => tsWrapRegReg_V(47 downto 0),
      tsWrapRegReg_V_ap_vld => NLW_EVMUXDataToXYTSStream_0_tsWrapRegReg_V_ap_vld_UNCONNECTED,
      xRegReg_V(15 downto 0) => xRegReg_V(15 downto 0),
      xRegReg_V_ap_vld => NLW_EVMUXDataToXYTSStream_0_xRegReg_V_ap_vld_UNCONNECTED,
      xStreamOut_V_V_TDATA(15 downto 0) => EVMUXDataToXYTSStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      xStreamOut_V_V_TREADY => EVMUXDataToXYTSStream_0_xStreamOut_V_V_TREADY,
      xStreamOut_V_V_TVALID => EVMUXDataToXYTSStream_0_xStreamOut_V_V_TVALID,
      yRegReg_V(15 downto 0) => yRegReg_V(15 downto 0),
      yRegReg_V_ap_vld => NLW_EVMUXDataToXYTSStream_0_yRegReg_V_ap_vld_UNCONNECTED,
      yStreamOut_V_V_TDATA(15 downto 0) => EVMUXDataToXYTSStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      yStreamOut_V_V_TREADY => EVMUXDataToXYTSStream_0_yStreamOut_V_V_TREADY,
      yStreamOut_V_V_TVALID => EVMUXDataToXYTSStream_0_yStreamOut_V_V_TVALID
    );
LEDShifter_0: component brd_LEDShifter_0_0
     port map (
      clk => processing_system7_0_FCLK_CLK1,
      led(5 downto 0) => LEDShifter_0_led(5 downto 0),
      rstn => xlslice_1_Dout(0)
    );
axi_gpio_0: component brd_axi_gpio_0_0
     port map (
      gpio_io_o(31 downto 0) => axi_gpio_0_gpio_io_o(31 downto 0),
      ip2intc_irpt => axi_gpio_0_ip2intc_irpt,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(8 downto 0) => ps7_0_axi_periph_M00_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arready => ps7_0_axi_periph_M00_AXI_ARREADY,
      s_axi_arvalid => ps7_0_axi_periph_M00_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => ps7_0_axi_periph_M00_AXI_AWADDR(8 downto 0),
      s_axi_awready => ps7_0_axi_periph_M00_AXI_AWREADY,
      s_axi_awvalid => ps7_0_axi_periph_M00_AXI_AWVALID,
      s_axi_bready => ps7_0_axi_periph_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps7_0_axi_periph_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      s_axi_rready => ps7_0_axi_periph_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps7_0_axi_periph_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      s_axi_wready => ps7_0_axi_periph_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps7_0_axi_periph_M00_AXI_WVALID
    );
axi_smc: component brd_axi_smc_0
     port map (
      M00_AXI_araddr(31 downto 0) => axi_smc_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_smc_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_smc_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(3 downto 0) => axi_smc_M00_AXI_ARLEN(3 downto 0),
      M00_AXI_arlock(1 downto 0) => axi_smc_M00_AXI_ARLOCK(1 downto 0),
      M00_AXI_arprot(2 downto 0) => axi_smc_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_smc_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => axi_smc_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_smc_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_smc_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => axi_smc_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_smc_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_smc_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(3 downto 0) => axi_smc_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => axi_smc_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_smc_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_smc_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_smc_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_smc_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_smc_M00_AXI_AWVALID,
      M00_AXI_bready => axi_smc_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_smc_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_smc_M00_AXI_BVALID,
      M00_AXI_rdata(63 downto 0) => axi_smc_M00_AXI_RDATA(63 downto 0),
      M00_AXI_rlast => axi_smc_M00_AXI_RLAST,
      M00_AXI_rready => axi_smc_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_smc_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_smc_M00_AXI_RVALID,
      M00_AXI_wdata(63 downto 0) => axi_smc_M00_AXI_WDATA(63 downto 0),
      M00_AXI_wlast => axi_smc_M00_AXI_WLAST,
      M00_AXI_wready => axi_smc_M00_AXI_WREADY,
      M00_AXI_wstrb(7 downto 0) => axi_smc_M00_AXI_WSTRB(7 downto 0),
      M00_AXI_wvalid => axi_smc_M00_AXI_WVALID,
      S00_AXI_araddr(31 downto 0) => axi_vdma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => axi_vdma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => axi_vdma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => axi_vdma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => '0',
      S00_AXI_arprot(2 downto 0) => axi_vdma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => B"0000",
      S00_AXI_arready => axi_vdma_0_M_AXI_MM2S_ARREADY,
      S00_AXI_arsize(2 downto 0) => axi_vdma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      S00_AXI_arvalid => axi_vdma_0_M_AXI_MM2S_ARVALID,
      S00_AXI_rdata(63 downto 0) => axi_vdma_0_M_AXI_MM2S_RDATA(63 downto 0),
      S00_AXI_rlast => axi_vdma_0_M_AXI_MM2S_RLAST,
      S00_AXI_rready => axi_vdma_0_M_AXI_MM2S_RREADY,
      S00_AXI_rresp(1 downto 0) => axi_vdma_0_M_AXI_MM2S_RRESP(1 downto 0),
      S00_AXI_rvalid => axi_vdma_0_M_AXI_MM2S_RVALID,
      S01_AXI_awaddr(31 downto 0) => axi_vdma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      S01_AXI_awburst(1 downto 0) => axi_vdma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      S01_AXI_awcache(3 downto 0) => axi_vdma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      S01_AXI_awlen(7 downto 0) => axi_vdma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      S01_AXI_awlock(0) => '0',
      S01_AXI_awprot(2 downto 0) => axi_vdma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      S01_AXI_awqos(3 downto 0) => B"0000",
      S01_AXI_awready => axi_vdma_0_M_AXI_S2MM_AWREADY,
      S01_AXI_awsize(2 downto 0) => axi_vdma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      S01_AXI_awvalid => axi_vdma_0_M_AXI_S2MM_AWVALID,
      S01_AXI_bready => axi_vdma_0_M_AXI_S2MM_BREADY,
      S01_AXI_bresp(1 downto 0) => axi_vdma_0_M_AXI_S2MM_BRESP(1 downto 0),
      S01_AXI_bvalid => axi_vdma_0_M_AXI_S2MM_BVALID,
      S01_AXI_wdata(63 downto 0) => axi_vdma_0_M_AXI_S2MM_WDATA(63 downto 0),
      S01_AXI_wlast => axi_vdma_0_M_AXI_S2MM_WLAST,
      S01_AXI_wready => axi_vdma_0_M_AXI_S2MM_WREADY,
      S01_AXI_wstrb(7 downto 0) => axi_vdma_0_M_AXI_S2MM_WSTRB(7 downto 0),
      S01_AXI_wvalid => axi_vdma_0_M_AXI_S2MM_WVALID,
      S02_AXI_araddr(31 downto 0) => axi_usb2_device_0_M_AXI_ARADDR(31 downto 0),
      S02_AXI_arburst(1 downto 0) => axi_usb2_device_0_M_AXI_ARBURST(1 downto 0),
      S02_AXI_arcache(3 downto 0) => axi_usb2_device_0_M_AXI_ARCACHE(3 downto 0),
      S02_AXI_arid(0) => axi_usb2_device_0_M_AXI_ARID(0),
      S02_AXI_arlen(7 downto 0) => axi_usb2_device_0_M_AXI_ARLEN(7 downto 0),
      S02_AXI_arlock(0) => axi_usb2_device_0_M_AXI_ARLOCK,
      S02_AXI_arprot(2 downto 0) => axi_usb2_device_0_M_AXI_ARPROT(2 downto 0),
      S02_AXI_arqos(3 downto 0) => B"0000",
      S02_AXI_arready => axi_usb2_device_0_M_AXI_ARREADY,
      S02_AXI_arsize(2 downto 0) => axi_usb2_device_0_M_AXI_ARSIZE(2 downto 0),
      S02_AXI_arvalid => axi_usb2_device_0_M_AXI_ARVALID,
      S02_AXI_awaddr(31 downto 0) => axi_usb2_device_0_M_AXI_AWADDR(31 downto 0),
      S02_AXI_awburst(1 downto 0) => axi_usb2_device_0_M_AXI_AWBURST(1 downto 0),
      S02_AXI_awcache(3 downto 0) => axi_usb2_device_0_M_AXI_AWCACHE(3 downto 0),
      S02_AXI_awid(0) => axi_usb2_device_0_M_AXI_AWID(0),
      S02_AXI_awlen(7 downto 0) => axi_usb2_device_0_M_AXI_AWLEN(7 downto 0),
      S02_AXI_awlock(0) => axi_usb2_device_0_M_AXI_AWLOCK,
      S02_AXI_awprot(2 downto 0) => axi_usb2_device_0_M_AXI_AWPROT(2 downto 0),
      S02_AXI_awqos(3 downto 0) => B"0000",
      S02_AXI_awready => axi_usb2_device_0_M_AXI_AWREADY,
      S02_AXI_awsize(2 downto 0) => axi_usb2_device_0_M_AXI_AWSIZE(2 downto 0),
      S02_AXI_awvalid => axi_usb2_device_0_M_AXI_AWVALID,
      S02_AXI_bid(0) => axi_usb2_device_0_M_AXI_BID(0),
      S02_AXI_bready => axi_usb2_device_0_M_AXI_BREADY,
      S02_AXI_bresp(1 downto 0) => axi_usb2_device_0_M_AXI_BRESP(1 downto 0),
      S02_AXI_bvalid => axi_usb2_device_0_M_AXI_BVALID,
      S02_AXI_rdata(31 downto 0) => axi_usb2_device_0_M_AXI_RDATA(31 downto 0),
      S02_AXI_rid(0) => axi_usb2_device_0_M_AXI_RID(0),
      S02_AXI_rlast => axi_usb2_device_0_M_AXI_RLAST,
      S02_AXI_rready => axi_usb2_device_0_M_AXI_RREADY,
      S02_AXI_rresp(1 downto 0) => axi_usb2_device_0_M_AXI_RRESP(1 downto 0),
      S02_AXI_rvalid => axi_usb2_device_0_M_AXI_RVALID,
      S02_AXI_wdata(31 downto 0) => axi_usb2_device_0_M_AXI_WDATA(31 downto 0),
      S02_AXI_wlast => axi_usb2_device_0_M_AXI_WLAST,
      S02_AXI_wready => axi_usb2_device_0_M_AXI_WREADY,
      S02_AXI_wstrb(3 downto 0) => axi_usb2_device_0_M_AXI_WSTRB(3 downto 0),
      S02_AXI_wvalid => axi_usb2_device_0_M_AXI_WVALID,
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => proc_sys_reset_0_peripheral_aresetn(0)
    );
axi_usb2_device_0: component brd_axi_usb2_device_0_0
     port map (
      m_axi_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_araddr(31 downto 0) => axi_usb2_device_0_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_usb2_device_0_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_usb2_device_0_M_AXI_ARCACHE(3 downto 0),
      m_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axi_arid(0) => axi_usb2_device_0_M_AXI_ARID(0),
      m_axi_arlen(7 downto 0) => axi_usb2_device_0_M_AXI_ARLEN(7 downto 0),
      m_axi_arlock => axi_usb2_device_0_M_AXI_ARLOCK,
      m_axi_arprot(2 downto 0) => axi_usb2_device_0_M_AXI_ARPROT(2 downto 0),
      m_axi_arready => axi_usb2_device_0_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_usb2_device_0_M_AXI_ARSIZE(2 downto 0),
      m_axi_arvalid => axi_usb2_device_0_M_AXI_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_usb2_device_0_M_AXI_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => axi_usb2_device_0_M_AXI_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => axi_usb2_device_0_M_AXI_AWCACHE(3 downto 0),
      m_axi_awid(0) => axi_usb2_device_0_M_AXI_AWID(0),
      m_axi_awlen(7 downto 0) => axi_usb2_device_0_M_AXI_AWLEN(7 downto 0),
      m_axi_awlock => axi_usb2_device_0_M_AXI_AWLOCK,
      m_axi_awprot(2 downto 0) => axi_usb2_device_0_M_AXI_AWPROT(2 downto 0),
      m_axi_awready => axi_usb2_device_0_M_AXI_AWREADY,
      m_axi_awsize(2 downto 0) => axi_usb2_device_0_M_AXI_AWSIZE(2 downto 0),
      m_axi_awvalid => axi_usb2_device_0_M_AXI_AWVALID,
      m_axi_bid(0) => axi_usb2_device_0_M_AXI_BID(0),
      m_axi_bready => axi_usb2_device_0_M_AXI_BREADY,
      m_axi_bresp(1 downto 0) => axi_usb2_device_0_M_AXI_BRESP(1 downto 0),
      m_axi_bvalid => axi_usb2_device_0_M_AXI_BVALID,
      m_axi_rdata(31 downto 0) => axi_usb2_device_0_M_AXI_RDATA(31 downto 0),
      m_axi_rid(0) => axi_usb2_device_0_M_AXI_RID(0),
      m_axi_rlast => axi_usb2_device_0_M_AXI_RLAST,
      m_axi_rready => axi_usb2_device_0_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_usb2_device_0_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_usb2_device_0_M_AXI_RVALID,
      m_axi_wdata(31 downto 0) => axi_usb2_device_0_M_AXI_WDATA(31 downto 0),
      m_axi_wlast => axi_usb2_device_0_M_AXI_WLAST,
      m_axi_wready => axi_usb2_device_0_M_AXI_WREADY,
      m_axi_wstrb(3 downto 0) => axi_usb2_device_0_M_AXI_WSTRB(3 downto 0),
      m_axi_wvalid => axi_usb2_device_0_M_AXI_WVALID,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(15 downto 0) => ps7_0_axi_periph_M06_AXI_ARADDR(15 downto 0),
      s_axi_arburst(1 downto 0) => ps7_0_axi_periph_M06_AXI_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => ps7_0_axi_periph_M06_AXI_ARCACHE(3 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arlen(7 downto 0) => ps7_0_axi_periph_M06_AXI_ARLEN(7 downto 0),
      s_axi_arlock => ps7_0_axi_periph_M06_AXI_ARLOCK,
      s_axi_arprot(2 downto 0) => ps7_0_axi_periph_M06_AXI_ARPROT(2 downto 0),
      s_axi_arready => ps7_0_axi_periph_M06_AXI_ARREADY,
      s_axi_arsize(2 downto 0) => ps7_0_axi_periph_M06_AXI_ARSIZE(2 downto 0),
      s_axi_arvalid => ps7_0_axi_periph_M06_AXI_ARVALID,
      s_axi_awaddr(15 downto 0) => ps7_0_axi_periph_M06_AXI_AWADDR(15 downto 0),
      s_axi_awburst(1 downto 0) => ps7_0_axi_periph_M06_AXI_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => ps7_0_axi_periph_M06_AXI_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => ps7_0_axi_periph_M06_AXI_AWLEN(7 downto 0),
      s_axi_awlock => ps7_0_axi_periph_M06_AXI_AWLOCK,
      s_axi_awprot(2 downto 0) => ps7_0_axi_periph_M06_AXI_AWPROT(2 downto 0),
      s_axi_awready => ps7_0_axi_periph_M06_AXI_AWREADY,
      s_axi_awsize(2 downto 0) => ps7_0_axi_periph_M06_AXI_AWSIZE(2 downto 0),
      s_axi_awvalid => ps7_0_axi_periph_M06_AXI_AWVALID,
      s_axi_bready => ps7_0_axi_periph_M06_AXI_BREADY,
      s_axi_bresp(1 downto 0) => ps7_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      s_axi_bvalid => ps7_0_axi_periph_M06_AXI_BVALID,
      s_axi_rdata(31 downto 0) => ps7_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      s_axi_rlast => ps7_0_axi_periph_M06_AXI_RLAST,
      s_axi_rready => ps7_0_axi_periph_M06_AXI_RREADY,
      s_axi_rresp(1 downto 0) => ps7_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      s_axi_rvalid => ps7_0_axi_periph_M06_AXI_RVALID,
      s_axi_wdata(31 downto 0) => ps7_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      s_axi_wlast => ps7_0_axi_periph_M06_AXI_WLAST,
      s_axi_wready => ps7_0_axi_periph_M06_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => ps7_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => ps7_0_axi_periph_M06_AXI_WVALID,
      ulpi_clock => ulpi_clock_0_1,
      ulpi_data_i(7 downto 0) => ULPI_0_1_DATA_I(7 downto 0),
      ulpi_data_o(7 downto 0) => ULPI_0_1_DATA_O(7 downto 0),
      ulpi_data_t => ULPI_0_1_DATA_T,
      ulpi_dir => ULPI_0_1_DIR,
      ulpi_next => ULPI_0_1_NEXT,
      ulpi_reset => ULPI_0_1_RST,
      ulpi_stop => ULPI_0_1_STOP,
      usb_irpt => axi_usb2_device_0_usb_irpt
    );
axi_vdma_0: component brd_axi_vdma_0_0
     port map (
      axi_resetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axi_mm2s_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_mm2s_araddr(31 downto 0) => axi_vdma_0_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => axi_vdma_0_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => axi_vdma_0_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => axi_vdma_0_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => axi_vdma_0_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => axi_vdma_0_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => axi_vdma_0_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_arvalid => axi_vdma_0_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(63 downto 0) => axi_vdma_0_M_AXI_MM2S_RDATA(63 downto 0),
      m_axi_mm2s_rlast => axi_vdma_0_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => axi_vdma_0_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => axi_vdma_0_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => axi_vdma_0_M_AXI_MM2S_RVALID,
      m_axi_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_s2mm_awaddr(31 downto 0) => axi_vdma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_vdma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_vdma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_vdma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_vdma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_vdma_0_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_vdma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_vdma_0_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_vdma_0_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_vdma_0_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_vdma_0_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(63 downto 0) => axi_vdma_0_M_AXI_S2MM_WDATA(63 downto 0),
      m_axi_s2mm_wlast => axi_vdma_0_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_vdma_0_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(7 downto 0) => axi_vdma_0_M_AXI_S2MM_WSTRB(7 downto 0),
      m_axi_s2mm_wvalid => axi_vdma_0_M_AXI_S2MM_WVALID,
      m_axis_mm2s_aclk => processing_system7_0_FCLK_CLK0,
      m_axis_mm2s_tdata(23 downto 0) => axi_vdma_0_M_AXIS_MM2S_TDATA(23 downto 0),
      m_axis_mm2s_tkeep(2 downto 0) => NLW_axi_vdma_0_m_axis_mm2s_tkeep_UNCONNECTED(2 downto 0),
      m_axis_mm2s_tlast => axi_vdma_0_M_AXIS_MM2S_TLAST,
      m_axis_mm2s_tready => axi_vdma_0_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tuser(0) => axi_vdma_0_M_AXIS_MM2S_TUSER(0),
      m_axis_mm2s_tvalid => axi_vdma_0_M_AXIS_MM2S_TVALID,
      mm2s_frame_ptr_out(5 downto 0) => NLW_axi_vdma_0_mm2s_frame_ptr_out_UNCONNECTED(5 downto 0),
      mm2s_introut => NLW_axi_vdma_0_mm2s_introut_UNCONNECTED,
      s2mm_frame_ptr_out(5 downto 0) => NLW_axi_vdma_0_s2mm_frame_ptr_out_UNCONNECTED(5 downto 0),
      s2mm_introut => NLW_axi_vdma_0_s2mm_introut_UNCONNECTED,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_araddr(8 downto 0) => ps7_0_axi_periph_M01_AXI_ARADDR(8 downto 0),
      s_axi_lite_arready => ps7_0_axi_periph_M01_AXI_ARREADY,
      s_axi_lite_arvalid => ps7_0_axi_periph_M01_AXI_ARVALID,
      s_axi_lite_awaddr(8 downto 0) => ps7_0_axi_periph_M01_AXI_AWADDR(8 downto 0),
      s_axi_lite_awready => ps7_0_axi_periph_M01_AXI_AWREADY,
      s_axi_lite_awvalid => ps7_0_axi_periph_M01_AXI_AWVALID,
      s_axi_lite_bready => ps7_0_axi_periph_M01_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => ps7_0_axi_periph_M01_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => ps7_0_axi_periph_M01_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => ps7_0_axi_periph_M01_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => ps7_0_axi_periph_M01_AXI_WREADY,
      s_axi_lite_wvalid => ps7_0_axi_periph_M01_AXI_WVALID,
      s_axis_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_s2mm_tdata(23 downto 0) => eventStreamToConstEn_0_frameStream_TDATA(23 downto 0),
      s_axis_s2mm_tkeep(2 downto 0) => eventStreamToConstEn_0_frameStream_TKEEP(2 downto 0),
      s_axis_s2mm_tlast => eventStreamToConstEn_0_frameStream_TLAST(0),
      s_axis_s2mm_tready => eventStreamToConstEn_0_frameStream_TREADY,
      s_axis_s2mm_tuser(0) => eventStreamToConstEn_0_frameStream_TUSER(0),
      s_axis_s2mm_tvalid => eventStreamToConstEn_0_frameStream_TVALID
    );
axis_data_fifo_0: component brd_axis_data_fifo_0_0
     port map (
      axis_data_count(31 downto 0) => axis_data_count(31 downto 0),
      axis_rd_data_count(31 downto 0) => axis_rd_data_count(31 downto 0),
      axis_wr_data_count(31 downto 0) => axis_wr_data_count(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(15 downto 0),
      m_axis_tready => axis_data_fifo_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_0_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => EVFastCornerStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      s_axis_tready => EVFastCornerStream_0_xStreamOut_V_V_TREADY,
      s_axis_tvalid => EVFastCornerStream_0_xStreamOut_V_V_TVALID
    );
axis_data_fifo_1: component brd_axis_data_fifo_1_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_1_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_1_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_1_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_1_M_AXIS_TDATA(15 downto 0),
      m_axis_tready => axis_data_fifo_1_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_1_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => EVFastCornerStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      s_axis_tready => EVFastCornerStream_0_yStreamOut_V_V_TREADY,
      s_axis_tvalid => EVFastCornerStream_0_yStreamOut_V_V_TVALID
    );
axis_data_fifo_2: component brd_axis_data_fifo_1_1
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_2_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_2_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_2_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => axis_data_fifo_2_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_2_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => EVFastCornerStream_0_tsStreamOut_V_V_TDATA(63 downto 0),
      s_axis_tready => EVFastCornerStream_0_tsStreamOut_V_V_TREADY,
      s_axis_tvalid => EVFastCornerStream_0_tsStreamOut_V_V_TVALID
    );
axis_data_fifo_3: component brd_axis_data_fifo_1_2
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_3_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_3_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_3_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(7 downto 0) => axis_data_fifo_3_M_AXIS_TDATA(7 downto 0),
      m_axis_tready => axis_data_fifo_3_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_3_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axis_tdata(7 downto 0) => EVFastCornerStream_0_polStreamOut_V_V_TDATA(7 downto 0),
      s_axis_tready => EVFastCornerStream_0_polStreamOut_V_V_TREADY,
      s_axis_tvalid => EVFastCornerStream_0_polStreamOut_V_V_TVALID
    );
const_HIGH: component brd_const_HIGH_0
     port map (
      dout(0) => Net2(0)
    );
const_VCC: component brd_const_VCC_0
     port map (
      dout(0) => const_VCC_dout(0)
    );
const_ZERO: component brd_const_ZERO_0
     port map (
      dout(0) => Net1(0)
    );
eventStreamToConstEn_0: component brd_eventStreamToConstEn_0_1
     port map (
      ap_clk => processing_system7_0_FCLK_CLK0,
      ap_done => NLW_eventStreamToConstEn_0_ap_done_UNCONNECTED,
      ap_idle => NLW_eventStreamToConstEn_0_ap_idle_UNCONNECTED,
      ap_ready => NLW_eventStreamToConstEn_0_ap_ready_UNCONNECTED,
      ap_rst_n => proc_sys_reset_0_peripheral_aresetn(0),
      ap_start => const_VCC_dout(0),
      count_V(63 downto 0) => count_V(63 downto 0),
      count_V_ap_vld => NLW_eventStreamToConstEn_0_count_V_ap_vld_UNCONNECTED,
      custDataStream_V_V_TDATA(7 downto 0) => EVABMOFStream_0_pixelDataStream_V_V_TDATA(7 downto 0),
      custDataStream_V_V_TREADY => EVABMOFStream_0_pixelDataStream_V_V_TREADY,
      custDataStream_V_V_TVALID => EVABMOFStream_0_pixelDataStream_V_V_TVALID,
      frameStream_TDATA(23 downto 0) => eventStreamToConstEn_0_frameStream_TDATA(23 downto 0),
      frameStream_TDEST(0) => eventStreamToConstEn_0_frameStream_TDEST(0),
      frameStream_TID(0) => eventStreamToConstEn_0_frameStream_TID(0),
      frameStream_TKEEP(2 downto 0) => eventStreamToConstEn_0_frameStream_TKEEP(2 downto 0),
      frameStream_TLAST(0) => eventStreamToConstEn_0_frameStream_TLAST(0),
      frameStream_TREADY => eventStreamToConstEn_0_frameStream_TREADY,
      frameStream_TSTRB(2 downto 0) => eventStreamToConstEn_0_frameStream_TSTRB(2 downto 0),
      frameStream_TUSER(1 downto 0) => eventStreamToConstEn_0_frameStream_TUSER(1 downto 0),
      frameStream_TVALID => eventStreamToConstEn_0_frameStream_TVALID,
      hCnt_V(15 downto 0) => hCnt_V(15 downto 0),
      hCnt_V_ap_vld => NLW_eventStreamToConstEn_0_hCnt_V_ap_vld_UNCONNECTED,
      polReg_V(0) => polReg_V(0),
      polReg_V_ap_vld => NLW_eventStreamToConstEn_0_polReg_V_ap_vld_UNCONNECTED,
      polStream_V_V_TDATA(7 downto 0) => EVABMOFStream_0_polStreamOut_V_V_TDATA(7 downto 0),
      polStream_V_V_TREADY => EVABMOFStream_0_polStreamOut_V_V_TREADY,
      polStream_V_V_TVALID => EVABMOFStream_0_polStreamOut_V_V_TVALID,
      regX_V(15 downto 0) => regX_V(15 downto 0),
      regX_V_ap_vld => NLW_eventStreamToConstEn_0_regX_V_ap_vld_UNCONNECTED,
      regY_V(15 downto 0) => regY_V(15 downto 0),
      regY_V_ap_vld => NLW_eventStreamToConstEn_0_regY_V_ap_vld_UNCONNECTED,
      s_axi_config_ARADDR(4 downto 0) => ps7_0_axi_periph_M02_AXI_ARADDR(4 downto 0),
      s_axi_config_ARREADY => ps7_0_axi_periph_M02_AXI_ARREADY,
      s_axi_config_ARVALID => ps7_0_axi_periph_M02_AXI_ARVALID,
      s_axi_config_AWADDR(4 downto 0) => ps7_0_axi_periph_M02_AXI_AWADDR(4 downto 0),
      s_axi_config_AWREADY => ps7_0_axi_periph_M02_AXI_AWREADY,
      s_axi_config_AWVALID => ps7_0_axi_periph_M02_AXI_AWVALID,
      s_axi_config_BREADY => ps7_0_axi_periph_M02_AXI_BREADY,
      s_axi_config_BRESP(1 downto 0) => ps7_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      s_axi_config_BVALID => ps7_0_axi_periph_M02_AXI_BVALID,
      s_axi_config_RDATA(31 downto 0) => ps7_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      s_axi_config_RREADY => ps7_0_axi_periph_M02_AXI_RREADY,
      s_axi_config_RRESP(1 downto 0) => ps7_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      s_axi_config_RVALID => ps7_0_axi_periph_M02_AXI_RVALID,
      s_axi_config_WDATA(31 downto 0) => ps7_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      s_axi_config_WREADY => ps7_0_axi_periph_M02_AXI_WREADY,
      s_axi_config_WSTRB(3 downto 0) => ps7_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      s_axi_config_WVALID => ps7_0_axi_periph_M02_AXI_WVALID,
      skipFlgOutput_V(0) => skipFlgOutput_V(0),
      skipFlgOutput_V_ap_vld => NLW_eventStreamToConstEn_0_skipFlgOutput_V_ap_vld_UNCONNECTED,
      tsReg_V(31 downto 0) => tsReg_V(31 downto 0),
      tsReg_V_ap_vld => NLW_eventStreamToConstEn_0_tsReg_V_ap_vld_UNCONNECTED,
      tsStream_V_V_TDATA(31 downto 0) => EVABMOFStream_0_tsStreamOut_V_V_TDATA(31 downto 0),
      tsStream_V_V_TREADY => EVABMOFStream_0_tsStreamOut_V_V_TREADY,
      tsStream_V_V_TVALID => EVABMOFStream_0_tsStreamOut_V_V_TVALID,
      vCnt_V(15 downto 0) => vCnt_V(15 downto 0),
      vCnt_V_ap_vld => NLW_eventStreamToConstEn_0_vCnt_V_ap_vld_UNCONNECTED,
      vgaEn_V(0) => vgaEn_V(0),
      vgaEn_V_ap_vld => NLW_eventStreamToConstEn_0_vgaEn_V_ap_vld_UNCONNECTED,
      xStream_V_V_TDATA(15 downto 0) => EVABMOFStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      xStream_V_V_TREADY => EVABMOFStream_0_xStreamOut_V_V_TREADY,
      xStream_V_V_TVALID => EVABMOFStream_0_xStreamOut_V_V_TVALID,
      yStream_V_V_TDATA(15 downto 0) => EVABMOFStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      yStream_V_V_TREADY => EVABMOFStream_0_yStreamOut_V_V_TREADY,
      yStream_V_V_TVALID => EVABMOFStream_0_yStreamOut_V_V_TVALID
    );
proc_sys_reset_0: component brd_proc_sys_reset_0_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => proc_sys_reset_0_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_0_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
proc_sys_reset_1: component brd_proc_sys_reset_1_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_1_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_1_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_1_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK1
    );
processing_system7_0: component brd_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_CLK1 => processing_system7_0_FCLK_CLK1,
      FCLK_CLK2 => NLW_processing_system7_0_FCLK_CLK2_UNCONNECTED,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      I2C1_SCL_I => '0',
      I2C1_SCL_O => NLW_processing_system7_0_I2C1_SCL_O_UNCONNECTED,
      I2C1_SCL_T => NLW_processing_system7_0_I2C1_SCL_T_UNCONNECTED,
      I2C1_SDA_I => '0',
      I2C1_SDA_O => NLW_processing_system7_0_I2C1_SDA_O_UNCONNECTED,
      I2C1_SDA_T => NLW_processing_system7_0_I2C1_SDA_T_UNCONNECTED,
      IRQ_F2P(1 downto 0) => xlconcat_0_dout(1 downto 0),
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      SPI0_MISO_I => testAERDVSSM_0_SPIMISO_DZO,
      SPI0_MISO_O => NLW_processing_system7_0_SPI0_MISO_O_UNCONNECTED,
      SPI0_MISO_T => NLW_processing_system7_0_SPI0_MISO_T_UNCONNECTED,
      SPI0_MOSI_I => '0',
      SPI0_MOSI_O => processing_system7_0_SPI0_MOSI_O,
      SPI0_MOSI_T => NLW_processing_system7_0_SPI0_MOSI_T_UNCONNECTED,
      SPI0_SCLK_I => '0',
      SPI0_SCLK_O => processing_system7_0_SPI0_SCLK_O,
      SPI0_SCLK_T => NLW_processing_system7_0_SPI0_SCLK_T_UNCONNECTED,
      SPI0_SS1_O => processing_system7_0_SPI0_SS1_O,
      SPI0_SS2_O => NLW_processing_system7_0_SPI0_SS2_O_UNCONNECTED,
      SPI0_SS_I => const_VCC_dout(0),
      SPI0_SS_O => NLW_processing_system7_0_SPI0_SS_O_UNCONNECTED,
      SPI0_SS_T => NLW_processing_system7_0_SPI0_SS_T_UNCONNECTED,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP0_ARADDR(31 downto 0) => axi_smc_M00_AXI_ARADDR(31 downto 0),
      S_AXI_HP0_ARBURST(1 downto 0) => axi_smc_M00_AXI_ARBURST(1 downto 0),
      S_AXI_HP0_ARCACHE(3 downto 0) => axi_smc_M00_AXI_ARCACHE(3 downto 0),
      S_AXI_HP0_ARID(5 downto 0) => B"000000",
      S_AXI_HP0_ARLEN(3 downto 0) => axi_smc_M00_AXI_ARLEN(3 downto 0),
      S_AXI_HP0_ARLOCK(1 downto 0) => axi_smc_M00_AXI_ARLOCK(1 downto 0),
      S_AXI_HP0_ARPROT(2 downto 0) => axi_smc_M00_AXI_ARPROT(2 downto 0),
      S_AXI_HP0_ARQOS(3 downto 0) => axi_smc_M00_AXI_ARQOS(3 downto 0),
      S_AXI_HP0_ARREADY => axi_smc_M00_AXI_ARREADY,
      S_AXI_HP0_ARSIZE(2 downto 0) => axi_smc_M00_AXI_ARSIZE(2 downto 0),
      S_AXI_HP0_ARVALID => axi_smc_M00_AXI_ARVALID,
      S_AXI_HP0_AWADDR(31 downto 0) => axi_smc_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => axi_smc_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => axi_smc_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 0) => B"000000",
      S_AXI_HP0_AWLEN(3 downto 0) => axi_smc_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => axi_smc_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => axi_smc_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => axi_smc_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => axi_smc_M00_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => axi_smc_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => axi_smc_M00_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_BREADY => axi_smc_M00_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => axi_smc_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => axi_smc_M00_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(63 downto 0) => axi_smc_M00_AXI_RDATA(63 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_RLAST => axi_smc_M00_AXI_RLAST,
      S_AXI_HP0_RREADY => axi_smc_M00_AXI_RREADY,
      S_AXI_HP0_RRESP(1 downto 0) => axi_smc_M00_AXI_RRESP(1 downto 0),
      S_AXI_HP0_RVALID => axi_smc_M00_AXI_RVALID,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(63 downto 0) => axi_smc_M00_AXI_WDATA(63 downto 0),
      S_AXI_HP0_WID(5 downto 0) => B"000000",
      S_AXI_HP0_WLAST => axi_smc_M00_AXI_WLAST,
      S_AXI_HP0_WREADY => axi_smc_M00_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(7 downto 0) => axi_smc_M00_AXI_WSTRB(7 downto 0),
      S_AXI_HP0_WVALID => axi_smc_M00_AXI_WVALID,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => '0',
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED,
      USB1_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB1_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB1_VBUS_PWRFAULT => '0',
      USB1_VBUS_PWRSELECT => NLW_processing_system7_0_USB1_VBUS_PWRSELECT_UNCONNECTED
    );
ps7_0_axi_periph: entity work.brd_ps7_0_axi_periph_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => proc_sys_reset_0_interconnect_aresetn(0),
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arready => ps7_0_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid => ps7_0_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awready => ps7_0_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid => ps7_0_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => ps7_0_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => ps7_0_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => ps7_0_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => ps7_0_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => ps7_0_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => ps7_0_axi_periph_M00_AXI_WVALID,
      M01_ACLK => processing_system7_0_FCLK_CLK0,
      M01_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M01_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arready => ps7_0_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arvalid => ps7_0_axi_periph_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awready => ps7_0_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awvalid => ps7_0_axi_periph_M01_AXI_AWVALID,
      M01_AXI_bready => ps7_0_axi_periph_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => ps7_0_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => ps7_0_axi_periph_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => ps7_0_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => ps7_0_axi_periph_M01_AXI_WREADY,
      M01_AXI_wvalid => ps7_0_axi_periph_M01_AXI_WVALID,
      M02_ACLK => processing_system7_0_FCLK_CLK0,
      M02_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M02_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M02_AXI_ARADDR(31 downto 0),
      M02_AXI_arready => ps7_0_axi_periph_M02_AXI_ARREADY,
      M02_AXI_arvalid => ps7_0_axi_periph_M02_AXI_ARVALID,
      M02_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M02_AXI_AWADDR(31 downto 0),
      M02_AXI_awready => ps7_0_axi_periph_M02_AXI_AWREADY,
      M02_AXI_awvalid => ps7_0_axi_periph_M02_AXI_AWVALID,
      M02_AXI_bready => ps7_0_axi_periph_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => ps7_0_axi_periph_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => ps7_0_axi_periph_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => ps7_0_axi_periph_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => ps7_0_axi_periph_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => ps7_0_axi_periph_M02_AXI_WVALID,
      M03_ACLK => processing_system7_0_FCLK_CLK0,
      M03_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M03_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M03_AXI_ARADDR(31 downto 0),
      M03_AXI_arready => ps7_0_axi_periph_M03_AXI_ARREADY,
      M03_AXI_arvalid => ps7_0_axi_periph_M03_AXI_ARVALID,
      M03_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awready => ps7_0_axi_periph_M03_AXI_AWREADY,
      M03_AXI_awvalid => ps7_0_axi_periph_M03_AXI_AWVALID,
      M03_AXI_bready => ps7_0_axi_periph_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => ps7_0_axi_periph_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => ps7_0_axi_periph_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => ps7_0_axi_periph_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => ps7_0_axi_periph_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => ps7_0_axi_periph_M03_AXI_WVALID,
      M04_ACLK => processing_system7_0_FCLK_CLK0,
      M04_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M04_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M04_AXI_ARADDR(31 downto 0),
      M04_AXI_arready => ps7_0_axi_periph_M04_AXI_ARREADY,
      M04_AXI_arvalid => ps7_0_axi_periph_M04_AXI_ARVALID,
      M04_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M04_AXI_AWADDR(31 downto 0),
      M04_AXI_awready => ps7_0_axi_periph_M04_AXI_AWREADY,
      M04_AXI_awvalid => ps7_0_axi_periph_M04_AXI_AWVALID,
      M04_AXI_bready => ps7_0_axi_periph_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => ps7_0_axi_periph_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready => ps7_0_axi_periph_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => ps7_0_axi_periph_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready => ps7_0_axi_periph_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => ps7_0_axi_periph_M04_AXI_WVALID,
      M05_ACLK => processing_system7_0_FCLK_CLK0,
      M05_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M05_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M05_AXI_ARADDR(31 downto 0),
      M05_AXI_arready => ps7_0_axi_periph_M05_AXI_ARREADY,
      M05_AXI_arvalid => ps7_0_axi_periph_M05_AXI_ARVALID,
      M05_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M05_AXI_AWADDR(31 downto 0),
      M05_AXI_awready => ps7_0_axi_periph_M05_AXI_AWREADY,
      M05_AXI_awvalid => ps7_0_axi_periph_M05_AXI_AWVALID,
      M05_AXI_bready => ps7_0_axi_periph_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => ps7_0_axi_periph_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready => ps7_0_axi_periph_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => ps7_0_axi_periph_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready => ps7_0_axi_periph_M05_AXI_WREADY,
      M05_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid => ps7_0_axi_periph_M05_AXI_WVALID,
      M06_ACLK => processing_system7_0_FCLK_CLK0,
      M06_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      M06_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M06_AXI_ARADDR(31 downto 0),
      M06_AXI_arburst(1 downto 0) => ps7_0_axi_periph_M06_AXI_ARBURST(1 downto 0),
      M06_AXI_arcache(3 downto 0) => ps7_0_axi_periph_M06_AXI_ARCACHE(3 downto 0),
      M06_AXI_arlen(7 downto 0) => ps7_0_axi_periph_M06_AXI_ARLEN(7 downto 0),
      M06_AXI_arlock => ps7_0_axi_periph_M06_AXI_ARLOCK,
      M06_AXI_arprot(2 downto 0) => ps7_0_axi_periph_M06_AXI_ARPROT(2 downto 0),
      M06_AXI_arready => ps7_0_axi_periph_M06_AXI_ARREADY,
      M06_AXI_arsize(2 downto 0) => ps7_0_axi_periph_M06_AXI_ARSIZE(2 downto 0),
      M06_AXI_arvalid => ps7_0_axi_periph_M06_AXI_ARVALID,
      M06_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M06_AXI_AWADDR(31 downto 0),
      M06_AXI_awburst(1 downto 0) => ps7_0_axi_periph_M06_AXI_AWBURST(1 downto 0),
      M06_AXI_awcache(3 downto 0) => ps7_0_axi_periph_M06_AXI_AWCACHE(3 downto 0),
      M06_AXI_awlen(7 downto 0) => ps7_0_axi_periph_M06_AXI_AWLEN(7 downto 0),
      M06_AXI_awlock => ps7_0_axi_periph_M06_AXI_AWLOCK,
      M06_AXI_awprot(2 downto 0) => ps7_0_axi_periph_M06_AXI_AWPROT(2 downto 0),
      M06_AXI_awready => ps7_0_axi_periph_M06_AXI_AWREADY,
      M06_AXI_awsize(2 downto 0) => ps7_0_axi_periph_M06_AXI_AWSIZE(2 downto 0),
      M06_AXI_awvalid => ps7_0_axi_periph_M06_AXI_AWVALID,
      M06_AXI_bready => ps7_0_axi_periph_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => ps7_0_axi_periph_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rlast => ps7_0_axi_periph_M06_AXI_RLAST,
      M06_AXI_rready => ps7_0_axi_periph_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => ps7_0_axi_periph_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wlast => ps7_0_axi_periph_M06_AXI_WLAST,
      M06_AXI_wready => ps7_0_axi_periph_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => ps7_0_axi_periph_M06_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN => proc_sys_reset_0_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID
    );
system_ila_0: component brd_system_ila_0_0
     port map (
      SLOT_0_AXIS_tdata(15 downto 0) => EVABMOFStream_0_xStreamOut_V_V_TDATA(15 downto 0),
      SLOT_0_AXIS_tlast => '0',
      SLOT_0_AXIS_tready => EVABMOFStream_0_xStreamOut_V_V_TREADY,
      SLOT_0_AXIS_tvalid => EVABMOFStream_0_xStreamOut_V_V_TVALID,
      SLOT_1_AXIS_tdata(15 downto 0) => EVABMOFStream_0_yStreamOut_V_V_TDATA(15 downto 0),
      SLOT_1_AXIS_tlast => '0',
      SLOT_1_AXIS_tready => EVABMOFStream_0_yStreamOut_V_V_TREADY,
      SLOT_1_AXIS_tvalid => EVABMOFStream_0_yStreamOut_V_V_TVALID,
      SLOT_2_AXIS_tdata(23 downto 0) => eventStreamToConstEn_0_frameStream_TDATA(23 downto 0),
      SLOT_2_AXIS_tdest(0) => eventStreamToConstEn_0_frameStream_TDEST(0),
      SLOT_2_AXIS_tid(0) => eventStreamToConstEn_0_frameStream_TID(0),
      SLOT_2_AXIS_tkeep(2 downto 0) => eventStreamToConstEn_0_frameStream_TKEEP(2 downto 0),
      SLOT_2_AXIS_tlast => eventStreamToConstEn_0_frameStream_TLAST(0),
      SLOT_2_AXIS_tready => eventStreamToConstEn_0_frameStream_TREADY,
      SLOT_2_AXIS_tstrb(2 downto 0) => eventStreamToConstEn_0_frameStream_TSTRB(2 downto 0),
      SLOT_2_AXIS_tuser(1 downto 0) => eventStreamToConstEn_0_frameStream_TUSER(1 downto 0),
      SLOT_2_AXIS_tvalid => eventStreamToConstEn_0_frameStream_TVALID,
      SLOT_3_AXIS_tdata(63 downto 0) => EVABMOFStream_0_tsStreamOut_V_V_TDATA(63 downto 0),
      SLOT_3_AXIS_tlast => '0',
      SLOT_3_AXIS_tready => EVABMOFStream_0_tsStreamOut_V_V_TREADY,
      SLOT_3_AXIS_tvalid => EVABMOFStream_0_tsStreamOut_V_V_TVALID,
      SLOT_4_AXIS_tdata(31 downto 8) => B"000000000000000000000000",
      SLOT_4_AXIS_tdata(7 downto 0) => EVABMOFStream_0_polStreamOut_V_V_TDATA(7 downto 0),
      SLOT_4_AXIS_tlast => '0',
      SLOT_4_AXIS_tready => EVABMOFStream_0_polStreamOut_V_V_TREADY,
      SLOT_4_AXIS_tvalid => EVABMOFStream_0_polStreamOut_V_V_TVALID,
      SLOT_5_AXIS_tdata(31 downto 8) => B"000000000000000000000000",
      SLOT_5_AXIS_tdata(7 downto 0) => EVABMOFStream_0_pixelDataStream_V_V_TDATA(7 downto 0),
      SLOT_5_AXIS_tlast => '0',
      SLOT_5_AXIS_tready => EVABMOFStream_0_pixelDataStream_V_V_TREADY,
      SLOT_5_AXIS_tvalid => EVABMOFStream_0_pixelDataStream_V_V_TVALID,
      clk => processing_system7_0_FCLK_CLK0,
      probe0(0) => skipFlgOutput_V(0),
      probe1(15 downto 0) => xRegReg_V(15 downto 0),
      probe10(15 downto 0) => vCnt_V(15 downto 0),
      probe11(63 downto 0) => count_V(63 downto 0),
      probe12(0) => testAERDVSSM_0_AERSMOutFifoWrite_SO,
      probe13(15 downto 0) => testAERDVSSM_0_AERSMOutFifoData_DO(15 downto 0),
      probe14(0) => polRegReg_V(0),
      probe15(31 downto 0) => axis_data_count(31 downto 0),
      probe16(31 downto 0) => axis_wr_data_count(31 downto 0),
      probe17(31 downto 0) => axis_rd_data_count(31 downto 0),
      probe18(31 downto 0) => tsReg_V(31 downto 0),
      probe2(15 downto 0) => regY_V(15 downto 0),
      probe3(0) => polReg_V(0),
      probe4(15 downto 0) => yRegReg_V(15 downto 0),
      probe5(63 downto 0) => tsRegReg_V(63 downto 0),
      probe6(15 downto 0) => hCnt_V(15 downto 0),
      probe7(15 downto 0) => regX_V(15 downto 0),
      probe8(15 downto 0) => dataReg_V(15 downto 0),
      probe9(0) => vgaEn_V(0),
      resetn => proc_sys_reset_0_peripheral_aresetn(0)
    );
testAERDVSSM_0: component brd_testAERDVSSM_0_0
     port map (
      ADCClk_CI => processing_system7_0_FCLK_CLK0,
      AERSMFifoAlmostFull_AI => Net1(0),
      AERSMFifoFull_AI => Net1(0),
      AERSMOutFifoData_DO(15 downto 0) => testAERDVSSM_0_AERSMOutFifoData_DO(15 downto 0),
      AERSMOutFifoWrite_SO => testAERDVSSM_0_AERSMOutFifoWrite_SO,
      ChipBiasAddrSelect_SBO => testAERDVSSM_0_ChipBiasAddrSelect_SBO,
      ChipBiasBitIn_DO => testAERDVSSM_0_ChipBiasBitIn_DO,
      ChipBiasClock_CBO => testAERDVSSM_0_ChipBiasClock_CBO,
      ChipBiasDiagSelect_SO => testAERDVSSM_0_ChipBiasDiagSelect_SO,
      ChipBiasEnable_SO => testAERDVSSM_0_ChipBiasEnable_SO,
      ChipBiasLatch_SBO => testAERDVSSM_0_ChipBiasLatch_SBO,
      DVSAERAck_SBO => testAERDVSSM_0_DVSAERAck_SBO,
      DVSAERData_AI(10 downto 0) => DVSAERData_AI_0_1(10 downto 0),
      DVSAERReq_ABI => DVSAERReq_ABI_0_1,
      DVSAERReset_SBO => testAERDVSSM_0_DVSAERReset_SBO,
      IMUClock_CZO => testAERDVSSM_0_IMUClock_CZO,
      IMUData_DZIO => IMUData_DZIO_0,
      IMUFSync_SO => testAERDVSSM_0_IMUFSync_SO,
      IMUInterrupt_AI => IMUInterrupt_AI_0_1,
      LogicClk_CI => processing_system7_0_FCLK_CLK0,
      Reset_RI => xlslice_0_Dout(0),
      SPIClock_AI => processing_system7_0_SPI0_SCLK_O,
      SPIMISO_DZO => testAERDVSSM_0_SPIMISO_DZO,
      SPIMOSI_AI => processing_system7_0_SPI0_MOSI_O,
      SPISlaveSelect_ABI => processing_system7_0_SPI0_SS1_O,
      SyncInClock_AI => SyncInClock_AI_0_1,
      SyncInSignal1_AI => SyncInSignal1_AI_0_1,
      SyncInSignal2_AI => SyncInSignal2_AI_0_1,
      SyncInSignal_AI => SyncInSignal_AI_0_1,
      SyncOutClock_CO => testAERDVSSM_0_SyncOutClock_CO,
      SyncOutSignal_SO => testAERDVSSM_0_SyncOutSignal_SO,
      USBClock_CI => processing_system7_0_FCLK_CLK0
    );
v_axi4s_vid_out_0: component brd_v_axi4s_vid_out_0_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aclken => Net2(0),
      aresetn => proc_sys_reset_1_peripheral_aresetn(0),
      fid => Net1(0),
      locked => NLW_v_axi4s_vid_out_0_locked_UNCONNECTED,
      overflow => NLW_v_axi4s_vid_out_0_overflow_UNCONNECTED,
      s_axis_video_tdata(23 downto 0) => axi_vdma_0_M_AXIS_MM2S_TDATA(23 downto 0),
      s_axis_video_tlast => axi_vdma_0_M_AXIS_MM2S_TLAST,
      s_axis_video_tready => axi_vdma_0_M_AXIS_MM2S_TREADY,
      s_axis_video_tuser => axi_vdma_0_M_AXIS_MM2S_TUSER(0),
      s_axis_video_tvalid => axi_vdma_0_M_AXIS_MM2S_TVALID,
      status(31 downto 0) => NLW_v_axi4s_vid_out_0_status_UNCONNECTED(31 downto 0),
      underflow => NLW_v_axi4s_vid_out_0_underflow_UNCONNECTED,
      vid_active_video => NLW_v_axi4s_vid_out_0_vid_active_video_UNCONNECTED,
      vid_data(23 downto 0) => v_axi4s_vid_out_0_vid_data(23 downto 0),
      vid_field_id => NLW_v_axi4s_vid_out_0_vid_field_id_UNCONNECTED,
      vid_hblank => NLW_v_axi4s_vid_out_0_vid_hblank_UNCONNECTED,
      vid_hsync => v_axi4s_vid_out_0_vid_hsync,
      vid_io_out_ce => Net2(0),
      vid_io_out_clk => processing_system7_0_FCLK_CLK1,
      vid_io_out_reset => Net1(0),
      vid_vblank => NLW_v_axi4s_vid_out_0_vid_vblank_UNCONNECTED,
      vid_vsync => v_axi4s_vid_out_0_vid_vsync,
      vtg_active_video => v_tc_0_vtiming_out_ACTIVE_VIDEO,
      vtg_ce => v_axi4s_vid_out_0_vtg_ce,
      vtg_field_id => '0',
      vtg_hblank => v_tc_0_vtiming_out_HBLANK,
      vtg_hsync => v_tc_0_vtiming_out_HSYNC,
      vtg_vblank => v_tc_0_vtiming_out_VBLANK,
      vtg_vsync => v_tc_0_vtiming_out_VSYNC
    );
v_tc_0: component brd_v_tc_0_0
     port map (
      active_video_out => v_tc_0_vtiming_out_ACTIVE_VIDEO,
      clk => processing_system7_0_FCLK_CLK1,
      clken => '1',
      fsync_out(0) => NLW_v_tc_0_fsync_out_UNCONNECTED(0),
      gen_clken => v_axi4s_vid_out_0_vtg_ce,
      hblank_out => v_tc_0_vtiming_out_HBLANK,
      hsync_out => v_tc_0_vtiming_out_HSYNC,
      resetn => proc_sys_reset_1_peripheral_aresetn(0),
      vblank_out => v_tc_0_vtiming_out_VBLANK,
      vsync_out => v_tc_0_vtiming_out_VSYNC
    );
xlconcat_0: component brd_xlconcat_0_0
     port map (
      In0(0) => axi_usb2_device_0_usb_irpt,
      In1(0) => axi_gpio_0_ip2intc_irpt,
      dout(1 downto 0) => xlconcat_0_dout(1 downto 0)
    );
xlslice_0: component brd_xlslice_0_0
     port map (
      Din(31 downto 0) => axi_gpio_0_gpio_io_o(31 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
xlslice_1: component brd_xlslice_1_0
     port map (
      Din(31 downto 0) => axi_gpio_0_gpio_io_o(31 downto 0),
      Dout(0) => xlslice_1_Dout(0)
    );
end STRUCTURE;
