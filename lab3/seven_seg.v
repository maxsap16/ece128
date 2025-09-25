`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2025 01:41:45 PM
// Design Name: 
// Module Name: seven_seg
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

module seven_seg(
input [3:0] data,
output reg [6:0] seg);

//behavioral
always @*
    begin
        case(data)
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            default : seg = 7'b0000000;
       endcase
    end
endmodule
-----------------------------------------------------
module seven_seg_tb;
reg [3:0] data;
wire [6:0] seg;

seven_seg uut(.data(data), .seg(seg));

integer i;

initial begin
for(i = 0; i < 10; i = i + 1)begin
     data = i;
     #10;
end
$stop;
end

endmodule
