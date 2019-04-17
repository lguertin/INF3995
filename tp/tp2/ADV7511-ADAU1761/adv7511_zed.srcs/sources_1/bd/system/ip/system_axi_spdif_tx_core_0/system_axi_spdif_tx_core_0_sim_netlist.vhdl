-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Mon Jan 14 15:54:55 2019
-- Host        : L3712-07 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               x:/Bureau/ADV7511-ADAU1761/adv7511_zed.srcs/sources_1/bd/system/ip/system_axi_spdif_tx_core_0/system_axi_spdif_tx_core_0_sim_netlist.vhdl
-- Design      : system_axi_spdif_tx_core_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_spdif_tx_core_0_axi_ctrlif is
  port (
    \out\ : out STD_LOGIC;
    S_AXI_BVALID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \wr_addr_reg[0]\ : out STD_LOGIC;
    wr_addr0 : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \config_reg_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    wr_addr : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_ARESETN : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 1 downto 0 );
    full : in STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    \chstatus_reg_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_spdif_tx_core_0_axi_ctrlif : entity is "axi_ctrlif";
end system_axi_spdif_tx_core_0_axi_ctrlif;

architecture STRUCTURE of system_axi_spdif_tx_core_0_axi_ctrlif is
  signal \FSM_onehot_wr_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wr_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wr_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wr_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wr_state_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_wr_state_reg_n_0_[0]\ : signal is "yes";
  signal FSM_sequential_rd_state_i_1_n_0 : STD_LOGIC;
  signal \FSM_sequential_rd_state_reg__0\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_sequential_rd_state_reg__0\ : signal is "yes";
  signal \^s_axi_bvalid\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^s_axi_bvalid\ : signal is "yes";
  signal \rd_addr[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_addr_reg_n_0_[1]\ : STD_LOGIC;
  signal \^wr_addr0\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_wr_state_reg[0]\ : label is "idle:001,ack:010,resp:100,";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_wr_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wr_state_reg[1]\ : label is "idle:001,ack:010,resp:100,";
  attribute KEEP of \FSM_onehot_wr_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wr_state_reg[2]\ : label is "idle:001,ack:010,resp:100,";
  attribute KEEP of \FSM_onehot_wr_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of FSM_sequential_rd_state_reg : label is "idle:0,resp:1,";
  attribute KEEP of FSM_sequential_rd_state_reg : label is "yes";
begin
  S_AXI_BVALID(1 downto 0) <= \^s_axi_bvalid\(1 downto 0);
  \out\ <= \FSM_sequential_rd_state_reg__0\;
  wr_addr0 <= \^wr_addr0\;
\FSM_onehot_wr_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E2FF"
    )
        port map (
      I0 => \FSM_onehot_wr_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_wr_state[2]_i_2_n_0\,
      I2 => \^s_axi_bvalid\(1),
      I3 => S_AXI_ARESETN,
      O => \FSM_onehot_wr_state[0]_i_1_n_0\
    );
\FSM_onehot_wr_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \^s_axi_bvalid\(0),
      I1 => \FSM_onehot_wr_state[2]_i_2_n_0\,
      I2 => \FSM_onehot_wr_state_reg_n_0_[0]\,
      I3 => S_AXI_ARESETN,
      O => \FSM_onehot_wr_state[1]_i_1_n_0\
    );
\FSM_onehot_wr_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \^s_axi_bvalid\(1),
      I1 => \FSM_onehot_wr_state[2]_i_2_n_0\,
      I2 => \^s_axi_bvalid\(0),
      I3 => S_AXI_ARESETN,
      O => \FSM_onehot_wr_state[2]_i_1_n_0\
    );
\FSM_onehot_wr_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF808080"
    )
        port map (
      I0 => S_AXI_WVALID,
      I1 => S_AXI_AWVALID,
      I2 => \FSM_onehot_wr_state_reg_n_0_[0]\,
      I3 => S_AXI_BREADY,
      I4 => \^s_axi_bvalid\(1),
      I5 => \^s_axi_bvalid\(0),
      O => \FSM_onehot_wr_state[2]_i_2_n_0\
    );
\FSM_onehot_wr_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \FSM_onehot_wr_state[0]_i_1_n_0\,
      Q => \FSM_onehot_wr_state_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_wr_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \FSM_onehot_wr_state[1]_i_1_n_0\,
      Q => \^s_axi_bvalid\(0),
      R => '0'
    );
\FSM_onehot_wr_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \FSM_onehot_wr_state[2]_i_1_n_0\,
      Q => \^s_axi_bvalid\(1),
      R => '0'
    );
FSM_sequential_rd_state_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EAE0000"
    )
        port map (
      I0 => \FSM_sequential_rd_state_reg__0\,
      I1 => S_AXI_ARVALID,
      I2 => \FSM_sequential_rd_state_reg__0\,
      I3 => S_AXI_RREADY,
      I4 => S_AXI_ARESETN,
      O => FSM_sequential_rd_state_i_1_n_0
    );
FSM_sequential_rd_state_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => FSM_sequential_rd_state_i_1_n_0,
      Q => \FSM_sequential_rd_state_reg__0\,
      R => '0'
    );
S_AXI_ARREADY_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \FSM_sequential_rd_state_reg__0\,
      O => S_AXI_ARREADY
    );
\S_AXI_RDATA[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(0),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(0),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(0)
    );
\S_AXI_RDATA[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(10),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(10),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(10)
    );
\S_AXI_RDATA[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(11),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(11),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(11)
    );
\S_AXI_RDATA[12]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(12),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(12),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(12)
    );
\S_AXI_RDATA[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(13),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(13),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(13)
    );
\S_AXI_RDATA[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(14),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(14),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(14)
    );
\S_AXI_RDATA[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(15),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(15),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(15)
    );
\S_AXI_RDATA[16]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(16),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(16),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(16)
    );
\S_AXI_RDATA[17]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(17),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(17),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(17)
    );
\S_AXI_RDATA[18]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(18),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(18),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(18)
    );
\S_AXI_RDATA[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(19),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(19),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(19)
    );
\S_AXI_RDATA[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(1),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(1),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(1)
    );
\S_AXI_RDATA[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(20),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(20),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(20)
    );
\S_AXI_RDATA[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(21),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(21),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(21)
    );
\S_AXI_RDATA[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(22),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(22),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(22)
    );
\S_AXI_RDATA[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(23),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(23),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(23)
    );
\S_AXI_RDATA[24]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(24),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(24),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(24)
    );
\S_AXI_RDATA[25]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(25),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(25),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(25)
    );
\S_AXI_RDATA[26]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(26),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(26),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(26)
    );
\S_AXI_RDATA[27]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(27),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(27),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(27)
    );
\S_AXI_RDATA[28]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(28),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(28),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(28)
    );
\S_AXI_RDATA[29]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(29),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(29),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(29)
    );
\S_AXI_RDATA[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(2),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(2),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(2)
    );
\S_AXI_RDATA[30]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(30),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(30),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(30)
    );
\S_AXI_RDATA[31]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(31),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(31),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(31)
    );
\S_AXI_RDATA[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(3),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(3),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(3)
    );
\S_AXI_RDATA[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(4),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(4),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(4)
    );
\S_AXI_RDATA[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(5),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(5),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(5)
    );
\S_AXI_RDATA[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(6),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(6),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(6)
    );
\S_AXI_RDATA[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(7),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(7),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(7)
    );
\S_AXI_RDATA[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(8),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(8),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(8)
    );
\S_AXI_RDATA[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => Q(9),
      I1 => \rd_addr_reg_n_0_[0]\,
      I2 => \chstatus_reg_reg[31]\(9),
      I3 => \rd_addr_reg_n_0_[1]\,
      O => S_AXI_RDATA(9)
    );
\chstatus_reg[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => S_AXI_AWADDR(0),
      I1 => \FSM_onehot_wr_state_reg_n_0_[0]\,
      I2 => S_AXI_AWVALID,
      I3 => S_AXI_WVALID,
      I4 => S_AXI_AWADDR(1),
      O => E(0)
    );
\config_reg[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => S_AXI_AWADDR(0),
      I1 => \FSM_onehot_wr_state_reg_n_0_[0]\,
      I2 => S_AXI_AWVALID,
      I3 => S_AXI_WVALID,
      I4 => S_AXI_AWADDR(1),
      O => \config_reg_reg[0]\(0)
    );
data_fifo_reg_0_7_0_5_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^wr_addr0\,
      I1 => S_AXI_ARESETN,
      I2 => Q(1),
      O => p_0_in
    );
\rd_addr[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => S_AXI_ARADDR(0),
      I1 => S_AXI_ARESETN,
      I2 => S_AXI_ARVALID,
      I3 => \FSM_sequential_rd_state_reg__0\,
      I4 => \rd_addr_reg_n_0_[0]\,
      O => \rd_addr[0]_i_1_n_0\
    );
\rd_addr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => S_AXI_ARADDR(1),
      I1 => S_AXI_ARESETN,
      I2 => S_AXI_ARVALID,
      I3 => \FSM_sequential_rd_state_reg__0\,
      I4 => \rd_addr_reg_n_0_[1]\,
      O => \rd_addr[1]_i_1_n_0\
    );
\rd_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \rd_addr[0]_i_1_n_0\,
      Q => \rd_addr_reg_n_0_[0]\,
      R => '0'
    );
\rd_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \rd_addr[1]_i_1_n_0\,
      Q => \rd_addr_reg_n_0_[1]\,
      R => '0'
    );
\wr_addr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^wr_addr0\,
      I1 => wr_addr(0),
      O => \wr_addr_reg[0]\
    );
