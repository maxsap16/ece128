`timescale 1ns / 1ps

module adder_top
   (A_0,
    B_0,
    S_0);
  input [7:0]A_0;
  input [7:0]B_0;
  output [8:0]S_0;

  design_adder uut0
       (.A_0(A_0),
        .B_0(B_0),
        .S_0(S_0));
endmodule