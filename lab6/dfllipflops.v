`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 02:07:38 PM
// Design Name: 
// Module Name: dflipflopsync
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


module dflipflopsync(input d, rstn, clk, output reg q);
    always @ (posedge clk)
        if(!rstn)
            q <= 0;
        else
            q <= d;
endmodule