\wr_addr[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => S_AXI_WVALID,
      I1 => S_AXI_AWVALID,
      I2 => \FSM_onehot_wr_state_reg_n_0_[0]\,
      I3 => S_AXI_AWADDR(0),
      I4 => S_AXI_AWADDR(1),
      I5 => full,
      O => \^wr_addr0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_spdif_tx_core_0_dma_fifo is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \free_cnt_reg[0]_0\ : out STD_LOGIC;
    full : out STD_LOGIC;
    \state_reg[1]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    \wr_addr_reg[0]_0\ : in STD_LOGIC;
    wr_addr0 : in STD_LOGIC;
    \config_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_ARESETN : in STD_LOGIC;
    empty_reg_0 : in STD_LOGIC;
    sample_data_ack : in STD_LOGIC;
    channel : in STD_LOGIC;
    DMA_REQ_DRREADY : in STD_LOGIC;
    \state_reg[0]\ : in STD_LOGIC;
    \state_reg[1]_0\ : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_spdif_tx_core_0_dma_fifo : entity is "dma_fifo";
end system_axi_spdif_tx_core_0_dma_fifo;

architecture STRUCTURE of system_axi_spdif_tx_core_0_dma_fifo is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty_i_1_n_0 : STD_LOGIC;
  signal free_cnt : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \free_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \^free_cnt_reg[0]_0\ : STD_LOGIC;
  signal \free_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \free_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \free_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \free_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal full_i_1_n_0 : STD_LOGIC;
  signal out_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rd_addr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \rd_addr[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr[2]_i_1_n_0\ : STD_LOGIC;
  signal wr_addr : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \wr_addr[1]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr[2]_i_1_n_0\ : STD_LOGIC;
  signal NLW_data_fifo_reg_0_7_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_12_17_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_18_23_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_24_29_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_30_31_DOB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_30_31_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_30_31_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_data_fifo_reg_0_7_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DA16.audio[10]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DA16.audio[11]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DA16.audio[12]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DA16.audio[13]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DA16.audio[14]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \DA16.audio[15]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \DA16.audio[16]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \DA16.audio[17]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \DA16.audio[18]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \DA16.audio[19]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \DA16.audio[20]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DA16.audio[21]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \DA16.audio[22]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \DA16.audio[23]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DA16.audio[8]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \DA16.audio[9]_i_1\ : label is "soft_lutpair24";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of data_fifo_reg_0_7_0_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of data_fifo_reg_0_7_12_17 : label is "";
  attribute METHODOLOGY_DRC_VIOS of data_fifo_reg_0_7_18_23 : label is "";
  attribute METHODOLOGY_DRC_VIOS of data_fifo_reg_0_7_24_29 : label is "";
  attribute METHODOLOGY_DRC_VIOS of data_fifo_reg_0_7_30_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of data_fifo_reg_0_7_6_11 : label is "";
  attribute SOFT_HLUTNM of \rd_addr[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rd_addr[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \wr_addr[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \wr_addr[2]_i_1\ : label is "soft_lutpair16";
begin
  Q(0) <= \^q\(0);
  SR(0) <= \^sr\(0);
  \free_cnt_reg[0]_0\ <= \^free_cnt_reg[0]_0\;
  full <= \^full\;
\DA16.audio[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(18),
      I1 => channel,
      I2 => out_data(2),
      O => D(2)
    );
\DA16.audio[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(19),
      I1 => channel,
      I2 => out_data(3),
      O => D(3)
    );
\DA16.audio[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(20),
      I1 => channel,
      I2 => out_data(4),
      O => D(4)
    );
\DA16.audio[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(21),
      I1 => channel,
      I2 => out_data(5),
      O => D(5)
    );
\DA16.audio[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(22),
      I1 => channel,
      I2 => out_data(6),
      O => D(6)
    );
\DA16.audio[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(23),
      I1 => channel,
      I2 => out_data(7),
      O => D(7)
    );
\DA16.audio[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(24),
      I1 => channel,
      I2 => out_data(8),
      O => D(8)
    );
\DA16.audio[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(25),
      I1 => channel,
      I2 => out_data(9),
      O => D(9)
    );
\DA16.audio[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(26),
      I1 => channel,
      I2 => out_data(10),
      O => D(10)
    );
\DA16.audio[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(27),
      I1 => channel,
      I2 => out_data(11),
      O => D(11)
    );
\DA16.audio[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(28),
      I1 => channel,
      I2 => out_data(12),
      O => D(12)
    );
\DA16.audio[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(29),
      I1 => channel,
      I2 => out_data(13),
      O => D(13)
    );
\DA16.audio[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(30),
      I1 => channel,
      I2 => out_data(14),
      O => D(14)
    );
\DA16.audio[23]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(31),
      I1 => channel,
      I2 => out_data(15),
      O => D(15)
    );
\DA16.audio[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(16),
      I1 => channel,
      I2 => out_data(0),
      O => D(0)
    );
\DA16.audio[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => out_data(17),
      I1 => channel,
      I2 => out_data(1),
      O => D(1)
    );
\FSM_sequential_bufctrl[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \config_reg_reg[1]\(0),
      I1 => S_AXI_ARESETN,
      O => \^sr\(0)
    );
data_fifo_reg_0_7_0_5: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 1) => wr_addr(2 downto 1),
      ADDRD(0) => \^q\(0),
      DIA(1 downto 0) => S_AXI_WDATA(1 downto 0),
      DIB(1 downto 0) => S_AXI_WDATA(3 downto 2),
      DIC(1 downto 0) => S_AXI_WDATA(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data(1 downto 0),
      DOB(1 downto 0) => out_data(3 downto 2),
      DOC(1 downto 0) => out_data(5 downto 4),
      DOD(1 downto 0) => NLW_data_fifo_reg_0_7_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => S_AXI_ACLK,
      WE => p_0_in
    );
data_fifo_reg_0_7_12_17: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 1) => wr_addr(2 downto 1),
      ADDRD(0) => \^q\(0),
      DIA(1 downto 0) => S_AXI_WDATA(13 downto 12),
      DIB(1 downto 0) => S_AXI_WDATA(15 downto 14),
      DIC(1 downto 0) => S_AXI_WDATA(17 downto 16),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data(13 downto 12),
      DOB(1 downto 0) => out_data(15 downto 14),
      DOC(1 downto 0) => out_data(17 downto 16),
      DOD(1 downto 0) => NLW_data_fifo_reg_0_7_12_17_DOD_UNCONNECTED(1 downto 0),
      WCLK => S_AXI_ACLK,
      WE => p_0_in
    );
data_fifo_reg_0_7_18_23: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 1) => wr_addr(2 downto 1),
      ADDRD(0) => \^q\(0),
      DIA(1 downto 0) => S_AXI_WDATA(19 downto 18),
      DIB(1 downto 0) => S_AXI_WDATA(21 downto 20),
      DIC(1 downto 0) => S_AXI_WDATA(23 downto 22),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data(19 downto 18),
      DOB(1 downto 0) => out_data(21 downto 20),
      DOC(1 downto 0) => out_data(23 downto 22),
      DOD(1 downto 0) => NLW_data_fifo_reg_0_7_18_23_DOD_UNCONNECTED(1 downto 0),
      WCLK => S_AXI_ACLK,
      WE => p_0_in
    );
data_fifo_reg_0_7_24_29: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 1) => wr_addr(2 downto 1),
      ADDRD(0) => \^q\(0),
      DIA(1 downto 0) => S_AXI_WDATA(25 downto 24),
      DIB(1 downto 0) => S_AXI_WDATA(27 downto 26),
      DIC(1 downto 0) => S_AXI_WDATA(29 downto 28),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data(25 downto 24),
      DOB(1 downto 0) => out_data(27 downto 26),
      DOC(1 downto 0) => out_data(29 downto 28),
      DOD(1 downto 0) => NLW_data_fifo_reg_0_7_24_29_DOD_UNCONNECTED(1 downto 0),
      WCLK => S_AXI_ACLK,
      WE => p_0_in
    );
data_fifo_reg_0_7_30_31: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 1) => wr_addr(2 downto 1),
      ADDRD(0) => \^q\(0),
      DIA(1 downto 0) => S_AXI_WDATA(31 downto 30),
      DIB(1 downto 0) => B"00",
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data(31 downto 30),
      DOB(1 downto 0) => NLW_data_fifo_reg_0_7_30_31_DOB_UNCONNECTED(1 downto 0),
      DOC(1 downto 0) => NLW_data_fifo_reg_0_7_30_31_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_data_fifo_reg_0_7_30_31_DOD_UNCONNECTED(1 downto 0),
      WCLK => S_AXI_ACLK,
      WE => p_0_in
    );
data_fifo_reg_0_7_6_11: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2 downto 0) => rd_addr(2 downto 0),
      ADDRB(4 downto 3) => B"00",
      ADDRB(2 downto 0) => rd_addr(2 downto 0),
      ADDRC(4 downto 3) => B"00",
      ADDRC(2 downto 0) => rd_addr(2 downto 0),
      ADDRD(4 downto 3) => B"00",
      ADDRD(2 downto 1) => wr_addr(2 downto 1),
      ADDRD(0) => \^q\(0),
      DIA(1 downto 0) => S_AXI_WDATA(7 downto 6),
      DIB(1 downto 0) => S_AXI_WDATA(9 downto 8),
      DIC(1 downto 0) => S_AXI_WDATA(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => out_data(7 downto 6),
      DOB(1 downto 0) => out_data(9 downto 8),
      DOC(1 downto 0) => out_data(11 downto 10),
      DOD(1 downto 0) => NLW_data_fifo_reg_0_7_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => S_AXI_ACLK,
      WE => p_0_in
    );
empty_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000020000220"
    )
        port map (
      I0 => \free_cnt_reg_n_0_[3]\,
      I1 => \free_cnt_reg_n_0_[1]\,
      I2 => wr_addr0,
      I3 => empty_reg_0,
      I4 => \free_cnt_reg_n_0_[0]\,
      I5 => \free_cnt_reg_n_0_[2]\,
      O => empty_i_1_n_0
    );
empty_reg: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => empty_i_1_n_0,
      Q => \^free_cnt_reg[0]_0\,
      S => \^sr\(0)
    );
\free_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"65559AAA"
    )
        port map (
      I0 => \free_cnt_reg_n_0_[0]\,
      I1 => \^free_cnt_reg[0]_0\,
      I2 => channel,
      I3 => sample_data_ack,
      I4 => wr_addr0,
      O => \free_cnt[0]_i_1_n_0\
    );
\free_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAFF7F55150080"
    )
        port map (
      I0 => \free_cnt_reg_n_0_[0]\,
      I1 => sample_data_ack,
      I2 => channel,
      I3 => \^free_cnt_reg[0]_0\,
      I4 => wr_addr0,
      I5 => \free_cnt_reg_n_0_[1]\,
      O => free_cnt(1)
    );
\free_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EF10F708"
    )
        port map (
      I0 => empty_reg_0,
      I1 => wr_addr0,
      I2 => \free_cnt_reg_n_0_[0]\,
      I3 => \free_cnt_reg_n_0_[2]\,
      I4 => \free_cnt_reg_n_0_[1]\,
      O => free_cnt(2)
    );
\free_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA6AA9AAAAAA"
    )
        port map (
      I0 => \free_cnt_reg_n_0_[3]\,
      I1 => \free_cnt_reg_n_0_[2]\,
      I2 => \free_cnt_reg_n_0_[1]\,
      I3 => empty_reg_0,
      I4 => wr_addr0,
      I5 => \free_cnt_reg_n_0_[0]\,
      O => free_cnt(3)
    );
\free_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \free_cnt[0]_i_1_n_0\,
      Q => \free_cnt_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\free_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => free_cnt(1),
      Q => \free_cnt_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\free_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => free_cnt(2),
      Q => \free_cnt_reg_n_0_[2]\,
      R => \^sr\(0)
    );
\free_cnt_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => free_cnt(3),
      Q => \free_cnt_reg_n_0_[3]\,
      S => \^sr\(0)
    );
