// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module xadc_wiz_0 (
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tdata,
  m_axis_tid,
  m_axis_aclk,
  s_axis_aclk,
  m_axis_resetn,
  vp_in,
  vn_in,
  channel_out,
  eoc_out,
  alarm_out,
  eos_out,
  busy_out
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  (* X_INTERFACE_MODE = "master M_AXIS" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 5, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN , LAYERED_METADATA undef, INSERT_VIP 0" *)
  output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *)
  output [15:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TID" *)
  output [4:0]m_axis_tid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_aclk CLK" *)
  (* X_INTERFACE_MODE = "slave m_axis_aclk" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_aclk, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET m_axis_resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN , ASSOCIATED_PORT , INSERT_VIP 0" *)
  input m_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_aclk CLK" *)
  (* X_INTERFACE_MODE = "slave s_axis_aclk" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_aclk, ASSOCIATED_BUSIF s_axis_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN , ASSOCIATED_PORT , ASSOCIATED_RESET , INSERT_VIP 0" *)
  input s_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axis_resetn RST" *)
  (* X_INTERFACE_MODE = "slave m_axis_resetn" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input m_axis_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 Vp_Vn V_P" *)
  (* X_INTERFACE_MODE = "slave Vp_Vn" *)
  input vp_in;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 Vp_Vn V_N" *)
  input vn_in;
  (* X_INTERFACE_IGNORE = "true" *)
  output [4:0]channel_out;
  (* X_INTERFACE_IGNORE = "true" *)
  output eoc_out;
  (* X_INTERFACE_IGNORE = "true" *)
  output alarm_out;
  (* X_INTERFACE_IGNORE = "true" *)
  output eos_out;
  (* X_INTERFACE_IGNORE = "true" *)
  output busy_out;

  // stub module has no contents

endmodule
