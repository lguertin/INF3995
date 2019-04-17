// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon Jan 14 15:37:08 2019
// Host        : L3712-07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               x:/Bureau/ADV7511-ADAU1761/adv7511_zed.srcs/sources_1/bd/system/ip/system_axi_hdmi_clkgen_0/system_axi_hdmi_clkgen_0_sim_netlist.v
// Design      : system_axi_hdmi_clkgen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_axi_hdmi_clkgen_0,axi_clkgen,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_clkgen,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module system_axi_hdmi_clkgen_0
   (clk,
    clk_0,
    clk_1,
    drp_clk,
    s_axi_aclk,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awready,
    s_axi_wvalid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wready,
    s_axi_bvalid,
    s_axi_bresp,
    s_axi_bready,
    s_axi_arvalid,
    s_axi_araddr,
    s_axi_arready,
    s_axi_rvalid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 200000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK1" *) input clk;
  output clk_0;
  output clk_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 drp_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME drp_clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0" *) input drp_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_RESET s_axi_aresetn, ASSOCIATED_BUSIF s_axi, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input s_axi_rready;

  wire \<const0> ;
  wire clk;
  wire clk_0;
  wire clk_1;
  wire drp_clk;
  wire s_axi_aclk;
  wire [31:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;

  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  system_axi_hdmi_clkgen_0_axi_clkgen inst
       (.clk(clk),
        .clk_0(clk_0),
        .clk_1(clk_1),
        .drp_clk(drp_clk),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[15:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[15:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "ad_mmcm_drp" *) 
module system_axi_hdmi_clkgen_0_ad_mmcm_drp
   (clk_0,
    clk_1,
    drp_locked,
    drp_ready_s,
    E,
    Q,
    clk,
    drp_clk,
    drp_sel_s,
    drp_wr_s,
    mmcm_rst,
    DI,
    DADDR,
    drp_rst,
    drp_ready_int);
  output clk_0;
  output clk_1;
  output drp_locked;
  output drp_ready_s;
  output [0:0]E;
  output [15:0]Q;
  input clk;
  input drp_clk;
  input drp_sel_s;
  input drp_wr_s;
  input mmcm_rst;
  input [15:0]DI;
  input [6:0]DADDR;
  input drp_rst;
  input drp_ready_int;

  wire [6:0]DADDR;
  wire [15:0]DI;
  wire [0:0]E;
  wire [15:0]Q;
  wire bufg_fb_clk_s;
  wire clk;
  wire clk_0;
  wire clk_1;
  wire drp_clk;
  wire drp_locked;
  wire drp_locked_m1;
  wire [15:0]drp_rdata_s;
  wire drp_ready_int;
  wire drp_ready_s;
  wire drp_ready_s_0;
  wire drp_rst;
  wire drp_sel_s;
  wire drp_wr_s;
  wire mmcm_clk_0_s;
  wire mmcm_clk_1_s;
  wire mmcm_fb_clk_s;
  wire mmcm_locked_s;
  wire mmcm_rst;
  wire NLW_i_mmcm_CLKFBOUTB_UNCONNECTED;
  wire NLW_i_mmcm_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_i_mmcm_CLKINSTOPPED_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT0B_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT1B_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT2_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT2B_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT3_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT3B_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT4_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT5_UNCONNECTED;
  wire NLW_i_mmcm_CLKOUT6_UNCONNECTED;
  wire NLW_i_mmcm_PSDONE_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    drp_locked_m1_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(mmcm_locked_s),
        .Q(drp_locked_m1),
        .R(drp_rst));
  FDRE #(
    .INIT(1'b0)) 
    drp_locked_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_locked_m1),
        .Q(drp_locked),
        .R(drp_rst));
  LUT2 #(
    .INIT(4'h2)) 
    \drp_rdata_int[15]_i_1 
       (.I0(drp_ready_s),
        .I1(drp_ready_int),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[0] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[10] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[11] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[12] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[13] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[14] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[15] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[1] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[2] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[3] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[4] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[5] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[6] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[7] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[8] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_reg[9] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_rdata_s[9]),
        .Q(Q[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    drp_ready_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_ready_s_0),
        .Q(drp_ready_s),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG i_clk_0_bufg
       (.I(mmcm_clk_0_s),
        .O(clk_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG i_clk_1_bufg
       (.I(mmcm_clk_1_s),
        .O(clk_1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG i_fb_clk_bufg
       (.I(mmcm_fb_clk_s),
        .O(bufg_fb_clk_s));
  (* BOX_TYPE = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(49.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(5.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(6.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(6),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(11),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    i_mmcm
       (.CLKFBIN(bufg_fb_clk_s),
        .CLKFBOUT(mmcm_fb_clk_s),
        .CLKFBOUTB(NLW_i_mmcm_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_i_mmcm_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_i_mmcm_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(mmcm_clk_0_s),
        .CLKOUT0B(NLW_i_mmcm_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(mmcm_clk_1_s),
        .CLKOUT1B(NLW_i_mmcm_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_i_mmcm_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_i_mmcm_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_i_mmcm_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_i_mmcm_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_i_mmcm_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_i_mmcm_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_i_mmcm_CLKOUT6_UNCONNECTED),
        .DADDR(DADDR),
        .DCLK(drp_clk),
        .DEN(drp_sel_s),
        .DI(DI),
        .DO(drp_rdata_s),
        .DRDY(drp_ready_s_0),
        .DWE(drp_wr_s),
        .LOCKED(mmcm_locked_s),
        .PSCLK(1'b0),
        .PSDONE(NLW_i_mmcm_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(mmcm_rst));
endmodule

(* ORIG_REF_NAME = "ad_rst" *) 
module system_axi_hdmi_clkgen_0_ad_rst
   (drp_rst,
    drp_clk,
    up_resetn);
  output drp_rst;
  input drp_clk;
  input up_resetn;

  wire drp_clk;
  wire drp_rst;
  wire rst_p_reg_n_0;
  wire up_preset_s;
  wire up_resetn;

  LUT1 #(
    .INIT(2'h1)) 
    rst_p_i_1
       (.I0(up_resetn),
        .O(up_preset_s));
  FDPE #(
    .INIT(1'b0)) 
    rst_p_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(up_preset_s),
        .Q(rst_p_reg_n_0));
  FDPE #(
    .INIT(1'b0)) 
    rst_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(rst_p_reg_n_0),
        .PRE(up_preset_s),
        .Q(drp_rst));
endmodule

(* ORIG_REF_NAME = "ad_rst" *) 
module system_axi_hdmi_clkgen_0_ad_rst_0
   (mmcm_rst,
    drp_clk,
    up_mmcm_resetn);
  output mmcm_rst;
  input drp_clk;
  input up_mmcm_resetn;

  wire drp_clk;
  wire mmcm_rst;
  wire rst_p;
  wire up_mmcm_preset_s;
  wire up_mmcm_resetn;

  LUT1 #(
    .INIT(2'h1)) 
    rst_p_i_1__0
       (.I0(up_mmcm_resetn),
        .O(up_mmcm_preset_s));
  FDPE #(
    .INIT(1'b0)) 
    rst_p_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(up_mmcm_preset_s),
        .Q(rst_p));
  FDPE #(
    .INIT(1'b0)) 
    rst_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(rst_p),
        .PRE(up_mmcm_preset_s),
        .Q(mmcm_rst));
endmodule

(* ORIG_REF_NAME = "axi_clkgen" *) 
module system_axi_hdmi_clkgen_0_axi_clkgen
   (clk_0,
    clk_1,
    s_axi_rdata,
    s_axi_rvalid,
    s_axi_bvalid,
    s_axi_awready,
    s_axi_wready,
    s_axi_arready,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_arvalid,
    clk,
    drp_clk,
    s_axi_aclk,
    s_axi_araddr,
    s_axi_wdata,
    s_axi_awaddr,
    s_axi_rready,
    s_axi_aresetn,
    s_axi_bready);
  output clk_0;
  output clk_1;
  output [31:0]s_axi_rdata;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output s_axi_awready;
  output s_axi_wready;
  output s_axi_arready;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input clk;
  input drp_clk;
  input s_axi_aclk;
  input [13:0]s_axi_araddr;
  input [31:0]s_axi_wdata;
  input [13:0]s_axi_awaddr;
  input s_axi_rready;
  input s_axi_aresetn;
  input s_axi_bready;

  wire clk;
  wire clk_0;
  wire clk_1;
  wire [6:0]drp_addr_s;
  wire drp_clk;
  wire drp_locked;
  wire [15:0]drp_rdata;
  wire drp_ready_s;
  wire drp_rst;
  wire drp_sel_s;
  wire [15:0]drp_wdata_s;
  wire drp_wr_s;
  wire \i_drp_cntrl/drp_rdata_int0 ;
  wire \i_drp_cntrl/drp_ready_int ;
  wire i_up_axi_n_0;
  wire i_up_axi_n_1;
  wire i_up_axi_n_10;
  wire i_up_axi_n_11;
  wire i_up_axi_n_12;
  wire i_up_axi_n_13;
  wire i_up_axi_n_14;
  wire i_up_axi_n_15;
  wire i_up_axi_n_16;
  wire i_up_axi_n_17;
  wire i_up_axi_n_18;
  wire i_up_axi_n_19;
  wire i_up_axi_n_20;
  wire i_up_axi_n_21;
  wire i_up_axi_n_22;
  wire i_up_axi_n_23;
  wire i_up_axi_n_24;
  wire i_up_axi_n_25;
  wire i_up_axi_n_26;
  wire i_up_axi_n_27;
  wire i_up_axi_n_28;
  wire i_up_axi_n_30;
  wire i_up_axi_n_31;
  wire i_up_axi_n_32;
  wire i_up_axi_n_33;
  wire i_up_axi_n_34;
  wire i_up_axi_n_35;
  wire i_up_axi_n_36;
  wire i_up_axi_n_37;
  wire i_up_axi_n_38;
  wire i_up_axi_n_39;
  wire i_up_axi_n_40;
  wire i_up_axi_n_41;
  wire i_up_axi_n_42;
  wire i_up_axi_n_43;
  wire i_up_axi_n_44;
  wire i_up_axi_n_45;
  wire i_up_axi_n_46;
  wire i_up_axi_n_47;
  wire i_up_axi_n_48;
  wire i_up_axi_n_49;
  wire i_up_axi_n_50;
  wire i_up_axi_n_51;
  wire i_up_axi_n_52;
  wire i_up_axi_n_53;
  wire i_up_axi_n_54;
  wire i_up_axi_n_55;
  wire i_up_axi_n_56;
  wire i_up_axi_n_57;
  wire i_up_axi_n_58;
  wire i_up_axi_n_59;
  wire i_up_axi_n_60;
  wire i_up_axi_n_61;
  wire i_up_axi_n_62;
  wire i_up_axi_n_63;
  wire i_up_axi_n_64;
  wire i_up_axi_n_66;
  wire i_up_axi_n_67;
  wire i_up_axi_n_7;
  wire i_up_axi_n_8;
  wire i_up_axi_n_9;
  wire i_up_clkgen_n_2;
  wire i_up_clkgen_n_53;
  wire mmcm_rst;
  wire p_0_in;
  wire [18:0]p_1_in;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [13:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire up_drp_locked;
  wire [15:0]up_drp_rdata;
  wire up_drp_sel_t0;
  wire up_drp_status;
  wire up_mmcm_resetn;
  wire up_rack_s;
  wire [31:0]up_rdata;
  wire up_resetn;
  wire up_rreq_s;
  wire [31:0]up_scratch;
  wire up_scratch0;
  wire up_wack_s;
  wire up_wreq_s;

  system_axi_hdmi_clkgen_0_ad_mmcm_drp i_mmcm_drp
       (.DADDR(drp_addr_s),
        .DI(drp_wdata_s),
        .E(\i_drp_cntrl/drp_rdata_int0 ),
        .Q(drp_rdata),
        .clk(clk),
        .clk_0(clk_0),
        .clk_1(clk_1),
        .drp_clk(drp_clk),
        .drp_locked(drp_locked),
        .drp_ready_int(\i_drp_cntrl/drp_ready_int ),
        .drp_ready_s(drp_ready_s),
        .drp_rst(drp_rst),
        .drp_sel_s(drp_sel_s),
        .drp_wr_s(drp_wr_s),
        .mmcm_rst(mmcm_rst));
  system_axi_hdmi_clkgen_0_up_axi i_up_axi
       (.D({i_up_axi_n_7,i_up_axi_n_8,i_up_axi_n_9,i_up_axi_n_10,i_up_axi_n_11,i_up_axi_n_12,i_up_axi_n_13,i_up_axi_n_14,i_up_axi_n_15,i_up_axi_n_16,i_up_axi_n_17,i_up_axi_n_18,i_up_axi_n_19,i_up_axi_n_20,i_up_axi_n_21,i_up_axi_n_22,i_up_axi_n_23,i_up_axi_n_24,i_up_axi_n_25,i_up_axi_n_26,i_up_axi_n_27,i_up_axi_n_28}),
        .E(up_drp_sel_t0),
        .Q(up_rdata),
        .p_1_in(p_1_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(i_up_clkgen_n_2),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid),
        .up_drp_locked(up_drp_locked),
        .\up_drp_rdata_reg[15] (up_drp_rdata),
        .up_drp_status(up_drp_status),
        .up_mmcm_resetn(up_mmcm_resetn),
        .up_mmcm_resetn_reg(i_up_axi_n_34),
        .up_rack_s(up_rack_s),
        .\up_raddr_reg[10]_0 (i_up_axi_n_1),
        .\up_rdata_int_reg[22]_0 (i_up_axi_n_0),
        .\up_rdata_reg[0] (i_up_axi_n_31),
        .\up_rdata_reg[17] (i_up_axi_n_33),
        .\up_rdata_reg[18] (i_up_axi_n_30),
        .\up_rdata_reg[2] (i_up_axi_n_32),
        .up_resetn(up_resetn),
        .up_resetn_reg(i_up_axi_n_67),
        .up_resetn_reg_0(i_up_clkgen_n_53),
        .up_rreq_s(up_rreq_s),
        .\up_scratch_reg[31] ({i_up_axi_n_35,i_up_axi_n_36,i_up_axi_n_37,i_up_axi_n_38,i_up_axi_n_39,i_up_axi_n_40,i_up_axi_n_41,i_up_axi_n_42,i_up_axi_n_43,i_up_axi_n_44,i_up_axi_n_45,i_up_axi_n_46,i_up_axi_n_47,i_up_axi_n_48,i_up_axi_n_49,i_up_axi_n_50,i_up_axi_n_51,i_up_axi_n_52,i_up_axi_n_53,i_up_axi_n_54,i_up_axi_n_55,i_up_axi_n_56,i_up_axi_n_57,i_up_axi_n_58,i_up_axi_n_59,i_up_axi_n_60,i_up_axi_n_61,i_up_axi_n_62,i_up_axi_n_63,i_up_axi_n_64,p_0_in,i_up_axi_n_66}),
        .\up_scratch_reg[31]_0 (up_scratch0),
        .\up_scratch_reg[31]_1 ({up_scratch[31:29],up_scratch[18:0]}),
        .up_wack_s(up_wack_s),
        .up_wreq_s(up_wreq_s));
  system_axi_hdmi_clkgen_0_up_clkgen i_up_clkgen
       (.D({i_up_axi_n_35,i_up_axi_n_36,i_up_axi_n_37,i_up_axi_n_38,i_up_axi_n_39,i_up_axi_n_40,i_up_axi_n_41,i_up_axi_n_42,i_up_axi_n_43,i_up_axi_n_44,i_up_axi_n_45,i_up_axi_n_46,i_up_axi_n_47,i_up_axi_n_48,i_up_axi_n_49,i_up_axi_n_50,i_up_axi_n_51,i_up_axi_n_52,i_up_axi_n_53,i_up_axi_n_54,i_up_axi_n_55,i_up_axi_n_56,i_up_axi_n_57,i_up_axi_n_58,i_up_axi_n_59,i_up_axi_n_60,i_up_axi_n_61,i_up_axi_n_62,i_up_axi_n_63,i_up_axi_n_64,p_0_in,i_up_axi_n_66}),
        .DADDR(drp_addr_s),
        .DI(drp_wdata_s),
        .E(up_drp_sel_t0),
        .Q({up_scratch[31:29],up_scratch[18:0]}),
        .\drp_addr_reg[2] (p_1_in),
        .drp_clk(drp_clk),
        .drp_locked(drp_locked),
        .\drp_rdata_reg[15] (drp_rdata),
        .drp_ready_int(\i_drp_cntrl/drp_ready_int ),
        .drp_ready_reg(\i_drp_cntrl/drp_rdata_int0 ),
        .drp_ready_s(drp_ready_s),
        .drp_rst(drp_rst),
        .drp_sel_s(drp_sel_s),
        .drp_wr_s(drp_wr_s),
        .mmcm_rst(mmcm_rst),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(i_up_axi_n_1),
        .s_axi_aresetn_1(i_up_axi_n_0),
        .up_drp_locked(up_drp_locked),
        .\up_drp_rdata_reg[1] (i_up_clkgen_n_2),
        .up_drp_status(up_drp_status),
        .up_mmcm_resetn(up_mmcm_resetn),
        .up_rack_s(up_rack_s),
        .\up_raddr_reg[3] (i_up_axi_n_33),
        .\up_raddr_reg[4] (i_up_axi_n_31),
        .\up_raddr_reg[5] (i_up_axi_n_32),
        .\up_raddr_reg[7] (i_up_axi_n_30),
        .\up_rdata_int_reg[31] (up_rdata),
        .\up_rdata_reg[0]_0 (i_up_clkgen_n_53),
        .\up_rdata_reg[15]_0 (up_drp_rdata),
        .up_resetn(up_resetn),
        .up_rreq_s(up_rreq_s),
        .\up_scratch_reg[31]_0 ({i_up_axi_n_7,i_up_axi_n_8,i_up_axi_n_9,i_up_axi_n_10,i_up_axi_n_11,i_up_axi_n_12,i_up_axi_n_13,i_up_axi_n_14,i_up_axi_n_15,i_up_axi_n_16,i_up_axi_n_17,i_up_axi_n_18,i_up_axi_n_19,i_up_axi_n_20,i_up_axi_n_21,i_up_axi_n_22,i_up_axi_n_23,i_up_axi_n_24,i_up_axi_n_25,i_up_axi_n_26,i_up_axi_n_27,i_up_axi_n_28}),
        .up_wack_s(up_wack_s),
        .\up_waddr_reg[2] (up_scratch0),
        .\up_wdata_reg[0] (i_up_axi_n_67),
        .\up_wdata_reg[1] (i_up_axi_n_34),
        .up_wreq_s(up_wreq_s));
endmodule

(* ORIG_REF_NAME = "up_axi" *) 
module system_axi_hdmi_clkgen_0_up_axi
   (\up_rdata_int_reg[22]_0 ,
    \up_raddr_reg[10]_0 ,
    s_axi_rvalid,
    s_axi_bvalid,
    s_axi_awready,
    s_axi_wready,
    s_axi_arready,
    D,
    up_rreq_s,
    \up_rdata_reg[18] ,
    \up_rdata_reg[0] ,
    \up_rdata_reg[2] ,
    \up_rdata_reg[17] ,
    up_mmcm_resetn_reg,
    \up_scratch_reg[31] ,
    up_resetn_reg,
    s_axi_rdata,
    E,
    \up_scratch_reg[31]_0 ,
    up_wreq_s,
    s_axi_aclk,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_arvalid,
    Q,
    up_rack_s,
    up_resetn_reg_0,
    \up_drp_rdata_reg[15] ,
    p_1_in,
    \up_scratch_reg[31]_1 ,
    up_drp_status,
    up_drp_locked,
    up_mmcm_resetn,
    s_axi_aresetn,
    s_axi_bready,
    up_wack_s,
    s_axi_rready,
    up_resetn,
    s_axi_araddr,
    s_axi_wdata,
    s_axi_aresetn_0,
    s_axi_awaddr);
  output \up_rdata_int_reg[22]_0 ;
  output \up_raddr_reg[10]_0 ;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output s_axi_awready;
  output s_axi_wready;
  output s_axi_arready;
  output [21:0]D;
  output up_rreq_s;
  output \up_rdata_reg[18] ;
  output \up_rdata_reg[0] ;
  output \up_rdata_reg[2] ;
  output \up_rdata_reg[17] ;
  output up_mmcm_resetn_reg;
  output [31:0]\up_scratch_reg[31] ;
  output up_resetn_reg;
  output [31:0]s_axi_rdata;
  output [0:0]E;
  output [0:0]\up_scratch_reg[31]_0 ;
  output up_wreq_s;
  input s_axi_aclk;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [31:0]Q;
  input up_rack_s;
  input up_resetn_reg_0;
  input [15:0]\up_drp_rdata_reg[15] ;
  input [18:0]p_1_in;
  input [21:0]\up_scratch_reg[31]_1 ;
  input up_drp_status;
  input up_drp_locked;
  input up_mmcm_resetn;
  input s_axi_aresetn;
  input s_axi_bready;
  input up_wack_s;
  input s_axi_rready;
  input up_resetn;
  input [13:0]s_axi_araddr;
  input [31:0]s_axi_wdata;
  input s_axi_aresetn_0;
  input [13:0]s_axi_awaddr;

  wire [21:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire \i_up_clkgen/up_mmcm_resetn0 ;
  wire p_0_in;
  wire [18:0]p_1_in;
  wire p_1_in_0;
  wire [31:0]p_1_in__0;
  wire p_5_in;
  wire s_axi_aclk;
  wire [13:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [13:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [5:0]sel0;
  wire up_axi_arready_i_1_n_0;
  wire up_axi_awready_i_1_n_0;
  wire up_axi_bvalid_i_1_n_0;
  wire \up_axi_rdata[31]_i_2_n_0 ;
  wire up_axi_rvalid_i_1_n_0;
  wire up_axi_rvalid_i_2_n_0;
  wire up_axi_wready_i_1_n_0;
  wire up_drp_locked;
  wire [15:0]\up_drp_rdata_reg[15] ;
  wire up_drp_status;
  wire up_mmcm_resetn;
  wire up_mmcm_resetn_reg;
  wire up_rack_i_2_n_0;
  wire up_rack_int;
  wire up_rack_int_d;
  wire up_rack_int_i_1_n_0;
  wire up_rack_s;
  wire [13:0]up_raddr;
  wire \up_raddr_reg[10]_0 ;
  wire \up_rcount[0]_i_1_n_0 ;
  wire \up_rcount[1]_i_1_n_0 ;
  wire \up_rcount[2]_i_1_n_0 ;
  wire \up_rcount[3]_i_1_n_0 ;
  wire \up_rcount[3]_i_2_n_0 ;
  wire \up_rcount_reg_n_0_[0] ;
  wire \up_rcount_reg_n_0_[1] ;
  wire \up_rcount_reg_n_0_[2] ;
  wire \up_rdata[0]_i_2_n_0 ;
  wire \up_rdata[0]_i_3_n_0 ;
  wire \up_rdata[0]_i_4_n_0 ;
  wire \up_rdata[0]_i_6_n_0 ;
  wire \up_rdata[0]_i_7_n_0 ;
  wire \up_rdata[17]_i_2_n_0 ;
  wire \up_rdata[18]_i_2_n_0 ;
  wire \up_rdata[18]_i_3_n_0 ;
  wire \up_rdata[18]_i_4_n_0 ;
  wire \up_rdata[1]_i_2_n_0 ;
  wire \up_rdata[1]_i_3_n_0 ;
  wire \up_rdata[1]_i_4_n_0 ;
  wire \up_rdata[28]_i_3_n_0 ;
  wire \up_rdata[28]_i_5_n_0 ;
  wire \up_rdata[31]_i_3_n_0 ;
  wire \up_rdata[5]_i_2_n_0 ;
  wire \up_rdata[6]_i_2_n_0 ;
  wire \up_rdata[6]_i_3_n_0 ;
  wire [31:0]up_rdata_int;
  wire \up_rdata_int[0]_i_1_n_0 ;
  wire \up_rdata_int[10]_i_1_n_0 ;
  wire \up_rdata_int[11]_i_1_n_0 ;
  wire \up_rdata_int[12]_i_1_n_0 ;
  wire \up_rdata_int[13]_i_1_n_0 ;
  wire \up_rdata_int[14]_i_1_n_0 ;
  wire \up_rdata_int[15]_i_1_n_0 ;
  wire \up_rdata_int[16]_i_1_n_0 ;
  wire \up_rdata_int[17]_i_1_n_0 ;
  wire \up_rdata_int[18]_i_1_n_0 ;
  wire \up_rdata_int[19]_i_1_n_0 ;
  wire \up_rdata_int[1]_i_1_n_0 ;
  wire \up_rdata_int[20]_i_1_n_0 ;
  wire \up_rdata_int[21]_i_1_n_0 ;
  wire \up_rdata_int[22]_i_1_n_0 ;
  wire \up_rdata_int[23]_i_1_n_0 ;
  wire \up_rdata_int[24]_i_1_n_0 ;
  wire \up_rdata_int[25]_i_1_n_0 ;
  wire \up_rdata_int[26]_i_1_n_0 ;
  wire \up_rdata_int[27]_i_1_n_0 ;
  wire \up_rdata_int[28]_i_1_n_0 ;
  wire \up_rdata_int[29]_i_1_n_0 ;
  wire \up_rdata_int[2]_i_1_n_0 ;
  wire \up_rdata_int[30]_i_1_n_0 ;
  wire \up_rdata_int[31]_i_1_n_0 ;
  wire \up_rdata_int[3]_i_1_n_0 ;
  wire \up_rdata_int[4]_i_1_n_0 ;
  wire \up_rdata_int[5]_i_1_n_0 ;
  wire \up_rdata_int[6]_i_1_n_0 ;
  wire \up_rdata_int[7]_i_1_n_0 ;
  wire \up_rdata_int[8]_i_1_n_0 ;
  wire \up_rdata_int[9]_i_1_n_0 ;
  wire [31:0]up_rdata_int_d;
  wire \up_rdata_int_reg[22]_0 ;
  wire \up_rdata_reg[0] ;
  wire \up_rdata_reg[17] ;
  wire \up_rdata_reg[18] ;
  wire \up_rdata_reg[2] ;
  wire up_resetn;
  wire up_resetn_reg;
  wire up_resetn_reg_0;
  wire up_rreq_i_1_n_0;
  wire up_rreq_s;
  wire up_rreq_s__0;
  wire up_rsel_i_1_n_0;
  wire up_rsel_reg_n_0;
  wire \up_scratch[31]_i_2_n_0 ;
  wire [31:0]\up_scratch_reg[31] ;
  wire [0:0]\up_scratch_reg[31]_0 ;
  wire [21:0]\up_scratch_reg[31]_1 ;
  wire up_wack_i_2_n_0;
  wire up_wack_int;
  wire up_wack_int_i_1_n_0;
  wire up_wack_s;
  wire [7:0]up_waddr_s;
  wire [2:0]up_wcount;
  wire \up_wcount[0]_i_1_n_0 ;
  wire \up_wcount[1]_i_1_n_0 ;
  wire \up_wcount[2]_i_1_n_0 ;
  wire up_wreq;
  wire up_wreq_i_1_n_0;
  wire up_wreq_s;
  wire up_wsel_i_1_n_0;
  wire up_wsel_reg_n_0;

  LUT2 #(
    .INIT(4'h4)) 
    up_axi_arready_i_1
       (.I0(s_axi_arready),
        .I1(up_rack_int),
        .O(up_axi_arready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    up_axi_arready_i_2
       (.I0(s_axi_aresetn),
        .O(\up_rdata_int_reg[22]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    up_axi_arready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_axi_arready_i_1_n_0),
        .Q(s_axi_arready));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_awready_i_1
       (.I0(s_axi_awready),
        .I1(up_wack_int),
        .O(up_axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    up_axi_awready_i_2
       (.I0(s_axi_aresetn),
        .O(\up_raddr_reg[10]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    up_axi_awready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(up_axi_awready_i_1_n_0),
        .Q(s_axi_awready));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h72)) 
    up_axi_bvalid_i_1
       (.I0(s_axi_bvalid),
        .I1(s_axi_bready),
        .I2(up_wack_int),
        .O(up_axi_bvalid_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_axi_bvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(up_axi_bvalid_i_1_n_0),
        .Q(s_axi_bvalid));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[0]_i_1 
       (.I0(up_rdata_int_d[0]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[10]_i_1 
       (.I0(up_rdata_int_d[10]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[10]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[11]_i_1 
       (.I0(up_rdata_int_d[11]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[11]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[12]_i_1 
       (.I0(up_rdata_int_d[12]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[12]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[13]_i_1 
       (.I0(up_rdata_int_d[13]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[13]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[14]_i_1 
       (.I0(up_rdata_int_d[14]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[14]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[15]_i_1 
       (.I0(up_rdata_int_d[15]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[15]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[16]_i_1 
       (.I0(up_rdata_int_d[16]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[16]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[17]_i_1 
       (.I0(up_rdata_int_d[17]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[17]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[18]_i_1 
       (.I0(up_rdata_int_d[18]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[18]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[19]_i_1 
       (.I0(up_rdata_int_d[19]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[19]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[1]_i_1 
       (.I0(up_rdata_int_d[1]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[20]_i_1 
       (.I0(up_rdata_int_d[20]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[20]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[21]_i_1 
       (.I0(up_rdata_int_d[21]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[21]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[22]_i_1 
       (.I0(up_rdata_int_d[22]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[22]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[23]_i_1 
       (.I0(up_rdata_int_d[23]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[23]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[24]_i_1 
       (.I0(up_rdata_int_d[24]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[24]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[25]_i_1 
       (.I0(up_rdata_int_d[25]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[25]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[26]_i_1 
       (.I0(up_rdata_int_d[26]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[26]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[27]_i_1 
       (.I0(up_rdata_int_d[27]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[27]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[28]_i_1 
       (.I0(up_rdata_int_d[28]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[28]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[29]_i_1 
       (.I0(up_rdata_int_d[29]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[29]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[2]_i_1 
       (.I0(up_rdata_int_d[2]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[30]_i_1 
       (.I0(up_rdata_int_d[30]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[30]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[31]_i_1 
       (.I0(up_rdata_int_d[31]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[31]));
  LUT1 #(
    .INIT(2'h1)) 
    \up_axi_rdata[31]_i_2 
       (.I0(s_axi_aresetn),
        .O(\up_axi_rdata[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[3]_i_1 
       (.I0(up_rdata_int_d[3]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[4]_i_1 
       (.I0(up_rdata_int_d[4]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[5]_i_1 
       (.I0(up_rdata_int_d[5]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[6]_i_1 
       (.I0(up_rdata_int_d[6]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[7]_i_1 
       (.I0(up_rdata_int_d[7]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[8]_i_1 
       (.I0(up_rdata_int_d[8]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \up_axi_rdata[9]_i_1 
       (.I0(up_rdata_int_d[9]),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(p_1_in__0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[0]),
        .Q(s_axi_rdata[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[10]),
        .Q(s_axi_rdata[10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[11]),
        .Q(s_axi_rdata[11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[12]),
        .Q(s_axi_rdata[12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[13]),
        .Q(s_axi_rdata[13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[14]),
        .Q(s_axi_rdata[14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[15]),
        .Q(s_axi_rdata[15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[16]),
        .Q(s_axi_rdata[16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[17]),
        .Q(s_axi_rdata[17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[18]),
        .Q(s_axi_rdata[18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[19]),
        .Q(s_axi_rdata[19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[1]),
        .Q(s_axi_rdata[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[20]),
        .Q(s_axi_rdata[20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[21]),
        .Q(s_axi_rdata[21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[22]),
        .Q(s_axi_rdata[22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[23]),
        .Q(s_axi_rdata[23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[24]),
        .Q(s_axi_rdata[24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[25]),
        .Q(s_axi_rdata[25]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[26]),
        .Q(s_axi_rdata[26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[27]),
        .Q(s_axi_rdata[27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[28]),
        .Q(s_axi_rdata[28]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[29]),
        .Q(s_axi_rdata[29]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[2]),
        .Q(s_axi_rdata[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[30]),
        .Q(s_axi_rdata[30]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[31]),
        .Q(s_axi_rdata[31]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[3]),
        .Q(s_axi_rdata[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[4]),
        .Q(s_axi_rdata[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[5]),
        .Q(s_axi_rdata[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[6]),
        .Q(s_axi_rdata[6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[7]),
        .Q(s_axi_rdata[7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[8]),
        .Q(s_axi_rdata[8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_axi_rdata[31]_i_2_n_0 ),
        .D(p_1_in__0[9]),
        .Q(s_axi_rdata[9]));
  LUT3 #(
    .INIT(8'hF8)) 
    up_axi_rvalid_i_1
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(up_rack_int_d),
        .O(up_axi_rvalid_i_1_n_0));
  LUT3 #(
    .INIT(8'h2A)) 
    up_axi_rvalid_i_2
       (.I0(up_rack_int_d),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(up_axi_rvalid_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(up_axi_rvalid_i_1_n_0),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_axi_rvalid_i_2_n_0),
        .Q(s_axi_rvalid));
  LUT2 #(
    .INIT(4'h4)) 
    up_axi_wready_i_1
       (.I0(s_axi_wready),
        .I1(up_wack_int),
        .O(up_axi_wready_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_axi_wready_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(up_axi_wready_i_1_n_0),
        .Q(s_axi_wready));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \up_drp_wdata[15]_i_1 
       (.I0(up_waddr_s[2]),
        .I1(up_waddr_s[1]),
        .I2(\up_scratch[31]_i_2_n_0 ),
        .I3(up_waddr_s[4]),
        .I4(up_waddr_s[3]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    up_mmcm_resetn_i_1
       (.I0(\up_scratch_reg[31] [1]),
        .I1(\i_up_clkgen/up_mmcm_resetn0 ),
        .I2(up_mmcm_resetn),
        .O(up_mmcm_resetn_reg));
  LUT4 #(
    .INIT(16'h0002)) 
    up_rack_i_1
       (.I0(up_rack_i_2_n_0),
        .I1(up_raddr[8]),
        .I2(up_raddr[9]),
        .I3(up_raddr[10]),
        .O(up_rreq_s));
  LUT4 #(
    .INIT(16'h0004)) 
    up_rack_i_2
       (.I0(up_raddr[13]),
        .I1(up_rreq_s__0),
        .I2(up_raddr[12]),
        .I3(up_raddr[11]),
        .O(up_rack_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_rack_int_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rack_int),
        .Q(up_rack_int_d));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    up_rack_int_i_1
       (.I0(p_0_in),
        .I1(\up_rcount_reg_n_0_[2] ),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(\up_rcount_reg_n_0_[1] ),
        .I4(up_rack_s),
        .O(up_rack_int_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_rack_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rack_int_i_1_n_0),
        .Q(up_rack_int));
  LUT1 #(
    .INIT(2'h1)) 
    \up_raddr[13]_i_1 
       (.I0(up_rsel_reg_n_0),
        .O(p_1_in_0));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[0]),
        .Q(up_raddr[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[10]),
        .Q(up_raddr[10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(s_axi_araddr[11]),
        .Q(up_raddr[11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(s_axi_araddr[12]),
        .Q(up_raddr[12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(s_axi_araddr[13]),
        .Q(up_raddr[13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[1]),
        .Q(up_raddr[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[2]),
        .Q(up_raddr[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[3]),
        .Q(up_raddr[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[4]),
        .Q(up_raddr[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[5]),
        .Q(up_raddr[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[6]),
        .Q(up_raddr[6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[7]),
        .Q(up_raddr[7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[8]),
        .Q(up_raddr[8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_raddr_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_1_in_0),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_araddr[9]),
        .Q(up_raddr[9]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \up_rcount[0]_i_1 
       (.I0(up_rack_int),
        .I1(p_0_in),
        .I2(\up_rcount_reg_n_0_[0] ),
        .O(\up_rcount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \up_rcount[1]_i_1 
       (.I0(p_0_in),
        .I1(up_rack_int),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(\up_rcount_reg_n_0_[1] ),
        .O(\up_rcount[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h02222000)) 
    \up_rcount[2]_i_1 
       (.I0(p_0_in),
        .I1(up_rack_int),
        .I2(\up_rcount_reg_n_0_[0] ),
        .I3(\up_rcount_reg_n_0_[1] ),
        .I4(\up_rcount_reg_n_0_[2] ),
        .O(\up_rcount[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \up_rcount[3]_i_1 
       (.I0(up_rreq_s__0),
        .I1(p_0_in),
        .I2(up_rack_int),
        .O(\up_rcount[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00007FFF)) 
    \up_rcount[3]_i_2 
       (.I0(\up_rcount_reg_n_0_[1] ),
        .I1(\up_rcount_reg_n_0_[0] ),
        .I2(\up_rcount_reg_n_0_[2] ),
        .I3(p_0_in),
        .I4(up_rack_int),
        .O(\up_rcount[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \up_rcount_reg[0] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[3]_i_1_n_0 ),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rcount[0]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \up_rcount_reg[1] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[3]_i_1_n_0 ),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rcount[1]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \up_rcount_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[3]_i_1_n_0 ),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rcount[2]_i_1_n_0 ),
        .Q(\up_rcount_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \up_rcount_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_rcount[3]_i_1_n_0 ),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rcount[3]_i_2_n_0 ),
        .Q(p_0_in));
  LUT6 #(
    .INIT(64'hFFFEFFFFFEFEFEFE)) 
    \up_rdata[0]_i_1 
       (.I0(\up_rdata[0]_i_2_n_0 ),
        .I1(\up_rdata[0]_i_3_n_0 ),
        .I2(\up_rdata[0]_i_4_n_0 ),
        .I3(up_resetn_reg_0),
        .I4(\up_rdata[0]_i_6_n_0 ),
        .I5(\up_rdata[0]_i_7_n_0 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \up_rdata[0]_i_2 
       (.I0(\up_rdata_reg[0] ),
        .I1(\up_rdata[18]_i_4_n_0 ),
        .I2(\up_rdata[28]_i_3_n_0 ),
        .I3(up_rreq_s),
        .I4(p_1_in[0]),
        .O(\up_rdata[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h08000000)) 
    \up_rdata[0]_i_3 
       (.I0(\up_rdata_reg[0] ),
        .I1(\up_rdata[18]_i_4_n_0 ),
        .I2(\up_rdata[28]_i_3_n_0 ),
        .I3(up_rreq_s),
        .I4(\up_drp_rdata_reg[15] [0]),
        .O(\up_rdata[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h10000000)) 
    \up_rdata[0]_i_4 
       (.I0(\up_rdata[31]_i_3_n_0 ),
        .I1(\up_rdata[28]_i_3_n_0 ),
        .I2(up_rreq_s),
        .I3(\up_rdata[0]_i_6_n_0 ),
        .I4(\up_scratch_reg[31]_1 [0]),
        .O(\up_rdata[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h60002014)) 
    \up_rdata[0]_i_6 
       (.I0(up_raddr[3]),
        .I1(up_raddr[1]),
        .I2(up_raddr[4]),
        .I3(up_raddr[2]),
        .I4(up_raddr[0]),
        .O(\up_rdata[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h01000000)) 
    \up_rdata[0]_i_7 
       (.I0(up_raddr[5]),
        .I1(up_raddr[6]),
        .I2(up_raddr[7]),
        .I3(up_rreq_s),
        .I4(\up_rdata[31]_i_3_n_0 ),
        .O(\up_rdata[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[10]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [10]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[10]),
        .I4(\up_drp_rdata_reg[15] [10]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[11]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [11]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[11]),
        .I4(\up_drp_rdata_reg[15] [11]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[12]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [12]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[12]),
        .I4(\up_drp_rdata_reg[15] [12]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[13]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [13]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[13]),
        .I4(\up_drp_rdata_reg[15] [13]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[14]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [14]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[14]),
        .I4(\up_drp_rdata_reg[15] [14]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[15]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [15]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[15]),
        .I4(\up_drp_rdata_reg[15] [15]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[15]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[16]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [16]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[16]),
        .I4(up_drp_status),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[16]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[17]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [17]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[17]),
        .I4(up_drp_locked),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \up_rdata[17]_i_2 
       (.I0(\up_rdata[28]_i_3_n_0 ),
        .I1(up_rreq_s),
        .I2(\up_rdata_reg[17] ),
        .I3(\up_rdata[28]_i_5_n_0 ),
        .I4(\up_rdata_reg[0] ),
        .O(\up_rdata[17]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \up_rdata[18]_i_1 
       (.I0(\up_rdata[18]_i_2_n_0 ),
        .I1(\up_rdata_reg[18] ),
        .I2(\up_scratch_reg[31]_1 [18]),
        .I3(p_1_in[18]),
        .I4(\up_rdata[18]_i_3_n_0 ),
        .O(D[18]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \up_rdata[18]_i_2 
       (.I0(\up_rdata[31]_i_3_n_0 ),
        .I1(up_rreq_s),
        .I2(up_raddr[7]),
        .I3(up_raddr[6]),
        .I4(up_raddr[5]),
        .I5(\up_rdata[0]_i_6_n_0 ),
        .O(\up_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \up_rdata[18]_i_3 
       (.I0(up_rreq_s),
        .I1(up_raddr[7]),
        .I2(up_raddr[6]),
        .I3(up_raddr[5]),
        .I4(\up_rdata[18]_i_4_n_0 ),
        .I5(\up_rdata_reg[0] ),
        .O(\up_rdata[18]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \up_rdata[18]_i_4 
       (.I0(up_raddr[2]),
        .I1(up_raddr[4]),
        .I2(up_raddr[1]),
        .I3(up_raddr[3]),
        .O(\up_rdata[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF8FFF8FFF8)) 
    \up_rdata[1]_i_1 
       (.I0(\up_rdata[6]_i_2_n_0 ),
        .I1(\up_drp_rdata_reg[15] [1]),
        .I2(\up_rdata[1]_i_2_n_0 ),
        .I3(\up_rdata[1]_i_3_n_0 ),
        .I4(\up_rdata[18]_i_3_n_0 ),
        .I5(p_1_in[1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h03000800)) 
    \up_rdata[1]_i_2 
       (.I0(\up_scratch_reg[31]_1 [1]),
        .I1(\up_rdata[0]_i_6_n_0 ),
        .I2(\up_rdata[28]_i_3_n_0 ),
        .I3(up_rreq_s),
        .I4(\up_rdata[31]_i_3_n_0 ),
        .O(\up_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \up_rdata[1]_i_3 
       (.I0(\up_rdata[1]_i_4_n_0 ),
        .I1(\up_rdata[31]_i_3_n_0 ),
        .I2(up_rreq_s),
        .I3(up_raddr[7]),
        .I4(up_raddr[6]),
        .I5(up_raddr[5]),
        .O(\up_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \up_rdata[1]_i_4 
       (.I0(up_mmcm_resetn),
        .I1(up_raddr[1]),
        .I2(up_raddr[3]),
        .I3(up_raddr[0]),
        .I4(up_raddr[2]),
        .I5(up_raddr[4]),
        .O(\up_rdata[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \up_rdata[28]_i_2 
       (.I0(\up_rdata[28]_i_3_n_0 ),
        .I1(up_rreq_s),
        .I2(\up_rdata_reg[17] ),
        .I3(\up_rdata[28]_i_5_n_0 ),
        .I4(\up_rdata_reg[0] ),
        .O(\up_rdata_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \up_rdata[28]_i_3 
       (.I0(up_raddr[5]),
        .I1(up_raddr[6]),
        .I2(up_raddr[7]),
        .O(\up_rdata[28]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hBFFFFFEE)) 
    \up_rdata[28]_i_4 
       (.I0(up_raddr[3]),
        .I1(up_raddr[1]),
        .I2(up_raddr[4]),
        .I3(up_raddr[2]),
        .I4(up_raddr[0]),
        .O(\up_rdata_reg[17] ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h22810000)) 
    \up_rdata[28]_i_5 
       (.I0(up_raddr[2]),
        .I1(up_raddr[1]),
        .I2(up_raddr[0]),
        .I3(up_raddr[3]),
        .I4(up_raddr[4]),
        .O(\up_rdata[28]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00818001)) 
    \up_rdata[28]_i_6 
       (.I0(up_raddr[4]),
        .I1(up_raddr[2]),
        .I2(up_raddr[0]),
        .I3(up_raddr[3]),
        .I4(up_raddr[1]),
        .O(\up_rdata_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \up_rdata[29]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [19]),
        .O(D[19]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[2]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [2]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[2]),
        .I4(\up_drp_rdata_reg[15] [2]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \up_rdata[30]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [20]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \up_rdata[31]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [21]),
        .O(D[21]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \up_rdata[31]_i_2 
       (.I0(\up_rdata[0]_i_6_n_0 ),
        .I1(up_rreq_s),
        .I2(up_raddr[7]),
        .I3(up_raddr[6]),
        .I4(up_raddr[5]),
        .I5(\up_rdata[31]_i_3_n_0 ),
        .O(\up_rdata_reg[18] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00C08011)) 
    \up_rdata[31]_i_3 
       (.I0(up_raddr[0]),
        .I1(up_raddr[2]),
        .I2(up_raddr[4]),
        .I3(up_raddr[1]),
        .I4(up_raddr[3]),
        .O(\up_rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[3]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [3]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[3]),
        .I4(\up_drp_rdata_reg[15] [3]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[4]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [4]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[4]),
        .I4(\up_drp_rdata_reg[15] [4]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \up_rdata[5]_i_1 
       (.I0(\up_rdata[18]_i_3_n_0 ),
        .I1(p_1_in[5]),
        .I2(\up_rdata[6]_i_2_n_0 ),
        .I3(\up_drp_rdata_reg[15] [5]),
        .I4(\up_rdata[5]_i_2_n_0 ),
        .O(D[5]));
  LUT5 #(
    .INIT(32'h03000800)) 
    \up_rdata[5]_i_2 
       (.I0(\up_scratch_reg[31]_1 [5]),
        .I1(\up_rdata[0]_i_6_n_0 ),
        .I2(\up_rdata[28]_i_3_n_0 ),
        .I3(up_rreq_s),
        .I4(\up_rdata[31]_i_3_n_0 ),
        .O(\up_rdata[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \up_rdata[6]_i_1 
       (.I0(\up_rdata[18]_i_3_n_0 ),
        .I1(p_1_in[6]),
        .I2(\up_rdata[6]_i_2_n_0 ),
        .I3(\up_drp_rdata_reg[15] [6]),
        .I4(\up_rdata[6]_i_3_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \up_rdata[6]_i_2 
       (.I0(up_rreq_s),
        .I1(up_raddr[7]),
        .I2(up_raddr[6]),
        .I3(up_raddr[5]),
        .I4(\up_rdata[18]_i_4_n_0 ),
        .I5(\up_rdata_reg[0] ),
        .O(\up_rdata[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h03000800)) 
    \up_rdata[6]_i_3 
       (.I0(\up_scratch_reg[31]_1 [6]),
        .I1(\up_rdata[0]_i_6_n_0 ),
        .I2(\up_rdata[28]_i_3_n_0 ),
        .I3(up_rreq_s),
        .I4(\up_rdata[31]_i_3_n_0 ),
        .O(\up_rdata[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[7]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [7]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[7]),
        .I4(\up_drp_rdata_reg[15] [7]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[8]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [8]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[8]),
        .I4(\up_drp_rdata_reg[15] [8]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \up_rdata[9]_i_1 
       (.I0(\up_rdata_reg[18] ),
        .I1(\up_scratch_reg[31]_1 [9]),
        .I2(\up_rdata_reg[2] ),
        .I3(p_1_in[9]),
        .I4(\up_drp_rdata_reg[15] [9]),
        .I5(\up_rdata[17]_i_2_n_0 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[0]_i_1 
       (.I0(Q[0]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[10]_i_1 
       (.I0(Q[10]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[11]_i_1 
       (.I0(Q[11]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[12]_i_1 
       (.I0(Q[12]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[13]_i_1 
       (.I0(Q[13]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[14]_i_1 
       (.I0(Q[14]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[15]_i_1 
       (.I0(Q[15]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[16]_i_1 
       (.I0(Q[16]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[17]_i_1 
       (.I0(Q[17]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[18]_i_1 
       (.I0(Q[18]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[19]_i_1 
       (.I0(Q[19]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[1]_i_1 
       (.I0(Q[1]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[20]_i_1 
       (.I0(Q[20]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[21]_i_1 
       (.I0(Q[21]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[22]_i_1 
       (.I0(Q[22]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[23]_i_1 
       (.I0(Q[23]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[24]_i_1 
       (.I0(Q[24]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[25]_i_1 
       (.I0(Q[25]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[26]_i_1 
       (.I0(Q[26]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[27]_i_1 
       (.I0(Q[27]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[28]_i_1 
       (.I0(Q[28]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[29]_i_1 
       (.I0(Q[29]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[2]_i_1 
       (.I0(Q[2]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[30]_i_1 
       (.I0(Q[30]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[31]_i_1 
       (.I0(Q[31]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[3]_i_1 
       (.I0(Q[3]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[4]_i_1 
       (.I0(Q[4]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[5]_i_1 
       (.I0(Q[5]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[6]_i_1 
       (.I0(Q[6]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[7]_i_1 
       (.I0(Q[7]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAAAAAAAAAA)) 
    \up_rdata_int[8]_i_1 
       (.I0(Q[8]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAAAAAAAAAAAAA)) 
    \up_rdata_int[9]_i_1 
       (.I0(Q[9]),
        .I1(up_rack_s),
        .I2(p_0_in),
        .I3(\up_rcount_reg_n_0_[2] ),
        .I4(\up_rcount_reg_n_0_[0] ),
        .I5(\up_rcount_reg_n_0_[1] ),
        .O(\up_rdata_int[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[0]),
        .Q(up_rdata_int_d[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[10]),
        .Q(up_rdata_int_d[10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[11]),
        .Q(up_rdata_int_d[11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[12]),
        .Q(up_rdata_int_d[12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[13]),
        .Q(up_rdata_int_d[13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[14]),
        .Q(up_rdata_int_d[14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[15]),
        .Q(up_rdata_int_d[15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[16]),
        .Q(up_rdata_int_d[16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[17]),
        .Q(up_rdata_int_d[17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[18]),
        .Q(up_rdata_int_d[18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[19]),
        .Q(up_rdata_int_d[19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[1]),
        .Q(up_rdata_int_d[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[20]),
        .Q(up_rdata_int_d[20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[21]),
        .Q(up_rdata_int_d[21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[22]),
        .Q(up_rdata_int_d[22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[23]),
        .Q(up_rdata_int_d[23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[24]),
        .Q(up_rdata_int_d[24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[25]),
        .Q(up_rdata_int_d[25]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[26]),
        .Q(up_rdata_int_d[26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[27]),
        .Q(up_rdata_int_d[27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[28]),
        .Q(up_rdata_int_d[28]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[29]),
        .Q(up_rdata_int_d[29]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[2]),
        .Q(up_rdata_int_d[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[30]),
        .Q(up_rdata_int_d[30]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[31]),
        .Q(up_rdata_int_d[31]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[3]),
        .Q(up_rdata_int_d[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[4]),
        .Q(up_rdata_int_d[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[5]),
        .Q(up_rdata_int_d[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[6]),
        .Q(up_rdata_int_d[6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[7]),
        .Q(up_rdata_int_d[7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[8]),
        .Q(up_rdata_int_d[8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_d_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rdata_int[9]),
        .Q(up_rdata_int_d[9]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[0]_i_1_n_0 ),
        .Q(up_rdata_int[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[10]_i_1_n_0 ),
        .Q(up_rdata_int[10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[11]_i_1_n_0 ),
        .Q(up_rdata_int[11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[12]_i_1_n_0 ),
        .Q(up_rdata_int[12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[13]_i_1_n_0 ),
        .Q(up_rdata_int[13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[14]_i_1_n_0 ),
        .Q(up_rdata_int[14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[15]_i_1_n_0 ),
        .Q(up_rdata_int[15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[16]_i_1_n_0 ),
        .Q(up_rdata_int[16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[17]_i_1_n_0 ),
        .Q(up_rdata_int[17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[18]_i_1_n_0 ),
        .Q(up_rdata_int[18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[19]_i_1_n_0 ),
        .Q(up_rdata_int[19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[1]_i_1_n_0 ),
        .Q(up_rdata_int[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[20]_i_1_n_0 ),
        .Q(up_rdata_int[20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[21]_i_1_n_0 ),
        .Q(up_rdata_int[21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[22]_i_1_n_0 ),
        .Q(up_rdata_int[22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[23]_i_1_n_0 ),
        .Q(up_rdata_int[23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[24]_i_1_n_0 ),
        .Q(up_rdata_int[24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[25]_i_1_n_0 ),
        .Q(up_rdata_int[25]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[26]_i_1_n_0 ),
        .Q(up_rdata_int[26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[27]_i_1_n_0 ),
        .Q(up_rdata_int[27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[28]_i_1_n_0 ),
        .Q(up_rdata_int[28]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[29]_i_1_n_0 ),
        .Q(up_rdata_int[29]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[2]_i_1_n_0 ),
        .Q(up_rdata_int[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[30]_i_1_n_0 ),
        .Q(up_rdata_int[30]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(\up_rdata_int[31]_i_1_n_0 ),
        .Q(up_rdata_int[31]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[3]_i_1_n_0 ),
        .Q(up_rdata_int[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[4]_i_1_n_0 ),
        .Q(up_rdata_int[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[5]_i_1_n_0 ),
        .Q(up_rdata_int[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[6]_i_1_n_0 ),
        .Q(up_rdata_int[6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[7]_i_1_n_0 ),
        .Q(up_rdata_int[7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[8]_i_1_n_0 ),
        .Q(up_rdata_int[8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_rdata_int[9]_i_1_n_0 ),
        .Q(up_rdata_int[9]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    up_resetn_i_1
       (.I0(\up_scratch_reg[31] [0]),
        .I1(\i_up_clkgen/up_mmcm_resetn0 ),
        .I2(up_resetn),
        .O(up_resetn_reg));
  LUT5 #(
    .INIT(32'h00001000)) 
    up_resetn_i_2
       (.I0(up_waddr_s[2]),
        .I1(up_waddr_s[1]),
        .I2(\up_scratch[31]_i_2_n_0 ),
        .I3(up_waddr_s[4]),
        .I4(up_waddr_s[3]),
        .O(\i_up_clkgen/up_mmcm_resetn0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    up_rreq_i_1
       (.I0(s_axi_arvalid),
        .I1(up_rsel_reg_n_0),
        .O(up_rreq_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_rreq_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rreq_i_1_n_0),
        .Q(up_rreq_s__0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h3FAA)) 
    up_rsel_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .I3(up_rsel_reg_n_0),
        .O(up_rsel_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_rsel_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_rdata_int_reg[22]_0 ),
        .D(up_rsel_i_1_n_0),
        .Q(up_rsel_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000040)) 
    \up_scratch[31]_i_1 
       (.I0(up_waddr_s[2]),
        .I1(up_waddr_s[1]),
        .I2(\up_scratch[31]_i_2_n_0 ),
        .I3(up_waddr_s[4]),
        .I4(up_waddr_s[3]),
        .O(\up_scratch_reg[31]_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \up_scratch[31]_i_2 
       (.I0(up_waddr_s[5]),
        .I1(up_waddr_s[6]),
        .I2(up_wack_i_2_n_0),
        .I3(up_wreq),
        .I4(up_waddr_s[7]),
        .I5(up_waddr_s[0]),
        .O(\up_scratch[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    up_wack_i_1
       (.I0(up_wack_i_2_n_0),
        .I1(up_wreq),
        .O(up_wreq_s));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    up_wack_i_2
       (.I0(sel0[0]),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[3]),
        .I4(sel0[4]),
        .I5(sel0[5]),
        .O(up_wack_i_2_n_0));
  LUT6 #(
    .INIT(64'hEAAAFFFFEAAA4000)) 
    up_wack_int_i_1
       (.I0(up_wack_s),
        .I1(up_wcount[1]),
        .I2(up_wcount[0]),
        .I3(up_wcount[2]),
        .I4(up_wsel_reg_n_0),
        .I5(up_wack_int),
        .O(up_wack_int_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_wack_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(up_wack_int_i_1_n_0),
        .Q(up_wack_int));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[0]),
        .Q(up_waddr_s[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[10]),
        .Q(sel0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[11]),
        .Q(sel0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[12]),
        .Q(sel0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[13]),
        .Q(sel0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[1]),
        .Q(up_waddr_s[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[2]),
        .Q(up_waddr_s[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[3]),
        .Q(up_waddr_s[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[4]),
        .Q(up_waddr_s[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[5]),
        .Q(up_waddr_s[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[6]),
        .Q(up_waddr_s[6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[7]),
        .Q(up_waddr_s[7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[8]),
        .Q(sel0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_waddr_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_awaddr[9]),
        .Q(sel0[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \up_wcount[0]_i_1 
       (.I0(up_wsel_reg_n_0),
        .I1(up_wcount[0]),
        .O(\up_wcount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \up_wcount[1]_i_1 
       (.I0(up_wsel_reg_n_0),
        .I1(up_wcount[1]),
        .I2(up_wcount[0]),
        .O(\up_wcount[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \up_wcount[2]_i_1 
       (.I0(up_wsel_reg_n_0),
        .I1(up_wcount[2]),
        .I2(up_wcount[1]),
        .I3(up_wcount[0]),
        .O(\up_wcount[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \up_wcount_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(\up_wcount[0]_i_1_n_0 ),
        .Q(up_wcount[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wcount_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(\up_wcount[1]_i_1_n_0 ),
        .Q(up_wcount[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wcount_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(\up_wcount[2]_i_1_n_0 ),
        .Q(up_wcount[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \up_wdata[31]_i_1 
       (.I0(up_wsel_reg_n_0),
        .O(p_5_in));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[0]),
        .Q(\up_scratch_reg[31] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[10]),
        .Q(\up_scratch_reg[31] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[11]),
        .Q(\up_scratch_reg[31] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[12]),
        .Q(\up_scratch_reg[31] [12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[13]),
        .Q(\up_scratch_reg[31] [13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[14]),
        .Q(\up_scratch_reg[31] [14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[15]),
        .Q(\up_scratch_reg[31] [15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[16]),
        .Q(\up_scratch_reg[31] [16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[17]),
        .Q(\up_scratch_reg[31] [17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[18]),
        .Q(\up_scratch_reg[31] [18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[19]),
        .Q(\up_scratch_reg[31] [19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[1]),
        .Q(\up_scratch_reg[31] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[20]),
        .Q(\up_scratch_reg[31] [20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[21]),
        .Q(\up_scratch_reg[31] [21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[22]),
        .Q(\up_scratch_reg[31] [22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[23]),
        .Q(\up_scratch_reg[31] [23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[24]),
        .Q(\up_scratch_reg[31] [24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[25]),
        .Q(\up_scratch_reg[31] [25]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[26]),
        .Q(\up_scratch_reg[31] [26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[27]),
        .Q(\up_scratch_reg[31] [27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[28]),
        .Q(\up_scratch_reg[31] [28]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[29]),
        .Q(\up_scratch_reg[31] [29]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[2]),
        .Q(\up_scratch_reg[31] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[30]),
        .Q(\up_scratch_reg[31] [30]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(s_axi_aresetn_0),
        .D(s_axi_wdata[31]),
        .Q(\up_scratch_reg[31] [31]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[3]),
        .Q(\up_scratch_reg[31] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[4]),
        .Q(\up_scratch_reg[31] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[5]),
        .Q(\up_scratch_reg[31] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[6]),
        .Q(\up_scratch_reg[31] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[7]),
        .Q(\up_scratch_reg[31] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[8]),
        .Q(\up_scratch_reg[31] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_wdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_5_in),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(s_axi_wdata[9]),
        .Q(\up_scratch_reg[31] [9]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h08)) 
    up_wreq_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_awvalid),
        .I2(up_wsel_reg_n_0),
        .O(up_wreq_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_wreq_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(up_wreq_i_1_n_0),
        .Q(up_wreq));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h0FFF8888)) 
    up_wsel_i_1
       (.I0(s_axi_wvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_bvalid),
        .I3(s_axi_bready),
        .I4(up_wsel_reg_n_0),
        .O(up_wsel_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_wsel_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_raddr_reg[10]_0 ),
        .D(up_wsel_i_1_n_0),
        .Q(up_wsel_reg_n_0));
endmodule

(* ORIG_REF_NAME = "up_clkgen" *) 
module system_axi_hdmi_clkgen_0_up_clkgen
   (drp_rst,
    up_drp_locked,
    \up_drp_rdata_reg[1] ,
    drp_sel_s,
    drp_ready_int,
    up_wack_s,
    up_rack_s,
    mmcm_rst,
    up_resetn,
    up_mmcm_resetn,
    up_drp_status,
    drp_wr_s,
    \drp_addr_reg[2] ,
    Q,
    \up_rdata_reg[0]_0 ,
    \up_rdata_reg[15]_0 ,
    \up_rdata_int_reg[31] ,
    DADDR,
    DI,
    drp_clk,
    drp_locked,
    s_axi_aclk,
    s_axi_aresetn_0,
    E,
    D,
    drp_ready_s,
    drp_ready_reg,
    up_wreq_s,
    up_rreq_s,
    s_axi_aresetn_1,
    \up_wdata_reg[0] ,
    \up_wdata_reg[1] ,
    \up_raddr_reg[5] ,
    \up_raddr_reg[7] ,
    \up_raddr_reg[4] ,
    \up_raddr_reg[3] ,
    s_axi_aresetn,
    \up_waddr_reg[2] ,
    \drp_rdata_reg[15] ,
    \up_scratch_reg[31]_0 );
  output drp_rst;
  output up_drp_locked;
  output \up_drp_rdata_reg[1] ;
  output drp_sel_s;
  output drp_ready_int;
  output up_wack_s;
  output up_rack_s;
  output mmcm_rst;
  output up_resetn;
  output up_mmcm_resetn;
  output up_drp_status;
  output drp_wr_s;
  output [18:0]\drp_addr_reg[2] ;
  output [21:0]Q;
  output \up_rdata_reg[0]_0 ;
  output [15:0]\up_rdata_reg[15]_0 ;
  output [31:0]\up_rdata_int_reg[31] ;
  output [6:0]DADDR;
  output [15:0]DI;
  input drp_clk;
  input drp_locked;
  input s_axi_aclk;
  input s_axi_aresetn_0;
  input [0:0]E;
  input [31:0]D;
  input drp_ready_s;
  input [0:0]drp_ready_reg;
  input up_wreq_s;
  input up_rreq_s;
  input s_axi_aresetn_1;
  input \up_wdata_reg[0] ;
  input \up_wdata_reg[1] ;
  input \up_raddr_reg[5] ;
  input \up_raddr_reg[7] ;
  input \up_raddr_reg[4] ;
  input \up_raddr_reg[3] ;
  input s_axi_aresetn;
  input [0:0]\up_waddr_reg[2] ;
  input [15:0]\drp_rdata_reg[15] ;
  input [21:0]\up_scratch_reg[31]_0 ;

  wire [31:0]D;
  wire [6:0]DADDR;
  wire [15:0]DI;
  wire [0:0]E;
  wire [21:0]Q;
  wire [18:0]\drp_addr_reg[2] ;
  wire drp_clk;
  wire drp_locked;
  wire [15:0]\drp_rdata_reg[15] ;
  wire drp_ready_int;
  wire [0:0]drp_ready_reg;
  wire drp_ready_s;
  wire drp_rst;
  wire drp_sel_s;
  wire drp_wr_s;
  wire mmcm_rst;
  wire [27:19]p_1_in;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_aresetn_1;
  wire up_drp_locked;
  wire \up_drp_rdata_reg[1] ;
  wire up_drp_rwn;
  wire up_drp_sel_t;
  wire up_drp_sel_t_i_1_n_0;
  wire up_drp_status;
  wire up_mmcm_resetn;
  wire up_rack_s;
  wire \up_raddr_reg[3] ;
  wire \up_raddr_reg[4] ;
  wire \up_raddr_reg[5] ;
  wire \up_raddr_reg[7] ;
  wire \up_rdata[19]_i_1_n_0 ;
  wire \up_rdata[20]_i_1_n_0 ;
  wire \up_rdata[21]_i_1_n_0 ;
  wire \up_rdata[22]_i_1_n_0 ;
  wire \up_rdata[23]_i_1_n_0 ;
  wire \up_rdata[24]_i_1_n_0 ;
  wire \up_rdata[25]_i_1_n_0 ;
  wire \up_rdata[26]_i_1_n_0 ;
  wire \up_rdata[27]_i_1_n_0 ;
  wire \up_rdata[28]_i_1_n_0 ;
  wire [31:0]\up_rdata_int_reg[31] ;
  wire \up_rdata_reg[0]_0 ;
  wire [15:0]\up_rdata_reg[15]_0 ;
  wire up_resetn;
  wire up_rreq_s;
  wire [28:19]up_scratch;
  wire [21:0]\up_scratch_reg[31]_0 ;
  wire up_wack_s;
  wire [0:0]\up_waddr_reg[2] ;
  wire \up_wdata_reg[0] ;
  wire \up_wdata_reg[1] ;
  wire up_wreq_s;

  system_axi_hdmi_clkgen_0_up_drp_cntrl i_drp_cntrl
       (.DADDR(DADDR),
        .DI(DI),
        .Q({p_1_in[22:19],\drp_addr_reg[2] [18:16]}),
        .drp_clk(drp_clk),
        .drp_locked(drp_locked),
        .\drp_rdata_reg[15] (\drp_rdata_reg[15] ),
        .drp_ready_int(drp_ready_int),
        .drp_ready_reg(drp_ready_reg),
        .drp_ready_s(drp_ready_s),
        .drp_sel_s(drp_sel_s),
        .drp_wr_s(drp_wr_s),
        .rst_reg(drp_rst),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(s_axi_aresetn_0),
        .up_drp_locked(up_drp_locked),
        .\up_drp_rdata_reg[1]_0 (\up_drp_rdata_reg[1] ),
        .up_drp_rwn(up_drp_rwn),
        .up_drp_sel_t(up_drp_sel_t),
        .up_drp_status(up_drp_status),
        .\up_drp_wdata_reg[15] (\drp_addr_reg[2] [15:0]),
        .\up_raddr_reg[3] (\up_raddr_reg[3] ),
        .\up_raddr_reg[4] (\up_raddr_reg[4] ),
        .\up_rdata_reg[0] (\up_rdata_reg[0]_0 ),
        .\up_rdata_reg[15] (\up_rdata_reg[15]_0 ),
        .up_resetn(up_resetn));
  system_axi_hdmi_clkgen_0_ad_rst i_drp_rst_reg
       (.drp_clk(drp_clk),
        .drp_rst(drp_rst),
        .up_resetn(up_resetn));
  system_axi_hdmi_clkgen_0_ad_rst_0 i_mmcm_rst_reg
       (.drp_clk(drp_clk),
        .mmcm_rst(mmcm_rst),
        .up_mmcm_resetn(up_mmcm_resetn));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[16]),
        .Q(\drp_addr_reg[2] [16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[26]),
        .Q(p_1_in[26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[27]),
        .Q(p_1_in[27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[17]),
        .Q(\drp_addr_reg[2] [17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[18]),
        .Q(\drp_addr_reg[2] [18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[19]),
        .Q(p_1_in[19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[20]),
        .Q(p_1_in[20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[21]),
        .Q(p_1_in[21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[22]),
        .Q(p_1_in[22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[23]),
        .Q(p_1_in[23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[24]),
        .Q(p_1_in[24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_addr_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[25]),
        .Q(p_1_in[25]));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_rwn_reg
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[28]),
        .Q(up_drp_rwn));
  LUT1 #(
    .INIT(2'h1)) 
    up_drp_sel_t_i_1
       (.I0(up_drp_sel_t),
        .O(up_drp_sel_t_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_sel_t_reg
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(up_drp_sel_t_i_1_n_0),
        .Q(up_drp_sel_t));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[0]),
        .Q(\drp_addr_reg[2] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[10]),
        .Q(\drp_addr_reg[2] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[11]),
        .Q(\drp_addr_reg[2] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[12]),
        .Q(\drp_addr_reg[2] [12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[13]),
        .Q(\drp_addr_reg[2] [13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[14]),
        .Q(\drp_addr_reg[2] [14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[15]),
        .Q(\drp_addr_reg[2] [15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[1]),
        .Q(\drp_addr_reg[2] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[2]),
        .Q(\drp_addr_reg[2] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[3]),
        .Q(\drp_addr_reg[2] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[4]),
        .Q(\drp_addr_reg[2] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[5]),
        .Q(\drp_addr_reg[2] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[6]),
        .Q(\drp_addr_reg[2] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[7]),
        .Q(\drp_addr_reg[2] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[8]),
        .Q(\drp_addr_reg[2] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_wdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .CLR(s_axi_aresetn_0),
        .D(D[9]),
        .Q(\drp_addr_reg[2] [9]));
  FDCE #(
    .INIT(1'b0)) 
    up_mmcm_resetn_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_wdata_reg[1] ),
        .Q(up_mmcm_resetn));
  FDCE #(
    .INIT(1'b0)) 
    up_rack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(up_rreq_s),
        .Q(up_rack_s));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[19]_i_1 
       (.I0(p_1_in[19]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[19]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[20]_i_1 
       (.I0(p_1_in[20]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[20]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[21]_i_1 
       (.I0(p_1_in[21]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[21]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[22]_i_1 
       (.I0(p_1_in[22]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[22]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[23]_i_1 
       (.I0(p_1_in[23]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[23]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[24]_i_1 
       (.I0(p_1_in[24]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[24]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[25]_i_1 
       (.I0(p_1_in[25]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[25]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[26]_i_1 
       (.I0(p_1_in[26]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[26]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[27]_i_1 
       (.I0(p_1_in[27]),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[27]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \up_rdata[28]_i_1 
       (.I0(up_drp_rwn),
        .I1(\up_raddr_reg[5] ),
        .I2(up_scratch[28]),
        .I3(\up_raddr_reg[7] ),
        .O(\up_rdata[28]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [0]),
        .Q(\up_rdata_int_reg[31] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [10]),
        .Q(\up_rdata_int_reg[31] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [11]),
        .Q(\up_rdata_int_reg[31] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [12]),
        .Q(\up_rdata_int_reg[31] [12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [13]),
        .Q(\up_rdata_int_reg[31] [13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [14]),
        .Q(\up_rdata_int_reg[31] [14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [15]),
        .Q(\up_rdata_int_reg[31] [15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [16]),
        .Q(\up_rdata_int_reg[31] [16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [17]),
        .Q(\up_rdata_int_reg[31] [17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [18]),
        .Q(\up_rdata_int_reg[31] [18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[19]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [1]),
        .Q(\up_rdata_int_reg[31] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[20]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[21]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[22]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[23]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[24]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[25]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [25]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[26]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[27]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_rdata[28]_i_1_n_0 ),
        .Q(\up_rdata_int_reg[31] [28]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [19]),
        .Q(\up_rdata_int_reg[31] [29]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [2]),
        .Q(\up_rdata_int_reg[31] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [20]),
        .Q(\up_rdata_int_reg[31] [30]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [21]),
        .Q(\up_rdata_int_reg[31] [31]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [3]),
        .Q(\up_rdata_int_reg[31] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [4]),
        .Q(\up_rdata_int_reg[31] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [5]),
        .Q(\up_rdata_int_reg[31] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [6]),
        .Q(\up_rdata_int_reg[31] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [7]),
        .Q(\up_rdata_int_reg[31] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [8]),
        .Q(\up_rdata_int_reg[31] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_1),
        .D(\up_scratch_reg[31]_0 [9]),
        .Q(\up_rdata_int_reg[31] [9]));
  FDCE #(
    .INIT(1'b0)) 
    up_resetn_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(\up_wdata_reg[0] ),
        .Q(up_resetn));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[0] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[10] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[11] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[12] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[13] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[14] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[15] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[16] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[17] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[18] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[19] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[19]),
        .Q(up_scratch[19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[1] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[20] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[20]),
        .Q(up_scratch[20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[21] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[21]),
        .Q(up_scratch[21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[22] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[22]),
        .Q(up_scratch[22]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[23] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[23]),
        .Q(up_scratch[23]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[24] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[24]),
        .Q(up_scratch[24]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[25] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[25]),
        .Q(up_scratch[25]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[26] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[26]),
        .Q(up_scratch[26]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[27] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[27]),
        .Q(up_scratch[27]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[28] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[28]),
        .Q(up_scratch[28]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[29] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[29]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[2] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[30] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[30]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[31] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(\up_drp_rdata_reg[1] ),
        .D(D[31]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[3] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[4] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[5] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[6] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[7] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[8] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_scratch_reg[9] 
       (.C(s_axi_aclk),
        .CE(\up_waddr_reg[2] ),
        .CLR(s_axi_aresetn_0),
        .D(D[9]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    up_wack_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(up_wreq_s),
        .Q(up_wack_s));
endmodule

(* ORIG_REF_NAME = "up_drp_cntrl" *) 
module system_axi_hdmi_clkgen_0_up_drp_cntrl
   (up_drp_locked,
    drp_sel_s,
    drp_ready_int,
    \up_drp_rdata_reg[1]_0 ,
    up_drp_status,
    drp_wr_s,
    \up_rdata_reg[0] ,
    \up_rdata_reg[15] ,
    DADDR,
    DI,
    drp_locked,
    s_axi_aclk,
    s_axi_aresetn_0,
    rst_reg,
    up_drp_sel_t,
    drp_clk,
    drp_ready_s,
    drp_ready_reg,
    up_drp_rwn,
    up_resetn,
    \up_raddr_reg[4] ,
    \up_raddr_reg[3] ,
    s_axi_aresetn,
    \drp_rdata_reg[15] ,
    Q,
    \up_drp_wdata_reg[15] );
  output up_drp_locked;
  output drp_sel_s;
  output drp_ready_int;
  output \up_drp_rdata_reg[1]_0 ;
  output up_drp_status;
  output drp_wr_s;
  output \up_rdata_reg[0] ;
  output [15:0]\up_rdata_reg[15] ;
  output [6:0]DADDR;
  output [15:0]DI;
  input drp_locked;
  input s_axi_aclk;
  input s_axi_aresetn_0;
  input rst_reg;
  input up_drp_sel_t;
  input drp_clk;
  input drp_ready_s;
  input [0:0]drp_ready_reg;
  input up_drp_rwn;
  input up_resetn;
  input \up_raddr_reg[4] ;
  input \up_raddr_reg[3] ;
  input s_axi_aresetn;
  input [15:0]\drp_rdata_reg[15] ;
  input [6:0]Q;
  input [15:0]\up_drp_wdata_reg[15] ;

  wire [6:0]DADDR;
  wire [15:0]DI;
  wire [6:0]Q;
  wire drp_ack_t;
  wire drp_ack_t_i_1_n_0;
  wire \drp_addr[6]_i_1_n_0 ;
  wire drp_clk;
  wire drp_locked;
  wire [15:0]drp_rdata_int;
  wire [15:0]\drp_rdata_reg[15] ;
  wire drp_ready_int;
  wire [0:0]drp_ready_reg;
  wire drp_ready_s;
  wire drp_sel_s;
  wire drp_sel_t_m1;
  wire drp_sel_t_m2;
  wire drp_sel_t_m3;
  wire drp_sel_t_s;
  wire drp_wr_i_1_n_0;
  wire drp_wr_s;
  wire rst_reg;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire up_drp_ack_t_m1;
  wire up_drp_ack_t_m2;
  wire up_drp_ack_t_m3;
  wire up_drp_ack_t_s;
  wire up_drp_locked;
  wire up_drp_locked_m1;
  wire \up_drp_rdata_reg[1]_0 ;
  wire up_drp_rwn;
  wire up_drp_sel_t;
  wire up_drp_sel_t_d;
  wire up_drp_status;
  wire up_drp_status_i_1_n_0;
  wire [15:0]\up_drp_wdata_reg[15] ;
  wire \up_raddr_reg[3] ;
  wire \up_raddr_reg[4] ;
  wire \up_rdata_reg[0] ;
  wire [15:0]\up_rdata_reg[15] ;
  wire up_resetn;

  LUT1 #(
    .INIT(2'h1)) 
    drp_ack_t_i_1
       (.I0(drp_ack_t),
        .O(drp_ack_t_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    drp_ack_t_reg
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(drp_ack_t_i_1_n_0),
        .Q(drp_ack_t),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \drp_addr[6]_i_1 
       (.I0(drp_sel_t_m2),
        .I1(drp_sel_t_m3),
        .O(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[0] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[0]),
        .Q(DADDR[0]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[1] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(DADDR[1]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[2] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[2]),
        .Q(DADDR[2]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[3] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[3]),
        .Q(DADDR[3]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[4] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[4]),
        .Q(DADDR[4]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[5] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[5]),
        .Q(DADDR[5]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_addr_reg[6] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(Q[6]),
        .Q(DADDR[6]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[0] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [0]),
        .Q(drp_rdata_int[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[10] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [10]),
        .Q(drp_rdata_int[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[11] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [11]),
        .Q(drp_rdata_int[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[12] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [12]),
        .Q(drp_rdata_int[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[13] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [13]),
        .Q(drp_rdata_int[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[14] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [14]),
        .Q(drp_rdata_int[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[15] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [15]),
        .Q(drp_rdata_int[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[1] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [1]),
        .Q(drp_rdata_int[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[2] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [2]),
        .Q(drp_rdata_int[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[3] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [3]),
        .Q(drp_rdata_int[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[4] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [4]),
        .Q(drp_rdata_int[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[5] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [5]),
        .Q(drp_rdata_int[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[6] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [6]),
        .Q(drp_rdata_int[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[7] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [7]),
        .Q(drp_rdata_int[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[8] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [8]),
        .Q(drp_rdata_int[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \drp_rdata_int_reg[9] 
       (.C(drp_clk),
        .CE(drp_ready_reg),
        .D(\drp_rdata_reg[15] [9]),
        .Q(drp_rdata_int[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    drp_ready_int_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_ready_s),
        .Q(drp_ready_int),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h6)) 
    drp_sel_i_1
       (.I0(drp_sel_t_m3),
        .I1(drp_sel_t_m2),
        .O(drp_sel_t_s));
  FDRE #(
    .INIT(1'b0)) 
    drp_sel_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_sel_t_s),
        .Q(drp_sel_s),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    drp_sel_t_m1_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(up_drp_sel_t),
        .Q(drp_sel_t_m1),
        .R(rst_reg));
  FDRE #(
    .INIT(1'b0)) 
    drp_sel_t_m2_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_sel_t_m1),
        .Q(drp_sel_t_m2),
        .R(rst_reg));
  FDRE #(
    .INIT(1'b0)) 
    drp_sel_t_m3_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_sel_t_m2),
        .Q(drp_sel_t_m3),
        .R(rst_reg));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[0] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [0]),
        .Q(DI[0]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[10] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [10]),
        .Q(DI[10]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[11] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [11]),
        .Q(DI[11]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[12] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [12]),
        .Q(DI[12]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[13] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [13]),
        .Q(DI[13]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[14] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [14]),
        .Q(DI[14]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[15] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [15]),
        .Q(DI[15]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[1] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [1]),
        .Q(DI[1]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[2] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [2]),
        .Q(DI[2]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[3] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [3]),
        .Q(DI[3]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[4] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [4]),
        .Q(DI[4]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[5] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [5]),
        .Q(DI[5]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[6] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [6]),
        .Q(DI[6]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[7] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [7]),
        .Q(DI[7]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[8] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [8]),
        .Q(DI[8]),
        .R(\drp_addr[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \drp_wdata_reg[9] 
       (.C(drp_clk),
        .CE(1'b1),
        .D(\up_drp_wdata_reg[15] [9]),
        .Q(DI[9]),
        .R(\drp_addr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h06)) 
    drp_wr_i_1
       (.I0(drp_sel_t_m2),
        .I1(drp_sel_t_m3),
        .I2(up_drp_rwn),
        .O(drp_wr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    drp_wr_reg
       (.C(drp_clk),
        .CE(1'b1),
        .D(drp_wr_i_1_n_0),
        .Q(drp_wr_s),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_ack_t_m1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_ack_t),
        .Q(up_drp_ack_t_m1));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_ack_t_m2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(up_drp_ack_t_m1),
        .Q(up_drp_ack_t_m2));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_ack_t_m3_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(up_drp_ack_t_m2),
        .Q(up_drp_ack_t_m3));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_locked_m1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(drp_locked),
        .Q(up_drp_locked_m1));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_locked_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(s_axi_aresetn_0),
        .D(up_drp_locked_m1),
        .Q(up_drp_locked));
  LUT2 #(
    .INIT(4'h6)) 
    \up_drp_rdata[15]_i_1 
       (.I0(up_drp_ack_t_m2),
        .I1(up_drp_ack_t_m3),
        .O(up_drp_ack_t_s));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[0]),
        .Q(\up_rdata_reg[15] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[10]),
        .Q(\up_rdata_reg[15] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[11]),
        .Q(\up_rdata_reg[15] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[12]),
        .Q(\up_rdata_reg[15] [12]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[13]),
        .Q(\up_rdata_reg[15] [13]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[14]),
        .Q(\up_rdata_reg[15] [14]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[15]),
        .Q(\up_rdata_reg[15] [15]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[1]),
        .Q(\up_rdata_reg[15] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[2]),
        .Q(\up_rdata_reg[15] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[3]),
        .Q(\up_rdata_reg[15] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[4]),
        .Q(\up_rdata_reg[15] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[5]),
        .Q(\up_rdata_reg[15] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(drp_rdata_int[6]),
        .Q(\up_rdata_reg[15] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[7]),
        .Q(\up_rdata_reg[15] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[8]),
        .Q(\up_rdata_reg[15] [8]));
  FDCE #(
    .INIT(1'b0)) 
    \up_drp_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(up_drp_ack_t_s),
        .CLR(s_axi_aresetn_0),
        .D(drp_rdata_int[9]),
        .Q(\up_rdata_reg[15] [9]));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_sel_t_d_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(up_drp_sel_t),
        .Q(up_drp_sel_t_d));
  LUT5 #(
    .INIT(32'h99990990)) 
    up_drp_status_i_1
       (.I0(up_drp_ack_t_m3),
        .I1(up_drp_ack_t_m2),
        .I2(up_drp_sel_t),
        .I3(up_drp_sel_t_d),
        .I4(up_drp_status),
        .O(up_drp_status_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    up_drp_status_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .CLR(\up_drp_rdata_reg[1]_0 ),
        .D(up_drp_status_i_1_n_0),
        .Q(up_drp_status));
  LUT4 #(
    .INIT(16'h00E2)) 
    \up_rdata[0]_i_5 
       (.I0(up_resetn),
        .I1(\up_raddr_reg[4] ),
        .I2(up_drp_locked),
        .I3(\up_raddr_reg[3] ),
        .O(\up_rdata_reg[0] ));
  LUT1 #(
    .INIT(2'h1)) 
    \up_wdata[31]_i_2 
       (.I0(s_axi_aresetn),
        .O(\up_drp_rdata_reg[1]_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