full_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000010000110"
    )
        port map (
      I0 => \free_cnt_reg_n_0_[3]\,
      I1 => \free_cnt_reg_n_0_[1]\,
      I2 => wr_addr0,
      I3 => empty_reg_0,
      I4 => \free_cnt_reg_n_0_[0]\,
      I5 => \free_cnt_reg_n_0_[2]\,
      O => full_i_1_n_0
    );
full_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => full_i_1_n_0,
      Q => \^full\,
      R => \^sr\(0)
    );
\rd_addr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF40"
    )
        port map (
      I0 => \^free_cnt_reg[0]_0\,
      I1 => channel,
      I2 => sample_data_ack,
      I3 => rd_addr(0),
      O => \rd_addr[0]_i_1_n_0\
    );
\rd_addr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0080"
    )
        port map (
      I0 => rd_addr(0),
      I1 => sample_data_ack,
      I2 => channel,
      I3 => \^free_cnt_reg[0]_0\,
      I4 => rd_addr(1),
      O => \rd_addr[1]_i_1_n_0\
    );
\rd_addr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF7FFF00008000"
    )
        port map (
      I0 => rd_addr(0),
      I1 => rd_addr(1),
      I2 => sample_data_ack,
      I3 => channel,
      I4 => \^free_cnt_reg[0]_0\,
      I5 => rd_addr(2),
      O => \rd_addr[2]_i_1_n_0\
    );
\rd_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \rd_addr[0]_i_1_n_0\,
      Q => rd_addr(0),
      R => \^sr\(0)
    );
\rd_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \rd_addr[1]_i_1_n_0\,
      Q => rd_addr(1),
      R => \^sr\(0)
    );
\rd_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \rd_addr[2]_i_1_n_0\,
      Q => rd_addr(2),
      R => \^sr\(0)
    );
\state[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888888B8"
    )
        port map (
      I0 => DMA_REQ_DRREADY,
      I1 => \state_reg[0]\,
      I2 => \config_reg_reg[1]\(0),
      I3 => \state_reg[1]_0\,
      I4 => \^full\,
      O => \state_reg[1]\
    );
\wr_addr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => wr_addr0,
      I2 => wr_addr(1),
      O => \wr_addr[1]_i_1_n_0\
    );
\wr_addr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(0),
      I1 => wr_addr(1),
      I2 => wr_addr0,
      I3 => wr_addr(2),
      O => \wr_addr[2]_i_1_n_0\
    );
\wr_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \wr_addr_reg[0]_0\,
      Q => \^q\(0),
      R => \^sr\(0)
    );
\wr_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \wr_addr[1]_i_1_n_0\,
      Q => wr_addr(1),
      R => \^sr\(0)
    );
\wr_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \wr_addr[2]_i_1_n_0\,
      Q => wr_addr(2),
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_spdif_tx_core_0_tx_encoder is
  port (
    sample_data_ack : out STD_LOGIC;
    channel : out STD_LOGIC;
    spdif_tx_o : out STD_LOGIC;
    \free_cnt_reg[3]\ : out STD_LOGIC;
    spdif_data_clk : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    in1 : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    empty : in STD_LOGIC;
    \chstatus_reg_reg[7]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    D : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_spdif_tx_core_0_tx_encoder : entity is "tx_encoder";
end system_axi_spdif_tx_core_0_tx_encoder;

architecture STRUCTURE of system_axi_spdif_tx_core_0_tx_encoder is
  signal \FSM_sequential_bufctrl[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_bufctrl[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_bufctrl[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_bufctrl[2]_i_3_n_0\ : STD_LOGIC;
  signal \__14/i__n_0\ : STD_LOGIC;
  signal bit_cnt : STD_LOGIC;
  signal \bit_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \bit_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal bufctrl : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of bufctrl : signal is "yes";
  signal cha_samp_ack_i_1_n_0 : STD_LOGIC;
  signal cha_samp_ack_i_2_n_0 : STD_LOGIC;
  signal cha_samp_ack_reg_n_0 : STD_LOGIC;
  signal \^channel\ : STD_LOGIC;
  signal channel_i_1_n_0 : STD_LOGIC;
  signal chb_samp_ack_i_1_n_0 : STD_LOGIC;
  signal chb_samp_ack_reg_n_0 : STD_LOGIC;
  signal clk_cnt0 : STD_LOGIC;
  signal clk_cnt1 : STD_LOGIC;
  signal \clk_cnt1_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \clk_cnt1_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \clk_cnt1_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \clk_cnt1_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \clk_cnt1_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \clk_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \clk_cnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \clk_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \clk_cnt_reg__0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal frame_cnt : STD_LOGIC;
  signal \frame_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \frame_cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \frame_cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \frame_cnt[7]_i_3_n_0\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \frame_cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \framest[0]_i_1_n_0\ : STD_LOGIC;
  signal \framest[1]_i_1_n_0\ : STD_LOGIC;
  signal \framest[1]_i_2_n_0\ : STD_LOGIC;
  signal \framest[1]_i_3_n_0\ : STD_LOGIC;
  signal \framest_reg_n_0_[0]\ : STD_LOGIC;
  signal \framest_reg_n_0_[1]\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal inv_preamble_i_1_n_0 : STD_LOGIC;
  signal inv_preamble_i_2_n_0 : STD_LOGIC;
  signal inv_preamble_i_3_n_0 : STD_LOGIC;
  signal inv_preamble_i_4_n_0 : STD_LOGIC;
  signal inv_preamble_reg_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 8 downto 1 );
  signal p_0_in0 : STD_LOGIC;
  signal \par_cnt[0]_i_10_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_11_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_12_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_13_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_14_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_15_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_16_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_17_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_18_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_19_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \par_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal par_cnt_reg : STD_LOGIC_VECTOR ( 0 to 0 );
  signal par_vector : STD_LOGIC_VECTOR ( 24 downto 8 );
  signal \^sample_data_ack\ : STD_LOGIC;
  signal send_audio : STD_LOGIC;
  signal send_audio_i_1_n_0 : STD_LOGIC;
  signal send_audio_i_2_n_0 : STD_LOGIC;
  signal spdif_clk_en : STD_LOGIC;
  signal spdif_clk_en_i_1_n_0 : STD_LOGIC;
  signal spdif_out4_out : STD_LOGIC;
  signal spdif_out_i_1_n_0 : STD_LOGIC;
  signal spdif_out_i_2_n_0 : STD_LOGIC;
  signal spdif_out_i_3_n_0 : STD_LOGIC;
  signal spdif_out_i_4_n_0 : STD_LOGIC;
  signal spdif_out_i_5_n_0 : STD_LOGIC;
  signal spdif_out_reg_n_0 : STD_LOGIC;
  signal spdif_tx_o_i_1_n_0 : STD_LOGIC;
  signal tick_counter : STD_LOGIC;
  signal tick_counter_d1 : STD_LOGIC;
  signal tick_counter_d2 : STD_LOGIC;
  signal tick_counter_i_1_n_0 : STD_LOGIC;
  signal toggle : STD_LOGIC;
  signal toggle_i_1_n_0 : STD_LOGIC;
  signal valid_i_1_n_0 : STD_LOGIC;
  signal \NLW_clk_cnt1_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clk_cnt1_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_clk_cnt1_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_bufctrl_reg[0]\ : label is "idle:000,read_cha:001,cha_rdy:010,read_chb:011,chb_rdy:100,";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_bufctrl_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_bufctrl_reg[1]\ : label is "idle:000,read_cha:001,cha_rdy:010,read_chb:011,chb_rdy:100,";
  attribute KEEP of \FSM_sequential_bufctrl_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_bufctrl_reg[2]\ : label is "idle:000,read_cha:001,cha_rdy:010,read_chb:011,chb_rdy:100,";
  attribute KEEP of \FSM_sequential_bufctrl_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bit_cnt[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bit_cnt[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bit_cnt[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bit_cnt[4]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \clk_cnt[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \clk_cnt[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \clk_cnt[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clk_cnt[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clk_cnt[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \clk_cnt[8]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \frame_cnt[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \frame_cnt[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \frame_cnt[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \frame_cnt[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \frame_cnt[7]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \framest[1]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \framest[1]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of inv_preamble_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of inv_preamble_i_3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_13\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_15\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_5\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_8\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \par_cnt[0]_i_9\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of spdif_clk_en_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of spdif_out_i_4 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of spdif_out_i_5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of toggle_i_1 : label is "soft_lutpair11";
begin
  channel <= \^channel\;
  sample_data_ack <= \^sample_data_ack\;
\DA16.audio[23]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => send_audio,
      O => p_0_in0
    );
\DA16.audio_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(2),
      Q => par_vector(10),
      R => p_0_in0
    );
\DA16.audio_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(3),
      Q => par_vector(11),
      R => p_0_in0
    );
\DA16.audio_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(4),
      Q => par_vector(12),
      R => p_0_in0
    );
\DA16.audio_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(5),
      Q => par_vector(13),
      R => p_0_in0
    );
\DA16.audio_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(6),
      Q => par_vector(14),
      R => p_0_in0
    );
\DA16.audio_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(7),
      Q => par_vector(15),
      R => p_0_in0
    );
\DA16.audio_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(8),
      Q => par_vector(16),
      R => p_0_in0
    );
\DA16.audio_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(9),
      Q => par_vector(17),
      R => p_0_in0
    );
\DA16.audio_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(10),
      Q => par_vector(18),
      R => p_0_in0
    );
\DA16.audio_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(11),
      Q => par_vector(19),
      R => p_0_in0
    );
\DA16.audio_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(12),
      Q => par_vector(20),
      R => p_0_in0
    );
\DA16.audio_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(13),
      Q => par_vector(21),
      R => p_0_in0
    );
\DA16.audio_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(14),
      Q => par_vector(22),
      R => p_0_in0
    );
\DA16.audio_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(15),
      Q => par_vector(23),
      R => p_0_in0
    );
\DA16.audio_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(0),
      Q => par_vector(8),
      R => p_0_in0
    );
\DA16.audio_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => D(1),
      Q => par_vector(9),
      R => p_0_in0
    );
\FSM_sequential_bufctrl[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => bufctrl(0),
      I1 => bufctrl(2),
      I2 => bufctrl(1),
      O => \FSM_sequential_bufctrl[0]_i_1_n_0\
    );
\FSM_sequential_bufctrl[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => bufctrl(1),
      I1 => bufctrl(0),
      I2 => bufctrl(2),
      O => \FSM_sequential_bufctrl[1]_i_1_n_0\
    );
\FSM_sequential_bufctrl[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0300FBFB"
    )
        port map (
      I0 => cha_samp_ack_reg_n_0,
      I1 => bufctrl(1),
      I2 => bufctrl(0),
      I3 => chb_samp_ack_reg_n_0,
      I4 => bufctrl(2),
      O => \FSM_sequential_bufctrl[2]_i_2_n_0\
    );
\FSM_sequential_bufctrl[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => bufctrl(2),
      I1 => bufctrl(0),
      I2 => bufctrl(1),
      O => \FSM_sequential_bufctrl[2]_i_3_n_0\
    );
