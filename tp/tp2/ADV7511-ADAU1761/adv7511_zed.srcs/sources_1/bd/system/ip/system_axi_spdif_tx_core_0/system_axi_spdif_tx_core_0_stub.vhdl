-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Mon Jan 14 15:54:54 2019
-- Host        : L3712-07 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               x:/Bureau/ADV7511-ADAU1761/adv7511_zed.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_core_0/system_axi_spdif_tx_core_0_stub.vhdl
-- Design      : system_axi_spdif_tx_core_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_axi_spdif_tx_core_0 is
  Port ( 
    spdif_data_clk : in STD_LOGIC;
    spdif_tx_o : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    DMA_REQ_ACLK : in STD_LOGIC;
    DMA_REQ_RSTN : in STD_LOGIC;
    DMA_REQ_DAVALID : in STD_LOGIC;
    DMA_REQ_DATYPE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA_REQ_DAREADY : out STD_LOGIC;
    DMA_REQ_DRVALID : out STD_LOGIC;
    DMA_REQ_DRTYPE : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA_REQ_DRLAST : out STD_LOGIC;
    DMA_REQ_DRREADY : in STD_LOGIC
  );

end system_axi_spdif_tx_core_0;

architecture stub of system_axi_spdif_tx_core_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "spdif_data_clk,spdif_tx_o,S_AXI_ACLK,S_AXI_ARESETN,S_AXI_AWADDR[15:0],S_AXI_AWVALID,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_BREADY,S_AXI_ARADDR[15:0],S_AXI_ARVALID,S_AXI_RREADY,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_AWREADY,DMA_REQ_ACLK,DMA_REQ_RSTN,DMA_REQ_DAVALID,DMA_REQ_DATYPE[1:0],DMA_REQ_DAREADY,DMA_REQ_DRVALID,DMA_REQ_DRTYPE[1:0],DMA_REQ_DRLAST,DMA_REQ_DRREADY";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axi_spdif_tx,Vivado 2018.1";
begin
end;
