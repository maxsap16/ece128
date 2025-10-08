`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 01:40:37 PM
// Design Name: 
// Module Name: car
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

module multi(clk, bcd_input, seg_anode, seg_cathode);
input clk;
input [15:0] bcd_input;

output [3:0] seg_anode;
output [6:0] seg_cathode;

wire [3:0] bcd_val;
//assign bcd_val = 4'b1110;

anode_gen ag(.clk(clk), .bcd_input(bcd_input), .seg_anode_buf(seg_anode), .bcd_out(bcd_val));
seg_decode ssd(.bcd_val(bcd_val), .seg_cathode(seg_cathode));

endmodule
--------------------------------------------------------------------------
module multi_tb;
reg clk;
reg [15:0] bcd_input;

wire [3:0] seg_anode;
wire [6:0] seg_cathode;

multi uut(.clk(clk), .bcd_input(bcd_input), .seg_anode(seg_anode), .seg_cathode(seg_cathode));

initial begin
clk = 1'b0;
forever begin
#1 clk = ~clk;
end
end


initial begin
bcd_input = 16'b0100011000010001; //4611
#8184 bcd_input = 16'b0100011100010110; //4716
#8184 bcd_input = 16'b1000100001000000; //8840
#8184 bcd_input = 16'b1000001001100010; //8262
#8184 bcd_input = 16'b0011010010000111; //3487
#8184 bcd_input = 16'b0010010001010111; //2457
#8184 bcd_input = 16'b0011001101000110; //3346
#8184 bcd_input = 16'b0101001000011000; //5218
#8184 bcd_input = 16'b0110001110010100; //6394
#8184 bcd_input = 16'b0111010010011001; //7499
$stop;
end
endmodule