\FSM_sequential_bufctrl_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \FSM_sequential_bufctrl[2]_i_2_n_0\,
      D => \FSM_sequential_bufctrl[0]_i_1_n_0\,
      Q => bufctrl(0),
      R => in1
    );
\FSM_sequential_bufctrl_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \FSM_sequential_bufctrl[2]_i_2_n_0\,
      D => \FSM_sequential_bufctrl[1]_i_1_n_0\,
      Q => bufctrl(1),
      R => in1
    );
\FSM_sequential_bufctrl_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \FSM_sequential_bufctrl[2]_i_2_n_0\,
      D => \FSM_sequential_bufctrl[2]_i_3_n_0\,
      Q => bufctrl(2),
      R => in1
    );
\__14/i_\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11510051"
    )
        port map (
      I0 => bufctrl(0),
      I1 => bufctrl(2),
      I2 => chb_samp_ack_reg_n_0,
      I3 => bufctrl(1),
      I4 => cha_samp_ack_reg_n_0,
      O => \__14/i__n_0\
    );
\bit_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \framest_reg_n_0_[0]\,
      I2 => \framest_reg_n_0_[1]\,
      O => \bit_cnt[0]_i_1_n_0\
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[1]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \framest_reg_n_0_[0]\,
      I3 => \framest_reg_n_0_[1]\,
      O => \bit_cnt[1]_i_1_n_0\
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EEEE000"
    )
        port map (
      I0 => \framest_reg_n_0_[0]\,
      I1 => \framest_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \bit_cnt_reg_n_0_[1]\,
      I4 => \bit_cnt_reg_n_0_[2]\,
      O => \bit_cnt[2]_i_1_n_0\
    );
\bit_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EEEEEEEE0000000"
    )
        port map (
      I0 => \framest_reg_n_0_[0]\,
      I1 => \framest_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \bit_cnt_reg_n_0_[0]\,
      I4 => \bit_cnt_reg_n_0_[2]\,
      I5 => \bit_cnt_reg_n_0_[3]\,
      O => \bit_cnt[3]_i_1_n_0\
    );
\bit_cnt[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA02"
    )
        port map (
      I0 => spdif_clk_en,
      I1 => \framest_reg_n_0_[1]\,
      I2 => \framest_reg_n_0_[0]\,
      I3 => toggle,
      O => bit_cnt
    );
\bit_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => \bit_cnt[4]_i_3_n_0\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \bit_cnt_reg_n_0_[3]\,
      I4 => \bit_cnt_reg_n_0_[2]\,
      I5 => \bit_cnt_reg_n_0_[4]\,
      O => \bit_cnt[4]_i_2_n_0\
    );
\bit_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \framest_reg_n_0_[1]\,
      I1 => \framest_reg_n_0_[0]\,
      O => \bit_cnt[4]_i_3_n_0\
    );
\bit_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => bit_cnt,
      D => \bit_cnt[0]_i_1_n_0\,
      Q => \bit_cnt_reg_n_0_[0]\,
      R => clk_cnt1
    );
\bit_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => bit_cnt,
      D => \bit_cnt[1]_i_1_n_0\,
      Q => \bit_cnt_reg_n_0_[1]\,
      R => clk_cnt1
    );
\bit_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => bit_cnt,
      D => \bit_cnt[2]_i_1_n_0\,
      Q => \bit_cnt_reg_n_0_[2]\,
      R => clk_cnt1
    );
\bit_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => bit_cnt,
      D => \bit_cnt[3]_i_1_n_0\,
      Q => \bit_cnt_reg_n_0_[3]\,
      R => clk_cnt1
    );
\bit_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => bit_cnt,
      D => \bit_cnt[4]_i_2_n_0\,
      Q => \bit_cnt_reg_n_0_[4]\,
      R => clk_cnt1
    );
cha_samp_ack_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FFFFFF00808000"
    )
        port map (
      I0 => spdif_clk_en,
      I1 => cha_samp_ack_i_2_n_0,
      I2 => send_audio,
      I3 => \framest_reg_n_0_[1]\,
      I4 => \framest_reg_n_0_[0]\,
      I5 => cha_samp_ack_reg_n_0,
      O => cha_samp_ack_i_1_n_0
    );
cha_samp_ack_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[4]\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \bit_cnt_reg_n_0_[3]\,
      I4 => \bit_cnt_reg_n_0_[2]\,
      I5 => toggle,
      O => cha_samp_ack_i_2_n_0
    );
cha_samp_ack_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => cha_samp_ack_i_1_n_0,
      Q => cha_samp_ack_reg_n_0,
      R => clk_cnt1
    );
channel_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => bufctrl(1),
      I1 => bufctrl(0),
      I2 => bufctrl(2),
      I3 => \^channel\,
      O => channel_i_1_n_0
    );
channel_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => channel_i_1_n_0,
      Q => \^channel\,
      R => in1
    );
chb_samp_ack_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF5555FF80000000"
    )
        port map (
      I0 => spdif_clk_en,
      I1 => cha_samp_ack_i_2_n_0,
      I2 => send_audio,
      I3 => \framest_reg_n_0_[1]\,
      I4 => \framest_reg_n_0_[0]\,
      I5 => chb_samp_ack_reg_n_0,
      O => chb_samp_ack_i_1_n_0
    );
chb_samp_ack_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => chb_samp_ack_i_1_n_0,
      Q => chb_samp_ack_reg_n_0,
      R => clk_cnt1
    );
\clk_cnt1_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \clk_cnt1_inferred__0/i__carry_n_0\,
      CO(2) => \clk_cnt1_inferred__0/i__carry_n_1\,
      CO(1) => \clk_cnt1_inferred__0/i__carry_n_2\,
      CO(0) => \clk_cnt1_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry_i_1_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1) => \i__carry_i_3_n_0\,
      DI(0) => \i__carry_i_4_n_0\,
      O(3 downto 0) => \NLW_clk_cnt1_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\clk_cnt1_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt1_inferred__0/i__carry_n_0\,
      CO(3 downto 1) => \NLW_clk_cnt1_inferred__0/i__carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \clk_cnt1_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_clk_cnt1_inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \i__carry__0_i_1_n_0\
    );
\clk_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \clk_cnt_reg__0\(0),
      O => \clk_cnt[0]_i_1_n_0\
    );
\clk_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \clk_cnt_reg__0\(1),
      I1 => \clk_cnt_reg__0\(0),
      O => p_0_in(1)
    );
\clk_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \clk_cnt_reg__0\(2),
      I1 => \clk_cnt_reg__0\(0),
      I2 => \clk_cnt_reg__0\(1),
      O => p_0_in(2)
    );
\clk_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \clk_cnt_reg__0\(3),
      I1 => \clk_cnt_reg__0\(1),
      I2 => \clk_cnt_reg__0\(0),
      I3 => \clk_cnt_reg__0\(2),
      O => p_0_in(3)
    );
\clk_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \clk_cnt_reg__0\(4),
      I1 => \clk_cnt_reg__0\(2),
      I2 => \clk_cnt_reg__0\(0),
      I3 => \clk_cnt_reg__0\(1),
      I4 => \clk_cnt_reg__0\(3),
      O => p_0_in(4)
    );
\clk_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \clk_cnt_reg__0\(5),
      I1 => \clk_cnt_reg__0\(3),
      I2 => \clk_cnt_reg__0\(1),
      I3 => \clk_cnt_reg__0\(0),
      I4 => \clk_cnt_reg__0\(2),
      I5 => \clk_cnt_reg__0\(4),
      O => p_0_in(5)
    );
\clk_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \clk_cnt_reg__0\(6),
      I1 => \clk_cnt[8]_i_4_n_0\,
      O => p_0_in(6)
    );
\clk_cnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \clk_cnt_reg__0\(7),
      I1 => \clk_cnt[8]_i_4_n_0\,
      I2 => \clk_cnt_reg__0\(6),
      O => p_0_in(7)
    );
\clk_cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14FFFFFF"
    )
        port map (
      I0 => \clk_cnt1_inferred__0/i__carry__0_n_3\,
      I1 => tick_counter_d1,
      I2 => tick_counter_d2,
      I3 => S_AXI_ARESETN,
      I4 => Q(0),
      O => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tick_counter_d1,
      I1 => tick_counter_d2,
      O => clk_cnt0
    );
\clk_cnt[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \clk_cnt_reg__0\(8),
      I1 => \clk_cnt_reg__0\(6),
      I2 => \clk_cnt[8]_i_4_n_0\,
      I3 => \clk_cnt_reg__0\(7),
      O => p_0_in(8)
    );
\clk_cnt[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \clk_cnt_reg__0\(5),
      I1 => \clk_cnt_reg__0\(3),
      I2 => \clk_cnt_reg__0\(1),
      I3 => \clk_cnt_reg__0\(0),
      I4 => \clk_cnt_reg__0\(2),
      I5 => \clk_cnt_reg__0\(4),
      O => \clk_cnt[8]_i_4_n_0\
    );
\clk_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => \clk_cnt[0]_i_1_n_0\,
      Q => \clk_cnt_reg__0\(0),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(1),
      Q => \clk_cnt_reg__0\(1),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(2),
      Q => \clk_cnt_reg__0\(2),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(3),
      Q => \clk_cnt_reg__0\(3),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(4),
      Q => \clk_cnt_reg__0\(4),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(5),
      Q => \clk_cnt_reg__0\(5),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(6),
      Q => \clk_cnt_reg__0\(6),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(7),
      Q => \clk_cnt_reg__0\(7),
      R => \clk_cnt[8]_i_1_n_0\
    );
\clk_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => clk_cnt0,
      D => p_0_in(8),
      Q => \clk_cnt_reg__0\(8),
      R => \clk_cnt[8]_i_1_n_0\
    );
\frame_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \frame_cnt[4]_i_2_n_0\,
      I1 => \frame_cnt_reg_n_0_[0]\,
      O => \frame_cnt[0]_i_1_n_0\
    );
\frame_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \frame_cnt[4]_i_2_n_0\,
      I1 => \frame_cnt_reg_n_0_[1]\,
      I2 => \frame_cnt_reg_n_0_[0]\,
      O => \frame_cnt[1]_i_1_n_0\
    );
\frame_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \frame_cnt[4]_i_2_n_0\,
      I1 => \frame_cnt_reg_n_0_[0]\,
      I2 => \frame_cnt_reg_n_0_[1]\,
      I3 => \frame_cnt_reg_n_0_[2]\,
      O => \frame_cnt[2]_i_1_n_0\
    );
\frame_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \frame_cnt[4]_i_2_n_0\,
      I1 => \frame_cnt_reg_n_0_[1]\,
      I2 => \frame_cnt_reg_n_0_[0]\,
      I3 => \frame_cnt_reg_n_0_[2]\,
      I4 => \frame_cnt_reg_n_0_[3]\,
      O => \frame_cnt[3]_i_1_n_0\
    );
