`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:43:25 PM
// Design Name: 
// Module Name: ram
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


module rom(
    input [2:0] adr,
    output reg [3:0] data
    );
    
    always @ (*) begin
        case(adr)
            3'd0 : data = 4'b0000;
            3'd1 : data = 4'b1100;
            3'd2 : data = 4'b0110;
            3'd3 : data = 4'b0111;
            3'd4 : data = 4'b1000;
            3'd5 : data = 4'b0001;
            3'd6 : data = 4'b1101;
            3'd7 : data = 4'b1110;
        endcase
    end
endmodule
