-------------------------------------------------------------------------------
-- xps_timebase_wdt_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library xps_timebase_wdt_v1_01_a;
use xps_timebase_wdt_v1_01_a.all;

entity xps_timebase_wdt_0_wrapper is
  port (
    WDT_Reset : out std_logic;
    Timebase_Interrupt : out std_logic;
    WDT_Interrupt : out std_logic;
    SPLB_Clk : in std_logic;
    SPLB_Rst : in std_logic;
    PLB_ABus : in std_logic_vector(0 to 31);
    PLB_PAValid : in std_logic;
    PLB_masterID : in std_logic_vector(0 to 0);
    PLB_RNW : in std_logic;
    PLB_BE : in std_logic_vector(0 to 7);
    PLB_size : in std_logic_vector(0 to 3);
    PLB_type : in std_logic_vector(0 to 2);
    PLB_wrDBus : in std_logic_vector(0 to 63);
    Sl_addrAck : out std_logic;
    Sl_SSize : out std_logic_vector(0 to 1);
    Sl_wait : out std_logic;
    Sl_rearbitrate : out std_logic;
    Sl_wrDAck : out std_logic;
    Sl_wrComp : out std_logic;
    Sl_rdDBus : out std_logic_vector(0 to 63);
    Sl_rdDAck : out std_logic;
    Sl_rdComp : out std_logic;
    Sl_MBusy : out std_logic_vector(0 to 1);
    Sl_MWrErr : out std_logic_vector(0 to 1);
    Sl_MRdErr : out std_logic_vector(0 to 1);
    PLB_UABus : in std_logic_vector(0 to 31);
    PLB_SAValid : in std_logic;
    PLB_rdPrim : in std_logic;
    PLB_wrPrim : in std_logic;
    PLB_abort : in std_logic;
    PLB_busLock : in std_logic;
    PLB_MSize : in std_logic_vector(0 to 1);
    PLB_lockErr : in std_logic;
    PLB_wrBurst : in std_logic;
    PLB_rdBurst : in std_logic;
    PLB_wrPendReq : in std_logic;
    PLB_rdPendReq : in std_logic;
    PLB_wrPendPri : in std_logic_vector(0 to 1);
    PLB_rdPendPri : in std_logic_vector(0 to 1);
    PLB_reqPri : in std_logic_vector(0 to 1);
    PLB_TAttribute : in std_logic_vector(0 to 15);
    Sl_wrBTerm : out std_logic;
    Sl_rdWdAddr : out std_logic_vector(0 to 3);
    Sl_rdBTerm : out std_logic;
    Sl_MIRQ : out std_logic_vector(0 to 1)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of xps_timebase_wdt_0_wrapper : entity is "xps_timebase_wdt_v1_01_a";

end xps_timebase_wdt_0_wrapper;

architecture STRUCTURE of xps_timebase_wdt_0_wrapper is

  component xps_timebase_wdt is
    generic (
      C_WDT_INTERVAL : INTEGER;
      C_WDT_ENABLE_ONCE : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_FAMILY : STRING;
      C_SPLB_AWIDTH : INTEGER;
      C_SPLB_DWIDTH : INTEGER;
      C_SPLB_P2P : INTEGER;
      C_SPLB_MID_WIDTH : INTEGER;
      C_SPLB_NUM_MASTERS : INTEGER;
      C_SPLB_SUPPORT_BURSTS : INTEGER;
      C_SPLB_NATIVE_DWIDTH : INTEGER
    );
    port (
      WDT_Reset : out std_logic;
      Timebase_Interrupt : out std_logic;
      WDT_Interrupt : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to (C_SPLB_MID_WIDTH-1));
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to ((C_SPLB_DWIDTH/8)-1));
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to (C_SPLB_DWIDTH-1));
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to (C_SPLB_DWIDTH-1));
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MWrErr : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MRdErr : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1))
    );
  end component;

begin

  xps_timebase_wdt_0 : xps_timebase_wdt
    generic map (
      C_WDT_INTERVAL => 30,
      C_WDT_ENABLE_ONCE => 0,
      C_BASEADDR => X"83a00000",
      C_HIGHADDR => X"83a0ffff",
      C_FAMILY => "spartan3adsp",
      C_SPLB_AWIDTH => 32,
      C_SPLB_DWIDTH => 64,
      C_SPLB_P2P => 0,
      C_SPLB_MID_WIDTH => 1,
      C_SPLB_NUM_MASTERS => 2,
      C_SPLB_SUPPORT_BURSTS => 0,
      C_SPLB_NATIVE_DWIDTH => 32
    )
    port map (
      WDT_Reset => WDT_Reset,
      Timebase_Interrupt => Timebase_Interrupt,
      WDT_Interrupt => WDT_Interrupt,
      SPLB_Clk => SPLB_Clk,
      SPLB_Rst => SPLB_Rst,
      PLB_ABus => PLB_ABus,
      PLB_PAValid => PLB_PAValid,
      PLB_masterID => PLB_masterID,
      PLB_RNW => PLB_RNW,
      PLB_BE => PLB_BE,
      PLB_size => PLB_size,
      PLB_type => PLB_type,
      PLB_wrDBus => PLB_wrDBus,
      Sl_addrAck => Sl_addrAck,
      Sl_SSize => Sl_SSize,
      Sl_wait => Sl_wait,
      Sl_rearbitrate => Sl_rearbitrate,
      Sl_wrDAck => Sl_wrDAck,
      Sl_wrComp => Sl_wrComp,
      Sl_rdDBus => Sl_rdDBus,
      Sl_rdDAck => Sl_rdDAck,
      Sl_rdComp => Sl_rdComp,
      Sl_MBusy => Sl_MBusy,
      Sl_MWrErr => Sl_MWrErr,
      Sl_MRdErr => Sl_MRdErr,
      PLB_UABus => PLB_UABus,
      PLB_SAValid => PLB_SAValid,
      PLB_rdPrim => PLB_rdPrim,
      PLB_wrPrim => PLB_wrPrim,
      PLB_abort => PLB_abort,
      PLB_busLock => PLB_busLock,
      PLB_MSize => PLB_MSize,
      PLB_lockErr => PLB_lockErr,
      PLB_wrBurst => PLB_wrBurst,
      PLB_rdBurst => PLB_rdBurst,
      PLB_wrPendReq => PLB_wrPendReq,
      PLB_rdPendReq => PLB_rdPendReq,
      PLB_wrPendPri => PLB_wrPendPri,
      PLB_rdPendPri => PLB_rdPendPri,
      PLB_reqPri => PLB_reqPri,
      PLB_TAttribute => PLB_TAttribute,
      Sl_wrBTerm => Sl_wrBTerm,
      Sl_rdWdAddr => Sl_rdWdAddr,
      Sl_rdBTerm => Sl_rdBTerm,
      Sl_MIRQ => Sl_MIRQ
    );

end architecture STRUCTURE;