\frame_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \frame_cnt[4]_i_2_n_0\,
      I1 => \frame_cnt_reg_n_0_[2]\,
      I2 => \frame_cnt_reg_n_0_[0]\,
      I3 => \frame_cnt_reg_n_0_[1]\,
      I4 => \frame_cnt_reg_n_0_[3]\,
      I5 => \frame_cnt_reg_n_0_[4]\,
      O => \frame_cnt[4]_i_1_n_0\
    );
\frame_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22220222AAAAAAAA"
    )
        port map (
      I0 => \framest_reg_n_0_[1]\,
      I1 => \frame_cnt_reg_n_0_[6]\,
      I2 => \frame_cnt_reg_n_0_[5]\,
      I3 => \frame_cnt_reg_n_0_[4]\,
      I4 => \frame_cnt[7]_i_3_n_0\,
      I5 => \frame_cnt_reg_n_0_[7]\,
      O => \frame_cnt[4]_i_2_n_0\
    );
\frame_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7070007000007000"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[7]\,
      I1 => \frame_cnt_reg_n_0_[6]\,
      I2 => \framest_reg_n_0_[1]\,
      I3 => \frame_cnt_reg_n_0_[4]\,
      I4 => \frame_cnt[7]_i_3_n_0\,
      I5 => \frame_cnt_reg_n_0_[5]\,
      O => \frame_cnt[5]_i_1_n_0\
    );
\frame_cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040404004404040"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[7]\,
      I1 => \framest_reg_n_0_[1]\,
      I2 => \frame_cnt_reg_n_0_[6]\,
      I3 => \frame_cnt_reg_n_0_[5]\,
      I4 => \frame_cnt_reg_n_0_[4]\,
      I5 => \frame_cnt[7]_i_3_n_0\,
      O => \frame_cnt[6]_i_1_n_0\
    );
\frame_cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"800F0000"
    )
        port map (
      I0 => \framest[1]_i_3_n_0\,
      I1 => toggle,
      I2 => \framest_reg_n_0_[1]\,
      I3 => \framest_reg_n_0_[0]\,
      I4 => spdif_clk_en,
      O => frame_cnt
    );
\frame_cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200088880888"
    )
        port map (
      I0 => \framest_reg_n_0_[1]\,
      I1 => \frame_cnt_reg_n_0_[7]\,
      I2 => \frame_cnt_reg_n_0_[5]\,
      I3 => \frame_cnt_reg_n_0_[4]\,
      I4 => \frame_cnt[7]_i_3_n_0\,
      I5 => \frame_cnt_reg_n_0_[6]\,
      O => \frame_cnt[7]_i_2_n_0\
    );
\frame_cnt[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[2]\,
      I1 => \frame_cnt_reg_n_0_[0]\,
      I2 => \frame_cnt_reg_n_0_[1]\,
      I3 => \frame_cnt_reg_n_0_[3]\,
      O => \frame_cnt[7]_i_3_n_0\
    );
\frame_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[0]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[0]\,
      R => clk_cnt1
    );
\frame_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[1]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[1]\,
      R => clk_cnt1
    );
\frame_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[2]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[2]\,
      R => clk_cnt1
    );
\frame_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[3]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[3]\,
      R => clk_cnt1
    );
\frame_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[4]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[4]\,
      R => clk_cnt1
    );
\frame_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[5]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[5]\,
      R => clk_cnt1
    );
\frame_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[6]_i_1_n_0\,
      Q => \frame_cnt_reg_n_0_[6]\,
      R => clk_cnt1
    );
\frame_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => frame_cnt,
      D => \frame_cnt[7]_i_2_n_0\,
      Q => \frame_cnt_reg_n_0_[7]\,
      R => clk_cnt1
    );
\framest[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFC000F0F0"
    )
        port map (
      I0 => \framest[1]_i_2_n_0\,
      I1 => toggle,
      I2 => spdif_clk_en,
      I3 => \framest[1]_i_3_n_0\,
      I4 => \framest_reg_n_0_[1]\,
      I5 => \framest_reg_n_0_[0]\,
      O => \framest[0]_i_1_n_0\
    );
\framest[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFC000FFFF0000"
    )
        port map (
      I0 => \framest[1]_i_2_n_0\,
      I1 => toggle,
      I2 => spdif_clk_en,
      I3 => \framest[1]_i_3_n_0\,
      I4 => \framest_reg_n_0_[1]\,
      I5 => \framest_reg_n_0_[0]\,
      O => \framest[1]_i_1_n_0\
    );
\framest[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA2000"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[7]\,
      I1 => \frame_cnt[7]_i_3_n_0\,
      I2 => \frame_cnt_reg_n_0_[4]\,
      I3 => \frame_cnt_reg_n_0_[5]\,
      I4 => \frame_cnt_reg_n_0_[6]\,
      O => \framest[1]_i_2_n_0\
    );
\framest[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[2]\,
      I1 => \bit_cnt_reg_n_0_[3]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \bit_cnt_reg_n_0_[1]\,
      I4 => \bit_cnt_reg_n_0_[4]\,
      O => \framest[1]_i_3_n_0\
    );
\framest_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \framest[0]_i_1_n_0\,
      Q => \framest_reg_n_0_[0]\,
      R => clk_cnt1
    );
\framest_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \framest[1]_i_1_n_0\,
      Q => \framest_reg_n_0_[1]\,
      R => clk_cnt1
    );
\free_cnt[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => empty,
      I1 => \^channel\,
      I2 => \^sample_data_ack\,
      O => \free_cnt_reg[3]\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \clk_cnt_reg__0\(8),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => \clk_cnt_reg__0\(7),
      I1 => Q(9),
      I2 => Q(8),
      I3 => \clk_cnt_reg__0\(6),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => \clk_cnt_reg__0\(5),
      I1 => Q(7),
      I2 => Q(6),
      I3 => \clk_cnt_reg__0\(4),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => \clk_cnt_reg__0\(3),
      I1 => Q(5),
      I2 => Q(4),
      I3 => \clk_cnt_reg__0\(2),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => \clk_cnt_reg__0\(1),
      I1 => Q(3),
      I2 => Q(2),
      I3 => \clk_cnt_reg__0\(0),
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(9),
      I1 => \clk_cnt_reg__0\(7),
      I2 => Q(8),
      I3 => \clk_cnt_reg__0\(6),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(7),
      I1 => \clk_cnt_reg__0\(5),
      I2 => Q(6),
      I3 => \clk_cnt_reg__0\(4),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(5),
      I1 => \clk_cnt_reg__0\(3),
      I2 => Q(4),
      I3 => \clk_cnt_reg__0\(2),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(3),
      I1 => \clk_cnt_reg__0\(1),
      I2 => Q(2),
      I3 => \clk_cnt_reg__0\(0),
      O => \i__carry_i_8_n_0\
    );
inv_preamble_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0EFF00000E00"
    )
        port map (
      I0 => inv_preamble_i_2_n_0,
      I1 => spdif_out_i_3_n_0,
      I2 => inv_preamble_i_3_n_0,
      I3 => spdif_clk_en,
      I4 => inv_preamble_i_4_n_0,
      I5 => inv_preamble_reg_n_0,
      O => inv_preamble_i_1_n_0
    );
inv_preamble_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => spdif_out_reg_n_0,
      I1 => \framest_reg_n_0_[1]\,
      I2 => \framest[1]_i_3_n_0\,
      O => inv_preamble_i_2_n_0
    );
inv_preamble_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0355"
    )
        port map (
      I0 => \framest_reg_n_0_[0]\,
      I1 => spdif_out_reg_n_0,
      I2 => \framest[1]_i_3_n_0\,
      I3 => \framest_reg_n_0_[1]\,
      O => inv_preamble_i_3_n_0
    );
inv_preamble_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555555555555"
    )
        port map (
      I0 => \bit_cnt[4]_i_3_n_0\,
      I1 => \bit_cnt_reg_n_0_[4]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \bit_cnt_reg_n_0_[0]\,
      I4 => \bit_cnt_reg_n_0_[3]\,
      I5 => \bit_cnt_reg_n_0_[2]\,
      O => inv_preamble_i_4_n_0
    );
inv_preamble_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => inv_preamble_i_1_n_0,
      Q => inv_preamble_reg_n_0,
      R => clk_cnt1
    );
\par_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0DFFFFFF02000000"
    )
        port map (
      I0 => \par_cnt[0]_i_2_n_0\,
      I1 => \par_cnt[0]_i_3_n_0\,
      I2 => \par_cnt[0]_i_4_n_0\,
      I3 => spdif_out4_out,
      I4 => \par_cnt[0]_i_6_n_0\,
      I5 => par_cnt_reg(0),
      O => \par_cnt[0]_i_1_n_0\
    );
\par_cnt[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"220AAAAA22AAAA0A"
    )
        port map (
      I0 => \par_cnt[0]_i_9_n_0\,
      I1 => \par_cnt[0]_i_18_n_0\,
      I2 => \par_cnt[0]_i_19_n_0\,
      I3 => \bit_cnt_reg_n_0_[2]\,
      I4 => \bit_cnt_reg_n_0_[4]\,
      I5 => \bit_cnt_reg_n_0_[3]\,
      O => \par_cnt[0]_i_10_n_0\
    );
\par_cnt[0]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \chstatus_reg_reg[7]\(2),
      I1 => \chstatus_reg_reg[7]\(1),
      I2 => \frame_cnt_reg_n_0_[1]\,
      I3 => \frame_cnt_reg_n_0_[0]\,
      I4 => \chstatus_reg_reg[7]\(0),
      O => \par_cnt[0]_i_11_n_0\
    );
\par_cnt[0]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[3]\,
      I1 => \frame_cnt_reg_n_0_[2]\,
      O => \par_cnt[0]_i_12_n_0\
    );
\par_cnt[0]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[3]\,
      I1 => \frame_cnt_reg_n_0_[1]\,
      I2 => \frame_cnt_reg_n_0_[0]\,
      I3 => \frame_cnt_reg_n_0_[2]\,
      I4 => \chstatus_reg_reg[7]\(3),
      O => \par_cnt[0]_i_13_n_0\
    );
\par_cnt[0]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEABFFFFFFFFF"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[1]\,
      I1 => \chstatus_reg_reg[7]\(4),
      I2 => \frame_cnt_reg_n_0_[0]\,
      I3 => \chstatus_reg_reg[7]\(5),
      I4 => \frame_cnt_reg_n_0_[2]\,
      I5 => \frame_cnt_reg_n_0_[3]\,
      O => \par_cnt[0]_i_14_n_0\
    );
\par_cnt[0]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \frame_cnt_reg_n_0_[5]\,
      I1 => \frame_cnt_reg_n_0_[7]\,
      I2 => \frame_cnt_reg_n_0_[6]\,
      O => \par_cnt[0]_i_15_n_0\
    );
