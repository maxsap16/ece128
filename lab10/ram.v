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


module ram(
    input clk, rst, w,
    input [width - 1:0] in,
    input [adr_w - 1 :0] adr,
    output reg [width - 1:0] out 
    );
    
    parameter width = 8;
    parameter adr_w = 4;
    parameter size = 8;
    
    reg [width - 1 : 0] mem [size - 1 : 0]; //data width 8 bits // 16 locations
    
    integer i;
    always @ (posedge clk) begin
        if(rst) begin
            //for loop
            for(i = 0; i < size; i = i + 1) begin
                mem[i] <= 8'd0;
            end

            //mem == 0
        end
        
        else
            if(w) begin
                //write
                mem[adr] <= in;
                //mem[addr] <= in
            end
            else
                //read 
                out <= mem[adr];
    end
endmodule
