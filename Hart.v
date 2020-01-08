module Fetch(
  input         clock,
  input         reset,
  input         io_in_branch_mispredicted,
  input         io_in_branch_graduated,
  input  [15:0] io_in_restoration_pc,
  input         io_in_is_branch,
  input         io_in_is_jump,
  input  [15:0] io_in_jump_pc,
  input  [15:0] io_in_alu_out,
  input         io_in_stall,
  input  [15:0] io_in_prev_pc,
  output [15:0] io_out_pc
);
  wire  _T; // @[Fetch.scala 34:32]
  wire  _T_2; // @[Mux.scala 87:16]
  wire [15:0] _T_3; // @[Mux.scala 87:16]
  wire [15:0] _T_5; // @[Fetch.scala 41:33]
  wire [15:0] _GEN_1; // @[Fetch.scala 36:30]
  wire  _T_6; // @[Fetch.scala 45:9]
  wire  _T_7; // @[Fetch.scala 45:9]
  assign _T = io_in_branch_graduated & io_in_branch_mispredicted; // @[Fetch.scala 34:32]
  assign _T_2 = io_in_stall ? 1'h0 : 1'h1; // @[Mux.scala 87:16]
  assign _T_3 = io_in_is_branch ? io_in_alu_out : {{15'd0}, _T_2}; // @[Mux.scala 87:16]
  assign _T_5 = io_in_prev_pc + _T_3; // @[Fetch.scala 41:33]
  assign _GEN_1 = io_in_is_jump ? io_in_jump_pc : _T_5; // @[Fetch.scala 36:30]
  assign _T_6 = $unsigned(reset); // @[Fetch.scala 45:9]
  assign _T_7 = _T_6 == 1'h0; // @[Fetch.scala 45:9]
  assign io_out_pc = _T ? io_in_restoration_pc : _GEN_1; // @[Fetch.scala 35:15 Fetch.scala 37:15 Fetch.scala 39:15 Fetch.scala 41:15]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"pc: %d, next_pc: %d, branch_mispredicted_enable: %d, branch_mispredicted: %d, restore_pc: %d\n",io_in_prev_pc,io_out_pc,io_in_branch_graduated,io_in_branch_mispredicted,io_in_restoration_pc); // @[Fetch.scala 45:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module IF(
  input         clock,
  input         reset,
  input         io_in_branch_mispredicted,
  input         io_in_branch_mispredicted_enable,
  input  [15:0] io_in_restoration_pc,
  input         io_in_is_branch,
  input         io_in_is_jump,
  input  [15:0] io_in_jump_pc,
  input  [15:0] io_in_alu_out,
  input         io_in_stall,
  output [15:0] io_out_pc,
  output [15:0] io_out_total_cnt,
  output [3:0]  io_out_inst_bits_op,
  output [2:0]  io_out_inst_bits_rd,
  output [2:0]  io_out_inst_bits_rs,
  output [5:0]  io_out_inst_bits_disp6u
);
  wire  fetch_clock; // @[IF.scala 39:28]
  wire  fetch_reset; // @[IF.scala 39:28]
  wire  fetch_io_in_branch_mispredicted; // @[IF.scala 39:28]
  wire  fetch_io_in_branch_graduated; // @[IF.scala 39:28]
  wire [15:0] fetch_io_in_restoration_pc; // @[IF.scala 39:28]
  wire  fetch_io_in_is_branch; // @[IF.scala 39:28]
  wire  fetch_io_in_is_jump; // @[IF.scala 39:28]
  wire [15:0] fetch_io_in_jump_pc; // @[IF.scala 39:28]
  wire [15:0] fetch_io_in_alu_out; // @[IF.scala 39:28]
  wire  fetch_io_in_stall; // @[IF.scala 39:28]
  wire [15:0] fetch_io_in_prev_pc; // @[IF.scala 39:28]
  wire [15:0] fetch_io_out_pc; // @[IF.scala 39:28]
  reg [15:0] pc; // @[IF.scala 35:25]
  reg [31:0] _RAND_0;
  reg [15:0] total_cnt; // @[IF.scala 36:32]
  reg [31:0] _RAND_1;
  wire [15:0] _T_2; // @[IF.scala 37:26]
  wire [4:0] _T_3;
  wire [15:0] _GEN_1;
  wire [15:0] _GEN_2;
  wire [15:0] _GEN_3;
  wire [15:0] _GEN_4;
  wire [15:0] _GEN_5;
  wire [15:0] _GEN_6;
  wire [15:0] _GEN_7;
  wire [15:0] _GEN_8;
  wire [15:0] _GEN_9;
  wire [15:0] _GEN_10;
  wire [15:0] _GEN_11;
  wire [15:0] _GEN_12;
  wire [15:0] _GEN_13;
  wire [15:0] _GEN_14;
  wire [15:0] _GEN_15;
  wire [15:0] _GEN_16;
  wire [15:0] _GEN_17;
  wire [15:0] _GEN_18;
  wire [15:0] _GEN_19;
  wire [15:0] _GEN_20;
  wire [15:0] _GEN_21;
  wire [15:0] _GEN_22;
  wire [15:0] _GEN_23;
  wire [15:0] _GEN_24;
  wire [15:0] _GEN_25;
  wire [15:0] _GEN_26;
  wire [15:0] _GEN_27;
  wire [15:0] _GEN_28;
  wire [15:0] _GEN_29;
  wire [15:0] _GEN_30;
  wire [15:0] _GEN_31;
  Fetch fetch ( // @[IF.scala 39:28]
    .clock(fetch_clock),
    .reset(fetch_reset),
    .io_in_branch_mispredicted(fetch_io_in_branch_mispredicted),
    .io_in_branch_graduated(fetch_io_in_branch_graduated),
    .io_in_restoration_pc(fetch_io_in_restoration_pc),
    .io_in_is_branch(fetch_io_in_is_branch),
    .io_in_is_jump(fetch_io_in_is_jump),
    .io_in_jump_pc(fetch_io_in_jump_pc),
    .io_in_alu_out(fetch_io_in_alu_out),
    .io_in_stall(fetch_io_in_stall),
    .io_in_prev_pc(fetch_io_in_prev_pc),
    .io_out_pc(fetch_io_out_pc)
  );
  assign _T_2 = total_cnt + 16'h1; // @[IF.scala 37:26]
  assign _T_3 = pc[4:0];
  assign _GEN_1 = 5'h1 == _T_3 ? 16'h9400 : 16'h9200;
  assign _GEN_2 = 5'h2 == _T_3 ? 16'h9609 : _GEN_1;
  assign _GEN_3 = 5'h3 == _T_3 ? 16'h9800 : _GEN_2;
  assign _GEN_4 = 5'h4 == _T_3 ? 16'h5201 : _GEN_3;
  assign _GEN_5 = 5'h5 == _T_3 ? 16'h1440 : _GEN_4;
  assign _GEN_6 = 5'h6 == _T_3 ? 16'hd2c3 : _GEN_5;
  assign _GEN_7 = 5'h7 == _T_3 ? 16'h0 : _GEN_6;
  assign _GEN_8 = 5'h8 == _T_3 ? 16'he1fc : _GEN_7;
  assign _GEN_9 = 5'h9 == _T_3 ? 16'h1880 : _GEN_8;
  assign _GEN_10 = 5'ha == _T_3 ? 16'h0 : _GEN_9;
  assign _GEN_11 = 5'hb == _T_3 ? 16'h0 : _GEN_10;
  assign _GEN_12 = 5'hc == _T_3 ? 16'h0 : _GEN_11;
  assign _GEN_13 = 5'hd == _T_3 ? 16'h0 : _GEN_12;
  assign _GEN_14 = 5'he == _T_3 ? 16'h0 : _GEN_13;
  assign _GEN_15 = 5'hf == _T_3 ? 16'h0 : _GEN_14;
  assign _GEN_16 = 5'h10 == _T_3 ? 16'h0 : _GEN_15;
  assign _GEN_17 = 5'h11 == _T_3 ? 16'h0 : _GEN_16;
  assign _GEN_18 = 5'h12 == _T_3 ? 16'h0 : _GEN_17;
  assign _GEN_19 = 5'h13 == _T_3 ? 16'h0 : _GEN_18;
  assign _GEN_20 = 5'h14 == _T_3 ? 16'h0 : _GEN_19;
  assign _GEN_21 = 5'h15 == _T_3 ? 16'h0 : _GEN_20;
  assign _GEN_22 = 5'h16 == _T_3 ? 16'h0 : _GEN_21;
  assign _GEN_23 = 5'h17 == _T_3 ? 16'h0 : _GEN_22;
  assign _GEN_24 = 5'h18 == _T_3 ? 16'h0 : _GEN_23;
  assign _GEN_25 = 5'h19 == _T_3 ? 16'h0 : _GEN_24;
  assign _GEN_26 = 5'h1a == _T_3 ? 16'h0 : _GEN_25;
  assign _GEN_27 = 5'h1b == _T_3 ? 16'h0 : _GEN_26;
  assign _GEN_28 = 5'h1c == _T_3 ? 16'h0 : _GEN_27;
  assign _GEN_29 = 5'h1d == _T_3 ? 16'h0 : _GEN_28;
  assign _GEN_30 = 5'h1e == _T_3 ? 16'h0 : _GEN_29;
  assign _GEN_31 = 5'h1f == _T_3 ? 16'h0 : _GEN_30;
  assign io_out_pc = pc; // @[IF.scala 57:13]
  assign io_out_total_cnt = total_cnt; // @[IF.scala 58:20]
  assign io_out_inst_bits_op = _GEN_31[15:12]; // @[IF.scala 59:20]
  assign io_out_inst_bits_rd = _GEN_31[11:9]; // @[IF.scala 59:20]
  assign io_out_inst_bits_rs = _GEN_31[8:6]; // @[IF.scala 59:20]
  assign io_out_inst_bits_disp6u = _GEN_31[5:0]; // @[IF.scala 59:20]
  assign fetch_clock = clock;
  assign fetch_reset = reset;
  assign fetch_io_in_branch_mispredicted = io_in_branch_mispredicted; // @[IF.scala 43:35]
  assign fetch_io_in_branch_graduated = io_in_branch_mispredicted_enable; // @[IF.scala 44:32]
  assign fetch_io_in_restoration_pc = io_in_restoration_pc; // @[IF.scala 45:30]
  assign fetch_io_in_is_branch = io_in_is_branch; // @[IF.scala 47:25]
  assign fetch_io_in_is_jump = io_in_is_jump; // @[IF.scala 48:23]
  assign fetch_io_in_jump_pc = io_in_jump_pc; // @[IF.scala 49:23]
  assign fetch_io_in_alu_out = io_in_alu_out; // @[IF.scala 50:23]
  assign fetch_io_in_stall = io_in_stall; // @[IF.scala 51:21]
  assign fetch_io_in_prev_pc = pc; // @[IF.scala 53:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  total_cnt = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc <= 16'h0;
    end else begin
      pc <= fetch_io_out_pc;
    end
    if (reset) begin
      total_cnt <= 16'h0;
    end else begin
      total_cnt <= _T_2;
    end
  end
endmodule
module Decoder(
  input  [3:0]  io_inst_bits_op,
  input  [2:0]  io_inst_bits_rd,
  output [2:0]  io_ctrl_rd_addr,
  output [2:0]  io_ctrl_alu_op,
  output        io_ctrl_is_jump,
  output        io_ctrl_is_branch,
  output        io_ctrl_rf_w,
  output        io_ctrl_rs1_use,
  output        io_ctrl_rs2_use,
  output [15:0] io_source_sel_0,
  output [15:0] io_source_sel_1
);
  wire  _T; // @[Decoder.scala 46:26]
  wire  _T_1; // @[Decoder.scala 49:32]
  wire  _T_2; // @[Decoder.scala 49:32]
  wire  _T_3; // @[Decoder.scala 49:32]
  wire  _T_4; // @[Decoder.scala 49:32]
  wire  _T_5; // @[Decoder.scala 49:32]
  wire  _T_6; // @[Decoder.scala 49:32]
  wire  _T_7; // @[Decoder.scala 49:32]
  wire  _T_9; // @[Decoder.scala 49:32]
  wire  _T_10; // @[Decoder.scala 49:32]
  wire  _T_11; // @[Decoder.scala 49:32]
  wire  _T_12; // @[Decoder.scala 49:32]
  wire  _T_13; // @[Decoder.scala 49:32]
  wire  _T_14; // @[Decoder.scala 49:32]
  wire  _T_15; // @[Decoder.scala 49:32]
  wire [1:0] _GEN_5; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_7; // @[Decoder.scala 49:45]
  wire  _GEN_8; // @[Decoder.scala 49:45]
  wire  _GEN_11; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_12; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_14; // @[Decoder.scala 49:45]
  wire  _GEN_15; // @[Decoder.scala 49:45]
  wire  _GEN_16; // @[Decoder.scala 49:45]
  wire  _GEN_18; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_19; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_21; // @[Decoder.scala 49:45]
  wire  _GEN_22; // @[Decoder.scala 49:45]
  wire  _GEN_23; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_26; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_27; // @[Decoder.scala 49:45]
  wire  _GEN_28; // @[Decoder.scala 49:45]
  wire  _GEN_29; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_31; // @[Decoder.scala 49:45]
  wire  _GEN_32; // @[Decoder.scala 49:45]
  wire  _GEN_33; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_36; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_37; // @[Decoder.scala 49:45]
  wire  _GEN_38; // @[Decoder.scala 49:45]
  wire  _GEN_39; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_41; // @[Decoder.scala 49:45]
  wire  _GEN_42; // @[Decoder.scala 49:45]
  wire  _GEN_43; // @[Decoder.scala 49:45]
  wire  _GEN_44; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_46; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_47; // @[Decoder.scala 49:45]
  wire  _GEN_48; // @[Decoder.scala 49:45]
  wire  _GEN_49; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_51; // @[Decoder.scala 49:45]
  wire  _GEN_52; // @[Decoder.scala 49:45]
  wire  _GEN_53; // @[Decoder.scala 49:45]
  wire  _GEN_54; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_56; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_57; // @[Decoder.scala 49:45]
  wire  _GEN_58; // @[Decoder.scala 49:45]
  wire  _GEN_59; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_61; // @[Decoder.scala 49:45]
  wire  _GEN_62; // @[Decoder.scala 49:45]
  wire  _GEN_63; // @[Decoder.scala 49:45]
  wire  _GEN_64; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_66; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_67; // @[Decoder.scala 49:45]
  wire  _GEN_68; // @[Decoder.scala 49:45]
  wire  _GEN_69; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_71; // @[Decoder.scala 49:45]
  wire  _GEN_72; // @[Decoder.scala 49:45]
  wire  _GEN_73; // @[Decoder.scala 49:45]
  wire  _GEN_74; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_76; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_77; // @[Decoder.scala 49:45]
  wire  _GEN_78; // @[Decoder.scala 49:45]
  wire  _GEN_79; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_81; // @[Decoder.scala 49:45]
  wire  _GEN_82; // @[Decoder.scala 49:45]
  wire  _GEN_83; // @[Decoder.scala 49:45]
  wire  _GEN_84; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_86; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_87; // @[Decoder.scala 49:45]
  wire  _GEN_88; // @[Decoder.scala 49:45]
  wire  _GEN_89; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_91; // @[Decoder.scala 49:45]
  wire  _GEN_92; // @[Decoder.scala 49:45]
  wire  _GEN_93; // @[Decoder.scala 49:45]
  wire  _GEN_94; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_96; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_97; // @[Decoder.scala 49:45]
  wire  _GEN_98; // @[Decoder.scala 49:45]
  wire  _GEN_99; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_101; // @[Decoder.scala 49:45]
  wire  _GEN_102; // @[Decoder.scala 49:45]
  wire  _GEN_103; // @[Decoder.scala 49:45]
  wire  _GEN_104; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_106; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_107; // @[Decoder.scala 49:45]
  wire  _GEN_108; // @[Decoder.scala 49:45]
  wire  _GEN_109; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_111; // @[Decoder.scala 49:45]
  wire  _GEN_112; // @[Decoder.scala 49:45]
  wire  _GEN_113; // @[Decoder.scala 49:45]
  wire  _GEN_114; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_116; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_117; // @[Decoder.scala 49:45]
  wire  _GEN_118; // @[Decoder.scala 49:45]
  wire  _GEN_119; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_121; // @[Decoder.scala 49:45]
  wire  _GEN_122; // @[Decoder.scala 49:45]
  wire  _GEN_123; // @[Decoder.scala 49:45]
  wire  _GEN_124; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_126; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_127; // @[Decoder.scala 49:45]
  wire  _GEN_128; // @[Decoder.scala 49:45]
  wire  _GEN_129; // @[Decoder.scala 49:45]
  wire [2:0] _GEN_131; // @[Decoder.scala 49:45]
  wire  _GEN_132; // @[Decoder.scala 49:45]
  wire  _GEN_133; // @[Decoder.scala 49:45]
  wire  _GEN_134; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_136; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_137; // @[Decoder.scala 49:45]
  wire  _GEN_138; // @[Decoder.scala 49:45]
  wire  _GEN_139; // @[Decoder.scala 49:45]
  wire [1:0] _GEN_146; // @[Decoder.scala 46:38]
  wire [1:0] _GEN_147; // @[Decoder.scala 46:38]
  assign _T = io_inst_bits_op == 4'h0; // @[Decoder.scala 46:26]
  assign _T_1 = io_inst_bits_op == 4'h1; // @[Decoder.scala 49:32]
  assign _T_2 = io_inst_bits_op == 4'h2; // @[Decoder.scala 49:32]
  assign _T_3 = io_inst_bits_op == 4'h3; // @[Decoder.scala 49:32]
  assign _T_4 = io_inst_bits_op == 4'h4; // @[Decoder.scala 49:32]
  assign _T_5 = io_inst_bits_op == 4'h5; // @[Decoder.scala 49:32]
  assign _T_6 = io_inst_bits_op == 4'h6; // @[Decoder.scala 49:32]
  assign _T_7 = io_inst_bits_op == 4'h7; // @[Decoder.scala 49:32]
  assign _T_9 = io_inst_bits_op == 4'h8; // @[Decoder.scala 49:32]
  assign _T_10 = io_inst_bits_op == 4'h9; // @[Decoder.scala 49:32]
  assign _T_11 = io_inst_bits_op == 4'ha; // @[Decoder.scala 49:32]
  assign _T_12 = io_inst_bits_op == 4'hb; // @[Decoder.scala 49:32]
  assign _T_13 = io_inst_bits_op == 4'hc; // @[Decoder.scala 49:32]
  assign _T_14 = io_inst_bits_op == 4'hd; // @[Decoder.scala 49:32]
  assign _T_15 = io_inst_bits_op == 4'he; // @[Decoder.scala 49:32]
  assign _GEN_5 = _T_15 ? 2'h2 : 2'h0; // @[Decoder.scala 49:45]
  assign _GEN_7 = _T_14 ? 3'h5 : 3'h0; // @[Decoder.scala 49:45]
  assign _GEN_8 = _T_14 ? 1'h0 : _T_15; // @[Decoder.scala 49:45]
  assign _GEN_11 = _T_14 | _T_15; // @[Decoder.scala 49:45]
  assign _GEN_12 = _T_14 ? 2'h1 : _GEN_5; // @[Decoder.scala 49:45]
  assign _GEN_14 = _T_13 ? 3'h4 : _GEN_7; // @[Decoder.scala 49:45]
  assign _GEN_15 = _T_13 ? 1'h0 : _GEN_8; // @[Decoder.scala 49:45]
  assign _GEN_16 = _T_13 | _T_14; // @[Decoder.scala 49:45]
  assign _GEN_18 = _T_13 | _GEN_11; // @[Decoder.scala 49:45]
  assign _GEN_19 = _T_13 ? 2'h1 : _GEN_12; // @[Decoder.scala 49:45]
  assign _GEN_21 = _T_12 ? 3'h0 : _GEN_14; // @[Decoder.scala 49:45]
  assign _GEN_22 = _T_12 ? 1'h0 : _GEN_15; // @[Decoder.scala 49:45]
  assign _GEN_23 = _T_12 ? 1'h0 : _GEN_16; // @[Decoder.scala 49:45]
  assign _GEN_26 = _T_12 ? 2'h3 : {{1'd0}, _GEN_18}; // @[Decoder.scala 49:45]
  assign _GEN_27 = _T_12 ? 2'h1 : _GEN_19; // @[Decoder.scala 49:45]
  assign _GEN_28 = _T_12 ? 1'h0 : _GEN_18; // @[Decoder.scala 49:45]
  assign _GEN_29 = _T_12 | _GEN_16; // @[Decoder.scala 49:45]
  assign _GEN_31 = _T_11 ? 3'h0 : _GEN_21; // @[Decoder.scala 49:45]
  assign _GEN_32 = _T_11 ? 1'h0 : _GEN_22; // @[Decoder.scala 49:45]
  assign _GEN_33 = _T_11 ? 1'h0 : _GEN_23; // @[Decoder.scala 49:45]
  assign _GEN_36 = _T_11 ? 2'h3 : _GEN_26; // @[Decoder.scala 49:45]
  assign _GEN_37 = _T_11 ? 2'h1 : _GEN_27; // @[Decoder.scala 49:45]
  assign _GEN_38 = _T_11 ? 1'h0 : _GEN_28; // @[Decoder.scala 49:45]
  assign _GEN_39 = _T_11 | _GEN_29; // @[Decoder.scala 49:45]
  assign _GEN_41 = _T_10 ? 3'h0 : _GEN_31; // @[Decoder.scala 49:45]
  assign _GEN_42 = _T_10 ? 1'h0 : _GEN_32; // @[Decoder.scala 49:45]
  assign _GEN_43 = _T_10 ? 1'h0 : _GEN_33; // @[Decoder.scala 49:45]
  assign _GEN_44 = _T_10 | _T_11; // @[Decoder.scala 49:45]
  assign _GEN_46 = _T_10 ? 2'h0 : _GEN_36; // @[Decoder.scala 49:45]
  assign _GEN_47 = _T_10 ? 2'h2 : _GEN_37; // @[Decoder.scala 49:45]
  assign _GEN_48 = _T_10 ? 1'h0 : _GEN_38; // @[Decoder.scala 49:45]
  assign _GEN_49 = _T_10 ? 1'h0 : _GEN_39; // @[Decoder.scala 49:45]
  assign _GEN_51 = _T_9 ? 3'h1 : _GEN_41; // @[Decoder.scala 49:45]
  assign _GEN_52 = _T_9 ? 1'h0 : _GEN_42; // @[Decoder.scala 49:45]
  assign _GEN_53 = _T_9 ? 1'h0 : _GEN_43; // @[Decoder.scala 49:45]
  assign _GEN_54 = _T_9 | _GEN_44; // @[Decoder.scala 49:45]
  assign _GEN_56 = _T_9 ? 2'h1 : _GEN_46; // @[Decoder.scala 49:45]
  assign _GEN_57 = _T_9 ? 2'h0 : _GEN_47; // @[Decoder.scala 49:45]
  assign _GEN_58 = _T_9 | _GEN_48; // @[Decoder.scala 49:45]
  assign _GEN_59 = _T_9 ? 1'h0 : _GEN_49; // @[Decoder.scala 49:45]
  assign _GEN_61 = _T_7 ? 3'h0 : _GEN_51; // @[Decoder.scala 49:45]
  assign _GEN_62 = _T_7 ? 1'h0 : _GEN_52; // @[Decoder.scala 49:45]
  assign _GEN_63 = _T_7 ? 1'h0 : _GEN_53; // @[Decoder.scala 49:45]
  assign _GEN_64 = _T_7 | _GEN_54; // @[Decoder.scala 49:45]
  assign _GEN_66 = _T_7 ? 2'h1 : _GEN_56; // @[Decoder.scala 49:45]
  assign _GEN_67 = _T_7 ? 2'h0 : _GEN_57; // @[Decoder.scala 49:45]
  assign _GEN_68 = _T_7 | _GEN_58; // @[Decoder.scala 49:45]
  assign _GEN_69 = _T_7 ? 1'h0 : _GEN_59; // @[Decoder.scala 49:45]
  assign _GEN_71 = _T_7 ? 3'h0 : _GEN_61; // @[Decoder.scala 49:45]
  assign _GEN_72 = _T_7 ? 1'h0 : _GEN_62; // @[Decoder.scala 49:45]
  assign _GEN_73 = _T_7 ? 1'h0 : _GEN_63; // @[Decoder.scala 49:45]
  assign _GEN_74 = _T_7 | _GEN_64; // @[Decoder.scala 49:45]
  assign _GEN_76 = _T_7 ? 2'h1 : _GEN_66; // @[Decoder.scala 49:45]
  assign _GEN_77 = _T_7 ? 2'h0 : _GEN_67; // @[Decoder.scala 49:45]
  assign _GEN_78 = _T_7 | _GEN_68; // @[Decoder.scala 49:45]
  assign _GEN_79 = _T_7 ? 1'h0 : _GEN_69; // @[Decoder.scala 49:45]
  assign _GEN_81 = _T_6 ? 3'h1 : _GEN_71; // @[Decoder.scala 49:45]
  assign _GEN_82 = _T_6 ? 1'h0 : _GEN_72; // @[Decoder.scala 49:45]
  assign _GEN_83 = _T_6 ? 1'h0 : _GEN_73; // @[Decoder.scala 49:45]
  assign _GEN_84 = _T_6 | _GEN_74; // @[Decoder.scala 49:45]
  assign _GEN_86 = _T_6 ? 2'h1 : _GEN_76; // @[Decoder.scala 49:45]
  assign _GEN_87 = _T_6 ? 2'h2 : _GEN_77; // @[Decoder.scala 49:45]
  assign _GEN_88 = _T_6 | _GEN_78; // @[Decoder.scala 49:45]
  assign _GEN_89 = _T_6 ? 1'h0 : _GEN_79; // @[Decoder.scala 49:45]
  assign _GEN_91 = _T_5 ? 3'h0 : _GEN_81; // @[Decoder.scala 49:45]
  assign _GEN_92 = _T_5 ? 1'h0 : _GEN_82; // @[Decoder.scala 49:45]
  assign _GEN_93 = _T_5 ? 1'h0 : _GEN_83; // @[Decoder.scala 49:45]
  assign _GEN_94 = _T_5 | _GEN_84; // @[Decoder.scala 49:45]
  assign _GEN_96 = _T_5 ? 2'h1 : _GEN_86; // @[Decoder.scala 49:45]
  assign _GEN_97 = _T_5 ? 2'h2 : _GEN_87; // @[Decoder.scala 49:45]
  assign _GEN_98 = _T_5 | _GEN_88; // @[Decoder.scala 49:45]
  assign _GEN_99 = _T_5 ? 1'h0 : _GEN_89; // @[Decoder.scala 49:45]
  assign _GEN_101 = _T_4 ? 3'h3 : _GEN_91; // @[Decoder.scala 49:45]
  assign _GEN_102 = _T_4 ? 1'h0 : _GEN_92; // @[Decoder.scala 49:45]
  assign _GEN_103 = _T_4 ? 1'h0 : _GEN_93; // @[Decoder.scala 49:45]
  assign _GEN_104 = _T_4 | _GEN_94; // @[Decoder.scala 49:45]
  assign _GEN_106 = _T_4 ? 2'h1 : _GEN_96; // @[Decoder.scala 49:45]
  assign _GEN_107 = _T_4 ? 2'h1 : _GEN_97; // @[Decoder.scala 49:45]
  assign _GEN_108 = _T_4 | _GEN_98; // @[Decoder.scala 49:45]
  assign _GEN_109 = _T_4 | _GEN_99; // @[Decoder.scala 49:45]
  assign _GEN_111 = _T_3 ? 3'h2 : _GEN_101; // @[Decoder.scala 49:45]
  assign _GEN_112 = _T_3 ? 1'h0 : _GEN_102; // @[Decoder.scala 49:45]
  assign _GEN_113 = _T_3 ? 1'h0 : _GEN_103; // @[Decoder.scala 49:45]
  assign _GEN_114 = _T_3 | _GEN_104; // @[Decoder.scala 49:45]
  assign _GEN_116 = _T_3 ? 2'h1 : _GEN_106; // @[Decoder.scala 49:45]
  assign _GEN_117 = _T_3 ? 2'h1 : _GEN_107; // @[Decoder.scala 49:45]
  assign _GEN_118 = _T_3 | _GEN_108; // @[Decoder.scala 49:45]
  assign _GEN_119 = _T_3 | _GEN_109; // @[Decoder.scala 49:45]
  assign _GEN_121 = _T_2 ? 3'h1 : _GEN_111; // @[Decoder.scala 49:45]
  assign _GEN_122 = _T_2 ? 1'h0 : _GEN_112; // @[Decoder.scala 49:45]
  assign _GEN_123 = _T_2 ? 1'h0 : _GEN_113; // @[Decoder.scala 49:45]
  assign _GEN_124 = _T_2 | _GEN_114; // @[Decoder.scala 49:45]
  assign _GEN_126 = _T_2 ? 2'h1 : _GEN_116; // @[Decoder.scala 49:45]
  assign _GEN_127 = _T_2 ? 2'h1 : _GEN_117; // @[Decoder.scala 49:45]
  assign _GEN_128 = _T_2 | _GEN_118; // @[Decoder.scala 49:45]
  assign _GEN_129 = _T_2 | _GEN_119; // @[Decoder.scala 49:45]
  assign _GEN_131 = _T_1 ? 3'h0 : _GEN_121; // @[Decoder.scala 49:45]
  assign _GEN_132 = _T_1 ? 1'h0 : _GEN_122; // @[Decoder.scala 49:45]
  assign _GEN_133 = _T_1 ? 1'h0 : _GEN_123; // @[Decoder.scala 49:45]
  assign _GEN_134 = _T_1 | _GEN_124; // @[Decoder.scala 49:45]
  assign _GEN_136 = _T_1 ? 2'h1 : _GEN_126; // @[Decoder.scala 49:45]
  assign _GEN_137 = _T_1 ? 2'h1 : _GEN_127; // @[Decoder.scala 49:45]
  assign _GEN_138 = _T_1 | _GEN_128; // @[Decoder.scala 49:45]
  assign _GEN_139 = _T_1 | _GEN_129; // @[Decoder.scala 49:45]
  assign _GEN_146 = _T ? 2'h0 : _GEN_136; // @[Decoder.scala 46:38]
  assign _GEN_147 = _T ? 2'h0 : _GEN_137; // @[Decoder.scala 46:38]
  assign io_ctrl_rd_addr = io_inst_bits_rd; // @[Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23 Decoder.scala 31:23]
  assign io_ctrl_alu_op = _T ? 3'h0 : _GEN_131; // @[Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23 Decoder.scala 32:23]
  assign io_ctrl_is_jump = _T ? 1'h0 : _GEN_132; // @[Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23 Decoder.scala 33:23]
  assign io_ctrl_is_branch = _T ? 1'h0 : _GEN_133; // @[Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23 Decoder.scala 34:23]
  assign io_ctrl_rf_w = _T ? 1'h0 : _GEN_134; // @[Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23 Decoder.scala 35:23]
  assign io_ctrl_rs1_use = _T ? 1'h0 : _GEN_138; // @[Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24 Decoder.scala 40:24]
  assign io_ctrl_rs2_use = _T ? 1'h0 : _GEN_139; // @[Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24 Decoder.scala 41:24]
  assign io_source_sel_0 = {{14'd0}, _GEN_146}; // @[Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24]
  assign io_source_sel_1 = {{14'd0}, _GEN_147}; // @[Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24 Decoder.scala 38:24]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input  [2:0]  io_read_addr_0,
  input  [2:0]  io_read_addr_1,
  input  [2:0]  io_write_0_rd_addr,
  input         io_write_0_rf_w,
  input  [15:0] io_write_0_data,
  output [15:0] io_out_0,
  output [15:0] io_out_1,
  output [15:0] io_rf4debug_1,
  output [15:0] io_rf4debug_2,
  output [15:0] io_rf4debug_3,
  output [15:0] io_rf4debug_4,
  output [15:0] io_rf4debug_5,
  output [15:0] io_rf4debug_6,
  output [15:0] io_rf4debug_7
);
  reg [15:0] rf_1; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_0;
  reg [15:0] rf_2; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_1;
  reg [15:0] rf_3; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_2;
  reg [15:0] rf_4; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_3;
  reg [15:0] rf_5; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_4;
  reg [15:0] rf_6; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_5;
  reg [15:0] rf_7; // @[RegisterFile.scala 23:26]
  reg [31:0] _RAND_6;
  wire  _T; // @[RegisterFile.scala 33:65]
  wire  _T_1; // @[RegisterFile.scala 33:40]
  wire [15:0] _GEN_1; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_2; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_3; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_4; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_5; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_6; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_7; // @[RegisterFile.scala 33:21]
  wire  _T_3; // @[RegisterFile.scala 33:65]
  wire  _T_4; // @[RegisterFile.scala 33:40]
  wire [15:0] _GEN_9; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_10; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_11; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_12; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_13; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_14; // @[RegisterFile.scala 33:21]
  wire [15:0] _GEN_15; // @[RegisterFile.scala 33:21]
  wire  _T_6; // @[RegisterFile.scala 49:11]
  wire  _T_7; // @[RegisterFile.scala 49:11]
  assign _T = io_write_0_rd_addr == io_read_addr_0; // @[RegisterFile.scala 33:65]
  assign _T_1 = io_write_0_rf_w & _T; // @[RegisterFile.scala 33:40]
  assign _GEN_1 = 3'h1 == io_read_addr_0 ? rf_1 : 16'h0; // @[RegisterFile.scala 33:21]
  assign _GEN_2 = 3'h2 == io_read_addr_0 ? rf_2 : _GEN_1; // @[RegisterFile.scala 33:21]
  assign _GEN_3 = 3'h3 == io_read_addr_0 ? rf_3 : _GEN_2; // @[RegisterFile.scala 33:21]
  assign _GEN_4 = 3'h4 == io_read_addr_0 ? rf_4 : _GEN_3; // @[RegisterFile.scala 33:21]
  assign _GEN_5 = 3'h5 == io_read_addr_0 ? rf_5 : _GEN_4; // @[RegisterFile.scala 33:21]
  assign _GEN_6 = 3'h6 == io_read_addr_0 ? rf_6 : _GEN_5; // @[RegisterFile.scala 33:21]
  assign _GEN_7 = 3'h7 == io_read_addr_0 ? rf_7 : _GEN_6; // @[RegisterFile.scala 33:21]
  assign _T_3 = io_write_0_rd_addr == io_read_addr_1; // @[RegisterFile.scala 33:65]
  assign _T_4 = io_write_0_rf_w & _T_3; // @[RegisterFile.scala 33:40]
  assign _GEN_9 = 3'h1 == io_read_addr_1 ? rf_1 : 16'h0; // @[RegisterFile.scala 33:21]
  assign _GEN_10 = 3'h2 == io_read_addr_1 ? rf_2 : _GEN_9; // @[RegisterFile.scala 33:21]
  assign _GEN_11 = 3'h3 == io_read_addr_1 ? rf_3 : _GEN_10; // @[RegisterFile.scala 33:21]
  assign _GEN_12 = 3'h4 == io_read_addr_1 ? rf_4 : _GEN_11; // @[RegisterFile.scala 33:21]
  assign _GEN_13 = 3'h5 == io_read_addr_1 ? rf_5 : _GEN_12; // @[RegisterFile.scala 33:21]
  assign _GEN_14 = 3'h6 == io_read_addr_1 ? rf_6 : _GEN_13; // @[RegisterFile.scala 33:21]
  assign _GEN_15 = 3'h7 == io_read_addr_1 ? rf_7 : _GEN_14; // @[RegisterFile.scala 33:21]
  assign _T_6 = $unsigned(reset); // @[RegisterFile.scala 49:11]
  assign _T_7 = _T_6 == 1'h0; // @[RegisterFile.scala 49:11]
  assign io_out_0 = _T_1 ? io_write_0_data : _GEN_7; // @[RegisterFile.scala 33:15]
  assign io_out_1 = _T_4 ? io_write_0_data : _GEN_15; // @[RegisterFile.scala 33:15]
  assign io_rf4debug_1 = rf_1; // @[RegisterFile.scala 46:15]
  assign io_rf4debug_2 = rf_2; // @[RegisterFile.scala 46:15]
  assign io_rf4debug_3 = rf_3; // @[RegisterFile.scala 46:15]
  assign io_rf4debug_4 = rf_4; // @[RegisterFile.scala 46:15]
  assign io_rf4debug_5 = rf_5; // @[RegisterFile.scala 46:15]
  assign io_rf4debug_6 = rf_6; // @[RegisterFile.scala 46:15]
  assign io_rf4debug_7 = rf_7; // @[RegisterFile.scala 46:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rf_1 = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rf_2 = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rf_3 = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rf_4 = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  rf_5 = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  rf_6 = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rf_7 = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_write_0_rf_w) begin
      if (3'h1 == io_write_0_rd_addr) begin
        rf_1 <= io_write_0_data;
      end
    end
    if (io_write_0_rf_w) begin
      if (3'h2 == io_write_0_rd_addr) begin
        rf_2 <= io_write_0_data;
      end
    end
    if (io_write_0_rf_w) begin
      if (3'h3 == io_write_0_rd_addr) begin
        rf_3 <= io_write_0_data;
      end
    end
    if (io_write_0_rf_w) begin
      if (3'h4 == io_write_0_rd_addr) begin
        rf_4 <= io_write_0_data;
      end
    end
    if (io_write_0_rf_w) begin
      if (3'h5 == io_write_0_rd_addr) begin
        rf_5 <= io_write_0_data;
      end
    end
    if (io_write_0_rf_w) begin
      if (3'h6 == io_write_0_rd_addr) begin
        rf_6 <= io_write_0_data;
      end
    end
    if (io_write_0_rf_w) begin
      if (3'h7 == io_write_0_rd_addr) begin
        rf_7 <= io_write_0_data;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"we: %d, addr: %d, data: %d\n",io_write_0_rf_w,io_write_0_rd_addr,io_write_0_data); // @[RegisterFile.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"rf: "); // @[RegisterFile.scala 52:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"0:%d, ",16'h0); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"1:%d, ",rf_1); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"2:%d, ",rf_2); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"3:%d, ",rf_3); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"4:%d, ",rf_4); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"5:%d, ",rf_5); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"6:%d, ",rf_6); // @[RegisterFile.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7) begin
          $fwrite(32'h80000002,"7:%d\n",rf_7); // @[RegisterFile.scala 55:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BusyBit(
  input        clock,
  input        reset,
  input        io_branch_mispredicted,
  input        io_branch_graduated,
  input  [2:0] io_release_0_rd_addr,
  input        io_release_0_rf_w,
  input  [2:0] io_req_rs_addr_0,
  input  [2:0] io_req_rs_addr_1,
  input        io_req_rd_w,
  input  [2:0] io_req_rd_addr,
  output       io_rs_available_0,
  output       io_rs_available_1
);
  reg  busy_bit_1; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_0;
  reg  busy_bit_2; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_1;
  reg  busy_bit_3; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_2;
  reg  busy_bit_4; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_3;
  reg  busy_bit_5; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_4;
  reg  busy_bit_6; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_5;
  reg  busy_bit_7; // @[BusyBit.scala 22:36]
  reg [31:0] _RAND_6;
  wire  _T_1; // @[BusyBit.scala 26:78]
  wire  _T_2; // @[BusyBit.scala 26:65]
  wire  _GEN_400; // @[BusyBit.scala 27:27]
  wire  _GEN_1; // @[BusyBit.scala 27:27]
  wire  _GEN_2; // @[BusyBit.scala 27:27]
  wire  _GEN_3; // @[BusyBit.scala 27:27]
  wire  _GEN_4; // @[BusyBit.scala 27:27]
  wire  _GEN_5; // @[BusyBit.scala 27:27]
  wire  _GEN_6; // @[BusyBit.scala 27:27]
  wire  _GEN_7; // @[BusyBit.scala 27:27]
  wire  _T_4; // @[BusyBit.scala 27:27]
  wire  _T_6; // @[BusyBit.scala 26:78]
  wire  _T_7; // @[BusyBit.scala 26:65]
  wire  _GEN_401; // @[BusyBit.scala 27:27]
  wire  _GEN_9; // @[BusyBit.scala 27:27]
  wire  _GEN_10; // @[BusyBit.scala 27:27]
  wire  _GEN_11; // @[BusyBit.scala 27:27]
  wire  _GEN_12; // @[BusyBit.scala 27:27]
  wire  _GEN_13; // @[BusyBit.scala 27:27]
  wire  _GEN_14; // @[BusyBit.scala 27:27]
  wire  _GEN_15; // @[BusyBit.scala 27:27]
  wire  _T_9; // @[BusyBit.scala 27:27]
  wire  _T_11; // @[BusyBit.scala 31:30]
  wire  _GEN_17; // @[BusyBit.scala 32:39]
  wire  _GEN_18; // @[BusyBit.scala 32:39]
  wire  _GEN_19; // @[BusyBit.scala 32:39]
  wire  _GEN_20; // @[BusyBit.scala 32:39]
  wire  _GEN_21; // @[BusyBit.scala 32:39]
  wire  _GEN_22; // @[BusyBit.scala 32:39]
  wire  _GEN_23; // @[BusyBit.scala 32:39]
  wire  _T_12; // @[BusyBit.scala 33:62]
  wire  _T_13; // @[BusyBit.scala 33:37]
  wire  _T_14; // @[BusyBit.scala 35:48]
  wire  _T_15; // @[BusyBit.scala 35:30]
  wire  _GEN_402; // @[BusyBit.scala 36:32]
  wire  _GEN_33; // @[BusyBit.scala 36:32]
  wire  _GEN_403; // @[BusyBit.scala 36:32]
  wire  _GEN_34; // @[BusyBit.scala 36:32]
  wire  _GEN_404; // @[BusyBit.scala 36:32]
  wire  _GEN_35; // @[BusyBit.scala 36:32]
  wire  _GEN_405; // @[BusyBit.scala 36:32]
  wire  _GEN_36; // @[BusyBit.scala 36:32]
  wire  _GEN_406; // @[BusyBit.scala 36:32]
  wire  _GEN_37; // @[BusyBit.scala 36:32]
  wire  _GEN_407; // @[BusyBit.scala 36:32]
  wire  _GEN_38; // @[BusyBit.scala 36:32]
  wire  _GEN_408; // @[BusyBit.scala 36:32]
  wire  _GEN_39; // @[BusyBit.scala 36:32]
  wire  _GEN_41; // @[BusyBit.scala 35:57]
  wire  _GEN_42; // @[BusyBit.scala 35:57]
  wire  _GEN_43; // @[BusyBit.scala 35:57]
  wire  _GEN_44; // @[BusyBit.scala 35:57]
  wire  _GEN_45; // @[BusyBit.scala 35:57]
  wire  _GEN_46; // @[BusyBit.scala 35:57]
  wire  _GEN_47; // @[BusyBit.scala 35:57]
  wire  _GEN_49; // @[BusyBit.scala 33:71]
  wire  _GEN_50; // @[BusyBit.scala 33:71]
  wire  _GEN_51; // @[BusyBit.scala 33:71]
  wire  _GEN_52; // @[BusyBit.scala 33:71]
  wire  _GEN_53; // @[BusyBit.scala 33:71]
  wire  _GEN_54; // @[BusyBit.scala 33:71]
  wire  _GEN_55; // @[BusyBit.scala 33:71]
  wire  _GEN_57; // @[BusyBit.scala 31:57]
  wire  _GEN_58; // @[BusyBit.scala 31:57]
  wire  _GEN_59; // @[BusyBit.scala 31:57]
  wire  _GEN_60; // @[BusyBit.scala 31:57]
  wire  _GEN_61; // @[BusyBit.scala 31:57]
  wire  _GEN_62; // @[BusyBit.scala 31:57]
  wire  _GEN_63; // @[BusyBit.scala 31:57]
  wire  _GEN_65; // @[BusyBit.scala 32:39]
  wire  _GEN_66; // @[BusyBit.scala 32:39]
  wire  _GEN_67; // @[BusyBit.scala 32:39]
  wire  _GEN_68; // @[BusyBit.scala 32:39]
  wire  _GEN_69; // @[BusyBit.scala 32:39]
  wire  _GEN_70; // @[BusyBit.scala 32:39]
  wire  _GEN_71; // @[BusyBit.scala 32:39]
  wire  _T_17; // @[BusyBit.scala 33:62]
  wire  _T_18; // @[BusyBit.scala 33:37]
  wire  _T_19; // @[BusyBit.scala 35:48]
  wire  _T_20; // @[BusyBit.scala 35:30]
  wire  _GEN_81; // @[BusyBit.scala 36:32]
  wire  _GEN_82; // @[BusyBit.scala 36:32]
  wire  _GEN_83; // @[BusyBit.scala 36:32]
  wire  _GEN_84; // @[BusyBit.scala 36:32]
  wire  _GEN_85; // @[BusyBit.scala 36:32]
  wire  _GEN_86; // @[BusyBit.scala 36:32]
  wire  _GEN_87; // @[BusyBit.scala 36:32]
  wire  _GEN_89; // @[BusyBit.scala 35:57]
  wire  _GEN_90; // @[BusyBit.scala 35:57]
  wire  _GEN_91; // @[BusyBit.scala 35:57]
  wire  _GEN_92; // @[BusyBit.scala 35:57]
  wire  _GEN_93; // @[BusyBit.scala 35:57]
  wire  _GEN_94; // @[BusyBit.scala 35:57]
  wire  _GEN_95; // @[BusyBit.scala 35:57]
  wire  _GEN_97; // @[BusyBit.scala 33:71]
  wire  _GEN_98; // @[BusyBit.scala 33:71]
  wire  _GEN_99; // @[BusyBit.scala 33:71]
  wire  _GEN_100; // @[BusyBit.scala 33:71]
  wire  _GEN_101; // @[BusyBit.scala 33:71]
  wire  _GEN_102; // @[BusyBit.scala 33:71]
  wire  _GEN_103; // @[BusyBit.scala 33:71]
  wire  _GEN_105; // @[BusyBit.scala 31:57]
  wire  _GEN_106; // @[BusyBit.scala 31:57]
  wire  _GEN_107; // @[BusyBit.scala 31:57]
  wire  _GEN_108; // @[BusyBit.scala 31:57]
  wire  _GEN_109; // @[BusyBit.scala 31:57]
  wire  _GEN_110; // @[BusyBit.scala 31:57]
  wire  _GEN_111; // @[BusyBit.scala 31:57]
  wire  _GEN_113; // @[BusyBit.scala 32:39]
  wire  _GEN_114; // @[BusyBit.scala 32:39]
  wire  _GEN_115; // @[BusyBit.scala 32:39]
  wire  _GEN_116; // @[BusyBit.scala 32:39]
  wire  _GEN_117; // @[BusyBit.scala 32:39]
  wire  _GEN_118; // @[BusyBit.scala 32:39]
  wire  _GEN_119; // @[BusyBit.scala 32:39]
  wire  _T_22; // @[BusyBit.scala 33:62]
  wire  _T_23; // @[BusyBit.scala 33:37]
  wire  _T_24; // @[BusyBit.scala 35:48]
  wire  _T_25; // @[BusyBit.scala 35:30]
  wire  _GEN_129; // @[BusyBit.scala 36:32]
  wire  _GEN_130; // @[BusyBit.scala 36:32]
  wire  _GEN_131; // @[BusyBit.scala 36:32]
  wire  _GEN_132; // @[BusyBit.scala 36:32]
  wire  _GEN_133; // @[BusyBit.scala 36:32]
  wire  _GEN_134; // @[BusyBit.scala 36:32]
  wire  _GEN_135; // @[BusyBit.scala 36:32]
  wire  _GEN_137; // @[BusyBit.scala 35:57]
  wire  _GEN_138; // @[BusyBit.scala 35:57]
  wire  _GEN_139; // @[BusyBit.scala 35:57]
  wire  _GEN_140; // @[BusyBit.scala 35:57]
  wire  _GEN_141; // @[BusyBit.scala 35:57]
  wire  _GEN_142; // @[BusyBit.scala 35:57]
  wire  _GEN_143; // @[BusyBit.scala 35:57]
  wire  _GEN_145; // @[BusyBit.scala 33:71]
  wire  _GEN_146; // @[BusyBit.scala 33:71]
  wire  _GEN_147; // @[BusyBit.scala 33:71]
  wire  _GEN_148; // @[BusyBit.scala 33:71]
  wire  _GEN_149; // @[BusyBit.scala 33:71]
  wire  _GEN_150; // @[BusyBit.scala 33:71]
  wire  _GEN_151; // @[BusyBit.scala 33:71]
  wire  _GEN_153; // @[BusyBit.scala 31:57]
  wire  _GEN_154; // @[BusyBit.scala 31:57]
  wire  _GEN_155; // @[BusyBit.scala 31:57]
  wire  _GEN_156; // @[BusyBit.scala 31:57]
  wire  _GEN_157; // @[BusyBit.scala 31:57]
  wire  _GEN_158; // @[BusyBit.scala 31:57]
  wire  _GEN_159; // @[BusyBit.scala 31:57]
  wire  _GEN_161; // @[BusyBit.scala 32:39]
  wire  _GEN_162; // @[BusyBit.scala 32:39]
  wire  _GEN_163; // @[BusyBit.scala 32:39]
  wire  _GEN_164; // @[BusyBit.scala 32:39]
  wire  _GEN_165; // @[BusyBit.scala 32:39]
  wire  _GEN_166; // @[BusyBit.scala 32:39]
  wire  _GEN_167; // @[BusyBit.scala 32:39]
  wire  _T_27; // @[BusyBit.scala 33:62]
  wire  _T_28; // @[BusyBit.scala 33:37]
  wire  _T_29; // @[BusyBit.scala 35:48]
  wire  _T_30; // @[BusyBit.scala 35:30]
  wire  _GEN_177; // @[BusyBit.scala 36:32]
  wire  _GEN_178; // @[BusyBit.scala 36:32]
  wire  _GEN_179; // @[BusyBit.scala 36:32]
  wire  _GEN_180; // @[BusyBit.scala 36:32]
  wire  _GEN_181; // @[BusyBit.scala 36:32]
  wire  _GEN_182; // @[BusyBit.scala 36:32]
  wire  _GEN_183; // @[BusyBit.scala 36:32]
  wire  _GEN_185; // @[BusyBit.scala 35:57]
  wire  _GEN_186; // @[BusyBit.scala 35:57]
  wire  _GEN_187; // @[BusyBit.scala 35:57]
  wire  _GEN_188; // @[BusyBit.scala 35:57]
  wire  _GEN_189; // @[BusyBit.scala 35:57]
  wire  _GEN_190; // @[BusyBit.scala 35:57]
  wire  _GEN_191; // @[BusyBit.scala 35:57]
  wire  _GEN_193; // @[BusyBit.scala 33:71]
  wire  _GEN_194; // @[BusyBit.scala 33:71]
  wire  _GEN_195; // @[BusyBit.scala 33:71]
  wire  _GEN_196; // @[BusyBit.scala 33:71]
  wire  _GEN_197; // @[BusyBit.scala 33:71]
  wire  _GEN_198; // @[BusyBit.scala 33:71]
  wire  _GEN_199; // @[BusyBit.scala 33:71]
  wire  _GEN_201; // @[BusyBit.scala 31:57]
  wire  _GEN_202; // @[BusyBit.scala 31:57]
  wire  _GEN_203; // @[BusyBit.scala 31:57]
  wire  _GEN_204; // @[BusyBit.scala 31:57]
  wire  _GEN_205; // @[BusyBit.scala 31:57]
  wire  _GEN_206; // @[BusyBit.scala 31:57]
  wire  _GEN_207; // @[BusyBit.scala 31:57]
  wire  _GEN_209; // @[BusyBit.scala 32:39]
  wire  _GEN_210; // @[BusyBit.scala 32:39]
  wire  _GEN_211; // @[BusyBit.scala 32:39]
  wire  _GEN_212; // @[BusyBit.scala 32:39]
  wire  _GEN_213; // @[BusyBit.scala 32:39]
  wire  _GEN_214; // @[BusyBit.scala 32:39]
  wire  _GEN_215; // @[BusyBit.scala 32:39]
  wire  _T_32; // @[BusyBit.scala 33:62]
  wire  _T_33; // @[BusyBit.scala 33:37]
  wire  _T_34; // @[BusyBit.scala 35:48]
  wire  _T_35; // @[BusyBit.scala 35:30]
  wire  _GEN_225; // @[BusyBit.scala 36:32]
  wire  _GEN_226; // @[BusyBit.scala 36:32]
  wire  _GEN_227; // @[BusyBit.scala 36:32]
  wire  _GEN_228; // @[BusyBit.scala 36:32]
  wire  _GEN_229; // @[BusyBit.scala 36:32]
  wire  _GEN_230; // @[BusyBit.scala 36:32]
  wire  _GEN_231; // @[BusyBit.scala 36:32]
  wire  _GEN_233; // @[BusyBit.scala 35:57]
  wire  _GEN_234; // @[BusyBit.scala 35:57]
  wire  _GEN_235; // @[BusyBit.scala 35:57]
  wire  _GEN_236; // @[BusyBit.scala 35:57]
  wire  _GEN_237; // @[BusyBit.scala 35:57]
  wire  _GEN_238; // @[BusyBit.scala 35:57]
  wire  _GEN_239; // @[BusyBit.scala 35:57]
  wire  _GEN_241; // @[BusyBit.scala 33:71]
  wire  _GEN_242; // @[BusyBit.scala 33:71]
  wire  _GEN_243; // @[BusyBit.scala 33:71]
  wire  _GEN_244; // @[BusyBit.scala 33:71]
  wire  _GEN_245; // @[BusyBit.scala 33:71]
  wire  _GEN_246; // @[BusyBit.scala 33:71]
  wire  _GEN_247; // @[BusyBit.scala 33:71]
  wire  _GEN_249; // @[BusyBit.scala 31:57]
  wire  _GEN_250; // @[BusyBit.scala 31:57]
  wire  _GEN_251; // @[BusyBit.scala 31:57]
  wire  _GEN_252; // @[BusyBit.scala 31:57]
  wire  _GEN_253; // @[BusyBit.scala 31:57]
  wire  _GEN_254; // @[BusyBit.scala 31:57]
  wire  _GEN_255; // @[BusyBit.scala 31:57]
  wire  _GEN_257; // @[BusyBit.scala 32:39]
  wire  _GEN_258; // @[BusyBit.scala 32:39]
  wire  _GEN_259; // @[BusyBit.scala 32:39]
  wire  _GEN_260; // @[BusyBit.scala 32:39]
  wire  _GEN_261; // @[BusyBit.scala 32:39]
  wire  _GEN_262; // @[BusyBit.scala 32:39]
  wire  _GEN_263; // @[BusyBit.scala 32:39]
  wire  _T_37; // @[BusyBit.scala 33:62]
  wire  _T_38; // @[BusyBit.scala 33:37]
  wire  _T_39; // @[BusyBit.scala 35:48]
  wire  _T_40; // @[BusyBit.scala 35:30]
  wire  _GEN_273; // @[BusyBit.scala 36:32]
  wire  _GEN_274; // @[BusyBit.scala 36:32]
  wire  _GEN_275; // @[BusyBit.scala 36:32]
  wire  _GEN_276; // @[BusyBit.scala 36:32]
  wire  _GEN_277; // @[BusyBit.scala 36:32]
  wire  _GEN_278; // @[BusyBit.scala 36:32]
  wire  _GEN_279; // @[BusyBit.scala 36:32]
  wire  _GEN_281; // @[BusyBit.scala 35:57]
  wire  _GEN_282; // @[BusyBit.scala 35:57]
  wire  _GEN_283; // @[BusyBit.scala 35:57]
  wire  _GEN_284; // @[BusyBit.scala 35:57]
  wire  _GEN_285; // @[BusyBit.scala 35:57]
  wire  _GEN_286; // @[BusyBit.scala 35:57]
  wire  _GEN_287; // @[BusyBit.scala 35:57]
  wire  _GEN_289; // @[BusyBit.scala 33:71]
  wire  _GEN_290; // @[BusyBit.scala 33:71]
  wire  _GEN_291; // @[BusyBit.scala 33:71]
  wire  _GEN_292; // @[BusyBit.scala 33:71]
  wire  _GEN_293; // @[BusyBit.scala 33:71]
  wire  _GEN_294; // @[BusyBit.scala 33:71]
  wire  _GEN_295; // @[BusyBit.scala 33:71]
  wire  _GEN_297; // @[BusyBit.scala 31:57]
  wire  _GEN_298; // @[BusyBit.scala 31:57]
  wire  _GEN_299; // @[BusyBit.scala 31:57]
  wire  _GEN_300; // @[BusyBit.scala 31:57]
  wire  _GEN_301; // @[BusyBit.scala 31:57]
  wire  _GEN_302; // @[BusyBit.scala 31:57]
  wire  _GEN_303; // @[BusyBit.scala 31:57]
  wire  _GEN_305; // @[BusyBit.scala 32:39]
  wire  _GEN_306; // @[BusyBit.scala 32:39]
  wire  _GEN_307; // @[BusyBit.scala 32:39]
  wire  _GEN_308; // @[BusyBit.scala 32:39]
  wire  _GEN_309; // @[BusyBit.scala 32:39]
  wire  _GEN_310; // @[BusyBit.scala 32:39]
  wire  _GEN_311; // @[BusyBit.scala 32:39]
  wire  _T_42; // @[BusyBit.scala 33:62]
  wire  _T_43; // @[BusyBit.scala 33:37]
  wire  _T_44; // @[BusyBit.scala 35:48]
  wire  _T_45; // @[BusyBit.scala 35:30]
  wire  _GEN_321; // @[BusyBit.scala 36:32]
  wire  _GEN_322; // @[BusyBit.scala 36:32]
  wire  _GEN_323; // @[BusyBit.scala 36:32]
  wire  _GEN_324; // @[BusyBit.scala 36:32]
  wire  _GEN_325; // @[BusyBit.scala 36:32]
  wire  _GEN_326; // @[BusyBit.scala 36:32]
  wire  _GEN_327; // @[BusyBit.scala 36:32]
  wire  _GEN_329; // @[BusyBit.scala 35:57]
  wire  _GEN_330; // @[BusyBit.scala 35:57]
  wire  _GEN_331; // @[BusyBit.scala 35:57]
  wire  _GEN_332; // @[BusyBit.scala 35:57]
  wire  _GEN_333; // @[BusyBit.scala 35:57]
  wire  _GEN_334; // @[BusyBit.scala 35:57]
  wire  _GEN_335; // @[BusyBit.scala 35:57]
  wire  _GEN_337; // @[BusyBit.scala 33:71]
  wire  _GEN_338; // @[BusyBit.scala 33:71]
  wire  _GEN_339; // @[BusyBit.scala 33:71]
  wire  _GEN_340; // @[BusyBit.scala 33:71]
  wire  _GEN_341; // @[BusyBit.scala 33:71]
  wire  _GEN_342; // @[BusyBit.scala 33:71]
  wire  _GEN_343; // @[BusyBit.scala 33:71]
  wire  _GEN_345; // @[BusyBit.scala 31:57]
  wire  _GEN_346; // @[BusyBit.scala 31:57]
  wire  _GEN_347; // @[BusyBit.scala 31:57]
  wire  _GEN_348; // @[BusyBit.scala 31:57]
  wire  _GEN_349; // @[BusyBit.scala 31:57]
  wire  _GEN_350; // @[BusyBit.scala 31:57]
  wire  _GEN_351; // @[BusyBit.scala 31:57]
  wire  _T_47; // @[BusyBit.scala 33:62]
  wire  _T_48; // @[BusyBit.scala 33:37]
  wire  _T_49; // @[BusyBit.scala 35:48]
  wire  _T_50; // @[BusyBit.scala 35:30]
  wire  _GEN_369; // @[BusyBit.scala 36:32]
  wire  _GEN_370; // @[BusyBit.scala 36:32]
  wire  _GEN_371; // @[BusyBit.scala 36:32]
  wire  _GEN_372; // @[BusyBit.scala 36:32]
  wire  _GEN_373; // @[BusyBit.scala 36:32]
  wire  _GEN_374; // @[BusyBit.scala 36:32]
  wire  _GEN_375; // @[BusyBit.scala 36:32]
  wire  _T_51; // @[BusyBit.scala 40:9]
  wire  _T_52; // @[BusyBit.scala 40:9]
  assign _T_1 = io_release_0_rd_addr == io_req_rs_addr_0; // @[BusyBit.scala 26:78]
  assign _T_2 = io_release_0_rf_w & _T_1; // @[BusyBit.scala 26:65]
  assign _GEN_400 = 3'h1 == io_req_rs_addr_0; // @[BusyBit.scala 27:27]
  assign _GEN_1 = _GEN_400 & busy_bit_1; // @[BusyBit.scala 27:27]
  assign _GEN_2 = 3'h2 == io_req_rs_addr_0 ? busy_bit_2 : _GEN_1; // @[BusyBit.scala 27:27]
  assign _GEN_3 = 3'h3 == io_req_rs_addr_0 ? busy_bit_3 : _GEN_2; // @[BusyBit.scala 27:27]
  assign _GEN_4 = 3'h4 == io_req_rs_addr_0 ? busy_bit_4 : _GEN_3; // @[BusyBit.scala 27:27]
  assign _GEN_5 = 3'h5 == io_req_rs_addr_0 ? busy_bit_5 : _GEN_4; // @[BusyBit.scala 27:27]
  assign _GEN_6 = 3'h6 == io_req_rs_addr_0 ? busy_bit_6 : _GEN_5; // @[BusyBit.scala 27:27]
  assign _GEN_7 = 3'h7 == io_req_rs_addr_0 ? busy_bit_7 : _GEN_6; // @[BusyBit.scala 27:27]
  assign _T_4 = _GEN_7 == 1'h0; // @[BusyBit.scala 27:27]
  assign _T_6 = io_release_0_rd_addr == io_req_rs_addr_1; // @[BusyBit.scala 26:78]
  assign _T_7 = io_release_0_rf_w & _T_6; // @[BusyBit.scala 26:65]
  assign _GEN_401 = 3'h1 == io_req_rs_addr_1; // @[BusyBit.scala 27:27]
  assign _GEN_9 = _GEN_401 & busy_bit_1; // @[BusyBit.scala 27:27]
  assign _GEN_10 = 3'h2 == io_req_rs_addr_1 ? busy_bit_2 : _GEN_9; // @[BusyBit.scala 27:27]
  assign _GEN_11 = 3'h3 == io_req_rs_addr_1 ? busy_bit_3 : _GEN_10; // @[BusyBit.scala 27:27]
  assign _GEN_12 = 3'h4 == io_req_rs_addr_1 ? busy_bit_4 : _GEN_11; // @[BusyBit.scala 27:27]
  assign _GEN_13 = 3'h5 == io_req_rs_addr_1 ? busy_bit_5 : _GEN_12; // @[BusyBit.scala 27:27]
  assign _GEN_14 = 3'h6 == io_req_rs_addr_1 ? busy_bit_6 : _GEN_13; // @[BusyBit.scala 27:27]
  assign _GEN_15 = 3'h7 == io_req_rs_addr_1 ? busy_bit_7 : _GEN_14; // @[BusyBit.scala 27:27]
  assign _T_9 = _GEN_15 == 1'h0; // @[BusyBit.scala 27:27]
  assign _T_11 = io_branch_graduated & io_branch_mispredicted; // @[BusyBit.scala 31:30]
  assign _GEN_17 = 3'h1 == io_release_0_rd_addr ? 1'h0 : busy_bit_1; // @[BusyBit.scala 32:39]
  assign _GEN_18 = 3'h2 == io_release_0_rd_addr ? 1'h0 : busy_bit_2; // @[BusyBit.scala 32:39]
  assign _GEN_19 = 3'h3 == io_release_0_rd_addr ? 1'h0 : busy_bit_3; // @[BusyBit.scala 32:39]
  assign _GEN_20 = 3'h4 == io_release_0_rd_addr ? 1'h0 : busy_bit_4; // @[BusyBit.scala 32:39]
  assign _GEN_21 = 3'h5 == io_release_0_rd_addr ? 1'h0 : busy_bit_5; // @[BusyBit.scala 32:39]
  assign _GEN_22 = 3'h6 == io_release_0_rd_addr ? 1'h0 : busy_bit_6; // @[BusyBit.scala 32:39]
  assign _GEN_23 = 3'h7 == io_release_0_rd_addr ? 1'h0 : busy_bit_7; // @[BusyBit.scala 32:39]
  assign _T_12 = io_release_0_rd_addr == 3'h0; // @[BusyBit.scala 33:62]
  assign _T_13 = io_release_0_rf_w & _T_12; // @[BusyBit.scala 33:37]
  assign _T_14 = io_req_rd_addr == 3'h0; // @[BusyBit.scala 35:48]
  assign _T_15 = io_req_rd_w & _T_14; // @[BusyBit.scala 35:30]
  assign _GEN_402 = 3'h1 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_33 = _GEN_402 | busy_bit_1; // @[BusyBit.scala 36:32]
  assign _GEN_403 = 3'h2 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_34 = _GEN_403 | busy_bit_2; // @[BusyBit.scala 36:32]
  assign _GEN_404 = 3'h3 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_35 = _GEN_404 | busy_bit_3; // @[BusyBit.scala 36:32]
  assign _GEN_405 = 3'h4 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_36 = _GEN_405 | busy_bit_4; // @[BusyBit.scala 36:32]
  assign _GEN_406 = 3'h5 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_37 = _GEN_406 | busy_bit_5; // @[BusyBit.scala 36:32]
  assign _GEN_407 = 3'h6 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_38 = _GEN_407 | busy_bit_6; // @[BusyBit.scala 36:32]
  assign _GEN_408 = 3'h7 == io_req_rd_addr; // @[BusyBit.scala 36:32]
  assign _GEN_39 = _GEN_408 | busy_bit_7; // @[BusyBit.scala 36:32]
  assign _GEN_41 = _T_15 ? _GEN_33 : busy_bit_1; // @[BusyBit.scala 35:57]
  assign _GEN_42 = _T_15 ? _GEN_34 : busy_bit_2; // @[BusyBit.scala 35:57]
  assign _GEN_43 = _T_15 ? _GEN_35 : busy_bit_3; // @[BusyBit.scala 35:57]
  assign _GEN_44 = _T_15 ? _GEN_36 : busy_bit_4; // @[BusyBit.scala 35:57]
  assign _GEN_45 = _T_15 ? _GEN_37 : busy_bit_5; // @[BusyBit.scala 35:57]
  assign _GEN_46 = _T_15 ? _GEN_38 : busy_bit_6; // @[BusyBit.scala 35:57]
  assign _GEN_47 = _T_15 ? _GEN_39 : busy_bit_7; // @[BusyBit.scala 35:57]
  assign _GEN_49 = _T_13 ? _GEN_17 : _GEN_41; // @[BusyBit.scala 33:71]
  assign _GEN_50 = _T_13 ? _GEN_18 : _GEN_42; // @[BusyBit.scala 33:71]
  assign _GEN_51 = _T_13 ? _GEN_19 : _GEN_43; // @[BusyBit.scala 33:71]
  assign _GEN_52 = _T_13 ? _GEN_20 : _GEN_44; // @[BusyBit.scala 33:71]
  assign _GEN_53 = _T_13 ? _GEN_21 : _GEN_45; // @[BusyBit.scala 33:71]
  assign _GEN_54 = _T_13 ? _GEN_22 : _GEN_46; // @[BusyBit.scala 33:71]
  assign _GEN_55 = _T_13 ? _GEN_23 : _GEN_47; // @[BusyBit.scala 33:71]
  assign _GEN_57 = _T_11 ? _GEN_17 : _GEN_49; // @[BusyBit.scala 31:57]
  assign _GEN_58 = _T_11 ? _GEN_18 : _GEN_50; // @[BusyBit.scala 31:57]
  assign _GEN_59 = _T_11 ? _GEN_19 : _GEN_51; // @[BusyBit.scala 31:57]
  assign _GEN_60 = _T_11 ? _GEN_20 : _GEN_52; // @[BusyBit.scala 31:57]
  assign _GEN_61 = _T_11 ? _GEN_21 : _GEN_53; // @[BusyBit.scala 31:57]
  assign _GEN_62 = _T_11 ? _GEN_22 : _GEN_54; // @[BusyBit.scala 31:57]
  assign _GEN_63 = _T_11 ? _GEN_23 : _GEN_55; // @[BusyBit.scala 31:57]
  assign _GEN_65 = 3'h1 == io_release_0_rd_addr ? 1'h0 : _GEN_57; // @[BusyBit.scala 32:39]
  assign _GEN_66 = 3'h2 == io_release_0_rd_addr ? 1'h0 : _GEN_58; // @[BusyBit.scala 32:39]
  assign _GEN_67 = 3'h3 == io_release_0_rd_addr ? 1'h0 : _GEN_59; // @[BusyBit.scala 32:39]
  assign _GEN_68 = 3'h4 == io_release_0_rd_addr ? 1'h0 : _GEN_60; // @[BusyBit.scala 32:39]
  assign _GEN_69 = 3'h5 == io_release_0_rd_addr ? 1'h0 : _GEN_61; // @[BusyBit.scala 32:39]
  assign _GEN_70 = 3'h6 == io_release_0_rd_addr ? 1'h0 : _GEN_62; // @[BusyBit.scala 32:39]
  assign _GEN_71 = 3'h7 == io_release_0_rd_addr ? 1'h0 : _GEN_63; // @[BusyBit.scala 32:39]
  assign _T_17 = io_release_0_rd_addr == 3'h1; // @[BusyBit.scala 33:62]
  assign _T_18 = io_release_0_rf_w & _T_17; // @[BusyBit.scala 33:37]
  assign _T_19 = io_req_rd_addr == 3'h1; // @[BusyBit.scala 35:48]
  assign _T_20 = io_req_rd_w & _T_19; // @[BusyBit.scala 35:30]
  assign _GEN_81 = _GEN_402 | _GEN_57; // @[BusyBit.scala 36:32]
  assign _GEN_82 = _GEN_403 | _GEN_58; // @[BusyBit.scala 36:32]
  assign _GEN_83 = _GEN_404 | _GEN_59; // @[BusyBit.scala 36:32]
  assign _GEN_84 = _GEN_405 | _GEN_60; // @[BusyBit.scala 36:32]
  assign _GEN_85 = _GEN_406 | _GEN_61; // @[BusyBit.scala 36:32]
  assign _GEN_86 = _GEN_407 | _GEN_62; // @[BusyBit.scala 36:32]
  assign _GEN_87 = _GEN_408 | _GEN_63; // @[BusyBit.scala 36:32]
  assign _GEN_89 = _T_20 ? _GEN_81 : _GEN_57; // @[BusyBit.scala 35:57]
  assign _GEN_90 = _T_20 ? _GEN_82 : _GEN_58; // @[BusyBit.scala 35:57]
  assign _GEN_91 = _T_20 ? _GEN_83 : _GEN_59; // @[BusyBit.scala 35:57]
  assign _GEN_92 = _T_20 ? _GEN_84 : _GEN_60; // @[BusyBit.scala 35:57]
  assign _GEN_93 = _T_20 ? _GEN_85 : _GEN_61; // @[BusyBit.scala 35:57]
  assign _GEN_94 = _T_20 ? _GEN_86 : _GEN_62; // @[BusyBit.scala 35:57]
  assign _GEN_95 = _T_20 ? _GEN_87 : _GEN_63; // @[BusyBit.scala 35:57]
  assign _GEN_97 = _T_18 ? _GEN_65 : _GEN_89; // @[BusyBit.scala 33:71]
  assign _GEN_98 = _T_18 ? _GEN_66 : _GEN_90; // @[BusyBit.scala 33:71]
  assign _GEN_99 = _T_18 ? _GEN_67 : _GEN_91; // @[BusyBit.scala 33:71]
  assign _GEN_100 = _T_18 ? _GEN_68 : _GEN_92; // @[BusyBit.scala 33:71]
  assign _GEN_101 = _T_18 ? _GEN_69 : _GEN_93; // @[BusyBit.scala 33:71]
  assign _GEN_102 = _T_18 ? _GEN_70 : _GEN_94; // @[BusyBit.scala 33:71]
  assign _GEN_103 = _T_18 ? _GEN_71 : _GEN_95; // @[BusyBit.scala 33:71]
  assign _GEN_105 = _T_11 ? _GEN_65 : _GEN_97; // @[BusyBit.scala 31:57]
  assign _GEN_106 = _T_11 ? _GEN_66 : _GEN_98; // @[BusyBit.scala 31:57]
  assign _GEN_107 = _T_11 ? _GEN_67 : _GEN_99; // @[BusyBit.scala 31:57]
  assign _GEN_108 = _T_11 ? _GEN_68 : _GEN_100; // @[BusyBit.scala 31:57]
  assign _GEN_109 = _T_11 ? _GEN_69 : _GEN_101; // @[BusyBit.scala 31:57]
  assign _GEN_110 = _T_11 ? _GEN_70 : _GEN_102; // @[BusyBit.scala 31:57]
  assign _GEN_111 = _T_11 ? _GEN_71 : _GEN_103; // @[BusyBit.scala 31:57]
  assign _GEN_113 = 3'h1 == io_release_0_rd_addr ? 1'h0 : _GEN_105; // @[BusyBit.scala 32:39]
  assign _GEN_114 = 3'h2 == io_release_0_rd_addr ? 1'h0 : _GEN_106; // @[BusyBit.scala 32:39]
  assign _GEN_115 = 3'h3 == io_release_0_rd_addr ? 1'h0 : _GEN_107; // @[BusyBit.scala 32:39]
  assign _GEN_116 = 3'h4 == io_release_0_rd_addr ? 1'h0 : _GEN_108; // @[BusyBit.scala 32:39]
  assign _GEN_117 = 3'h5 == io_release_0_rd_addr ? 1'h0 : _GEN_109; // @[BusyBit.scala 32:39]
  assign _GEN_118 = 3'h6 == io_release_0_rd_addr ? 1'h0 : _GEN_110; // @[BusyBit.scala 32:39]
  assign _GEN_119 = 3'h7 == io_release_0_rd_addr ? 1'h0 : _GEN_111; // @[BusyBit.scala 32:39]
  assign _T_22 = io_release_0_rd_addr == 3'h2; // @[BusyBit.scala 33:62]
  assign _T_23 = io_release_0_rf_w & _T_22; // @[BusyBit.scala 33:37]
  assign _T_24 = io_req_rd_addr == 3'h2; // @[BusyBit.scala 35:48]
  assign _T_25 = io_req_rd_w & _T_24; // @[BusyBit.scala 35:30]
  assign _GEN_129 = _GEN_402 | _GEN_105; // @[BusyBit.scala 36:32]
  assign _GEN_130 = _GEN_403 | _GEN_106; // @[BusyBit.scala 36:32]
  assign _GEN_131 = _GEN_404 | _GEN_107; // @[BusyBit.scala 36:32]
  assign _GEN_132 = _GEN_405 | _GEN_108; // @[BusyBit.scala 36:32]
  assign _GEN_133 = _GEN_406 | _GEN_109; // @[BusyBit.scala 36:32]
  assign _GEN_134 = _GEN_407 | _GEN_110; // @[BusyBit.scala 36:32]
  assign _GEN_135 = _GEN_408 | _GEN_111; // @[BusyBit.scala 36:32]
  assign _GEN_137 = _T_25 ? _GEN_129 : _GEN_105; // @[BusyBit.scala 35:57]
  assign _GEN_138 = _T_25 ? _GEN_130 : _GEN_106; // @[BusyBit.scala 35:57]
  assign _GEN_139 = _T_25 ? _GEN_131 : _GEN_107; // @[BusyBit.scala 35:57]
  assign _GEN_140 = _T_25 ? _GEN_132 : _GEN_108; // @[BusyBit.scala 35:57]
  assign _GEN_141 = _T_25 ? _GEN_133 : _GEN_109; // @[BusyBit.scala 35:57]
  assign _GEN_142 = _T_25 ? _GEN_134 : _GEN_110; // @[BusyBit.scala 35:57]
  assign _GEN_143 = _T_25 ? _GEN_135 : _GEN_111; // @[BusyBit.scala 35:57]
  assign _GEN_145 = _T_23 ? _GEN_113 : _GEN_137; // @[BusyBit.scala 33:71]
  assign _GEN_146 = _T_23 ? _GEN_114 : _GEN_138; // @[BusyBit.scala 33:71]
  assign _GEN_147 = _T_23 ? _GEN_115 : _GEN_139; // @[BusyBit.scala 33:71]
  assign _GEN_148 = _T_23 ? _GEN_116 : _GEN_140; // @[BusyBit.scala 33:71]
  assign _GEN_149 = _T_23 ? _GEN_117 : _GEN_141; // @[BusyBit.scala 33:71]
  assign _GEN_150 = _T_23 ? _GEN_118 : _GEN_142; // @[BusyBit.scala 33:71]
  assign _GEN_151 = _T_23 ? _GEN_119 : _GEN_143; // @[BusyBit.scala 33:71]
  assign _GEN_153 = _T_11 ? _GEN_113 : _GEN_145; // @[BusyBit.scala 31:57]
  assign _GEN_154 = _T_11 ? _GEN_114 : _GEN_146; // @[BusyBit.scala 31:57]
  assign _GEN_155 = _T_11 ? _GEN_115 : _GEN_147; // @[BusyBit.scala 31:57]
  assign _GEN_156 = _T_11 ? _GEN_116 : _GEN_148; // @[BusyBit.scala 31:57]
  assign _GEN_157 = _T_11 ? _GEN_117 : _GEN_149; // @[BusyBit.scala 31:57]
  assign _GEN_158 = _T_11 ? _GEN_118 : _GEN_150; // @[BusyBit.scala 31:57]
  assign _GEN_159 = _T_11 ? _GEN_119 : _GEN_151; // @[BusyBit.scala 31:57]
  assign _GEN_161 = 3'h1 == io_release_0_rd_addr ? 1'h0 : _GEN_153; // @[BusyBit.scala 32:39]
  assign _GEN_162 = 3'h2 == io_release_0_rd_addr ? 1'h0 : _GEN_154; // @[BusyBit.scala 32:39]
  assign _GEN_163 = 3'h3 == io_release_0_rd_addr ? 1'h0 : _GEN_155; // @[BusyBit.scala 32:39]
  assign _GEN_164 = 3'h4 == io_release_0_rd_addr ? 1'h0 : _GEN_156; // @[BusyBit.scala 32:39]
  assign _GEN_165 = 3'h5 == io_release_0_rd_addr ? 1'h0 : _GEN_157; // @[BusyBit.scala 32:39]
  assign _GEN_166 = 3'h6 == io_release_0_rd_addr ? 1'h0 : _GEN_158; // @[BusyBit.scala 32:39]
  assign _GEN_167 = 3'h7 == io_release_0_rd_addr ? 1'h0 : _GEN_159; // @[BusyBit.scala 32:39]
  assign _T_27 = io_release_0_rd_addr == 3'h3; // @[BusyBit.scala 33:62]
  assign _T_28 = io_release_0_rf_w & _T_27; // @[BusyBit.scala 33:37]
  assign _T_29 = io_req_rd_addr == 3'h3; // @[BusyBit.scala 35:48]
  assign _T_30 = io_req_rd_w & _T_29; // @[BusyBit.scala 35:30]
  assign _GEN_177 = _GEN_402 | _GEN_153; // @[BusyBit.scala 36:32]
  assign _GEN_178 = _GEN_403 | _GEN_154; // @[BusyBit.scala 36:32]
  assign _GEN_179 = _GEN_404 | _GEN_155; // @[BusyBit.scala 36:32]
  assign _GEN_180 = _GEN_405 | _GEN_156; // @[BusyBit.scala 36:32]
  assign _GEN_181 = _GEN_406 | _GEN_157; // @[BusyBit.scala 36:32]
  assign _GEN_182 = _GEN_407 | _GEN_158; // @[BusyBit.scala 36:32]
  assign _GEN_183 = _GEN_408 | _GEN_159; // @[BusyBit.scala 36:32]
  assign _GEN_185 = _T_30 ? _GEN_177 : _GEN_153; // @[BusyBit.scala 35:57]
  assign _GEN_186 = _T_30 ? _GEN_178 : _GEN_154; // @[BusyBit.scala 35:57]
  assign _GEN_187 = _T_30 ? _GEN_179 : _GEN_155; // @[BusyBit.scala 35:57]
  assign _GEN_188 = _T_30 ? _GEN_180 : _GEN_156; // @[BusyBit.scala 35:57]
  assign _GEN_189 = _T_30 ? _GEN_181 : _GEN_157; // @[BusyBit.scala 35:57]
  assign _GEN_190 = _T_30 ? _GEN_182 : _GEN_158; // @[BusyBit.scala 35:57]
  assign _GEN_191 = _T_30 ? _GEN_183 : _GEN_159; // @[BusyBit.scala 35:57]
  assign _GEN_193 = _T_28 ? _GEN_161 : _GEN_185; // @[BusyBit.scala 33:71]
  assign _GEN_194 = _T_28 ? _GEN_162 : _GEN_186; // @[BusyBit.scala 33:71]
  assign _GEN_195 = _T_28 ? _GEN_163 : _GEN_187; // @[BusyBit.scala 33:71]
  assign _GEN_196 = _T_28 ? _GEN_164 : _GEN_188; // @[BusyBit.scala 33:71]
  assign _GEN_197 = _T_28 ? _GEN_165 : _GEN_189; // @[BusyBit.scala 33:71]
  assign _GEN_198 = _T_28 ? _GEN_166 : _GEN_190; // @[BusyBit.scala 33:71]
  assign _GEN_199 = _T_28 ? _GEN_167 : _GEN_191; // @[BusyBit.scala 33:71]
  assign _GEN_201 = _T_11 ? _GEN_161 : _GEN_193; // @[BusyBit.scala 31:57]
  assign _GEN_202 = _T_11 ? _GEN_162 : _GEN_194; // @[BusyBit.scala 31:57]
  assign _GEN_203 = _T_11 ? _GEN_163 : _GEN_195; // @[BusyBit.scala 31:57]
  assign _GEN_204 = _T_11 ? _GEN_164 : _GEN_196; // @[BusyBit.scala 31:57]
  assign _GEN_205 = _T_11 ? _GEN_165 : _GEN_197; // @[BusyBit.scala 31:57]
  assign _GEN_206 = _T_11 ? _GEN_166 : _GEN_198; // @[BusyBit.scala 31:57]
  assign _GEN_207 = _T_11 ? _GEN_167 : _GEN_199; // @[BusyBit.scala 31:57]
  assign _GEN_209 = 3'h1 == io_release_0_rd_addr ? 1'h0 : _GEN_201; // @[BusyBit.scala 32:39]
  assign _GEN_210 = 3'h2 == io_release_0_rd_addr ? 1'h0 : _GEN_202; // @[BusyBit.scala 32:39]
  assign _GEN_211 = 3'h3 == io_release_0_rd_addr ? 1'h0 : _GEN_203; // @[BusyBit.scala 32:39]
  assign _GEN_212 = 3'h4 == io_release_0_rd_addr ? 1'h0 : _GEN_204; // @[BusyBit.scala 32:39]
  assign _GEN_213 = 3'h5 == io_release_0_rd_addr ? 1'h0 : _GEN_205; // @[BusyBit.scala 32:39]
  assign _GEN_214 = 3'h6 == io_release_0_rd_addr ? 1'h0 : _GEN_206; // @[BusyBit.scala 32:39]
  assign _GEN_215 = 3'h7 == io_release_0_rd_addr ? 1'h0 : _GEN_207; // @[BusyBit.scala 32:39]
  assign _T_32 = io_release_0_rd_addr == 3'h4; // @[BusyBit.scala 33:62]
  assign _T_33 = io_release_0_rf_w & _T_32; // @[BusyBit.scala 33:37]
  assign _T_34 = io_req_rd_addr == 3'h4; // @[BusyBit.scala 35:48]
  assign _T_35 = io_req_rd_w & _T_34; // @[BusyBit.scala 35:30]
  assign _GEN_225 = _GEN_402 | _GEN_201; // @[BusyBit.scala 36:32]
  assign _GEN_226 = _GEN_403 | _GEN_202; // @[BusyBit.scala 36:32]
  assign _GEN_227 = _GEN_404 | _GEN_203; // @[BusyBit.scala 36:32]
  assign _GEN_228 = _GEN_405 | _GEN_204; // @[BusyBit.scala 36:32]
  assign _GEN_229 = _GEN_406 | _GEN_205; // @[BusyBit.scala 36:32]
  assign _GEN_230 = _GEN_407 | _GEN_206; // @[BusyBit.scala 36:32]
  assign _GEN_231 = _GEN_408 | _GEN_207; // @[BusyBit.scala 36:32]
  assign _GEN_233 = _T_35 ? _GEN_225 : _GEN_201; // @[BusyBit.scala 35:57]
  assign _GEN_234 = _T_35 ? _GEN_226 : _GEN_202; // @[BusyBit.scala 35:57]
  assign _GEN_235 = _T_35 ? _GEN_227 : _GEN_203; // @[BusyBit.scala 35:57]
  assign _GEN_236 = _T_35 ? _GEN_228 : _GEN_204; // @[BusyBit.scala 35:57]
  assign _GEN_237 = _T_35 ? _GEN_229 : _GEN_205; // @[BusyBit.scala 35:57]
  assign _GEN_238 = _T_35 ? _GEN_230 : _GEN_206; // @[BusyBit.scala 35:57]
  assign _GEN_239 = _T_35 ? _GEN_231 : _GEN_207; // @[BusyBit.scala 35:57]
  assign _GEN_241 = _T_33 ? _GEN_209 : _GEN_233; // @[BusyBit.scala 33:71]
  assign _GEN_242 = _T_33 ? _GEN_210 : _GEN_234; // @[BusyBit.scala 33:71]
  assign _GEN_243 = _T_33 ? _GEN_211 : _GEN_235; // @[BusyBit.scala 33:71]
  assign _GEN_244 = _T_33 ? _GEN_212 : _GEN_236; // @[BusyBit.scala 33:71]
  assign _GEN_245 = _T_33 ? _GEN_213 : _GEN_237; // @[BusyBit.scala 33:71]
  assign _GEN_246 = _T_33 ? _GEN_214 : _GEN_238; // @[BusyBit.scala 33:71]
  assign _GEN_247 = _T_33 ? _GEN_215 : _GEN_239; // @[BusyBit.scala 33:71]
  assign _GEN_249 = _T_11 ? _GEN_209 : _GEN_241; // @[BusyBit.scala 31:57]
  assign _GEN_250 = _T_11 ? _GEN_210 : _GEN_242; // @[BusyBit.scala 31:57]
  assign _GEN_251 = _T_11 ? _GEN_211 : _GEN_243; // @[BusyBit.scala 31:57]
  assign _GEN_252 = _T_11 ? _GEN_212 : _GEN_244; // @[BusyBit.scala 31:57]
  assign _GEN_253 = _T_11 ? _GEN_213 : _GEN_245; // @[BusyBit.scala 31:57]
  assign _GEN_254 = _T_11 ? _GEN_214 : _GEN_246; // @[BusyBit.scala 31:57]
  assign _GEN_255 = _T_11 ? _GEN_215 : _GEN_247; // @[BusyBit.scala 31:57]
  assign _GEN_257 = 3'h1 == io_release_0_rd_addr ? 1'h0 : _GEN_249; // @[BusyBit.scala 32:39]
  assign _GEN_258 = 3'h2 == io_release_0_rd_addr ? 1'h0 : _GEN_250; // @[BusyBit.scala 32:39]
  assign _GEN_259 = 3'h3 == io_release_0_rd_addr ? 1'h0 : _GEN_251; // @[BusyBit.scala 32:39]
  assign _GEN_260 = 3'h4 == io_release_0_rd_addr ? 1'h0 : _GEN_252; // @[BusyBit.scala 32:39]
  assign _GEN_261 = 3'h5 == io_release_0_rd_addr ? 1'h0 : _GEN_253; // @[BusyBit.scala 32:39]
  assign _GEN_262 = 3'h6 == io_release_0_rd_addr ? 1'h0 : _GEN_254; // @[BusyBit.scala 32:39]
  assign _GEN_263 = 3'h7 == io_release_0_rd_addr ? 1'h0 : _GEN_255; // @[BusyBit.scala 32:39]
  assign _T_37 = io_release_0_rd_addr == 3'h5; // @[BusyBit.scala 33:62]
  assign _T_38 = io_release_0_rf_w & _T_37; // @[BusyBit.scala 33:37]
  assign _T_39 = io_req_rd_addr == 3'h5; // @[BusyBit.scala 35:48]
  assign _T_40 = io_req_rd_w & _T_39; // @[BusyBit.scala 35:30]
  assign _GEN_273 = _GEN_402 | _GEN_249; // @[BusyBit.scala 36:32]
  assign _GEN_274 = _GEN_403 | _GEN_250; // @[BusyBit.scala 36:32]
  assign _GEN_275 = _GEN_404 | _GEN_251; // @[BusyBit.scala 36:32]
  assign _GEN_276 = _GEN_405 | _GEN_252; // @[BusyBit.scala 36:32]
  assign _GEN_277 = _GEN_406 | _GEN_253; // @[BusyBit.scala 36:32]
  assign _GEN_278 = _GEN_407 | _GEN_254; // @[BusyBit.scala 36:32]
  assign _GEN_279 = _GEN_408 | _GEN_255; // @[BusyBit.scala 36:32]
  assign _GEN_281 = _T_40 ? _GEN_273 : _GEN_249; // @[BusyBit.scala 35:57]
  assign _GEN_282 = _T_40 ? _GEN_274 : _GEN_250; // @[BusyBit.scala 35:57]
  assign _GEN_283 = _T_40 ? _GEN_275 : _GEN_251; // @[BusyBit.scala 35:57]
  assign _GEN_284 = _T_40 ? _GEN_276 : _GEN_252; // @[BusyBit.scala 35:57]
  assign _GEN_285 = _T_40 ? _GEN_277 : _GEN_253; // @[BusyBit.scala 35:57]
  assign _GEN_286 = _T_40 ? _GEN_278 : _GEN_254; // @[BusyBit.scala 35:57]
  assign _GEN_287 = _T_40 ? _GEN_279 : _GEN_255; // @[BusyBit.scala 35:57]
  assign _GEN_289 = _T_38 ? _GEN_257 : _GEN_281; // @[BusyBit.scala 33:71]
  assign _GEN_290 = _T_38 ? _GEN_258 : _GEN_282; // @[BusyBit.scala 33:71]
  assign _GEN_291 = _T_38 ? _GEN_259 : _GEN_283; // @[BusyBit.scala 33:71]
  assign _GEN_292 = _T_38 ? _GEN_260 : _GEN_284; // @[BusyBit.scala 33:71]
  assign _GEN_293 = _T_38 ? _GEN_261 : _GEN_285; // @[BusyBit.scala 33:71]
  assign _GEN_294 = _T_38 ? _GEN_262 : _GEN_286; // @[BusyBit.scala 33:71]
  assign _GEN_295 = _T_38 ? _GEN_263 : _GEN_287; // @[BusyBit.scala 33:71]
  assign _GEN_297 = _T_11 ? _GEN_257 : _GEN_289; // @[BusyBit.scala 31:57]
  assign _GEN_298 = _T_11 ? _GEN_258 : _GEN_290; // @[BusyBit.scala 31:57]
  assign _GEN_299 = _T_11 ? _GEN_259 : _GEN_291; // @[BusyBit.scala 31:57]
  assign _GEN_300 = _T_11 ? _GEN_260 : _GEN_292; // @[BusyBit.scala 31:57]
  assign _GEN_301 = _T_11 ? _GEN_261 : _GEN_293; // @[BusyBit.scala 31:57]
  assign _GEN_302 = _T_11 ? _GEN_262 : _GEN_294; // @[BusyBit.scala 31:57]
  assign _GEN_303 = _T_11 ? _GEN_263 : _GEN_295; // @[BusyBit.scala 31:57]
  assign _GEN_305 = 3'h1 == io_release_0_rd_addr ? 1'h0 : _GEN_297; // @[BusyBit.scala 32:39]
  assign _GEN_306 = 3'h2 == io_release_0_rd_addr ? 1'h0 : _GEN_298; // @[BusyBit.scala 32:39]
  assign _GEN_307 = 3'h3 == io_release_0_rd_addr ? 1'h0 : _GEN_299; // @[BusyBit.scala 32:39]
  assign _GEN_308 = 3'h4 == io_release_0_rd_addr ? 1'h0 : _GEN_300; // @[BusyBit.scala 32:39]
  assign _GEN_309 = 3'h5 == io_release_0_rd_addr ? 1'h0 : _GEN_301; // @[BusyBit.scala 32:39]
  assign _GEN_310 = 3'h6 == io_release_0_rd_addr ? 1'h0 : _GEN_302; // @[BusyBit.scala 32:39]
  assign _GEN_311 = 3'h7 == io_release_0_rd_addr ? 1'h0 : _GEN_303; // @[BusyBit.scala 32:39]
  assign _T_42 = io_release_0_rd_addr == 3'h6; // @[BusyBit.scala 33:62]
  assign _T_43 = io_release_0_rf_w & _T_42; // @[BusyBit.scala 33:37]
  assign _T_44 = io_req_rd_addr == 3'h6; // @[BusyBit.scala 35:48]
  assign _T_45 = io_req_rd_w & _T_44; // @[BusyBit.scala 35:30]
  assign _GEN_321 = _GEN_402 | _GEN_297; // @[BusyBit.scala 36:32]
  assign _GEN_322 = _GEN_403 | _GEN_298; // @[BusyBit.scala 36:32]
  assign _GEN_323 = _GEN_404 | _GEN_299; // @[BusyBit.scala 36:32]
  assign _GEN_324 = _GEN_405 | _GEN_300; // @[BusyBit.scala 36:32]
  assign _GEN_325 = _GEN_406 | _GEN_301; // @[BusyBit.scala 36:32]
  assign _GEN_326 = _GEN_407 | _GEN_302; // @[BusyBit.scala 36:32]
  assign _GEN_327 = _GEN_408 | _GEN_303; // @[BusyBit.scala 36:32]
  assign _GEN_329 = _T_45 ? _GEN_321 : _GEN_297; // @[BusyBit.scala 35:57]
  assign _GEN_330 = _T_45 ? _GEN_322 : _GEN_298; // @[BusyBit.scala 35:57]
  assign _GEN_331 = _T_45 ? _GEN_323 : _GEN_299; // @[BusyBit.scala 35:57]
  assign _GEN_332 = _T_45 ? _GEN_324 : _GEN_300; // @[BusyBit.scala 35:57]
  assign _GEN_333 = _T_45 ? _GEN_325 : _GEN_301; // @[BusyBit.scala 35:57]
  assign _GEN_334 = _T_45 ? _GEN_326 : _GEN_302; // @[BusyBit.scala 35:57]
  assign _GEN_335 = _T_45 ? _GEN_327 : _GEN_303; // @[BusyBit.scala 35:57]
  assign _GEN_337 = _T_43 ? _GEN_305 : _GEN_329; // @[BusyBit.scala 33:71]
  assign _GEN_338 = _T_43 ? _GEN_306 : _GEN_330; // @[BusyBit.scala 33:71]
  assign _GEN_339 = _T_43 ? _GEN_307 : _GEN_331; // @[BusyBit.scala 33:71]
  assign _GEN_340 = _T_43 ? _GEN_308 : _GEN_332; // @[BusyBit.scala 33:71]
  assign _GEN_341 = _T_43 ? _GEN_309 : _GEN_333; // @[BusyBit.scala 33:71]
  assign _GEN_342 = _T_43 ? _GEN_310 : _GEN_334; // @[BusyBit.scala 33:71]
  assign _GEN_343 = _T_43 ? _GEN_311 : _GEN_335; // @[BusyBit.scala 33:71]
  assign _GEN_345 = _T_11 ? _GEN_305 : _GEN_337; // @[BusyBit.scala 31:57]
  assign _GEN_346 = _T_11 ? _GEN_306 : _GEN_338; // @[BusyBit.scala 31:57]
  assign _GEN_347 = _T_11 ? _GEN_307 : _GEN_339; // @[BusyBit.scala 31:57]
  assign _GEN_348 = _T_11 ? _GEN_308 : _GEN_340; // @[BusyBit.scala 31:57]
  assign _GEN_349 = _T_11 ? _GEN_309 : _GEN_341; // @[BusyBit.scala 31:57]
  assign _GEN_350 = _T_11 ? _GEN_310 : _GEN_342; // @[BusyBit.scala 31:57]
  assign _GEN_351 = _T_11 ? _GEN_311 : _GEN_343; // @[BusyBit.scala 31:57]
  assign _T_47 = io_release_0_rd_addr == 3'h7; // @[BusyBit.scala 33:62]
  assign _T_48 = io_release_0_rf_w & _T_47; // @[BusyBit.scala 33:37]
  assign _T_49 = io_req_rd_addr == 3'h7; // @[BusyBit.scala 35:48]
  assign _T_50 = io_req_rd_w & _T_49; // @[BusyBit.scala 35:30]
  assign _GEN_369 = _GEN_402 | _GEN_345; // @[BusyBit.scala 36:32]
  assign _GEN_370 = _GEN_403 | _GEN_346; // @[BusyBit.scala 36:32]
  assign _GEN_371 = _GEN_404 | _GEN_347; // @[BusyBit.scala 36:32]
  assign _GEN_372 = _GEN_405 | _GEN_348; // @[BusyBit.scala 36:32]
  assign _GEN_373 = _GEN_406 | _GEN_349; // @[BusyBit.scala 36:32]
  assign _GEN_374 = _GEN_407 | _GEN_350; // @[BusyBit.scala 36:32]
  assign _GEN_375 = _GEN_408 | _GEN_351; // @[BusyBit.scala 36:32]
  assign _T_51 = $unsigned(reset); // @[BusyBit.scala 40:9]
  assign _T_52 = _T_51 == 1'h0; // @[BusyBit.scala 40:9]
  assign io_rs_available_0 = _T_4 | _T_2; // @[BusyBit.scala 27:24]
  assign io_rs_available_1 = _T_9 | _T_7; // @[BusyBit.scala 27:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy_bit_1 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  busy_bit_2 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  busy_bit_3 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  busy_bit_4 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  busy_bit_5 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  busy_bit_6 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  busy_bit_7 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      busy_bit_1 <= 1'h0;
    end else if (_T_11) begin
      if (3'h1 == io_release_0_rd_addr) begin
        busy_bit_1 <= 1'h0;
      end else if (_T_11) begin
        if (3'h1 == io_release_0_rd_addr) begin
          busy_bit_1 <= 1'h0;
        end else if (_T_11) begin
          if (3'h1 == io_release_0_rd_addr) begin
            busy_bit_1 <= 1'h0;
          end else if (_T_11) begin
            if (3'h1 == io_release_0_rd_addr) begin
              busy_bit_1 <= 1'h0;
            end else if (_T_11) begin
              if (3'h1 == io_release_0_rd_addr) begin
                busy_bit_1 <= 1'h0;
              end else if (_T_11) begin
                if (3'h1 == io_release_0_rd_addr) begin
                  busy_bit_1 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h1 == io_release_0_rd_addr) begin
                    busy_bit_1 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h1 == io_release_0_rd_addr) begin
                      busy_bit_1 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h1 == io_release_0_rd_addr) begin
                      busy_bit_1 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_1 <= _GEN_33;
                  end
                end else if (_T_18) begin
                  if (3'h1 == io_release_0_rd_addr) begin
                    busy_bit_1 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h1 == io_release_0_rd_addr) begin
                      busy_bit_1 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h1 == io_release_0_rd_addr) begin
                      busy_bit_1 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_1 <= _GEN_33;
                  end
                end else if (_T_20) begin
                  busy_bit_1 <= _GEN_81;
                end else if (_T_11) begin
                  busy_bit_1 <= _GEN_17;
                end else if (_T_13) begin
                  busy_bit_1 <= _GEN_17;
                end else if (_T_15) begin
                  busy_bit_1 <= _GEN_33;
                end
              end else if (_T_23) begin
                if (3'h1 == io_release_0_rd_addr) begin
                  busy_bit_1 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h1 == io_release_0_rd_addr) begin
                    busy_bit_1 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_1 <= _GEN_17;
                  end else if (_T_13) begin
                    busy_bit_1 <= _GEN_17;
                  end else if (_T_15) begin
                    busy_bit_1 <= _GEN_33;
                  end
                end else if (_T_18) begin
                  if (3'h1 == io_release_0_rd_addr) begin
                    busy_bit_1 <= 1'h0;
                  end else begin
                    busy_bit_1 <= _GEN_57;
                  end
                end else if (_T_20) begin
                  busy_bit_1 <= _GEN_81;
                end else begin
                  busy_bit_1 <= _GEN_57;
                end
              end else if (_T_25) begin
                busy_bit_1 <= _GEN_129;
              end else if (_T_11) begin
                busy_bit_1 <= _GEN_65;
              end else if (_T_18) begin
                busy_bit_1 <= _GEN_65;
              end else if (_T_20) begin
                busy_bit_1 <= _GEN_81;
              end else begin
                busy_bit_1 <= _GEN_57;
              end
            end else if (_T_28) begin
              if (3'h1 == io_release_0_rd_addr) begin
                busy_bit_1 <= 1'h0;
              end else if (_T_11) begin
                if (3'h1 == io_release_0_rd_addr) begin
                  busy_bit_1 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_1 <= _GEN_65;
                end else if (_T_18) begin
                  busy_bit_1 <= _GEN_65;
                end else if (_T_20) begin
                  busy_bit_1 <= _GEN_81;
                end else begin
                  busy_bit_1 <= _GEN_57;
                end
              end else if (_T_23) begin
                if (3'h1 == io_release_0_rd_addr) begin
                  busy_bit_1 <= 1'h0;
                end else begin
                  busy_bit_1 <= _GEN_105;
                end
              end else if (_T_25) begin
                busy_bit_1 <= _GEN_129;
              end else begin
                busy_bit_1 <= _GEN_105;
              end
            end else if (_T_30) begin
              busy_bit_1 <= _GEN_177;
            end else if (_T_11) begin
              busy_bit_1 <= _GEN_113;
            end else if (_T_23) begin
              busy_bit_1 <= _GEN_113;
            end else if (_T_25) begin
              busy_bit_1 <= _GEN_129;
            end else begin
              busy_bit_1 <= _GEN_105;
            end
          end else if (_T_33) begin
            if (3'h1 == io_release_0_rd_addr) begin
              busy_bit_1 <= 1'h0;
            end else if (_T_11) begin
              if (3'h1 == io_release_0_rd_addr) begin
                busy_bit_1 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_1 <= _GEN_113;
              end else if (_T_23) begin
                busy_bit_1 <= _GEN_113;
              end else if (_T_25) begin
                busy_bit_1 <= _GEN_129;
              end else begin
                busy_bit_1 <= _GEN_105;
              end
            end else if (_T_28) begin
              if (3'h1 == io_release_0_rd_addr) begin
                busy_bit_1 <= 1'h0;
              end else begin
                busy_bit_1 <= _GEN_153;
              end
            end else if (_T_30) begin
              busy_bit_1 <= _GEN_177;
            end else begin
              busy_bit_1 <= _GEN_153;
            end
          end else if (_T_35) begin
            busy_bit_1 <= _GEN_225;
          end else if (_T_11) begin
            busy_bit_1 <= _GEN_161;
          end else if (_T_28) begin
            busy_bit_1 <= _GEN_161;
          end else if (_T_30) begin
            busy_bit_1 <= _GEN_177;
          end else begin
            busy_bit_1 <= _GEN_153;
          end
        end else if (_T_38) begin
          if (3'h1 == io_release_0_rd_addr) begin
            busy_bit_1 <= 1'h0;
          end else if (_T_11) begin
            if (3'h1 == io_release_0_rd_addr) begin
              busy_bit_1 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_1 <= _GEN_161;
            end else if (_T_28) begin
              busy_bit_1 <= _GEN_161;
            end else if (_T_30) begin
              busy_bit_1 <= _GEN_177;
            end else begin
              busy_bit_1 <= _GEN_153;
            end
          end else if (_T_33) begin
            if (3'h1 == io_release_0_rd_addr) begin
              busy_bit_1 <= 1'h0;
            end else begin
              busy_bit_1 <= _GEN_201;
            end
          end else if (_T_35) begin
            busy_bit_1 <= _GEN_225;
          end else begin
            busy_bit_1 <= _GEN_201;
          end
        end else if (_T_40) begin
          busy_bit_1 <= _GEN_273;
        end else if (_T_11) begin
          busy_bit_1 <= _GEN_209;
        end else if (_T_33) begin
          busy_bit_1 <= _GEN_209;
        end else if (_T_35) begin
          busy_bit_1 <= _GEN_225;
        end else begin
          busy_bit_1 <= _GEN_201;
        end
      end else if (_T_43) begin
        if (3'h1 == io_release_0_rd_addr) begin
          busy_bit_1 <= 1'h0;
        end else if (_T_11) begin
          if (3'h1 == io_release_0_rd_addr) begin
            busy_bit_1 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_1 <= _GEN_209;
          end else if (_T_33) begin
            busy_bit_1 <= _GEN_209;
          end else if (_T_35) begin
            busy_bit_1 <= _GEN_225;
          end else begin
            busy_bit_1 <= _GEN_201;
          end
        end else if (_T_38) begin
          if (3'h1 == io_release_0_rd_addr) begin
            busy_bit_1 <= 1'h0;
          end else begin
            busy_bit_1 <= _GEN_249;
          end
        end else if (_T_40) begin
          busy_bit_1 <= _GEN_273;
        end else begin
          busy_bit_1 <= _GEN_249;
        end
      end else if (_T_45) begin
        busy_bit_1 <= _GEN_321;
      end else if (_T_11) begin
        busy_bit_1 <= _GEN_257;
      end else if (_T_38) begin
        busy_bit_1 <= _GEN_257;
      end else if (_T_40) begin
        busy_bit_1 <= _GEN_273;
      end else begin
        busy_bit_1 <= _GEN_249;
      end
    end else if (_T_48) begin
      if (3'h1 == io_release_0_rd_addr) begin
        busy_bit_1 <= 1'h0;
      end else if (_T_11) begin
        if (3'h1 == io_release_0_rd_addr) begin
          busy_bit_1 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_1 <= _GEN_257;
        end else if (_T_38) begin
          busy_bit_1 <= _GEN_257;
        end else if (_T_40) begin
          busy_bit_1 <= _GEN_273;
        end else begin
          busy_bit_1 <= _GEN_249;
        end
      end else if (_T_43) begin
        if (3'h1 == io_release_0_rd_addr) begin
          busy_bit_1 <= 1'h0;
        end else begin
          busy_bit_1 <= _GEN_297;
        end
      end else if (_T_45) begin
        busy_bit_1 <= _GEN_321;
      end else begin
        busy_bit_1 <= _GEN_297;
      end
    end else if (_T_50) begin
      busy_bit_1 <= _GEN_369;
    end else if (_T_11) begin
      busy_bit_1 <= _GEN_305;
    end else if (_T_43) begin
      busy_bit_1 <= _GEN_305;
    end else if (_T_45) begin
      busy_bit_1 <= _GEN_321;
    end else begin
      busy_bit_1 <= _GEN_297;
    end
    if (reset) begin
      busy_bit_2 <= 1'h0;
    end else if (_T_11) begin
      if (3'h2 == io_release_0_rd_addr) begin
        busy_bit_2 <= 1'h0;
      end else if (_T_11) begin
        if (3'h2 == io_release_0_rd_addr) begin
          busy_bit_2 <= 1'h0;
        end else if (_T_11) begin
          if (3'h2 == io_release_0_rd_addr) begin
            busy_bit_2 <= 1'h0;
          end else if (_T_11) begin
            if (3'h2 == io_release_0_rd_addr) begin
              busy_bit_2 <= 1'h0;
            end else if (_T_11) begin
              if (3'h2 == io_release_0_rd_addr) begin
                busy_bit_2 <= 1'h0;
              end else if (_T_11) begin
                if (3'h2 == io_release_0_rd_addr) begin
                  busy_bit_2 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h2 == io_release_0_rd_addr) begin
                    busy_bit_2 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h2 == io_release_0_rd_addr) begin
                      busy_bit_2 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h2 == io_release_0_rd_addr) begin
                      busy_bit_2 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_2 <= _GEN_34;
                  end
                end else if (_T_18) begin
                  if (3'h2 == io_release_0_rd_addr) begin
                    busy_bit_2 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h2 == io_release_0_rd_addr) begin
                      busy_bit_2 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h2 == io_release_0_rd_addr) begin
                      busy_bit_2 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_2 <= _GEN_34;
                  end
                end else if (_T_20) begin
                  busy_bit_2 <= _GEN_82;
                end else if (_T_11) begin
                  busy_bit_2 <= _GEN_18;
                end else if (_T_13) begin
                  busy_bit_2 <= _GEN_18;
                end else if (_T_15) begin
                  busy_bit_2 <= _GEN_34;
                end
              end else if (_T_23) begin
                if (3'h2 == io_release_0_rd_addr) begin
                  busy_bit_2 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h2 == io_release_0_rd_addr) begin
                    busy_bit_2 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_2 <= _GEN_18;
                  end else if (_T_13) begin
                    busy_bit_2 <= _GEN_18;
                  end else if (_T_15) begin
                    busy_bit_2 <= _GEN_34;
                  end
                end else if (_T_18) begin
                  if (3'h2 == io_release_0_rd_addr) begin
                    busy_bit_2 <= 1'h0;
                  end else begin
                    busy_bit_2 <= _GEN_58;
                  end
                end else if (_T_20) begin
                  busy_bit_2 <= _GEN_82;
                end else begin
                  busy_bit_2 <= _GEN_58;
                end
              end else if (_T_25) begin
                busy_bit_2 <= _GEN_130;
              end else if (_T_11) begin
                busy_bit_2 <= _GEN_66;
              end else if (_T_18) begin
                busy_bit_2 <= _GEN_66;
              end else if (_T_20) begin
                busy_bit_2 <= _GEN_82;
              end else begin
                busy_bit_2 <= _GEN_58;
              end
            end else if (_T_28) begin
              if (3'h2 == io_release_0_rd_addr) begin
                busy_bit_2 <= 1'h0;
              end else if (_T_11) begin
                if (3'h2 == io_release_0_rd_addr) begin
                  busy_bit_2 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_2 <= _GEN_66;
                end else if (_T_18) begin
                  busy_bit_2 <= _GEN_66;
                end else if (_T_20) begin
                  busy_bit_2 <= _GEN_82;
                end else begin
                  busy_bit_2 <= _GEN_58;
                end
              end else if (_T_23) begin
                if (3'h2 == io_release_0_rd_addr) begin
                  busy_bit_2 <= 1'h0;
                end else begin
                  busy_bit_2 <= _GEN_106;
                end
              end else if (_T_25) begin
                busy_bit_2 <= _GEN_130;
              end else begin
                busy_bit_2 <= _GEN_106;
              end
            end else if (_T_30) begin
              busy_bit_2 <= _GEN_178;
            end else if (_T_11) begin
              busy_bit_2 <= _GEN_114;
            end else if (_T_23) begin
              busy_bit_2 <= _GEN_114;
            end else if (_T_25) begin
              busy_bit_2 <= _GEN_130;
            end else begin
              busy_bit_2 <= _GEN_106;
            end
          end else if (_T_33) begin
            if (3'h2 == io_release_0_rd_addr) begin
              busy_bit_2 <= 1'h0;
            end else if (_T_11) begin
              if (3'h2 == io_release_0_rd_addr) begin
                busy_bit_2 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_2 <= _GEN_114;
              end else if (_T_23) begin
                busy_bit_2 <= _GEN_114;
              end else if (_T_25) begin
                busy_bit_2 <= _GEN_130;
              end else begin
                busy_bit_2 <= _GEN_106;
              end
            end else if (_T_28) begin
              if (3'h2 == io_release_0_rd_addr) begin
                busy_bit_2 <= 1'h0;
              end else begin
                busy_bit_2 <= _GEN_154;
              end
            end else if (_T_30) begin
              busy_bit_2 <= _GEN_178;
            end else begin
              busy_bit_2 <= _GEN_154;
            end
          end else if (_T_35) begin
            busy_bit_2 <= _GEN_226;
          end else if (_T_11) begin
            busy_bit_2 <= _GEN_162;
          end else if (_T_28) begin
            busy_bit_2 <= _GEN_162;
          end else if (_T_30) begin
            busy_bit_2 <= _GEN_178;
          end else begin
            busy_bit_2 <= _GEN_154;
          end
        end else if (_T_38) begin
          if (3'h2 == io_release_0_rd_addr) begin
            busy_bit_2 <= 1'h0;
          end else if (_T_11) begin
            if (3'h2 == io_release_0_rd_addr) begin
              busy_bit_2 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_2 <= _GEN_162;
            end else if (_T_28) begin
              busy_bit_2 <= _GEN_162;
            end else if (_T_30) begin
              busy_bit_2 <= _GEN_178;
            end else begin
              busy_bit_2 <= _GEN_154;
            end
          end else if (_T_33) begin
            if (3'h2 == io_release_0_rd_addr) begin
              busy_bit_2 <= 1'h0;
            end else begin
              busy_bit_2 <= _GEN_202;
            end
          end else if (_T_35) begin
            busy_bit_2 <= _GEN_226;
          end else begin
            busy_bit_2 <= _GEN_202;
          end
        end else if (_T_40) begin
          busy_bit_2 <= _GEN_274;
        end else if (_T_11) begin
          busy_bit_2 <= _GEN_210;
        end else if (_T_33) begin
          busy_bit_2 <= _GEN_210;
        end else if (_T_35) begin
          busy_bit_2 <= _GEN_226;
        end else begin
          busy_bit_2 <= _GEN_202;
        end
      end else if (_T_43) begin
        if (3'h2 == io_release_0_rd_addr) begin
          busy_bit_2 <= 1'h0;
        end else if (_T_11) begin
          if (3'h2 == io_release_0_rd_addr) begin
            busy_bit_2 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_2 <= _GEN_210;
          end else if (_T_33) begin
            busy_bit_2 <= _GEN_210;
          end else if (_T_35) begin
            busy_bit_2 <= _GEN_226;
          end else begin
            busy_bit_2 <= _GEN_202;
          end
        end else if (_T_38) begin
          if (3'h2 == io_release_0_rd_addr) begin
            busy_bit_2 <= 1'h0;
          end else begin
            busy_bit_2 <= _GEN_250;
          end
        end else if (_T_40) begin
          busy_bit_2 <= _GEN_274;
        end else begin
          busy_bit_2 <= _GEN_250;
        end
      end else if (_T_45) begin
        busy_bit_2 <= _GEN_322;
      end else if (_T_11) begin
        busy_bit_2 <= _GEN_258;
      end else if (_T_38) begin
        busy_bit_2 <= _GEN_258;
      end else if (_T_40) begin
        busy_bit_2 <= _GEN_274;
      end else begin
        busy_bit_2 <= _GEN_250;
      end
    end else if (_T_48) begin
      if (3'h2 == io_release_0_rd_addr) begin
        busy_bit_2 <= 1'h0;
      end else if (_T_11) begin
        if (3'h2 == io_release_0_rd_addr) begin
          busy_bit_2 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_2 <= _GEN_258;
        end else if (_T_38) begin
          busy_bit_2 <= _GEN_258;
        end else if (_T_40) begin
          busy_bit_2 <= _GEN_274;
        end else begin
          busy_bit_2 <= _GEN_250;
        end
      end else if (_T_43) begin
        if (3'h2 == io_release_0_rd_addr) begin
          busy_bit_2 <= 1'h0;
        end else begin
          busy_bit_2 <= _GEN_298;
        end
      end else if (_T_45) begin
        busy_bit_2 <= _GEN_322;
      end else begin
        busy_bit_2 <= _GEN_298;
      end
    end else if (_T_50) begin
      busy_bit_2 <= _GEN_370;
    end else if (_T_11) begin
      busy_bit_2 <= _GEN_306;
    end else if (_T_43) begin
      busy_bit_2 <= _GEN_306;
    end else if (_T_45) begin
      busy_bit_2 <= _GEN_322;
    end else begin
      busy_bit_2 <= _GEN_298;
    end
    if (reset) begin
      busy_bit_3 <= 1'h0;
    end else if (_T_11) begin
      if (3'h3 == io_release_0_rd_addr) begin
        busy_bit_3 <= 1'h0;
      end else if (_T_11) begin
        if (3'h3 == io_release_0_rd_addr) begin
          busy_bit_3 <= 1'h0;
        end else if (_T_11) begin
          if (3'h3 == io_release_0_rd_addr) begin
            busy_bit_3 <= 1'h0;
          end else if (_T_11) begin
            if (3'h3 == io_release_0_rd_addr) begin
              busy_bit_3 <= 1'h0;
            end else if (_T_11) begin
              if (3'h3 == io_release_0_rd_addr) begin
                busy_bit_3 <= 1'h0;
              end else if (_T_11) begin
                if (3'h3 == io_release_0_rd_addr) begin
                  busy_bit_3 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h3 == io_release_0_rd_addr) begin
                    busy_bit_3 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h3 == io_release_0_rd_addr) begin
                      busy_bit_3 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h3 == io_release_0_rd_addr) begin
                      busy_bit_3 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_3 <= _GEN_35;
                  end
                end else if (_T_18) begin
                  if (3'h3 == io_release_0_rd_addr) begin
                    busy_bit_3 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h3 == io_release_0_rd_addr) begin
                      busy_bit_3 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h3 == io_release_0_rd_addr) begin
                      busy_bit_3 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_3 <= _GEN_35;
                  end
                end else if (_T_20) begin
                  busy_bit_3 <= _GEN_83;
                end else if (_T_11) begin
                  busy_bit_3 <= _GEN_19;
                end else if (_T_13) begin
                  busy_bit_3 <= _GEN_19;
                end else if (_T_15) begin
                  busy_bit_3 <= _GEN_35;
                end
              end else if (_T_23) begin
                if (3'h3 == io_release_0_rd_addr) begin
                  busy_bit_3 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h3 == io_release_0_rd_addr) begin
                    busy_bit_3 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_3 <= _GEN_19;
                  end else if (_T_13) begin
                    busy_bit_3 <= _GEN_19;
                  end else if (_T_15) begin
                    busy_bit_3 <= _GEN_35;
                  end
                end else if (_T_18) begin
                  if (3'h3 == io_release_0_rd_addr) begin
                    busy_bit_3 <= 1'h0;
                  end else begin
                    busy_bit_3 <= _GEN_59;
                  end
                end else if (_T_20) begin
                  busy_bit_3 <= _GEN_83;
                end else begin
                  busy_bit_3 <= _GEN_59;
                end
              end else if (_T_25) begin
                busy_bit_3 <= _GEN_131;
              end else if (_T_11) begin
                busy_bit_3 <= _GEN_67;
              end else if (_T_18) begin
                busy_bit_3 <= _GEN_67;
              end else if (_T_20) begin
                busy_bit_3 <= _GEN_83;
              end else begin
                busy_bit_3 <= _GEN_59;
              end
            end else if (_T_28) begin
              if (3'h3 == io_release_0_rd_addr) begin
                busy_bit_3 <= 1'h0;
              end else if (_T_11) begin
                if (3'h3 == io_release_0_rd_addr) begin
                  busy_bit_3 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_3 <= _GEN_67;
                end else if (_T_18) begin
                  busy_bit_3 <= _GEN_67;
                end else if (_T_20) begin
                  busy_bit_3 <= _GEN_83;
                end else begin
                  busy_bit_3 <= _GEN_59;
                end
              end else if (_T_23) begin
                if (3'h3 == io_release_0_rd_addr) begin
                  busy_bit_3 <= 1'h0;
                end else begin
                  busy_bit_3 <= _GEN_107;
                end
              end else if (_T_25) begin
                busy_bit_3 <= _GEN_131;
              end else begin
                busy_bit_3 <= _GEN_107;
              end
            end else if (_T_30) begin
              busy_bit_3 <= _GEN_179;
            end else if (_T_11) begin
              busy_bit_3 <= _GEN_115;
            end else if (_T_23) begin
              busy_bit_3 <= _GEN_115;
            end else if (_T_25) begin
              busy_bit_3 <= _GEN_131;
            end else begin
              busy_bit_3 <= _GEN_107;
            end
          end else if (_T_33) begin
            if (3'h3 == io_release_0_rd_addr) begin
              busy_bit_3 <= 1'h0;
            end else if (_T_11) begin
              if (3'h3 == io_release_0_rd_addr) begin
                busy_bit_3 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_3 <= _GEN_115;
              end else if (_T_23) begin
                busy_bit_3 <= _GEN_115;
              end else if (_T_25) begin
                busy_bit_3 <= _GEN_131;
              end else begin
                busy_bit_3 <= _GEN_107;
              end
            end else if (_T_28) begin
              if (3'h3 == io_release_0_rd_addr) begin
                busy_bit_3 <= 1'h0;
              end else begin
                busy_bit_3 <= _GEN_155;
              end
            end else if (_T_30) begin
              busy_bit_3 <= _GEN_179;
            end else begin
              busy_bit_3 <= _GEN_155;
            end
          end else if (_T_35) begin
            busy_bit_3 <= _GEN_227;
          end else if (_T_11) begin
            busy_bit_3 <= _GEN_163;
          end else if (_T_28) begin
            busy_bit_3 <= _GEN_163;
          end else if (_T_30) begin
            busy_bit_3 <= _GEN_179;
          end else begin
            busy_bit_3 <= _GEN_155;
          end
        end else if (_T_38) begin
          if (3'h3 == io_release_0_rd_addr) begin
            busy_bit_3 <= 1'h0;
          end else if (_T_11) begin
            if (3'h3 == io_release_0_rd_addr) begin
              busy_bit_3 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_3 <= _GEN_163;
            end else if (_T_28) begin
              busy_bit_3 <= _GEN_163;
            end else if (_T_30) begin
              busy_bit_3 <= _GEN_179;
            end else begin
              busy_bit_3 <= _GEN_155;
            end
          end else if (_T_33) begin
            if (3'h3 == io_release_0_rd_addr) begin
              busy_bit_3 <= 1'h0;
            end else begin
              busy_bit_3 <= _GEN_203;
            end
          end else if (_T_35) begin
            busy_bit_3 <= _GEN_227;
          end else begin
            busy_bit_3 <= _GEN_203;
          end
        end else if (_T_40) begin
          busy_bit_3 <= _GEN_275;
        end else if (_T_11) begin
          busy_bit_3 <= _GEN_211;
        end else if (_T_33) begin
          busy_bit_3 <= _GEN_211;
        end else if (_T_35) begin
          busy_bit_3 <= _GEN_227;
        end else begin
          busy_bit_3 <= _GEN_203;
        end
      end else if (_T_43) begin
        if (3'h3 == io_release_0_rd_addr) begin
          busy_bit_3 <= 1'h0;
        end else if (_T_11) begin
          if (3'h3 == io_release_0_rd_addr) begin
            busy_bit_3 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_3 <= _GEN_211;
          end else if (_T_33) begin
            busy_bit_3 <= _GEN_211;
          end else if (_T_35) begin
            busy_bit_3 <= _GEN_227;
          end else begin
            busy_bit_3 <= _GEN_203;
          end
        end else if (_T_38) begin
          if (3'h3 == io_release_0_rd_addr) begin
            busy_bit_3 <= 1'h0;
          end else begin
            busy_bit_3 <= _GEN_251;
          end
        end else if (_T_40) begin
          busy_bit_3 <= _GEN_275;
        end else begin
          busy_bit_3 <= _GEN_251;
        end
      end else if (_T_45) begin
        busy_bit_3 <= _GEN_323;
      end else if (_T_11) begin
        busy_bit_3 <= _GEN_259;
      end else if (_T_38) begin
        busy_bit_3 <= _GEN_259;
      end else if (_T_40) begin
        busy_bit_3 <= _GEN_275;
      end else begin
        busy_bit_3 <= _GEN_251;
      end
    end else if (_T_48) begin
      if (3'h3 == io_release_0_rd_addr) begin
        busy_bit_3 <= 1'h0;
      end else if (_T_11) begin
        if (3'h3 == io_release_0_rd_addr) begin
          busy_bit_3 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_3 <= _GEN_259;
        end else if (_T_38) begin
          busy_bit_3 <= _GEN_259;
        end else if (_T_40) begin
          busy_bit_3 <= _GEN_275;
        end else begin
          busy_bit_3 <= _GEN_251;
        end
      end else if (_T_43) begin
        if (3'h3 == io_release_0_rd_addr) begin
          busy_bit_3 <= 1'h0;
        end else begin
          busy_bit_3 <= _GEN_299;
        end
      end else if (_T_45) begin
        busy_bit_3 <= _GEN_323;
      end else begin
        busy_bit_3 <= _GEN_299;
      end
    end else if (_T_50) begin
      busy_bit_3 <= _GEN_371;
    end else if (_T_11) begin
      busy_bit_3 <= _GEN_307;
    end else if (_T_43) begin
      busy_bit_3 <= _GEN_307;
    end else if (_T_45) begin
      busy_bit_3 <= _GEN_323;
    end else begin
      busy_bit_3 <= _GEN_299;
    end
    if (reset) begin
      busy_bit_4 <= 1'h0;
    end else if (_T_11) begin
      if (3'h4 == io_release_0_rd_addr) begin
        busy_bit_4 <= 1'h0;
      end else if (_T_11) begin
        if (3'h4 == io_release_0_rd_addr) begin
          busy_bit_4 <= 1'h0;
        end else if (_T_11) begin
          if (3'h4 == io_release_0_rd_addr) begin
            busy_bit_4 <= 1'h0;
          end else if (_T_11) begin
            if (3'h4 == io_release_0_rd_addr) begin
              busy_bit_4 <= 1'h0;
            end else if (_T_11) begin
              if (3'h4 == io_release_0_rd_addr) begin
                busy_bit_4 <= 1'h0;
              end else if (_T_11) begin
                if (3'h4 == io_release_0_rd_addr) begin
                  busy_bit_4 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h4 == io_release_0_rd_addr) begin
                    busy_bit_4 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h4 == io_release_0_rd_addr) begin
                      busy_bit_4 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h4 == io_release_0_rd_addr) begin
                      busy_bit_4 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_4 <= _GEN_36;
                  end
                end else if (_T_18) begin
                  if (3'h4 == io_release_0_rd_addr) begin
                    busy_bit_4 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h4 == io_release_0_rd_addr) begin
                      busy_bit_4 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h4 == io_release_0_rd_addr) begin
                      busy_bit_4 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_4 <= _GEN_36;
                  end
                end else if (_T_20) begin
                  busy_bit_4 <= _GEN_84;
                end else if (_T_11) begin
                  busy_bit_4 <= _GEN_20;
                end else if (_T_13) begin
                  busy_bit_4 <= _GEN_20;
                end else if (_T_15) begin
                  busy_bit_4 <= _GEN_36;
                end
              end else if (_T_23) begin
                if (3'h4 == io_release_0_rd_addr) begin
                  busy_bit_4 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h4 == io_release_0_rd_addr) begin
                    busy_bit_4 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_4 <= _GEN_20;
                  end else if (_T_13) begin
                    busy_bit_4 <= _GEN_20;
                  end else if (_T_15) begin
                    busy_bit_4 <= _GEN_36;
                  end
                end else if (_T_18) begin
                  if (3'h4 == io_release_0_rd_addr) begin
                    busy_bit_4 <= 1'h0;
                  end else begin
                    busy_bit_4 <= _GEN_60;
                  end
                end else if (_T_20) begin
                  busy_bit_4 <= _GEN_84;
                end else begin
                  busy_bit_4 <= _GEN_60;
                end
              end else if (_T_25) begin
                busy_bit_4 <= _GEN_132;
              end else if (_T_11) begin
                busy_bit_4 <= _GEN_68;
              end else if (_T_18) begin
                busy_bit_4 <= _GEN_68;
              end else if (_T_20) begin
                busy_bit_4 <= _GEN_84;
              end else begin
                busy_bit_4 <= _GEN_60;
              end
            end else if (_T_28) begin
              if (3'h4 == io_release_0_rd_addr) begin
                busy_bit_4 <= 1'h0;
              end else if (_T_11) begin
                if (3'h4 == io_release_0_rd_addr) begin
                  busy_bit_4 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_4 <= _GEN_68;
                end else if (_T_18) begin
                  busy_bit_4 <= _GEN_68;
                end else if (_T_20) begin
                  busy_bit_4 <= _GEN_84;
                end else begin
                  busy_bit_4 <= _GEN_60;
                end
              end else if (_T_23) begin
                if (3'h4 == io_release_0_rd_addr) begin
                  busy_bit_4 <= 1'h0;
                end else begin
                  busy_bit_4 <= _GEN_108;
                end
              end else if (_T_25) begin
                busy_bit_4 <= _GEN_132;
              end else begin
                busy_bit_4 <= _GEN_108;
              end
            end else if (_T_30) begin
              busy_bit_4 <= _GEN_180;
            end else if (_T_11) begin
              busy_bit_4 <= _GEN_116;
            end else if (_T_23) begin
              busy_bit_4 <= _GEN_116;
            end else if (_T_25) begin
              busy_bit_4 <= _GEN_132;
            end else begin
              busy_bit_4 <= _GEN_108;
            end
          end else if (_T_33) begin
            if (3'h4 == io_release_0_rd_addr) begin
              busy_bit_4 <= 1'h0;
            end else if (_T_11) begin
              if (3'h4 == io_release_0_rd_addr) begin
                busy_bit_4 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_4 <= _GEN_116;
              end else if (_T_23) begin
                busy_bit_4 <= _GEN_116;
              end else if (_T_25) begin
                busy_bit_4 <= _GEN_132;
              end else begin
                busy_bit_4 <= _GEN_108;
              end
            end else if (_T_28) begin
              if (3'h4 == io_release_0_rd_addr) begin
                busy_bit_4 <= 1'h0;
              end else begin
                busy_bit_4 <= _GEN_156;
              end
            end else if (_T_30) begin
              busy_bit_4 <= _GEN_180;
            end else begin
              busy_bit_4 <= _GEN_156;
            end
          end else if (_T_35) begin
            busy_bit_4 <= _GEN_228;
          end else if (_T_11) begin
            busy_bit_4 <= _GEN_164;
          end else if (_T_28) begin
            busy_bit_4 <= _GEN_164;
          end else if (_T_30) begin
            busy_bit_4 <= _GEN_180;
          end else begin
            busy_bit_4 <= _GEN_156;
          end
        end else if (_T_38) begin
          if (3'h4 == io_release_0_rd_addr) begin
            busy_bit_4 <= 1'h0;
          end else if (_T_11) begin
            if (3'h4 == io_release_0_rd_addr) begin
              busy_bit_4 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_4 <= _GEN_164;
            end else if (_T_28) begin
              busy_bit_4 <= _GEN_164;
            end else if (_T_30) begin
              busy_bit_4 <= _GEN_180;
            end else begin
              busy_bit_4 <= _GEN_156;
            end
          end else if (_T_33) begin
            if (3'h4 == io_release_0_rd_addr) begin
              busy_bit_4 <= 1'h0;
            end else begin
              busy_bit_4 <= _GEN_204;
            end
          end else if (_T_35) begin
            busy_bit_4 <= _GEN_228;
          end else begin
            busy_bit_4 <= _GEN_204;
          end
        end else if (_T_40) begin
          busy_bit_4 <= _GEN_276;
        end else if (_T_11) begin
          busy_bit_4 <= _GEN_212;
        end else if (_T_33) begin
          busy_bit_4 <= _GEN_212;
        end else if (_T_35) begin
          busy_bit_4 <= _GEN_228;
        end else begin
          busy_bit_4 <= _GEN_204;
        end
      end else if (_T_43) begin
        if (3'h4 == io_release_0_rd_addr) begin
          busy_bit_4 <= 1'h0;
        end else if (_T_11) begin
          if (3'h4 == io_release_0_rd_addr) begin
            busy_bit_4 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_4 <= _GEN_212;
          end else if (_T_33) begin
            busy_bit_4 <= _GEN_212;
          end else if (_T_35) begin
            busy_bit_4 <= _GEN_228;
          end else begin
            busy_bit_4 <= _GEN_204;
          end
        end else if (_T_38) begin
          if (3'h4 == io_release_0_rd_addr) begin
            busy_bit_4 <= 1'h0;
          end else begin
            busy_bit_4 <= _GEN_252;
          end
        end else if (_T_40) begin
          busy_bit_4 <= _GEN_276;
        end else begin
          busy_bit_4 <= _GEN_252;
        end
      end else if (_T_45) begin
        busy_bit_4 <= _GEN_324;
      end else if (_T_11) begin
        busy_bit_4 <= _GEN_260;
      end else if (_T_38) begin
        busy_bit_4 <= _GEN_260;
      end else if (_T_40) begin
        busy_bit_4 <= _GEN_276;
      end else begin
        busy_bit_4 <= _GEN_252;
      end
    end else if (_T_48) begin
      if (3'h4 == io_release_0_rd_addr) begin
        busy_bit_4 <= 1'h0;
      end else if (_T_11) begin
        if (3'h4 == io_release_0_rd_addr) begin
          busy_bit_4 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_4 <= _GEN_260;
        end else if (_T_38) begin
          busy_bit_4 <= _GEN_260;
        end else if (_T_40) begin
          busy_bit_4 <= _GEN_276;
        end else begin
          busy_bit_4 <= _GEN_252;
        end
      end else if (_T_43) begin
        if (3'h4 == io_release_0_rd_addr) begin
          busy_bit_4 <= 1'h0;
        end else begin
          busy_bit_4 <= _GEN_300;
        end
      end else if (_T_45) begin
        busy_bit_4 <= _GEN_324;
      end else begin
        busy_bit_4 <= _GEN_300;
      end
    end else if (_T_50) begin
      busy_bit_4 <= _GEN_372;
    end else if (_T_11) begin
      busy_bit_4 <= _GEN_308;
    end else if (_T_43) begin
      busy_bit_4 <= _GEN_308;
    end else if (_T_45) begin
      busy_bit_4 <= _GEN_324;
    end else begin
      busy_bit_4 <= _GEN_300;
    end
    if (reset) begin
      busy_bit_5 <= 1'h0;
    end else if (_T_11) begin
      if (3'h5 == io_release_0_rd_addr) begin
        busy_bit_5 <= 1'h0;
      end else if (_T_11) begin
        if (3'h5 == io_release_0_rd_addr) begin
          busy_bit_5 <= 1'h0;
        end else if (_T_11) begin
          if (3'h5 == io_release_0_rd_addr) begin
            busy_bit_5 <= 1'h0;
          end else if (_T_11) begin
            if (3'h5 == io_release_0_rd_addr) begin
              busy_bit_5 <= 1'h0;
            end else if (_T_11) begin
              if (3'h5 == io_release_0_rd_addr) begin
                busy_bit_5 <= 1'h0;
              end else if (_T_11) begin
                if (3'h5 == io_release_0_rd_addr) begin
                  busy_bit_5 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h5 == io_release_0_rd_addr) begin
                    busy_bit_5 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h5 == io_release_0_rd_addr) begin
                      busy_bit_5 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h5 == io_release_0_rd_addr) begin
                      busy_bit_5 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_5 <= _GEN_37;
                  end
                end else if (_T_18) begin
                  if (3'h5 == io_release_0_rd_addr) begin
                    busy_bit_5 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h5 == io_release_0_rd_addr) begin
                      busy_bit_5 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h5 == io_release_0_rd_addr) begin
                      busy_bit_5 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_5 <= _GEN_37;
                  end
                end else if (_T_20) begin
                  busy_bit_5 <= _GEN_85;
                end else if (_T_11) begin
                  busy_bit_5 <= _GEN_21;
                end else if (_T_13) begin
                  busy_bit_5 <= _GEN_21;
                end else if (_T_15) begin
                  busy_bit_5 <= _GEN_37;
                end
              end else if (_T_23) begin
                if (3'h5 == io_release_0_rd_addr) begin
                  busy_bit_5 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h5 == io_release_0_rd_addr) begin
                    busy_bit_5 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_5 <= _GEN_21;
                  end else if (_T_13) begin
                    busy_bit_5 <= _GEN_21;
                  end else if (_T_15) begin
                    busy_bit_5 <= _GEN_37;
                  end
                end else if (_T_18) begin
                  if (3'h5 == io_release_0_rd_addr) begin
                    busy_bit_5 <= 1'h0;
                  end else begin
                    busy_bit_5 <= _GEN_61;
                  end
                end else if (_T_20) begin
                  busy_bit_5 <= _GEN_85;
                end else begin
                  busy_bit_5 <= _GEN_61;
                end
              end else if (_T_25) begin
                busy_bit_5 <= _GEN_133;
              end else if (_T_11) begin
                busy_bit_5 <= _GEN_69;
              end else if (_T_18) begin
                busy_bit_5 <= _GEN_69;
              end else if (_T_20) begin
                busy_bit_5 <= _GEN_85;
              end else begin
                busy_bit_5 <= _GEN_61;
              end
            end else if (_T_28) begin
              if (3'h5 == io_release_0_rd_addr) begin
                busy_bit_5 <= 1'h0;
              end else if (_T_11) begin
                if (3'h5 == io_release_0_rd_addr) begin
                  busy_bit_5 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_5 <= _GEN_69;
                end else if (_T_18) begin
                  busy_bit_5 <= _GEN_69;
                end else if (_T_20) begin
                  busy_bit_5 <= _GEN_85;
                end else begin
                  busy_bit_5 <= _GEN_61;
                end
              end else if (_T_23) begin
                if (3'h5 == io_release_0_rd_addr) begin
                  busy_bit_5 <= 1'h0;
                end else begin
                  busy_bit_5 <= _GEN_109;
                end
              end else if (_T_25) begin
                busy_bit_5 <= _GEN_133;
              end else begin
                busy_bit_5 <= _GEN_109;
              end
            end else if (_T_30) begin
              busy_bit_5 <= _GEN_181;
            end else if (_T_11) begin
              busy_bit_5 <= _GEN_117;
            end else if (_T_23) begin
              busy_bit_5 <= _GEN_117;
            end else if (_T_25) begin
              busy_bit_5 <= _GEN_133;
            end else begin
              busy_bit_5 <= _GEN_109;
            end
          end else if (_T_33) begin
            if (3'h5 == io_release_0_rd_addr) begin
              busy_bit_5 <= 1'h0;
            end else if (_T_11) begin
              if (3'h5 == io_release_0_rd_addr) begin
                busy_bit_5 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_5 <= _GEN_117;
              end else if (_T_23) begin
                busy_bit_5 <= _GEN_117;
              end else if (_T_25) begin
                busy_bit_5 <= _GEN_133;
              end else begin
                busy_bit_5 <= _GEN_109;
              end
            end else if (_T_28) begin
              if (3'h5 == io_release_0_rd_addr) begin
                busy_bit_5 <= 1'h0;
              end else begin
                busy_bit_5 <= _GEN_157;
              end
            end else if (_T_30) begin
              busy_bit_5 <= _GEN_181;
            end else begin
              busy_bit_5 <= _GEN_157;
            end
          end else if (_T_35) begin
            busy_bit_5 <= _GEN_229;
          end else if (_T_11) begin
            busy_bit_5 <= _GEN_165;
          end else if (_T_28) begin
            busy_bit_5 <= _GEN_165;
          end else if (_T_30) begin
            busy_bit_5 <= _GEN_181;
          end else begin
            busy_bit_5 <= _GEN_157;
          end
        end else if (_T_38) begin
          if (3'h5 == io_release_0_rd_addr) begin
            busy_bit_5 <= 1'h0;
          end else if (_T_11) begin
            if (3'h5 == io_release_0_rd_addr) begin
              busy_bit_5 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_5 <= _GEN_165;
            end else if (_T_28) begin
              busy_bit_5 <= _GEN_165;
            end else if (_T_30) begin
              busy_bit_5 <= _GEN_181;
            end else begin
              busy_bit_5 <= _GEN_157;
            end
          end else if (_T_33) begin
            if (3'h5 == io_release_0_rd_addr) begin
              busy_bit_5 <= 1'h0;
            end else begin
              busy_bit_5 <= _GEN_205;
            end
          end else if (_T_35) begin
            busy_bit_5 <= _GEN_229;
          end else begin
            busy_bit_5 <= _GEN_205;
          end
        end else if (_T_40) begin
          busy_bit_5 <= _GEN_277;
        end else if (_T_11) begin
          busy_bit_5 <= _GEN_213;
        end else if (_T_33) begin
          busy_bit_5 <= _GEN_213;
        end else if (_T_35) begin
          busy_bit_5 <= _GEN_229;
        end else begin
          busy_bit_5 <= _GEN_205;
        end
      end else if (_T_43) begin
        if (3'h5 == io_release_0_rd_addr) begin
          busy_bit_5 <= 1'h0;
        end else if (_T_11) begin
          if (3'h5 == io_release_0_rd_addr) begin
            busy_bit_5 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_5 <= _GEN_213;
          end else if (_T_33) begin
            busy_bit_5 <= _GEN_213;
          end else if (_T_35) begin
            busy_bit_5 <= _GEN_229;
          end else begin
            busy_bit_5 <= _GEN_205;
          end
        end else if (_T_38) begin
          if (3'h5 == io_release_0_rd_addr) begin
            busy_bit_5 <= 1'h0;
          end else begin
            busy_bit_5 <= _GEN_253;
          end
        end else if (_T_40) begin
          busy_bit_5 <= _GEN_277;
        end else begin
          busy_bit_5 <= _GEN_253;
        end
      end else if (_T_45) begin
        busy_bit_5 <= _GEN_325;
      end else if (_T_11) begin
        busy_bit_5 <= _GEN_261;
      end else if (_T_38) begin
        busy_bit_5 <= _GEN_261;
      end else if (_T_40) begin
        busy_bit_5 <= _GEN_277;
      end else begin
        busy_bit_5 <= _GEN_253;
      end
    end else if (_T_48) begin
      if (3'h5 == io_release_0_rd_addr) begin
        busy_bit_5 <= 1'h0;
      end else if (_T_11) begin
        if (3'h5 == io_release_0_rd_addr) begin
          busy_bit_5 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_5 <= _GEN_261;
        end else if (_T_38) begin
          busy_bit_5 <= _GEN_261;
        end else if (_T_40) begin
          busy_bit_5 <= _GEN_277;
        end else begin
          busy_bit_5 <= _GEN_253;
        end
      end else if (_T_43) begin
        if (3'h5 == io_release_0_rd_addr) begin
          busy_bit_5 <= 1'h0;
        end else begin
          busy_bit_5 <= _GEN_301;
        end
      end else if (_T_45) begin
        busy_bit_5 <= _GEN_325;
      end else begin
        busy_bit_5 <= _GEN_301;
      end
    end else if (_T_50) begin
      busy_bit_5 <= _GEN_373;
    end else if (_T_11) begin
      busy_bit_5 <= _GEN_309;
    end else if (_T_43) begin
      busy_bit_5 <= _GEN_309;
    end else if (_T_45) begin
      busy_bit_5 <= _GEN_325;
    end else begin
      busy_bit_5 <= _GEN_301;
    end
    if (reset) begin
      busy_bit_6 <= 1'h0;
    end else if (_T_11) begin
      if (3'h6 == io_release_0_rd_addr) begin
        busy_bit_6 <= 1'h0;
      end else if (_T_11) begin
        if (3'h6 == io_release_0_rd_addr) begin
          busy_bit_6 <= 1'h0;
        end else if (_T_11) begin
          if (3'h6 == io_release_0_rd_addr) begin
            busy_bit_6 <= 1'h0;
          end else if (_T_11) begin
            if (3'h6 == io_release_0_rd_addr) begin
              busy_bit_6 <= 1'h0;
            end else if (_T_11) begin
              if (3'h6 == io_release_0_rd_addr) begin
                busy_bit_6 <= 1'h0;
              end else if (_T_11) begin
                if (3'h6 == io_release_0_rd_addr) begin
                  busy_bit_6 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h6 == io_release_0_rd_addr) begin
                    busy_bit_6 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h6 == io_release_0_rd_addr) begin
                      busy_bit_6 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h6 == io_release_0_rd_addr) begin
                      busy_bit_6 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_6 <= _GEN_38;
                  end
                end else if (_T_18) begin
                  if (3'h6 == io_release_0_rd_addr) begin
                    busy_bit_6 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h6 == io_release_0_rd_addr) begin
                      busy_bit_6 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h6 == io_release_0_rd_addr) begin
                      busy_bit_6 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_6 <= _GEN_38;
                  end
                end else if (_T_20) begin
                  busy_bit_6 <= _GEN_86;
                end else if (_T_11) begin
                  busy_bit_6 <= _GEN_22;
                end else if (_T_13) begin
                  busy_bit_6 <= _GEN_22;
                end else if (_T_15) begin
                  busy_bit_6 <= _GEN_38;
                end
              end else if (_T_23) begin
                if (3'h6 == io_release_0_rd_addr) begin
                  busy_bit_6 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h6 == io_release_0_rd_addr) begin
                    busy_bit_6 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_6 <= _GEN_22;
                  end else if (_T_13) begin
                    busy_bit_6 <= _GEN_22;
                  end else if (_T_15) begin
                    busy_bit_6 <= _GEN_38;
                  end
                end else if (_T_18) begin
                  if (3'h6 == io_release_0_rd_addr) begin
                    busy_bit_6 <= 1'h0;
                  end else begin
                    busy_bit_6 <= _GEN_62;
                  end
                end else if (_T_20) begin
                  busy_bit_6 <= _GEN_86;
                end else begin
                  busy_bit_6 <= _GEN_62;
                end
              end else if (_T_25) begin
                busy_bit_6 <= _GEN_134;
              end else if (_T_11) begin
                busy_bit_6 <= _GEN_70;
              end else if (_T_18) begin
                busy_bit_6 <= _GEN_70;
              end else if (_T_20) begin
                busy_bit_6 <= _GEN_86;
              end else begin
                busy_bit_6 <= _GEN_62;
              end
            end else if (_T_28) begin
              if (3'h6 == io_release_0_rd_addr) begin
                busy_bit_6 <= 1'h0;
              end else if (_T_11) begin
                if (3'h6 == io_release_0_rd_addr) begin
                  busy_bit_6 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_6 <= _GEN_70;
                end else if (_T_18) begin
                  busy_bit_6 <= _GEN_70;
                end else if (_T_20) begin
                  busy_bit_6 <= _GEN_86;
                end else begin
                  busy_bit_6 <= _GEN_62;
                end
              end else if (_T_23) begin
                if (3'h6 == io_release_0_rd_addr) begin
                  busy_bit_6 <= 1'h0;
                end else begin
                  busy_bit_6 <= _GEN_110;
                end
              end else if (_T_25) begin
                busy_bit_6 <= _GEN_134;
              end else begin
                busy_bit_6 <= _GEN_110;
              end
            end else if (_T_30) begin
              busy_bit_6 <= _GEN_182;
            end else if (_T_11) begin
              busy_bit_6 <= _GEN_118;
            end else if (_T_23) begin
              busy_bit_6 <= _GEN_118;
            end else if (_T_25) begin
              busy_bit_6 <= _GEN_134;
            end else begin
              busy_bit_6 <= _GEN_110;
            end
          end else if (_T_33) begin
            if (3'h6 == io_release_0_rd_addr) begin
              busy_bit_6 <= 1'h0;
            end else if (_T_11) begin
              if (3'h6 == io_release_0_rd_addr) begin
                busy_bit_6 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_6 <= _GEN_118;
              end else if (_T_23) begin
                busy_bit_6 <= _GEN_118;
              end else if (_T_25) begin
                busy_bit_6 <= _GEN_134;
              end else begin
                busy_bit_6 <= _GEN_110;
              end
            end else if (_T_28) begin
              if (3'h6 == io_release_0_rd_addr) begin
                busy_bit_6 <= 1'h0;
              end else begin
                busy_bit_6 <= _GEN_158;
              end
            end else if (_T_30) begin
              busy_bit_6 <= _GEN_182;
            end else begin
              busy_bit_6 <= _GEN_158;
            end
          end else if (_T_35) begin
            busy_bit_6 <= _GEN_230;
          end else if (_T_11) begin
            busy_bit_6 <= _GEN_166;
          end else if (_T_28) begin
            busy_bit_6 <= _GEN_166;
          end else if (_T_30) begin
            busy_bit_6 <= _GEN_182;
          end else begin
            busy_bit_6 <= _GEN_158;
          end
        end else if (_T_38) begin
          if (3'h6 == io_release_0_rd_addr) begin
            busy_bit_6 <= 1'h0;
          end else if (_T_11) begin
            if (3'h6 == io_release_0_rd_addr) begin
              busy_bit_6 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_6 <= _GEN_166;
            end else if (_T_28) begin
              busy_bit_6 <= _GEN_166;
            end else if (_T_30) begin
              busy_bit_6 <= _GEN_182;
            end else begin
              busy_bit_6 <= _GEN_158;
            end
          end else if (_T_33) begin
            if (3'h6 == io_release_0_rd_addr) begin
              busy_bit_6 <= 1'h0;
            end else begin
              busy_bit_6 <= _GEN_206;
            end
          end else if (_T_35) begin
            busy_bit_6 <= _GEN_230;
          end else begin
            busy_bit_6 <= _GEN_206;
          end
        end else if (_T_40) begin
          busy_bit_6 <= _GEN_278;
        end else if (_T_11) begin
          busy_bit_6 <= _GEN_214;
        end else if (_T_33) begin
          busy_bit_6 <= _GEN_214;
        end else if (_T_35) begin
          busy_bit_6 <= _GEN_230;
        end else begin
          busy_bit_6 <= _GEN_206;
        end
      end else if (_T_43) begin
        if (3'h6 == io_release_0_rd_addr) begin
          busy_bit_6 <= 1'h0;
        end else if (_T_11) begin
          if (3'h6 == io_release_0_rd_addr) begin
            busy_bit_6 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_6 <= _GEN_214;
          end else if (_T_33) begin
            busy_bit_6 <= _GEN_214;
          end else if (_T_35) begin
            busy_bit_6 <= _GEN_230;
          end else begin
            busy_bit_6 <= _GEN_206;
          end
        end else if (_T_38) begin
          if (3'h6 == io_release_0_rd_addr) begin
            busy_bit_6 <= 1'h0;
          end else begin
            busy_bit_6 <= _GEN_254;
          end
        end else if (_T_40) begin
          busy_bit_6 <= _GEN_278;
        end else begin
          busy_bit_6 <= _GEN_254;
        end
      end else if (_T_45) begin
        busy_bit_6 <= _GEN_326;
      end else if (_T_11) begin
        busy_bit_6 <= _GEN_262;
      end else if (_T_38) begin
        busy_bit_6 <= _GEN_262;
      end else if (_T_40) begin
        busy_bit_6 <= _GEN_278;
      end else begin
        busy_bit_6 <= _GEN_254;
      end
    end else if (_T_48) begin
      if (3'h6 == io_release_0_rd_addr) begin
        busy_bit_6 <= 1'h0;
      end else if (_T_11) begin
        if (3'h6 == io_release_0_rd_addr) begin
          busy_bit_6 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_6 <= _GEN_262;
        end else if (_T_38) begin
          busy_bit_6 <= _GEN_262;
        end else if (_T_40) begin
          busy_bit_6 <= _GEN_278;
        end else begin
          busy_bit_6 <= _GEN_254;
        end
      end else if (_T_43) begin
        if (3'h6 == io_release_0_rd_addr) begin
          busy_bit_6 <= 1'h0;
        end else begin
          busy_bit_6 <= _GEN_302;
        end
      end else if (_T_45) begin
        busy_bit_6 <= _GEN_326;
      end else begin
        busy_bit_6 <= _GEN_302;
      end
    end else if (_T_50) begin
      busy_bit_6 <= _GEN_374;
    end else if (_T_11) begin
      busy_bit_6 <= _GEN_310;
    end else if (_T_43) begin
      busy_bit_6 <= _GEN_310;
    end else if (_T_45) begin
      busy_bit_6 <= _GEN_326;
    end else begin
      busy_bit_6 <= _GEN_302;
    end
    if (reset) begin
      busy_bit_7 <= 1'h0;
    end else if (_T_11) begin
      if (3'h7 == io_release_0_rd_addr) begin
        busy_bit_7 <= 1'h0;
      end else if (_T_11) begin
        if (3'h7 == io_release_0_rd_addr) begin
          busy_bit_7 <= 1'h0;
        end else if (_T_11) begin
          if (3'h7 == io_release_0_rd_addr) begin
            busy_bit_7 <= 1'h0;
          end else if (_T_11) begin
            if (3'h7 == io_release_0_rd_addr) begin
              busy_bit_7 <= 1'h0;
            end else if (_T_11) begin
              if (3'h7 == io_release_0_rd_addr) begin
                busy_bit_7 <= 1'h0;
              end else if (_T_11) begin
                if (3'h7 == io_release_0_rd_addr) begin
                  busy_bit_7 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h7 == io_release_0_rd_addr) begin
                    busy_bit_7 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h7 == io_release_0_rd_addr) begin
                      busy_bit_7 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h7 == io_release_0_rd_addr) begin
                      busy_bit_7 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_7 <= _GEN_39;
                  end
                end else if (_T_18) begin
                  if (3'h7 == io_release_0_rd_addr) begin
                    busy_bit_7 <= 1'h0;
                  end else if (_T_11) begin
                    if (3'h7 == io_release_0_rd_addr) begin
                      busy_bit_7 <= 1'h0;
                    end
                  end else if (_T_13) begin
                    if (3'h7 == io_release_0_rd_addr) begin
                      busy_bit_7 <= 1'h0;
                    end
                  end else if (_T_15) begin
                    busy_bit_7 <= _GEN_39;
                  end
                end else if (_T_20) begin
                  busy_bit_7 <= _GEN_87;
                end else if (_T_11) begin
                  busy_bit_7 <= _GEN_23;
                end else if (_T_13) begin
                  busy_bit_7 <= _GEN_23;
                end else if (_T_15) begin
                  busy_bit_7 <= _GEN_39;
                end
              end else if (_T_23) begin
                if (3'h7 == io_release_0_rd_addr) begin
                  busy_bit_7 <= 1'h0;
                end else if (_T_11) begin
                  if (3'h7 == io_release_0_rd_addr) begin
                    busy_bit_7 <= 1'h0;
                  end else if (_T_11) begin
                    busy_bit_7 <= _GEN_23;
                  end else if (_T_13) begin
                    busy_bit_7 <= _GEN_23;
                  end else if (_T_15) begin
                    busy_bit_7 <= _GEN_39;
                  end
                end else if (_T_18) begin
                  if (3'h7 == io_release_0_rd_addr) begin
                    busy_bit_7 <= 1'h0;
                  end else begin
                    busy_bit_7 <= _GEN_63;
                  end
                end else if (_T_20) begin
                  busy_bit_7 <= _GEN_87;
                end else begin
                  busy_bit_7 <= _GEN_63;
                end
              end else if (_T_25) begin
                busy_bit_7 <= _GEN_135;
              end else if (_T_11) begin
                busy_bit_7 <= _GEN_71;
              end else if (_T_18) begin
                busy_bit_7 <= _GEN_71;
              end else if (_T_20) begin
                busy_bit_7 <= _GEN_87;
              end else begin
                busy_bit_7 <= _GEN_63;
              end
            end else if (_T_28) begin
              if (3'h7 == io_release_0_rd_addr) begin
                busy_bit_7 <= 1'h0;
              end else if (_T_11) begin
                if (3'h7 == io_release_0_rd_addr) begin
                  busy_bit_7 <= 1'h0;
                end else if (_T_11) begin
                  busy_bit_7 <= _GEN_71;
                end else if (_T_18) begin
                  busy_bit_7 <= _GEN_71;
                end else if (_T_20) begin
                  busy_bit_7 <= _GEN_87;
                end else begin
                  busy_bit_7 <= _GEN_63;
                end
              end else if (_T_23) begin
                if (3'h7 == io_release_0_rd_addr) begin
                  busy_bit_7 <= 1'h0;
                end else begin
                  busy_bit_7 <= _GEN_111;
                end
              end else if (_T_25) begin
                busy_bit_7 <= _GEN_135;
              end else begin
                busy_bit_7 <= _GEN_111;
              end
            end else if (_T_30) begin
              busy_bit_7 <= _GEN_183;
            end else if (_T_11) begin
              busy_bit_7 <= _GEN_119;
            end else if (_T_23) begin
              busy_bit_7 <= _GEN_119;
            end else if (_T_25) begin
              busy_bit_7 <= _GEN_135;
            end else begin
              busy_bit_7 <= _GEN_111;
            end
          end else if (_T_33) begin
            if (3'h7 == io_release_0_rd_addr) begin
              busy_bit_7 <= 1'h0;
            end else if (_T_11) begin
              if (3'h7 == io_release_0_rd_addr) begin
                busy_bit_7 <= 1'h0;
              end else if (_T_11) begin
                busy_bit_7 <= _GEN_119;
              end else if (_T_23) begin
                busy_bit_7 <= _GEN_119;
              end else if (_T_25) begin
                busy_bit_7 <= _GEN_135;
              end else begin
                busy_bit_7 <= _GEN_111;
              end
            end else if (_T_28) begin
              if (3'h7 == io_release_0_rd_addr) begin
                busy_bit_7 <= 1'h0;
              end else begin
                busy_bit_7 <= _GEN_159;
              end
            end else if (_T_30) begin
              busy_bit_7 <= _GEN_183;
            end else begin
              busy_bit_7 <= _GEN_159;
            end
          end else if (_T_35) begin
            busy_bit_7 <= _GEN_231;
          end else if (_T_11) begin
            busy_bit_7 <= _GEN_167;
          end else if (_T_28) begin
            busy_bit_7 <= _GEN_167;
          end else if (_T_30) begin
            busy_bit_7 <= _GEN_183;
          end else begin
            busy_bit_7 <= _GEN_159;
          end
        end else if (_T_38) begin
          if (3'h7 == io_release_0_rd_addr) begin
            busy_bit_7 <= 1'h0;
          end else if (_T_11) begin
            if (3'h7 == io_release_0_rd_addr) begin
              busy_bit_7 <= 1'h0;
            end else if (_T_11) begin
              busy_bit_7 <= _GEN_167;
            end else if (_T_28) begin
              busy_bit_7 <= _GEN_167;
            end else if (_T_30) begin
              busy_bit_7 <= _GEN_183;
            end else begin
              busy_bit_7 <= _GEN_159;
            end
          end else if (_T_33) begin
            if (3'h7 == io_release_0_rd_addr) begin
              busy_bit_7 <= 1'h0;
            end else begin
              busy_bit_7 <= _GEN_207;
            end
          end else if (_T_35) begin
            busy_bit_7 <= _GEN_231;
          end else begin
            busy_bit_7 <= _GEN_207;
          end
        end else if (_T_40) begin
          busy_bit_7 <= _GEN_279;
        end else if (_T_11) begin
          busy_bit_7 <= _GEN_215;
        end else if (_T_33) begin
          busy_bit_7 <= _GEN_215;
        end else if (_T_35) begin
          busy_bit_7 <= _GEN_231;
        end else begin
          busy_bit_7 <= _GEN_207;
        end
      end else if (_T_43) begin
        if (3'h7 == io_release_0_rd_addr) begin
          busy_bit_7 <= 1'h0;
        end else if (_T_11) begin
          if (3'h7 == io_release_0_rd_addr) begin
            busy_bit_7 <= 1'h0;
          end else if (_T_11) begin
            busy_bit_7 <= _GEN_215;
          end else if (_T_33) begin
            busy_bit_7 <= _GEN_215;
          end else if (_T_35) begin
            busy_bit_7 <= _GEN_231;
          end else begin
            busy_bit_7 <= _GEN_207;
          end
        end else if (_T_38) begin
          if (3'h7 == io_release_0_rd_addr) begin
            busy_bit_7 <= 1'h0;
          end else begin
            busy_bit_7 <= _GEN_255;
          end
        end else if (_T_40) begin
          busy_bit_7 <= _GEN_279;
        end else begin
          busy_bit_7 <= _GEN_255;
        end
      end else if (_T_45) begin
        busy_bit_7 <= _GEN_327;
      end else if (_T_11) begin
        busy_bit_7 <= _GEN_263;
      end else if (_T_38) begin
        busy_bit_7 <= _GEN_263;
      end else if (_T_40) begin
        busy_bit_7 <= _GEN_279;
      end else begin
        busy_bit_7 <= _GEN_255;
      end
    end else if (_T_48) begin
      if (3'h7 == io_release_0_rd_addr) begin
        busy_bit_7 <= 1'h0;
      end else if (_T_11) begin
        if (3'h7 == io_release_0_rd_addr) begin
          busy_bit_7 <= 1'h0;
        end else if (_T_11) begin
          busy_bit_7 <= _GEN_263;
        end else if (_T_38) begin
          busy_bit_7 <= _GEN_263;
        end else if (_T_40) begin
          busy_bit_7 <= _GEN_279;
        end else begin
          busy_bit_7 <= _GEN_255;
        end
      end else if (_T_43) begin
        if (3'h7 == io_release_0_rd_addr) begin
          busy_bit_7 <= 1'h0;
        end else begin
          busy_bit_7 <= _GEN_303;
        end
      end else if (_T_45) begin
        busy_bit_7 <= _GEN_327;
      end else begin
        busy_bit_7 <= _GEN_303;
      end
    end else if (_T_50) begin
      busy_bit_7 <= _GEN_375;
    end else if (_T_11) begin
      busy_bit_7 <= _GEN_311;
    end else if (_T_43) begin
      busy_bit_7 <= _GEN_311;
    end else if (_T_45) begin
      busy_bit_7 <= _GEN_327;
    end else begin
      busy_bit_7 <= _GEN_303;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"busy_bit: "); // @[BusyBit.scala 40:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",1'h0); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_1); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_2); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_3); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_4); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_5); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_6); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"%d, ",busy_bit_7); // @[BusyBit.scala 40:57]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_52) begin
          $fwrite(32'h80000002,"\n"); // @[BusyBit.scala 40:86]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ID(
  input         clock,
  input         reset,
  input         io_branch_mispredicted,
  input         io_branch_graduated,
  input  [15:0] io_if_out_pc,
  input  [3:0]  io_if_out_inst_bits_op,
  input  [2:0]  io_if_out_inst_bits_rd,
  input  [2:0]  io_if_out_inst_bits_rs,
  input  [5:0]  io_if_out_inst_bits_disp6u,
  input  [2:0]  io_rf_write_0_rd_addr,
  input         io_rf_write_0_rf_w,
  input  [15:0] io_rf_write_0_data,
  output [15:0] io_next_pc,
  output [2:0]  io_ctrl_rd_addr,
  output [2:0]  io_ctrl_alu_op,
  output        io_ctrl_is_jump,
  output        io_ctrl_is_branch,
  output        io_ctrl_rf_w,
  output [15:0] io_source_0,
  output [15:0] io_source_1,
  output        io_stall,
  output [15:0] io_rf4debug_1,
  output [15:0] io_rf4debug_2,
  output [15:0] io_rf4debug_3,
  output [15:0] io_rf4debug_4,
  output [15:0] io_rf4debug_5,
  output [15:0] io_rf4debug_6,
  output [15:0] io_rf4debug_7
);
  wire [3:0] decoder_io_inst_bits_op; // @[ID.scala 43:32]
  wire [2:0] decoder_io_inst_bits_rd; // @[ID.scala 43:32]
  wire [2:0] decoder_io_ctrl_rd_addr; // @[ID.scala 43:32]
  wire [2:0] decoder_io_ctrl_alu_op; // @[ID.scala 43:32]
  wire  decoder_io_ctrl_is_jump; // @[ID.scala 43:32]
  wire  decoder_io_ctrl_is_branch; // @[ID.scala 43:32]
  wire  decoder_io_ctrl_rf_w; // @[ID.scala 43:32]
  wire  decoder_io_ctrl_rs1_use; // @[ID.scala 43:32]
  wire  decoder_io_ctrl_rs2_use; // @[ID.scala 43:32]
  wire [15:0] decoder_io_source_sel_0; // @[ID.scala 43:32]
  wire [15:0] decoder_io_source_sel_1; // @[ID.scala 43:32]
  wire  reg_file_clock; // @[ID.scala 46:38]
  wire  reg_file_reset; // @[ID.scala 46:38]
  wire [2:0] reg_file_io_read_addr_0; // @[ID.scala 46:38]
  wire [2:0] reg_file_io_read_addr_1; // @[ID.scala 46:38]
  wire [2:0] reg_file_io_write_0_rd_addr; // @[ID.scala 46:38]
  wire  reg_file_io_write_0_rf_w; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_write_0_data; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_out_0; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_out_1; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_1; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_2; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_3; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_4; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_5; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_6; // @[ID.scala 46:38]
  wire [15:0] reg_file_io_rf4debug_7; // @[ID.scala 46:38]
  wire  busy_bit_clock; // @[ID.scala 51:33]
  wire  busy_bit_reset; // @[ID.scala 51:33]
  wire  busy_bit_io_branch_mispredicted; // @[ID.scala 51:33]
  wire  busy_bit_io_branch_graduated; // @[ID.scala 51:33]
  wire [2:0] busy_bit_io_release_0_rd_addr; // @[ID.scala 51:33]
  wire  busy_bit_io_release_0_rf_w; // @[ID.scala 51:33]
  wire [2:0] busy_bit_io_req_rs_addr_0; // @[ID.scala 51:33]
  wire [2:0] busy_bit_io_req_rs_addr_1; // @[ID.scala 51:33]
  wire  busy_bit_io_req_rd_w; // @[ID.scala 51:33]
  wire [2:0] busy_bit_io_req_rd_addr; // @[ID.scala 51:33]
  wire  busy_bit_io_rs_available_0; // @[ID.scala 51:33]
  wire  busy_bit_io_rs_available_1; // @[ID.scala 51:33]
  reg [15:0] if_out_r_pc; // @[ID.scala 31:32]
  reg [31:0] _RAND_0;
  reg [3:0] if_out_r_inst_bits_op; // @[ID.scala 31:32]
  reg [31:0] _RAND_1;
  reg [2:0] if_out_r_inst_bits_rd; // @[ID.scala 31:32]
  reg [31:0] _RAND_2;
  reg [2:0] if_out_r_inst_bits_rs; // @[ID.scala 31:32]
  reg [31:0] _RAND_3;
  reg [5:0] if_out_r_inst_bits_disp6u; // @[ID.scala 31:32]
  reg [31:0] _RAND_4;
  wire [15:0] if_out_pc; // @[ID.scala 32:16]
  wire [2:0] if_out_inst_bits_rs; // @[ID.scala 32:16]
  wire [5:0] if_out_inst_bits_disp6u; // @[ID.scala 32:16]
  reg  predict_r; // @[ID.scala 35:32]
  reg [31:0] _RAND_5;
  wire  predict; // @[ID.scala 36:17]
  wire  _T_6; // @[ID.scala 68:29]
  reg  _T_7; // @[ID.scala 69:16]
  reg [31:0] _RAND_6;
  wire  _T_8; // @[ID.scala 69:5]
  reg  _T_10; // @[ID.scala 70:16]
  reg [31:0] _RAND_7;
  wire  clear_instruction; // @[ID.scala 70:5]
  wire  _T_2; // @[ID.scala 59:27]
  wire  _T_16; // @[ID.scala 87:37]
  wire  _T_17; // @[ID.scala 87:34]
  wire  _T_18; // @[ID.scala 88:37]
  wire  _T_19; // @[ID.scala 88:34]
  wire  operands_available; // @[ID.scala 87:63]
  wire  _T_20; // @[ID.scala 90:12]
  reg  branch_pending; // @[ID.scala 80:37]
  reg [31:0] _RAND_8;
  wire  stall; // @[ID.scala 90:32]
  wire  _T_3; // @[ID.scala 59:49]
  wire  _T_4; // @[ID.scala 59:46]
  wire  _T_9; // @[ID.scala 70:43]
  wire  _T_13; // @[ID.scala 83:13]
  wire  _T_14; // @[ID.scala 83:43]
  wire  _T_23; // @[ID.scala 92:5]
  wire  _T_24; // @[ID.scala 93:7]
  reg  _T_25; // @[ID.scala 91:22]
  reg [31:0] _RAND_9;
  wire  _T_26; // @[ID.scala 97:15]
  reg [2:0] _T_30_rd_addr; // @[ID.scala 96:21]
  reg [31:0] _RAND_10;
  reg [2:0] _T_30_alu_op; // @[ID.scala 96:21]
  reg [31:0] _RAND_11;
  reg  _T_30_is_jump; // @[ID.scala 96:21]
  reg [31:0] _RAND_12;
  reg  _T_30_is_branch; // @[ID.scala 96:21]
  reg [31:0] _RAND_13;
  reg  _T_30_rf_w; // @[ID.scala 96:21]
  reg [31:0] _RAND_14;
  wire [8:0] _T_31; // @[Cat.scala 29:58]
  wire  _T_35; // @[InstBits.scala 18:43]
  wire [6:0] _T_36; // @[InstBits.scala 18:28]
  wire [15:0] _T_38; // @[Cat.scala 29:58]
  wire [15:0] _T_40; // @[ID.scala 102:15]
  wire  _T_44; // @[InstBits.scala 16:45]
  wire [9:0] _T_45; // @[InstBits.scala 16:29]
  wire [15:0] _T_46; // @[Cat.scala 29:58]
  wire [15:0] _T_48; // @[ID.scala 102:51]
  reg [15:0] _T_50; // @[ID.scala 101:24]
  reg [31:0] _RAND_15;
  wire  _T_53; // @[Mux.scala 68:19]
  wire  _T_55; // @[Mux.scala 68:19]
  reg [15:0] _T_57; // @[ID.scala 104:26]
  reg [31:0] _RAND_16;
  wire  _T_66; // @[Mux.scala 68:19]
  wire  _T_68; // @[Mux.scala 68:19]
  wire  _T_70; // @[Mux.scala 68:19]
  reg [15:0] _T_72; // @[ID.scala 109:26]
  reg [31:0] _RAND_17;
  wire  _T_73; // @[ID.scala 115:9]
  wire  _T_74; // @[ID.scala 115:9]
  Decoder decoder ( // @[ID.scala 43:32]
    .io_inst_bits_op(decoder_io_inst_bits_op),
    .io_inst_bits_rd(decoder_io_inst_bits_rd),
    .io_ctrl_rd_addr(decoder_io_ctrl_rd_addr),
    .io_ctrl_alu_op(decoder_io_ctrl_alu_op),
    .io_ctrl_is_jump(decoder_io_ctrl_is_jump),
    .io_ctrl_is_branch(decoder_io_ctrl_is_branch),
    .io_ctrl_rf_w(decoder_io_ctrl_rf_w),
    .io_ctrl_rs1_use(decoder_io_ctrl_rs1_use),
    .io_ctrl_rs2_use(decoder_io_ctrl_rs2_use),
    .io_source_sel_0(decoder_io_source_sel_0),
    .io_source_sel_1(decoder_io_source_sel_1)
  );
  RegisterFile reg_file ( // @[ID.scala 46:38]
    .clock(reg_file_clock),
    .reset(reg_file_reset),
    .io_read_addr_0(reg_file_io_read_addr_0),
    .io_read_addr_1(reg_file_io_read_addr_1),
    .io_write_0_rd_addr(reg_file_io_write_0_rd_addr),
    .io_write_0_rf_w(reg_file_io_write_0_rf_w),
    .io_write_0_data(reg_file_io_write_0_data),
    .io_out_0(reg_file_io_out_0),
    .io_out_1(reg_file_io_out_1),
    .io_rf4debug_1(reg_file_io_rf4debug_1),
    .io_rf4debug_2(reg_file_io_rf4debug_2),
    .io_rf4debug_3(reg_file_io_rf4debug_3),
    .io_rf4debug_4(reg_file_io_rf4debug_4),
    .io_rf4debug_5(reg_file_io_rf4debug_5),
    .io_rf4debug_6(reg_file_io_rf4debug_6),
    .io_rf4debug_7(reg_file_io_rf4debug_7)
  );
  BusyBit busy_bit ( // @[ID.scala 51:33]
    .clock(busy_bit_clock),
    .reset(busy_bit_reset),
    .io_branch_mispredicted(busy_bit_io_branch_mispredicted),
    .io_branch_graduated(busy_bit_io_branch_graduated),
    .io_release_0_rd_addr(busy_bit_io_release_0_rd_addr),
    .io_release_0_rf_w(busy_bit_io_release_0_rf_w),
    .io_req_rs_addr_0(busy_bit_io_req_rs_addr_0),
    .io_req_rs_addr_1(busy_bit_io_req_rs_addr_1),
    .io_req_rd_w(busy_bit_io_req_rd_w),
    .io_req_rd_addr(busy_bit_io_req_rd_addr),
    .io_rs_available_0(busy_bit_io_rs_available_0),
    .io_rs_available_1(busy_bit_io_rs_available_1)
  );
  assign if_out_pc = io_stall ? if_out_r_pc : io_if_out_pc; // @[ID.scala 32:16]
  assign if_out_inst_bits_rs = io_stall ? if_out_r_inst_bits_rs : io_if_out_inst_bits_rs; // @[ID.scala 32:16]
  assign if_out_inst_bits_disp6u = io_stall ? if_out_r_inst_bits_disp6u : io_if_out_inst_bits_disp6u; // @[ID.scala 32:16]
  assign predict = io_stall & predict_r; // @[ID.scala 36:17]
  assign _T_6 = io_branch_graduated & io_branch_mispredicted; // @[ID.scala 68:29]
  assign _T_8 = _T_6 | _T_7; // @[ID.scala 69:5]
  assign clear_instruction = _T_8 | _T_10; // @[ID.scala 70:5]
  assign _T_2 = clear_instruction == 1'h0; // @[ID.scala 59:27]
  assign _T_16 = decoder_io_ctrl_rs1_use == 1'h0; // @[ID.scala 87:37]
  assign _T_17 = busy_bit_io_rs_available_0 | _T_16; // @[ID.scala 87:34]
  assign _T_18 = decoder_io_ctrl_rs2_use == 1'h0; // @[ID.scala 88:37]
  assign _T_19 = busy_bit_io_rs_available_1 | _T_18; // @[ID.scala 88:34]
  assign operands_available = _T_17 & _T_19; // @[ID.scala 87:63]
  assign _T_20 = operands_available == 1'h0; // @[ID.scala 90:12]
  assign stall = _T_20 | branch_pending; // @[ID.scala 90:32]
  assign _T_3 = stall == 1'h0; // @[ID.scala 59:49]
  assign _T_4 = _T_2 & _T_3; // @[ID.scala 59:46]
  assign _T_9 = decoder_io_ctrl_is_branch & predict; // @[ID.scala 70:43]
  assign _T_13 = _T_3 & decoder_io_ctrl_is_branch; // @[ID.scala 83:13]
  assign _T_14 = _T_13 | branch_pending; // @[ID.scala 83:43]
  assign _T_23 = _T_6 == 1'h0; // @[ID.scala 92:5]
  assign _T_24 = _T_23 & stall; // @[ID.scala 93:7]
  assign _T_26 = stall | clear_instruction; // @[ID.scala 97:15]
  assign _T_31 = {if_out_inst_bits_rs,if_out_inst_bits_disp6u}; // @[Cat.scala 29:58]
  assign _T_35 = _T_31[8]; // @[InstBits.scala 18:43]
  assign _T_36 = _T_35 ? 7'h7f : 7'h0; // @[InstBits.scala 18:28]
  assign _T_38 = {_T_36,if_out_inst_bits_rs,if_out_inst_bits_disp6u}; // @[Cat.scala 29:58]
  assign _T_40 = if_out_pc + _T_38; // @[ID.scala 102:15]
  assign _T_44 = if_out_inst_bits_disp6u[5]; // @[InstBits.scala 16:45]
  assign _T_45 = _T_44 ? 10'h3ff : 10'h0; // @[InstBits.scala 16:29]
  assign _T_46 = {_T_45,if_out_inst_bits_disp6u}; // @[Cat.scala 29:58]
  assign _T_48 = if_out_pc + _T_46; // @[ID.scala 102:51]
  assign _T_53 = 16'h1 == decoder_io_source_sel_0; // @[Mux.scala 68:19]
  assign _T_55 = 16'h3 == decoder_io_source_sel_0; // @[Mux.scala 68:19]
  assign _T_66 = 16'h0 == decoder_io_source_sel_1; // @[Mux.scala 68:19]
  assign _T_68 = 16'h1 == decoder_io_source_sel_1; // @[Mux.scala 68:19]
  assign _T_70 = 16'h2 == decoder_io_source_sel_1; // @[Mux.scala 68:19]
  assign _T_73 = $unsigned(reset); // @[ID.scala 115:9]
  assign _T_74 = _T_73 == 1'h0; // @[ID.scala 115:9]
  assign io_next_pc = _T_50; // @[ID.scala 101:14]
  assign io_ctrl_rd_addr = _T_30_rd_addr; // @[ID.scala 96:11]
  assign io_ctrl_alu_op = _T_30_alu_op; // @[ID.scala 96:11]
  assign io_ctrl_is_jump = _T_30_is_jump; // @[ID.scala 96:11]
  assign io_ctrl_is_branch = _T_30_is_branch; // @[ID.scala 96:11]
  assign io_ctrl_rf_w = _T_30_rf_w; // @[ID.scala 96:11]
  assign io_source_0 = _T_57; // @[ID.scala 104:16]
  assign io_source_1 = _T_72; // @[ID.scala 109:16]
  assign io_stall = _T_25; // @[ID.scala 91:12]
  assign io_rf4debug_1 = reg_file_io_rf4debug_1; // @[ID.scala 123:15]
  assign io_rf4debug_2 = reg_file_io_rf4debug_2; // @[ID.scala 123:15]
  assign io_rf4debug_3 = reg_file_io_rf4debug_3; // @[ID.scala 123:15]
  assign io_rf4debug_4 = reg_file_io_rf4debug_4; // @[ID.scala 123:15]
  assign io_rf4debug_5 = reg_file_io_rf4debug_5; // @[ID.scala 123:15]
  assign io_rf4debug_6 = reg_file_io_rf4debug_6; // @[ID.scala 123:15]
  assign io_rf4debug_7 = reg_file_io_rf4debug_7; // @[ID.scala 123:15]
  assign decoder_io_inst_bits_op = io_stall ? if_out_r_inst_bits_op : io_if_out_inst_bits_op; // @[ID.scala 44:24]
  assign decoder_io_inst_bits_rd = io_stall ? if_out_r_inst_bits_rd : io_if_out_inst_bits_rd; // @[ID.scala 44:24]
  assign reg_file_clock = clock;
  assign reg_file_reset = reset;
  assign reg_file_io_read_addr_0 = io_stall ? if_out_r_inst_bits_rd : io_if_out_inst_bits_rd; // @[ID.scala 47:28]
  assign reg_file_io_read_addr_1 = io_stall ? if_out_r_inst_bits_rs : io_if_out_inst_bits_rs; // @[ID.scala 48:28]
  assign reg_file_io_write_0_rd_addr = io_rf_write_0_rd_addr; // @[ID.scala 49:21]
  assign reg_file_io_write_0_rf_w = io_rf_write_0_rf_w; // @[ID.scala 49:21]
  assign reg_file_io_write_0_data = io_rf_write_0_data; // @[ID.scala 49:21]
  assign busy_bit_clock = clock;
  assign busy_bit_reset = reset;
  assign busy_bit_io_branch_mispredicted = io_branch_mispredicted; // @[ID.scala 52:35]
  assign busy_bit_io_branch_graduated = io_branch_graduated; // @[ID.scala 53:32]
  assign busy_bit_io_release_0_rd_addr = io_rf_write_0_rd_addr; // @[ID.scala 54:23]
  assign busy_bit_io_release_0_rf_w = io_rf_write_0_rf_w; // @[ID.scala 54:23]
  assign busy_bit_io_req_rs_addr_0 = io_stall ? if_out_r_inst_bits_rd : io_if_out_inst_bits_rd; // @[ID.scala 55:30]
  assign busy_bit_io_req_rs_addr_1 = io_stall ? if_out_r_inst_bits_rs : io_if_out_inst_bits_rs; // @[ID.scala 56:30]
  assign busy_bit_io_req_rd_w = _T_4 & decoder_io_ctrl_rf_w; // @[ID.scala 59:24]
  assign busy_bit_io_req_rd_addr = io_stall ? if_out_r_inst_bits_rd : io_if_out_inst_bits_rd; // @[ID.scala 60:27]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  if_out_r_pc = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  if_out_r_inst_bits_op = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  if_out_r_inst_bits_rd = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  if_out_r_inst_bits_rs = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  if_out_r_inst_bits_disp6u = _RAND_4[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  predict_r = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_7 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_10 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  branch_pending = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_25 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_30_rd_addr = _RAND_10[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_30_alu_op = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_30_is_jump = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_30_is_branch = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_30_rf_w = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_50 = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_57 = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_72 = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (!(io_stall)) begin
      if_out_r_pc <= io_if_out_pc;
    end
    if (!(io_stall)) begin
      if_out_r_inst_bits_op <= io_if_out_inst_bits_op;
    end
    if (!(io_stall)) begin
      if_out_r_inst_bits_rd <= io_if_out_inst_bits_rd;
    end
    if (!(io_stall)) begin
      if_out_r_inst_bits_rs <= io_if_out_inst_bits_rs;
    end
    if (!(io_stall)) begin
      if_out_r_inst_bits_disp6u <= io_if_out_inst_bits_disp6u;
    end
    predict_r <= io_stall & predict_r;
    if (reset) begin
      _T_7 <= 1'h0;
    end else begin
      _T_7 <= decoder_io_ctrl_is_jump;
    end
    if (reset) begin
      _T_10 <= 1'h0;
    end else begin
      _T_10 <= _T_9;
    end
    if (reset) begin
      branch_pending <= 1'h0;
    end else if (io_branch_graduated) begin
      branch_pending <= 1'h0;
    end else begin
      branch_pending <= _T_14;
    end
    if (reset) begin
      _T_25 <= 1'h0;
    end else begin
      _T_25 <= _T_24;
    end
    if (reset) begin
      _T_30_rd_addr <= 3'h0;
    end else if (_T_26) begin
      _T_30_rd_addr <= 3'h0;
    end else begin
      _T_30_rd_addr <= decoder_io_ctrl_rd_addr;
    end
    if (reset) begin
      _T_30_alu_op <= 3'h0;
    end else if (_T_26) begin
      _T_30_alu_op <= 3'h0;
    end else begin
      _T_30_alu_op <= decoder_io_ctrl_alu_op;
    end
    if (reset) begin
      _T_30_is_jump <= 1'h0;
    end else if (_T_26) begin
      _T_30_is_jump <= 1'h0;
    end else begin
      _T_30_is_jump <= decoder_io_ctrl_is_jump;
    end
    if (reset) begin
      _T_30_is_branch <= 1'h0;
    end else if (_T_26) begin
      _T_30_is_branch <= 1'h0;
    end else begin
      _T_30_is_branch <= decoder_io_ctrl_is_branch;
    end
    if (reset) begin
      _T_30_rf_w <= 1'h0;
    end else if (_T_26) begin
      _T_30_rf_w <= 1'h0;
    end else begin
      _T_30_rf_w <= decoder_io_ctrl_rf_w;
    end
    if (decoder_io_ctrl_is_jump) begin
      _T_50 <= _T_40;
    end else begin
      _T_50 <= _T_48;
    end
    if (_T_55) begin
      _T_57 <= {{10'd0}, if_out_inst_bits_disp6u};
    end else if (_T_53) begin
      _T_57 <= reg_file_io_out_0;
    end else begin
      _T_57 <= 16'h0;
    end
    if (_T_70) begin
      _T_72 <= _T_38;
    end else if (_T_68) begin
      _T_72 <= reg_file_io_out_1;
    end else begin
      _T_72 <= {{15'd0}, _T_66};
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_74) begin
          $fwrite(32'h80000002,"branch_mispredicted_enable: %d, branch_mispredicted: %d\n",io_branch_graduated,io_branch_mispredicted); // @[ID.scala 115:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_74) begin
          $fwrite(32'h80000002,"stall: %d, !operands_avail: %d, branch_pend: %d\n",stall,_T_20,branch_pending); // @[ID.scala 116:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_74) begin
          $fwrite(32'h80000002,"source(0): %d\n",io_source_0); // @[ID.scala 118:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_74) begin
          $fwrite(32'h80000002,"source(1): %d\n",io_source_1); // @[ID.scala 119:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_74) begin
          $fwrite(32'h80000002,"next_addr: %d\n",io_next_pc); // @[ID.scala 120:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_74) begin
          $fwrite(32'h80000002,"----------\n"); // @[ID.scala 121:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ALU(
  input         clock,
  input         reset,
  input  [2:0]  io_ctrl_rd_addr,
  input  [2:0]  io_ctrl_alu_op,
  input         io_ctrl_is_branch,
  input         io_ctrl_rf_w,
  input  [15:0] io_source_0,
  input  [15:0] io_source_1,
  input  [15:0] io_restoration_pc,
  output [15:0] io_alu_out,
  output [2:0]  io_alu_ctrl_out_rd_addr,
  output        io_alu_ctrl_out_is_branch,
  output        io_alu_ctrl_out_rf_w,
  output [15:0] io_restoration_pc_out
);
  wire [15:0] _T_1; // @[ALU.scala 22:34]
  wire [15:0] _T_3; // @[ALU.scala 23:34]
  wire [15:0] _T_4; // @[ALU.scala 24:34]
  wire [15:0] _T_5; // @[ALU.scala 25:34]
  wire  _T_6; // @[ALU.scala 26:36]
  wire  _T_7; // @[ALU.scala 27:34]
  wire  _T_8; // @[Mux.scala 68:19]
  wire  _T_9; // @[Mux.scala 68:16]
  wire  _T_10; // @[Mux.scala 68:19]
  wire  _T_11; // @[Mux.scala 68:16]
  wire  _T_12; // @[Mux.scala 68:19]
  wire  _T_14; // @[Mux.scala 68:19]
  wire  _T_16; // @[Mux.scala 68:19]
  wire  _T_18; // @[Mux.scala 68:19]
  reg [15:0] _T_20; // @[ALU.scala 21:24]
  reg [31:0] _RAND_0;
  reg [2:0] _T_22_rd_addr; // @[ALU.scala 29:29]
  reg [31:0] _RAND_1;
  reg  _T_22_is_branch; // @[ALU.scala 29:29]
  reg [31:0] _RAND_2;
  reg  _T_22_rf_w; // @[ALU.scala 29:29]
  reg [31:0] _RAND_3;
  reg [15:0] _T_23; // @[ALU.scala 30:35]
  reg [31:0] _RAND_4;
  assign _T_1 = io_source_0 + io_source_1; // @[ALU.scala 22:34]
  assign _T_3 = io_source_0 - io_source_1; // @[ALU.scala 23:34]
  assign _T_4 = io_source_0 & io_source_1; // @[ALU.scala 24:34]
  assign _T_5 = io_source_0 | io_source_1; // @[ALU.scala 25:34]
  assign _T_6 = io_source_0 == io_source_1; // @[ALU.scala 26:36]
  assign _T_7 = io_source_0 > io_source_1; // @[ALU.scala 27:34]
  assign _T_8 = 3'h5 == io_ctrl_alu_op; // @[Mux.scala 68:19]
  assign _T_9 = _T_8 & _T_7; // @[Mux.scala 68:16]
  assign _T_10 = 3'h4 == io_ctrl_alu_op; // @[Mux.scala 68:19]
  assign _T_11 = _T_10 ? _T_6 : _T_9; // @[Mux.scala 68:16]
  assign _T_12 = 3'h3 == io_ctrl_alu_op; // @[Mux.scala 68:19]
  assign _T_14 = 3'h2 == io_ctrl_alu_op; // @[Mux.scala 68:19]
  assign _T_16 = 3'h1 == io_ctrl_alu_op; // @[Mux.scala 68:19]
  assign _T_18 = 3'h0 == io_ctrl_alu_op; // @[Mux.scala 68:19]
  assign io_alu_out = _T_20; // @[ALU.scala 21:14]
  assign io_alu_ctrl_out_rd_addr = _T_22_rd_addr; // @[ALU.scala 29:19]
  assign io_alu_ctrl_out_is_branch = _T_22_is_branch; // @[ALU.scala 29:19]
  assign io_alu_ctrl_out_rf_w = _T_22_rf_w; // @[ALU.scala 29:19]
  assign io_restoration_pc_out = _T_23; // @[ALU.scala 30:25]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_20 = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_22_rd_addr = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_22_is_branch = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_22_rf_w = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_23 = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_18) begin
      _T_20 <= _T_1;
    end else if (_T_16) begin
      _T_20 <= _T_3;
    end else if (_T_14) begin
      _T_20 <= _T_4;
    end else if (_T_12) begin
      _T_20 <= _T_5;
    end else begin
      _T_20 <= {{15'd0}, _T_11};
    end
    if (reset) begin
      _T_22_rd_addr <= 3'h0;
    end else begin
      _T_22_rd_addr <= io_ctrl_rd_addr;
    end
    if (reset) begin
      _T_22_is_branch <= 1'h0;
    end else begin
      _T_22_is_branch <= io_ctrl_is_branch;
    end
    if (reset) begin
      _T_22_rf_w <= 1'h0;
    end else begin
      _T_22_rf_w <= io_ctrl_rf_w;
    end
    _T_23 <= io_restoration_pc;
  end
endmodule
module EX(
  input         clock,
  input         reset,
  input  [2:0]  io_ctrl_rd_addr,
  input  [2:0]  io_ctrl_alu_op,
  input         io_ctrl_is_branch,
  input         io_ctrl_rf_w,
  input  [15:0] io_source_0,
  input  [15:0] io_source_1,
  input  [15:0] io_restoration_pc,
  output [15:0] io_alu_out,
  output [2:0]  io_alu_ctrl_out_rd_addr,
  output        io_alu_ctrl_out_is_branch,
  output        io_alu_ctrl_out_rf_w,
  output [15:0] io_restoration_pc_out
);
  wire  alu_clock; // @[EX.scala 22:24]
  wire  alu_reset; // @[EX.scala 22:24]
  wire [2:0] alu_io_ctrl_rd_addr; // @[EX.scala 22:24]
  wire [2:0] alu_io_ctrl_alu_op; // @[EX.scala 22:24]
  wire  alu_io_ctrl_is_branch; // @[EX.scala 22:24]
  wire  alu_io_ctrl_rf_w; // @[EX.scala 22:24]
  wire [15:0] alu_io_source_0; // @[EX.scala 22:24]
  wire [15:0] alu_io_source_1; // @[EX.scala 22:24]
  wire [15:0] alu_io_restoration_pc; // @[EX.scala 22:24]
  wire [15:0] alu_io_alu_out; // @[EX.scala 22:24]
  wire [2:0] alu_io_alu_ctrl_out_rd_addr; // @[EX.scala 22:24]
  wire  alu_io_alu_ctrl_out_is_branch; // @[EX.scala 22:24]
  wire  alu_io_alu_ctrl_out_rf_w; // @[EX.scala 22:24]
  wire [15:0] alu_io_restoration_pc_out; // @[EX.scala 22:24]
  ALU alu ( // @[EX.scala 22:24]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_ctrl_rd_addr(alu_io_ctrl_rd_addr),
    .io_ctrl_alu_op(alu_io_ctrl_alu_op),
    .io_ctrl_is_branch(alu_io_ctrl_is_branch),
    .io_ctrl_rf_w(alu_io_ctrl_rf_w),
    .io_source_0(alu_io_source_0),
    .io_source_1(alu_io_source_1),
    .io_restoration_pc(alu_io_restoration_pc),
    .io_alu_out(alu_io_alu_out),
    .io_alu_ctrl_out_rd_addr(alu_io_alu_ctrl_out_rd_addr),
    .io_alu_ctrl_out_is_branch(alu_io_alu_ctrl_out_is_branch),
    .io_alu_ctrl_out_rf_w(alu_io_alu_ctrl_out_rf_w),
    .io_restoration_pc_out(alu_io_restoration_pc_out)
  );
  assign io_alu_out = alu_io_alu_out; // @[EX.scala 28:14]
  assign io_alu_ctrl_out_rd_addr = alu_io_alu_ctrl_out_rd_addr; // @[EX.scala 29:19]
  assign io_alu_ctrl_out_is_branch = alu_io_alu_ctrl_out_is_branch; // @[EX.scala 29:19]
  assign io_alu_ctrl_out_rf_w = alu_io_alu_ctrl_out_rf_w; // @[EX.scala 29:19]
  assign io_restoration_pc_out = alu_io_restoration_pc_out; // @[EX.scala 30:25]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_ctrl_rd_addr = io_ctrl_rd_addr; // @[EX.scala 23:15]
  assign alu_io_ctrl_alu_op = io_ctrl_alu_op; // @[EX.scala 23:15]
  assign alu_io_ctrl_is_branch = io_ctrl_is_branch; // @[EX.scala 23:15]
  assign alu_io_ctrl_rf_w = io_ctrl_rf_w; // @[EX.scala 23:15]
  assign alu_io_source_0 = io_source_0; // @[EX.scala 24:17]
  assign alu_io_source_1 = io_source_1; // @[EX.scala 24:17]
  assign alu_io_restoration_pc = io_restoration_pc; // @[EX.scala 25:25]
endmodule
module Hart(
  input         clock,
  input         reset,
  // output [15:0] io_pc,
  // output [15:0] io_total_cnt,
  // output [15:0] io_rf_0,
  // output [15:0] io_rf_1,
  output [15:0] io_rf_2
  // output [15:0] io_rf_3,
  // output [15:0] io_rf_4,
  // output [15:0] io_rf_5,
  // output [15:0] io_rf_6,
  // output [15:0] io_rf_7
);
  wire [15:0] io_pc;
  wire [15:0] io_total_cnt;
  wire [15:0] io_rf_0;
  wire [15:0] io_rf_1;
  // wire [15:0] io_rf_2;
  wire [15:0] io_rf_3;
  wire [15:0] io_rf_4;
  wire [15:0] io_rf_5;
  wire [15:0] io_rf_6;
  wire [15:0] io_rf_7;

  wire  s_if_clock; // @[Hart.scala 36:24]
  wire  s_if_reset; // @[Hart.scala 36:24]
  wire  s_if_io_in_branch_mispredicted; // @[Hart.scala 36:24]
  wire  s_if_io_in_branch_mispredicted_enable; // @[Hart.scala 36:24]
  wire [15:0] s_if_io_in_restoration_pc; // @[Hart.scala 36:24]
  wire  s_if_io_in_is_branch; // @[Hart.scala 36:24]
  wire  s_if_io_in_is_jump; // @[Hart.scala 36:24]
  wire [15:0] s_if_io_in_jump_pc; // @[Hart.scala 36:24]
  wire [15:0] s_if_io_in_alu_out; // @[Hart.scala 36:24]
  wire  s_if_io_in_stall; // @[Hart.scala 36:24]
  wire [15:0] s_if_io_out_pc; // @[Hart.scala 36:24]
  wire [15:0] s_if_io_out_total_cnt; // @[Hart.scala 36:24]
  wire [3:0] s_if_io_out_inst_bits_op; // @[Hart.scala 36:24]
  wire [2:0] s_if_io_out_inst_bits_rd; // @[Hart.scala 36:24]
  wire [2:0] s_if_io_out_inst_bits_rs; // @[Hart.scala 36:24]
  wire [5:0] s_if_io_out_inst_bits_disp6u; // @[Hart.scala 36:24]
  wire  s_id_clock; // @[Hart.scala 37:24]
  wire  s_id_reset; // @[Hart.scala 37:24]
  wire  s_id_io_branch_mispredicted; // @[Hart.scala 37:24]
  wire  s_id_io_branch_graduated; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_if_out_pc; // @[Hart.scala 37:24]
  wire [3:0] s_id_io_if_out_inst_bits_op; // @[Hart.scala 37:24]
  wire [2:0] s_id_io_if_out_inst_bits_rd; // @[Hart.scala 37:24]
  wire [2:0] s_id_io_if_out_inst_bits_rs; // @[Hart.scala 37:24]
  wire [5:0] s_id_io_if_out_inst_bits_disp6u; // @[Hart.scala 37:24]
  wire [2:0] s_id_io_rf_write_0_rd_addr; // @[Hart.scala 37:24]
  wire  s_id_io_rf_write_0_rf_w; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf_write_0_data; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_next_pc; // @[Hart.scala 37:24]
  wire [2:0] s_id_io_ctrl_rd_addr; // @[Hart.scala 37:24]
  wire [2:0] s_id_io_ctrl_alu_op; // @[Hart.scala 37:24]
  wire  s_id_io_ctrl_is_jump; // @[Hart.scala 37:24]
  wire  s_id_io_ctrl_is_branch; // @[Hart.scala 37:24]
  wire  s_id_io_ctrl_rf_w; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_source_0; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_source_1; // @[Hart.scala 37:24]
  wire  s_id_io_stall; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_1; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_2; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_3; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_4; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_5; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_6; // @[Hart.scala 37:24]
  wire [15:0] s_id_io_rf4debug_7; // @[Hart.scala 37:24]
  wire  s_ex_clock; // @[Hart.scala 38:24]
  wire  s_ex_reset; // @[Hart.scala 38:24]
  wire [2:0] s_ex_io_ctrl_rd_addr; // @[Hart.scala 38:24]
  wire [2:0] s_ex_io_ctrl_alu_op; // @[Hart.scala 38:24]
  wire  s_ex_io_ctrl_is_branch; // @[Hart.scala 38:24]
  wire  s_ex_io_ctrl_rf_w; // @[Hart.scala 38:24]
  wire [15:0] s_ex_io_source_0; // @[Hart.scala 38:24]
  wire [15:0] s_ex_io_source_1; // @[Hart.scala 38:24]
  wire [15:0] s_ex_io_restoration_pc; // @[Hart.scala 38:24]
  wire [15:0] s_ex_io_alu_out; // @[Hart.scala 38:24]
  wire [2:0] s_ex_io_alu_ctrl_out_rd_addr; // @[Hart.scala 38:24]
  wire  s_ex_io_alu_ctrl_out_is_branch; // @[Hart.scala 38:24]
  wire  s_ex_io_alu_ctrl_out_rf_w; // @[Hart.scala 38:24]
  wire [15:0] s_ex_io_restoration_pc_out; // @[Hart.scala 38:24]
  IF s_if ( // @[Hart.scala 36:24]
    .clock(s_if_clock),
    .reset(s_if_reset),
    .io_in_branch_mispredicted(s_if_io_in_branch_mispredicted),
    .io_in_branch_mispredicted_enable(s_if_io_in_branch_mispredicted_enable),
    .io_in_restoration_pc(s_if_io_in_restoration_pc),
    .io_in_is_branch(s_if_io_in_is_branch),
    .io_in_is_jump(s_if_io_in_is_jump),
    .io_in_jump_pc(s_if_io_in_jump_pc),
    .io_in_alu_out(s_if_io_in_alu_out),
    .io_in_stall(s_if_io_in_stall),
    .io_out_pc(s_if_io_out_pc),
    .io_out_total_cnt(s_if_io_out_total_cnt),
    .io_out_inst_bits_op(s_if_io_out_inst_bits_op),
    .io_out_inst_bits_rd(s_if_io_out_inst_bits_rd),
    .io_out_inst_bits_rs(s_if_io_out_inst_bits_rs),
    .io_out_inst_bits_disp6u(s_if_io_out_inst_bits_disp6u)
  );
  ID s_id ( // @[Hart.scala 37:24]
    .clock(s_id_clock),
    .reset(s_id_reset),
    .io_branch_mispredicted(s_id_io_branch_mispredicted),
    .io_branch_graduated(s_id_io_branch_graduated),
    .io_if_out_pc(s_id_io_if_out_pc),
    .io_if_out_inst_bits_op(s_id_io_if_out_inst_bits_op),
    .io_if_out_inst_bits_rd(s_id_io_if_out_inst_bits_rd),
    .io_if_out_inst_bits_rs(s_id_io_if_out_inst_bits_rs),
    .io_if_out_inst_bits_disp6u(s_id_io_if_out_inst_bits_disp6u),
    .io_rf_write_0_rd_addr(s_id_io_rf_write_0_rd_addr),
    .io_rf_write_0_rf_w(s_id_io_rf_write_0_rf_w),
    .io_rf_write_0_data(s_id_io_rf_write_0_data),
    .io_next_pc(s_id_io_next_pc),
    .io_ctrl_rd_addr(s_id_io_ctrl_rd_addr),
    .io_ctrl_alu_op(s_id_io_ctrl_alu_op),
    .io_ctrl_is_jump(s_id_io_ctrl_is_jump),
    .io_ctrl_is_branch(s_id_io_ctrl_is_branch),
    .io_ctrl_rf_w(s_id_io_ctrl_rf_w),
    .io_source_0(s_id_io_source_0),
    .io_source_1(s_id_io_source_1),
    .io_stall(s_id_io_stall),
    .io_rf4debug_1(s_id_io_rf4debug_1),
    .io_rf4debug_2(s_id_io_rf4debug_2),
    .io_rf4debug_3(s_id_io_rf4debug_3),
    .io_rf4debug_4(s_id_io_rf4debug_4),
    .io_rf4debug_5(s_id_io_rf4debug_5),
    .io_rf4debug_6(s_id_io_rf4debug_6),
    .io_rf4debug_7(s_id_io_rf4debug_7)
  );
  EX s_ex ( // @[Hart.scala 38:24]
    .clock(s_ex_clock),
    .reset(s_ex_reset),
    .io_ctrl_rd_addr(s_ex_io_ctrl_rd_addr),
    .io_ctrl_alu_op(s_ex_io_ctrl_alu_op),
    .io_ctrl_is_branch(s_ex_io_ctrl_is_branch),
    .io_ctrl_rf_w(s_ex_io_ctrl_rf_w),
    .io_source_0(s_ex_io_source_0),
    .io_source_1(s_ex_io_source_1),
    .io_restoration_pc(s_ex_io_restoration_pc),
    .io_alu_out(s_ex_io_alu_out),
    .io_alu_ctrl_out_rd_addr(s_ex_io_alu_ctrl_out_rd_addr),
    .io_alu_ctrl_out_is_branch(s_ex_io_alu_ctrl_out_is_branch),
    .io_alu_ctrl_out_rf_w(s_ex_io_alu_ctrl_out_rf_w),
    .io_restoration_pc_out(s_ex_io_restoration_pc_out)
  );
  assign io_pc = s_if_io_out_pc; // @[Hart.scala 76:9]
  assign io_total_cnt = s_if_io_out_total_cnt; // @[Hart.scala 77:16]
  assign io_rf_0 = 16'h0; // @[Hart.scala 78:9]
  assign io_rf_1 = s_id_io_rf4debug_1; // @[Hart.scala 78:9]
  assign io_rf_2 = s_id_io_rf4debug_2; // @[Hart.scala 78:9]
  assign io_rf_3 = s_id_io_rf4debug_3; // @[Hart.scala 78:9]
  assign io_rf_4 = s_id_io_rf4debug_4; // @[Hart.scala 78:9]
  assign io_rf_5 = s_id_io_rf4debug_5; // @[Hart.scala 78:9]
  assign io_rf_6 = s_id_io_rf4debug_6; // @[Hart.scala 78:9]
  assign io_rf_7 = s_id_io_rf4debug_7; // @[Hart.scala 78:9]
  assign s_if_clock = clock;
  assign s_if_reset = reset;
  assign s_if_io_in_branch_mispredicted = s_ex_io_alu_out != 16'h0; // @[Hart.scala 46:34]
  assign s_if_io_in_branch_mispredicted_enable = s_ex_io_alu_ctrl_out_is_branch; // @[Hart.scala 47:41]
  assign s_if_io_in_restoration_pc = s_ex_io_restoration_pc_out; // @[Hart.scala 48:29]
  assign s_if_io_in_is_branch = s_ex_io_alu_ctrl_out_is_branch; // @[Hart.scala 50:24]
  assign s_if_io_in_is_jump = s_id_io_ctrl_is_jump; // @[Hart.scala 51:22]
  assign s_if_io_in_jump_pc = s_id_io_next_pc; // @[Hart.scala 52:22]
  assign s_if_io_in_alu_out = s_ex_io_alu_out; // @[Hart.scala 53:22]
  assign s_if_io_in_stall = s_id_io_stall; // @[Hart.scala 55:20]
  assign s_id_clock = clock;
  assign s_id_reset = reset;
  assign s_id_io_branch_mispredicted = s_ex_io_alu_out != 16'h0; // @[Hart.scala 61:31]
  assign s_id_io_branch_graduated = s_ex_io_alu_ctrl_out_is_branch; // @[Hart.scala 62:28]
  assign s_id_io_if_out_pc = s_if_io_out_pc; // @[Hart.scala 63:18]
  assign s_id_io_if_out_inst_bits_op = s_if_io_out_inst_bits_op; // @[Hart.scala 63:18]
  assign s_id_io_if_out_inst_bits_rd = s_if_io_out_inst_bits_rd; // @[Hart.scala 63:18]
  assign s_id_io_if_out_inst_bits_rs = s_if_io_out_inst_bits_rs; // @[Hart.scala 63:18]
  assign s_id_io_if_out_inst_bits_disp6u = s_if_io_out_inst_bits_disp6u; // @[Hart.scala 63:18]
  assign s_id_io_rf_write_0_rd_addr = s_ex_io_alu_ctrl_out_rd_addr; // @[Hart.scala 66:20]
  assign s_id_io_rf_write_0_rf_w = s_ex_io_alu_ctrl_out_rf_w; // @[Hart.scala 66:20]
  assign s_id_io_rf_write_0_data = s_ex_io_alu_out; // @[Hart.scala 66:20]
  assign s_ex_clock = clock;
  assign s_ex_reset = reset;
  assign s_ex_io_ctrl_rd_addr = s_id_io_ctrl_rd_addr; // @[Hart.scala 70:16]
  assign s_ex_io_ctrl_alu_op = s_id_io_ctrl_alu_op; // @[Hart.scala 70:16]
  assign s_ex_io_ctrl_is_branch = s_id_io_ctrl_is_branch; // @[Hart.scala 70:16]
  assign s_ex_io_ctrl_rf_w = s_id_io_ctrl_rf_w; // @[Hart.scala 70:16]
  assign s_ex_io_source_0 = s_id_io_source_0; // @[Hart.scala 71:18]
  assign s_ex_io_source_1 = s_id_io_source_1; // @[Hart.scala 71:18]
  assign s_ex_io_restoration_pc = s_id_io_next_pc; // @[Hart.scala 72:26]
endmodule