\par_cnt[0]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => par_vector(11),
      I1 => par_vector(10),
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => par_vector(9),
      I4 => \bit_cnt_reg_n_0_[0]\,
      I5 => par_vector(8),
      O => \par_cnt[0]_i_16_n_0\
    );
\par_cnt[0]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => par_vector(15),
      I1 => par_vector(14),
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => par_vector(13),
      I4 => \bit_cnt_reg_n_0_[0]\,
      I5 => par_vector(12),
      O => \par_cnt[0]_i_17_n_0\
    );
\par_cnt[0]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => par_vector(19),
      I1 => par_vector(18),
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => par_vector(17),
      I4 => \bit_cnt_reg_n_0_[0]\,
      I5 => par_vector(16),
      O => \par_cnt[0]_i_18_n_0\
    );
\par_cnt[0]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => par_vector(23),
      I1 => par_vector(22),
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => par_vector(21),
      I4 => \bit_cnt_reg_n_0_[0]\,
      I5 => par_vector(20),
      O => \par_cnt[0]_i_19_n_0\
    );
\par_cnt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF4FF4FFFFFFFF"
    )
        port map (
      I0 => \par_cnt[0]_i_7_n_0\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[3]\,
      I3 => \bit_cnt_reg_n_0_[2]\,
      I4 => \par_cnt[0]_i_8_n_0\,
      I5 => \par_cnt[0]_i_9_n_0\,
      O => \par_cnt[0]_i_2_n_0\
    );
\par_cnt[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFEEEEEEEEE"
    )
        port map (
      I0 => \framest[1]_i_3_n_0\,
      I1 => toggle,
      I2 => \bit_cnt_reg_n_0_[2]\,
      I3 => \bit_cnt_reg_n_0_[3]\,
      I4 => \bit_cnt_reg_n_0_[4]\,
      I5 => \par_cnt[0]_i_10_n_0\,
      O => \par_cnt[0]_i_3_n_0\
    );
\par_cnt[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[4]\,
      I1 => \bit_cnt_reg_n_0_[3]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      O => \par_cnt[0]_i_4_n_0\
    );
\par_cnt[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => spdif_clk_en,
      I1 => \framest_reg_n_0_[0]\,
      I2 => \framest_reg_n_0_[1]\,
      O => spdif_out4_out
    );
\par_cnt[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Q(0),
      I1 => S_AXI_ARESETN,
      O => \par_cnt[0]_i_6_n_0\
    );
\par_cnt[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFD000D0"
    )
        port map (
      I0 => \par_cnt[0]_i_11_n_0\,
      I1 => \par_cnt[0]_i_12_n_0\,
      I2 => \par_cnt[0]_i_13_n_0\,
      I3 => \frame_cnt_reg_n_0_[4]\,
      I4 => \par_cnt[0]_i_14_n_0\,
      I5 => \par_cnt[0]_i_15_n_0\,
      O => \par_cnt[0]_i_7_n_0\
    );
\par_cnt[0]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => par_vector(24),
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      O => \par_cnt[0]_i_8_n_0\
    );
\par_cnt[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BDFDBFFF"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[4]\,
      I1 => \bit_cnt_reg_n_0_[3]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      I3 => \par_cnt[0]_i_16_n_0\,
      I4 => \par_cnt[0]_i_17_n_0\,
      O => \par_cnt[0]_i_9_n_0\
    );
\par_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \par_cnt[0]_i_1_n_0\,
      Q => par_cnt_reg(0),
      R => '0'
    );
sample_data_ack_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \FSM_sequential_bufctrl[2]_i_2_n_0\,
      D => \__14/i__n_0\,
      Q => \^sample_data_ack\,
      R => in1
    );
send_audio_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => Q(1),
      I1 => toggle,
      I2 => \framest[1]_i_3_n_0\,
      I3 => send_audio_i_2_n_0,
      I4 => spdif_clk_en,
      I5 => send_audio,
      O => send_audio_i_1_n_0
    );
send_audio_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \framest_reg_n_0_[1]\,
      I1 => \framest_reg_n_0_[0]\,
      O => send_audio_i_2_n_0
    );
send_audio_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => send_audio_i_1_n_0,
      Q => send_audio,
      R => clk_cnt1
    );
spdif_clk_en_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14000000"
    )
        port map (
      I0 => \clk_cnt1_inferred__0/i__carry__0_n_3\,
      I1 => tick_counter_d1,
      I2 => tick_counter_d2,
      I3 => S_AXI_ARESETN,
      I4 => Q(0),
      O => spdif_clk_en_i_1_n_0
    );
spdif_clk_en_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => spdif_clk_en_i_1_n_0,
      Q => spdif_clk_en,
      R => '0'
    );
spdif_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8FF0000B800"
    )
        port map (
      I0 => spdif_out_i_2_n_0,
      I1 => \par_cnt[0]_i_4_n_0\,
      I2 => spdif_out_i_3_n_0,
      I3 => spdif_clk_en,
      I4 => \bit_cnt[4]_i_3_n_0\,
      I5 => spdif_out_reg_n_0,
      O => spdif_out_i_1_n_0
    );
spdif_out_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6A995959AA99595"
    )
        port map (
      I0 => inv_preamble_reg_n_0,
      I1 => toggle,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \framest_reg_n_0_[1]\,
      I4 => \bit_cnt_reg_n_0_[1]\,
      I5 => \framest_reg_n_0_[0]\,
      O => spdif_out_i_2_n_0
    );
spdif_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55A95555AAA95555"
    )
        port map (
      I0 => spdif_out_reg_n_0,
      I1 => \par_cnt[0]_i_10_n_0\,
      I2 => \par_cnt[0]_i_4_n_0\,
      I3 => spdif_out_i_4_n_0,
      I4 => toggle,
      I5 => spdif_out_i_5_n_0,
      O => spdif_out_i_3_n_0
    );
spdif_out_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[4]\,
      I1 => \bit_cnt_reg_n_0_[3]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      O => spdif_out_i_4_n_0
    );
spdif_out_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A00CAF0C"
    )
        port map (
      I0 => par_cnt_reg(0),
      I1 => par_vector(24),
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \bit_cnt_reg_n_0_[1]\,
      I4 => \par_cnt[0]_i_7_n_0\,
      O => spdif_out_i_5_n_0
    );
spdif_out_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => spdif_out_i_1_n_0,
      Q => spdif_out_reg_n_0,
      R => clk_cnt1
    );
spdif_tx_o_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => spdif_out_reg_n_0,
      I1 => S_AXI_ARESETN,
      O => spdif_tx_o_i_1_n_0
    );
spdif_tx_o_reg: unisim.vcomponents.FDRE
     port map (
      C => spdif_data_clk,
      CE => '1',
      D => spdif_tx_o_i_1_n_0,
      Q => spdif_tx_o,
      R => '0'
    );
tick_counter_d1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => S_AXI_ARESETN,
      I1 => Q(0),
      O => clk_cnt1
    );
tick_counter_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => tick_counter,
      Q => tick_counter_d1,
      R => clk_cnt1
    );
tick_counter_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => tick_counter_d1,
      Q => tick_counter_d2,
      R => clk_cnt1
    );
tick_counter_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tick_counter,
      O => tick_counter_i_1_n_0
    );
tick_counter_reg: unisim.vcomponents.FDRE
     port map (
      C => spdif_data_clk,
      CE => '1',
      D => tick_counter_i_1_n_0,
      Q => tick_counter,
      R => '0'
    );
toggle_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FE0"
    )
        port map (
      I0 => \framest_reg_n_0_[0]\,
      I1 => \framest_reg_n_0_[1]\,
      I2 => spdif_clk_en,
      I3 => toggle,
      O => toggle_i_1_n_0
    );
toggle_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => toggle_i_1_n_0,
      Q => toggle,
      R => clk_cnt1
    );
valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF40000000"
    )
        port map (
      I0 => Q(1),
      I1 => toggle,
      I2 => \framest[1]_i_3_n_0\,
      I3 => send_audio_i_2_n_0,
      I4 => spdif_clk_en,
      I5 => par_vector(24),
      O => valid_i_1_n_0
    );
valid_reg: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => valid_i_1_n_0,
      Q => par_vector(24),
      S => clk_cnt1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_spdif_tx_core_0_pl330_dma_fifo is
  port (
    \wr_addr_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    in1 : out STD_LOGIC;
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    DMA_REQ_DRVALID : out STD_LOGIC;
    DMA_REQ_DRTYPE : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    \wr_addr_reg[0]\ : in STD_LOGIC;
    wr_addr0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_ARESETN : in STD_LOGIC;
    empty_reg : in STD_LOGIC;
    sample_data_ack : in STD_LOGIC;
    channel : in STD_LOGIC;
    DMA_REQ_DATYPE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DMA_REQ_DAVALID : in STD_LOGIC;
    DMA_REQ_DRREADY : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DMA_REQ_RSTN : in STD_LOGIC;
    DMA_REQ_ACLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_spdif_tx_core_0_pl330_dma_fifo : entity is "pl330_dma_fifo";
end system_axi_spdif_tx_core_0_pl330_dma_fifo;

architecture STRUCTURE of system_axi_spdif_tx_core_0_pl330_dma_fifo is
  signal \^dma_req_drvalid\ : STD_LOGIC;
  signal fifo_n_4 : STD_LOGIC;
  signal state0 : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[0]_i_2_n_0\ : STD_LOGIC;
  signal \state[0]_i_3_n_0\ : STD_LOGIC;
  signal \state[0]_i_5_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_3_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DMA_REQ_DRTYPE[1]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \state[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \state[0]_i_5\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \state[1]_i_2\ : label is "soft_lutpair26";
begin
  DMA_REQ_DRVALID <= \^dma_req_drvalid\;
\DMA_REQ_DRTYPE[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \^dma_req_drvalid\,
      O => DMA_REQ_DRTYPE(0)
    );
fifo: entity work.system_axi_spdif_tx_core_0_dma_fifo
     port map (
      D(15 downto 0) => D(15 downto 0),
      DMA_REQ_DRREADY => DMA_REQ_DRREADY,
      Q(0) => \wr_addr_reg[1]\(0),
      SR(0) => in1,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      channel => channel,
      \config_reg_reg[1]\(0) => Q(0),
      empty_reg_0 => empty_reg,
      \free_cnt_reg[0]_0\ => empty,
      full => full,
      p_0_in => p_0_in,
      sample_data_ack => sample_data_ack,
      \state_reg[0]\ => \^dma_req_drvalid\,
      \state_reg[1]\ => fifo_n_4,
      \state_reg[1]_0\ => \state_reg_n_0_[1]\,
      wr_addr0 => wr_addr0,
      \wr_addr_reg[0]_0\ => \wr_addr_reg[0]\
    );
\state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \^dma_req_drvalid\,
      I1 => \state[0]_i_2_n_0\,
      I2 => \state[0]_i_3_n_0\,
      I3 => DMA_REQ_RSTN,
      O => \state[0]_i_1_n_0\
    );
\state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAAEAEAEAAAE"
    )
        port map (
      I0 => fifo_n_4,
      I1 => \state_reg_n_0_[1]\,
      I2 => \^dma_req_drvalid\,
      I3 => Q(0),
      I4 => \state[0]_i_5_n_0\,
      I5 => DMA_REQ_DATYPE(1),
      O => \state[0]_i_2_n_0\
    );
