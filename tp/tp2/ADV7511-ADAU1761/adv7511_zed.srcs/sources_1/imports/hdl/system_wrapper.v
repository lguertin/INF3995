//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Mon Jan 14 15:30:37 2019
//Host        : L3712-07 running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GPIO_I,
    GPIO_O,
    GPIO_T,
    IIC_FMC_scl_io,
    IIC_FMC_sda_io,
    hdmi_data,
    hdmi_data_e,
    hdmi_hsync,
    hdmi_out_clk,
    hdmi_vsync,
    i2s_bclk,
    i2s_lrclk,
    i2s_mclk,
    i2s_sdata_in,
    i2s_sdata_out,
    iic_mux_scl_I,
    iic_mux_scl_O,
    iic_mux_scl_T,
    iic_mux_sda_I,
    iic_mux_sda_O,
    iic_mux_sda_T,
    otg_vbusoc,
    ps_intr_0,
    ps_intr_1,
    ps_intr_10,
    ps_intr_12,
    ps_intr_13,
    ps_intr_2,
    ps_intr_3,
    ps_intr_4,
    ps_intr_5,
    ps_intr_6,
    ps_intr_7,
    ps_intr_8,
    ps_intr_9,
    spdif);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [31:0]GPIO_I;
  output [31:0]GPIO_O;
  output [31:0]GPIO_T;
  inout IIC_FMC_scl_io;
  inout IIC_FMC_sda_io;
  output [15:0]hdmi_data;
  output hdmi_data_e;
  output hdmi_hsync;
  output hdmi_out_clk;
  output hdmi_vsync;
  output [0:0]i2s_bclk;
  output [0:0]i2s_lrclk;
  output i2s_mclk;
  input i2s_sdata_in;
  output [0:0]i2s_sdata_out;
  input [1:0]iic_mux_scl_I;
  output [1:0]iic_mux_scl_O;
  output iic_mux_scl_T;
  input [1:0]iic_mux_sda_I;
  output [1:0]iic_mux_sda_O;
  output iic_mux_sda_T;
  input otg_vbusoc;
  input ps_intr_0;
  input ps_intr_1;
  input ps_intr_10;
  input ps_intr_12;
  input ps_intr_13;
  input ps_intr_2;
  input ps_intr_3;
  input ps_intr_4;
  input ps_intr_5;
  input ps_intr_6;
  input ps_intr_7;
  input ps_intr_8;
  input ps_intr_9;
  output spdif;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [31:0]GPIO_I;
  wire [31:0]GPIO_O;
  wire [31:0]GPIO_T;
  wire IIC_FMC_scl_i;
  wire IIC_FMC_scl_io;
  wire IIC_FMC_scl_o;
  wire IIC_FMC_scl_t;
  wire IIC_FMC_sda_i;
  wire IIC_FMC_sda_io;
  wire IIC_FMC_sda_o;
  wire IIC_FMC_sda_t;
  wire [15:0]hdmi_data;
  wire hdmi_data_e;
  wire hdmi_hsync;
  wire hdmi_out_clk;
  wire hdmi_vsync;
  wire [0:0]i2s_bclk;
  wire [0:0]i2s_lrclk;
  wire i2s_mclk;
  wire i2s_sdata_in;
  wire [0:0]i2s_sdata_out;
  wire [1:0]iic_mux_scl_I;
  wire [1:0]iic_mux_scl_O;
  wire iic_mux_scl_T;
  wire [1:0]iic_mux_sda_I;
  wire [1:0]iic_mux_sda_O;
  wire iic_mux_sda_T;
  wire otg_vbusoc;
  wire ps_intr_0;
  wire ps_intr_1;
  wire ps_intr_10;
  wire ps_intr_12;
  wire ps_intr_13;
  wire ps_intr_2;
  wire ps_intr_3;
  wire ps_intr_4;
  wire ps_intr_5;
  wire ps_intr_6;
  wire ps_intr_7;
  wire ps_intr_8;
  wire ps_intr_9;
  wire spdif;

  IOBUF IIC_FMC_scl_iobuf
       (.I(IIC_FMC_scl_o),
        .IO(IIC_FMC_scl_io),
        .O(IIC_FMC_scl_i),
        .T(IIC_FMC_scl_t));
  IOBUF IIC_FMC_sda_iobuf
       (.I(IIC_FMC_sda_o),
        .IO(IIC_FMC_sda_io),
        .O(IIC_FMC_sda_i),
        .T(IIC_FMC_sda_t));
  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO_I(GPIO_I),
        .GPIO_O(GPIO_O),
        .GPIO_T(GPIO_T),
        .IIC_FMC_scl_i(IIC_FMC_scl_i),
        .IIC_FMC_scl_o(IIC_FMC_scl_o),
        .IIC_FMC_scl_t(IIC_FMC_scl_t),
        .IIC_FMC_sda_i(IIC_FMC_sda_i),
        .IIC_FMC_sda_o(IIC_FMC_sda_o),
        .IIC_FMC_sda_t(IIC_FMC_sda_t),
        .hdmi_data(hdmi_data),
        .hdmi_data_e(hdmi_data_e),
        .hdmi_hsync(hdmi_hsync),
        .hdmi_out_clk(hdmi_out_clk),
        .hdmi_vsync(hdmi_vsync),
        .i2s_bclk(i2s_bclk),
        .i2s_lrclk(i2s_lrclk),
        .i2s_mclk(i2s_mclk),
        .i2s_sdata_in(i2s_sdata_in),
        .i2s_sdata_out(i2s_sdata_out),
        .iic_mux_scl_I(iic_mux_scl_I),
        .iic_mux_scl_O(iic_mux_scl_O),
        .iic_mux_scl_T(iic_mux_scl_T),
        .iic_mux_sda_I(iic_mux_sda_I),
        .iic_mux_sda_O(iic_mux_sda_O),
        .iic_mux_sda_T(iic_mux_sda_T),
        .otg_vbusoc(otg_vbusoc),
        .ps_intr_0(ps_intr_0),
        .ps_intr_1(ps_intr_1),
        .ps_intr_10(ps_intr_10),
        .ps_intr_12(ps_intr_12),
        .ps_intr_13(ps_intr_13),
        .ps_intr_2(ps_intr_2),
        .ps_intr_3(ps_intr_3),
        .ps_intr_4(ps_intr_4),
        .ps_intr_5(ps_intr_5),
        .ps_intr_6(ps_intr_6),
        .ps_intr_7(ps_intr_7),
        .ps_intr_8(ps_intr_8),
        .ps_intr_9(ps_intr_9),
        .spdif(spdif));
endmodule
