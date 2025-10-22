`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 01:41:56 PM
// Design Name: 
// Module Name: srlatch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module srlatch(input s, r, output q, qbar);
    nor #1 n1(q, r, qbar);
    nor #1 n2(qbar, s, q);
endmodule