\state[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4545FF0545450505"
    )
        port map (
      I0 => \^dma_req_drvalid\,
      I1 => Q(0),
      I2 => \state_reg_n_0_[1]\,
      I3 => DMA_REQ_DAVALID,
      I4 => DMA_REQ_DATYPE(0),
      I5 => DMA_REQ_DATYPE(1),
      O => \state[0]_i_3_n_0\
    );
\state[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DMA_REQ_DAVALID,
      I1 => DMA_REQ_DATYPE(0),
      O => \state[0]_i_5_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E6E6EAE200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[0]_i_2_n_0\,
      I2 => state0,
      I3 => \state[1]_i_3_n_0\,
      I4 => \^dma_req_drvalid\,
      I5 => DMA_REQ_RSTN,
      O => \state[1]_i_1_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => DMA_REQ_DATYPE(1),
      I1 => DMA_REQ_DATYPE(0),
      I2 => DMA_REQ_DAVALID,
      O => state0
    );
\state[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Q(0),
      I1 => DMA_REQ_DATYPE(1),
      O => \state[1]_i_3_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => DMA_REQ_ACLK,
      CE => '1',
      D => \state[0]_i_1_n_0\,
      Q => \^dma_req_drvalid\,
      R => '0'
    );
\state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => DMA_REQ_ACLK,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      Q => \state_reg_n_0_[1]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_spdif_tx_core_0_axi_spdif_tx is
  port (
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
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_TREADY : out STD_LOGIC;
    S_AXIS_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_TLAST : in STD_LOGIC;
    S_AXIS_TVALID : in STD_LOGIC;
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
  attribute C_DMA_TYPE : integer;
  attribute C_DMA_TYPE of system_axi_spdif_tx_core_0_axi_spdif_tx : entity is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of system_axi_spdif_tx_core_0_axi_spdif_tx : entity is "zynq";
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of system_axi_spdif_tx_core_0_axi_spdif_tx : entity is 16;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of system_axi_spdif_tx_core_0_axi_spdif_tx : entity is 32;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_axi_spdif_tx_core_0_axi_spdif_tx : entity is "axi_spdif_tx";
end system_axi_spdif_tx_core_0_axi_spdif_tx;

architecture STRUCTURE of system_axi_spdif_tx_core_0_axi_spdif_tx is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^dma_req_drtype\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_wready\ : STD_LOGIC;
  signal TENC_n_3 : STD_LOGIC;
  signal channel : STD_LOGIC;
  signal chstat_copy : STD_LOGIC;
  signal chstat_freq : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal chstat_gstat : STD_LOGIC;
  signal chstat_preem : STD_LOGIC;
  signal chstatus_reg : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[10]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[11]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[12]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[13]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[14]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[15]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[16]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[17]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[18]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[19]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[20]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[21]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[22]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[23]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[24]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[25]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[26]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[27]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[28]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[29]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[30]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[31]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal \chstatus_reg_reg_n_0_[9]\ : STD_LOGIC;
  signal conf_ratio : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal conf_txdata : STD_LOGIC;
  signal config_reg : STD_LOGIC;
  signal \config_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[16]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[17]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[18]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[19]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[20]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[21]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[22]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[23]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[24]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[25]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[26]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[27]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[28]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[29]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[30]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[31]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \config_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal ctrlif_n_3 : STD_LOGIC;
  signal empty : STD_LOGIC;
  signal \fifo/wr_addr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \fifo/wr_addr0\ : STD_LOGIC;
  signal full : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 23 downto 8 );
  signal \pl330_dma_gen.fifo_n_1\ : STD_LOGIC;
  signal sample_data_ack : STD_LOGIC;
begin
  DMA_REQ_DAREADY <= \<const1>\;
  DMA_REQ_DRLAST <= \<const0>\;
  DMA_REQ_DRTYPE(1) <= \^dma_req_drtype\(1);
  DMA_REQ_DRTYPE(0) <= \<const0>\;
  S_AXIS_TREADY <= \<const0>\;
  S_AXI_AWREADY <= \^s_axi_wready\;
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
  S_AXI_WREADY <= \^s_axi_wready\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
TENC: entity work.system_axi_spdif_tx_core_0_tx_encoder
     port map (
      D(15 downto 0) => p_1_in(23 downto 8),
      Q(9 downto 2) => conf_ratio(7 downto 0),
      Q(1) => conf_txdata,
      Q(0) => \config_reg_reg_n_0_[0]\,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      channel => channel,
      \chstatus_reg_reg[7]\(5 downto 4) => chstat_freq(1 downto 0),
      \chstatus_reg_reg[7]\(3) => chstat_gstat,
      \chstatus_reg_reg[7]\(2) => chstat_preem,
      \chstatus_reg_reg[7]\(1) => chstat_copy,
      \chstatus_reg_reg[7]\(0) => \chstatus_reg_reg_n_0_[0]\,
      empty => empty,
      \free_cnt_reg[3]\ => TENC_n_3,
      in1 => \pl330_dma_gen.fifo_n_1\,
      sample_data_ack => sample_data_ack,
      spdif_data_clk => spdif_data_clk,
      spdif_tx_o => spdif_tx_o
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
\chstatus_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(0),
      Q => \chstatus_reg_reg_n_0_[0]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(10),
      Q => \chstatus_reg_reg_n_0_[10]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(11),
      Q => \chstatus_reg_reg_n_0_[11]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(12),
      Q => \chstatus_reg_reg_n_0_[12]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(13),
      Q => \chstatus_reg_reg_n_0_[13]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(14),
      Q => \chstatus_reg_reg_n_0_[14]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(15),
      Q => \chstatus_reg_reg_n_0_[15]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(16),
      Q => \chstatus_reg_reg_n_0_[16]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(17),
      Q => \chstatus_reg_reg_n_0_[17]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(18),
      Q => \chstatus_reg_reg_n_0_[18]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(19),
      Q => \chstatus_reg_reg_n_0_[19]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(1),
      Q => chstat_copy,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(20),
      Q => \chstatus_reg_reg_n_0_[20]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(21),
      Q => \chstatus_reg_reg_n_0_[21]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(22),
      Q => \chstatus_reg_reg_n_0_[22]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(23),
      Q => \chstatus_reg_reg_n_0_[23]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(24),
      Q => \chstatus_reg_reg_n_0_[24]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(25),
      Q => \chstatus_reg_reg_n_0_[25]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(26),
      Q => \chstatus_reg_reg_n_0_[26]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(27),
      Q => \chstatus_reg_reg_n_0_[27]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(28),
      Q => \chstatus_reg_reg_n_0_[28]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(29),
      Q => \chstatus_reg_reg_n_0_[29]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(2),
      Q => chstat_preem,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(30),
      Q => \chstatus_reg_reg_n_0_[30]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(31),
      Q => \chstatus_reg_reg_n_0_[31]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(3),
      Q => chstat_gstat,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(4),
      Q => \chstatus_reg_reg_n_0_[4]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(5),
      Q => \chstatus_reg_reg_n_0_[5]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(6),
      Q => chstat_freq(0),
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(7),
      Q => chstat_freq(1),
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(8),
      Q => \chstatus_reg_reg_n_0_[8]\,
      R => \config_reg[31]_i_1_n_0\
    );
\chstatus_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => chstatus_reg,
      D => S_AXI_WDATA(9),
      Q => \chstatus_reg_reg_n_0_[9]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(0),
      Q => \config_reg_reg_n_0_[0]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(10),
      Q => conf_ratio(2),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(11),
      Q => conf_ratio(3),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(12),
      Q => conf_ratio(4),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(13),
      Q => conf_ratio(5),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(14),
      Q => conf_ratio(6),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(15),
      Q => conf_ratio(7),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(16),
      Q => \config_reg_reg_n_0_[16]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(17),
      Q => \config_reg_reg_n_0_[17]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(18),
      Q => \config_reg_reg_n_0_[18]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(19),
      Q => \config_reg_reg_n_0_[19]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(1),
      Q => conf_txdata,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(20),
      Q => \config_reg_reg_n_0_[20]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(21),
      Q => \config_reg_reg_n_0_[21]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(22),
      Q => \config_reg_reg_n_0_[22]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(23),
      Q => \config_reg_reg_n_0_[23]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(24),
      Q => \config_reg_reg_n_0_[24]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(25),
      Q => \config_reg_reg_n_0_[25]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(26),
      Q => \config_reg_reg_n_0_[26]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(27),
      Q => \config_reg_reg_n_0_[27]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(28),
      Q => \config_reg_reg_n_0_[28]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(29),
      Q => \config_reg_reg_n_0_[29]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(2),
      Q => \config_reg_reg_n_0_[2]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(30),
      Q => \config_reg_reg_n_0_[30]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(31),
      Q => \config_reg_reg_n_0_[31]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(3),
      Q => \config_reg_reg_n_0_[3]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(4),
      Q => \config_reg_reg_n_0_[4]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(5),
      Q => \config_reg_reg_n_0_[5]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(6),
      Q => \config_reg_reg_n_0_[6]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(7),
      Q => \config_reg_reg_n_0_[7]\,
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(8),
      Q => conf_ratio(0),
      R => \config_reg[31]_i_1_n_0\
    );
\config_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => config_reg,
      D => S_AXI_WDATA(9),
      Q => conf_ratio(1),
      R => \config_reg[31]_i_1_n_0\
    );
