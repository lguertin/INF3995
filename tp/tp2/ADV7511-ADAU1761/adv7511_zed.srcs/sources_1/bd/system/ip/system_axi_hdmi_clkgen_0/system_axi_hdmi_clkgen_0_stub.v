// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon Jan 14 15:37:08 2019
// Host        : L3712-07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               x:/Bureau/ADV7511-ADAU1761/adv7511_zed.srcs/sources_1/bd/system/ip/system_axi_hdmi_clkgen_0/system_axi_hdmi_clkgen_0_stub.v
// Design      : system_axi_hdmi_clkgen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_clkgen,Vivado 2018.1" *)
module system_axi_hdmi_clkgen_0(clk, clk_0, clk_1, drp_clk, s_axi_aclk, 
  s_axi_aresetn, s_axi_awvalid, s_axi_awaddr, s_axi_awready, s_axi_wvalid, s_axi_wdata, 
  s_axi_wstrb, s_axi_wready, s_axi_bvalid, s_axi_bresp, s_axi_bready, s_axi_arvalid, 
  s_axi_araddr, s_axi_arready, s_axi_rvalid, s_axi_rdata, s_axi_rresp, s_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="clk,clk_0,clk_1,drp_clk,s_axi_aclk,s_axi_aresetn,s_axi_awvalid,s_axi_awaddr[31:0],s_axi_awready,s_axi_wvalid,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wready,s_axi_bvalid,s_axi_bresp[1:0],s_axi_bready,s_axi_arvalid,s_axi_araddr[31:0],s_axi_arready,s_axi_rvalid,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rready" */;
  input clk;
  output clk_0;
  output clk_1;
  input drp_clk;
  input s_axi_aclk;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input [31:0]s_axi_awaddr;
  output s_axi_awready;
  input s_axi_wvalid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  output s_axi_wready;
  output s_axi_bvalid;
  output [1:0]s_axi_bresp;
  input s_axi_bready;
  input s_axi_arvalid;
  input [31:0]s_axi_araddr;
  output s_axi_arready;
  output s_axi_rvalid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  input s_axi_rready;
endmodule
