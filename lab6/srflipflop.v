`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 01:55:33 PM
// Design Name: 
// Module Name: srflipflop
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


module srflipflop(input s, r, clk, output reg q, qbar);
    always @ (posedge clk) begin
        //qbar <= ~q;
        //qbar <= qbar + 1;
        case({s, r})
            2'b00 : q <= q;
            2'b01 : q <= 0;
            2'b10 : q <= 1;
            2'b11 : q <= 1'bx; //invalid   
        endcase 
        //qbar <= ~q;
     end
     
     //this is for the qbar and q timing
     always @ (*) begin
        qbar = ~q;
     end
endmodule