ctrlif: entity work.system_axi_spdif_tx_core_0_axi_ctrlif
     port map (
      E(0) => chstatus_reg,
      Q(31) => \config_reg_reg_n_0_[31]\,
      Q(30) => \config_reg_reg_n_0_[30]\,
      Q(29) => \config_reg_reg_n_0_[29]\,
      Q(28) => \config_reg_reg_n_0_[28]\,
      Q(27) => \config_reg_reg_n_0_[27]\,
      Q(26) => \config_reg_reg_n_0_[26]\,
      Q(25) => \config_reg_reg_n_0_[25]\,
      Q(24) => \config_reg_reg_n_0_[24]\,
      Q(23) => \config_reg_reg_n_0_[23]\,
      Q(22) => \config_reg_reg_n_0_[22]\,
      Q(21) => \config_reg_reg_n_0_[21]\,
      Q(20) => \config_reg_reg_n_0_[20]\,
      Q(19) => \config_reg_reg_n_0_[19]\,
      Q(18) => \config_reg_reg_n_0_[18]\,
      Q(17) => \config_reg_reg_n_0_[17]\,
      Q(16) => \config_reg_reg_n_0_[16]\,
      Q(15 downto 8) => conf_ratio(7 downto 0),
      Q(7) => \config_reg_reg_n_0_[7]\,
      Q(6) => \config_reg_reg_n_0_[6]\,
      Q(5) => \config_reg_reg_n_0_[5]\,
      Q(4) => \config_reg_reg_n_0_[4]\,
      Q(3) => \config_reg_reg_n_0_[3]\,
      Q(2) => \config_reg_reg_n_0_[2]\,
      Q(1) => conf_txdata,
      Q(0) => \config_reg_reg_n_0_[0]\,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(1 downto 0) => S_AXI_ARADDR(3 downto 2),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWADDR(1 downto 0) => S_AXI_AWADDR(3 downto 2),
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BVALID(1) => S_AXI_BVALID,
      S_AXI_BVALID(0) => \^s_axi_wready\,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_WVALID => S_AXI_WVALID,
      \chstatus_reg_reg[31]\(31) => \chstatus_reg_reg_n_0_[31]\,
      \chstatus_reg_reg[31]\(30) => \chstatus_reg_reg_n_0_[30]\,
      \chstatus_reg_reg[31]\(29) => \chstatus_reg_reg_n_0_[29]\,
      \chstatus_reg_reg[31]\(28) => \chstatus_reg_reg_n_0_[28]\,
      \chstatus_reg_reg[31]\(27) => \chstatus_reg_reg_n_0_[27]\,
      \chstatus_reg_reg[31]\(26) => \chstatus_reg_reg_n_0_[26]\,
      \chstatus_reg_reg[31]\(25) => \chstatus_reg_reg_n_0_[25]\,
      \chstatus_reg_reg[31]\(24) => \chstatus_reg_reg_n_0_[24]\,
      \chstatus_reg_reg[31]\(23) => \chstatus_reg_reg_n_0_[23]\,
      \chstatus_reg_reg[31]\(22) => \chstatus_reg_reg_n_0_[22]\,
      \chstatus_reg_reg[31]\(21) => \chstatus_reg_reg_n_0_[21]\,
      \chstatus_reg_reg[31]\(20) => \chstatus_reg_reg_n_0_[20]\,
      \chstatus_reg_reg[31]\(19) => \chstatus_reg_reg_n_0_[19]\,
      \chstatus_reg_reg[31]\(18) => \chstatus_reg_reg_n_0_[18]\,
      \chstatus_reg_reg[31]\(17) => \chstatus_reg_reg_n_0_[17]\,
      \chstatus_reg_reg[31]\(16) => \chstatus_reg_reg_n_0_[16]\,
      \chstatus_reg_reg[31]\(15) => \chstatus_reg_reg_n_0_[15]\,
      \chstatus_reg_reg[31]\(14) => \chstatus_reg_reg_n_0_[14]\,
      \chstatus_reg_reg[31]\(13) => \chstatus_reg_reg_n_0_[13]\,
      \chstatus_reg_reg[31]\(12) => \chstatus_reg_reg_n_0_[12]\,
      \chstatus_reg_reg[31]\(11) => \chstatus_reg_reg_n_0_[11]\,
      \chstatus_reg_reg[31]\(10) => \chstatus_reg_reg_n_0_[10]\,
      \chstatus_reg_reg[31]\(9) => \chstatus_reg_reg_n_0_[9]\,
      \chstatus_reg_reg[31]\(8) => \chstatus_reg_reg_n_0_[8]\,
      \chstatus_reg_reg[31]\(7 downto 6) => chstat_freq(1 downto 0),
      \chstatus_reg_reg[31]\(5) => \chstatus_reg_reg_n_0_[5]\,
      \chstatus_reg_reg[31]\(4) => \chstatus_reg_reg_n_0_[4]\,
      \chstatus_reg_reg[31]\(3) => chstat_gstat,
      \chstatus_reg_reg[31]\(2) => chstat_preem,
      \chstatus_reg_reg[31]\(1) => chstat_copy,
      \chstatus_reg_reg[31]\(0) => \chstatus_reg_reg_n_0_[0]\,
      \config_reg_reg[0]\(0) => config_reg,
      full => full,
      \out\ => S_AXI_RVALID,
      p_0_in => p_0_in,
      wr_addr(0) => \fifo/wr_addr\(0),
      wr_addr0 => \fifo/wr_addr0\,
      \wr_addr_reg[0]\ => ctrlif_n_3
    );
\pl330_dma_gen.fifo\: entity work.system_axi_spdif_tx_core_0_pl330_dma_fifo
     port map (
      D(15 downto 0) => p_1_in(23 downto 8),
      DMA_REQ_ACLK => DMA_REQ_ACLK,
      DMA_REQ_DATYPE(1 downto 0) => DMA_REQ_DATYPE(1 downto 0),
      DMA_REQ_DAVALID => DMA_REQ_DAVALID,
      DMA_REQ_DRREADY => DMA_REQ_DRREADY,
      DMA_REQ_DRTYPE(0) => \^dma_req_drtype\(1),
      DMA_REQ_DRVALID => DMA_REQ_DRVALID,
      DMA_REQ_RSTN => DMA_REQ_RSTN,
      Q(0) => conf_txdata,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      channel => channel,
      empty => empty,
      empty_reg => TENC_n_3,
      full => full,
      in1 => \pl330_dma_gen.fifo_n_1\,
      p_0_in => p_0_in,
      sample_data_ack => sample_data_ack,
      wr_addr0 => \fifo/wr_addr0\,
      \wr_addr_reg[0]\ => ctrlif_n_3,
      \wr_addr_reg[1]\(0) => \fifo/wr_addr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_axi_spdif_tx_core_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_axi_spdif_tx_core_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_axi_spdif_tx_core_0 : entity is "system_axi_spdif_tx_core_0,axi_spdif_tx,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_axi_spdif_tx_core_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_axi_spdif_tx_core_0 : entity is "axi_spdif_tx,Vivado 2018.1";
end system_axi_spdif_tx_core_0;

architecture STRUCTURE of system_axi_spdif_tx_core_0 is
  signal NLW_inst_S_AXIS_TREADY_UNCONNECTED : STD_LOGIC;
  attribute C_DMA_TYPE : integer;
  attribute C_DMA_TYPE of inst : label is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynq";
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of inst : label is 16;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of DMA_REQ_ACLK : signal is "xilinx.com:signal:clock:1.0 DMA_REQ_ACLK CLK, xilinx.com:signal:clock:1.0 DMA_REQ_DMA_ACK_signal_clock CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of DMA_REQ_ACLK : signal is "XIL_INTERFACENAME DMA_REQ_ACLK, FREQ_HZ 100000000, PHASE 0.000, ASSOCIATED_BUSIF DMA_REQ:DMA_ACK, ASSOCIATED_RESET DMA_REQ_RSTN, XIL_INTERFACENAME DMA_REQ_DMA_ACK_signal_clock, ASSOCIATED_BUSIF DMA_REQ:DMA_ACK, ASSOCIATED_RESET DMA_REQ_RSTN, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of DMA_REQ_DAREADY : signal is "xilinx.com:interface:axis:1.0 DMA_ACK TREADY";
  attribute X_INTERFACE_PARAMETER of DMA_REQ_DAREADY : signal is "XIL_INTERFACENAME DMA_ACK, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 2, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of DMA_REQ_DAVALID : signal is "xilinx.com:interface:axis:1.0 DMA_ACK TVALID";
  attribute X_INTERFACE_INFO of DMA_REQ_DRLAST : signal is "xilinx.com:interface:axis:1.0 DMA_REQ TLAST";
  attribute X_INTERFACE_INFO of DMA_REQ_DRREADY : signal is "xilinx.com:interface:axis:1.0 DMA_REQ TREADY";
  attribute X_INTERFACE_PARAMETER of DMA_REQ_DRREADY : signal is "XIL_INTERFACENAME DMA_REQ, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 2, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of DMA_REQ_DRVALID : signal is "xilinx.com:interface:axis:1.0 DMA_REQ TVALID";
  attribute X_INTERFACE_INFO of DMA_REQ_RSTN : signal is "xilinx.com:signal:reset:1.0 DMA_REQ_DMA_ACK_signal_reset RST";
  attribute X_INTERFACE_PARAMETER of DMA_REQ_RSTN : signal is "XIL_INTERFACENAME DMA_REQ_DMA_ACK_signal_reset, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of S_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute X_INTERFACE_PARAMETER of S_AXI_ACLK : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXIS_ARESETN, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of S_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of S_AXI_ARESETN : signal is "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of S_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_PARAMETER of S_AXI_AWREADY : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of S_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of S_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of S_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_INFO of S_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of S_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of S_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of spdif_data_clk : signal is "xilinx.com:signal:clock:1.0 spdif_data_clk CLK";
  attribute X_INTERFACE_PARAMETER of spdif_data_clk : signal is "XIL_INTERFACENAME spdif_data_clk, FREQ_HZ 12287988, PHASE 0.0, CLK_DOMAIN /sys_audio_clkgen_clk_out1";
  attribute X_INTERFACE_INFO of DMA_REQ_DATYPE : signal is "xilinx.com:interface:axis:1.0 DMA_ACK TUSER";
  attribute X_INTERFACE_INFO of DMA_REQ_DRTYPE : signal is "xilinx.com:interface:axis:1.0 DMA_REQ TUSER";
  attribute X_INTERFACE_INFO of S_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of S_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_INFO of S_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of S_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of S_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of S_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of S_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
inst: entity work.system_axi_spdif_tx_core_0_axi_spdif_tx
     port map (
      DMA_REQ_ACLK => DMA_REQ_ACLK,
      DMA_REQ_DAREADY => DMA_REQ_DAREADY,
      DMA_REQ_DATYPE(1 downto 0) => DMA_REQ_DATYPE(1 downto 0),
      DMA_REQ_DAVALID => DMA_REQ_DAVALID,
      DMA_REQ_DRLAST => DMA_REQ_DRLAST,
      DMA_REQ_DRREADY => DMA_REQ_DRREADY,
      DMA_REQ_DRTYPE(1 downto 0) => DMA_REQ_DRTYPE(1 downto 0),
      DMA_REQ_DRVALID => DMA_REQ_DRVALID,
      DMA_REQ_RSTN => DMA_REQ_RSTN,
      S_AXIS_ACLK => '0',
      S_AXIS_ARESETN => '0',
      S_AXIS_TDATA(31 downto 0) => B"00000000000000000000000000000000",
      S_AXIS_TLAST => '0',
      S_AXIS_TREADY => NLW_inst_S_AXIS_TREADY_UNCONNECTED,
      S_AXIS_TVALID => '0',
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(15 downto 0) => S_AXI_ARADDR(15 downto 0),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWADDR(15 downto 0) => S_AXI_AWADDR(15 downto 0),
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => S_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => S_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => S_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => S_AXI_WVALID,
      spdif_data_clk => spdif_data_clk,
      spdif_tx_o => spdif_tx_o
    );
end STRUCTURE;
