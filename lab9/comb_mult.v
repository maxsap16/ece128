`timescale 1ns / 1ps
module comb_mult(a, b, p);
    input [3:0] a, b;
    output [7:0] p;
    
    wire [7:0] s1, s2, s3;
    wire [3:0] m0;
    wire [4:0] m1;
    wire [5:0] m2;
    wire [6:0] m3;
    
    assign m0 = a & {4{b[0]}};
    assign m1 = a & {4{b[1]}};
    assign m2 = a & {4{b[2]}};
    assign m3 = a & {4{b[3]}};
    
    assign s1 = m0 + (m1 << 1);
    assign s2 = s1 + (m2 << 2);
    assign s3 = s2 + (m3 << 3);
    assign p = s3;
    
endmodule
