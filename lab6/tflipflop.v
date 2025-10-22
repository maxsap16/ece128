`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 02:21:30 PM
// Design Name: 
// Module Name: tflipflop
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


module tflipflop(input clk, t, output reg q);
    initial q = 1'b0;
    always @ (posedge clk) begin
        if(t)
            q <= ~q;
     end
endmodule