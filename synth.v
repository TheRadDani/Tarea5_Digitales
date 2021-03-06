/* Generated by Yosys 0.8 (git sha1 5706e90) */

(* top =  1  *)
(* src = "synth.v:1" *)
module synth(clk, reset_L, selector, data_in0, data_in1, data_out_c);
  (* src = "synth.v:13" *)
  wire [1:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  (* src = "synth.v:2" *)
  input clk;
  (* src = "synth.v:5" *)
  input [1:0] data_in0;
  (* src = "synth.v:6" *)
  input [1:0] data_in1;
  (* src = "synth.v:7" *)
  output [1:0] data_out_c;
  (* src = "synth.v:3" *)
  input reset_L;
  (* src = "synth.v:4" *)
  input selector;
  NOT _09_ (
    .A(data_in1[0]),
    .Y(_08_)
  );
  NOT _10_ (
    .A(data_in1[1]),
    .Y(_01_)
  );
  NOR _11_ (
    .A(selector),
    .B(data_in0[1]),
    .Y(_02_)
  );
  NAND _12_ (
    .A(selector),
    .B(_01_),
    .Y(_03_)
  );
  NAND _13_ (
    .A(reset_L),
    .B(_03_),
    .Y(_04_)
  );
  NOR _14_ (
    .A(_02_),
    .B(_04_),
    .Y(_00_[1])
  );
  NOR _15_ (
    .A(data_in0[0]),
    .B(selector),
    .Y(_05_)
  );
  NAND _16_ (
    .A(_08_),
    .B(selector),
    .Y(_06_)
  );
  NAND _17_ (
    .A(reset_L),
    .B(_06_),
    .Y(_07_)
  );
  NOR _18_ (
    .A(_05_),
    .B(_07_),
    .Y(_00_[0])
  );
  (* src = "synth.v:13" *)
  DFF _19_ (
    .C(clk),
    .D(_00_[0]),
    .Q(data_out_c[0])
  );
  (* src = "synth.v:13" *)
  DFF _20_ (
    .C(clk),
    .D(_00_[1]),
    .Q(data_out_c[1])
  );
endmodule
