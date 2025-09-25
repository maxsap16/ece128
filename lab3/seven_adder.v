`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2025 02:57:26 PM
// Design Name: 
// Module Name: seven_adder
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

module seven_adder(a, b, seg);
input [3:0] a, b;
output [6:0] seg;

wire [3:0] s;
wire cin;

assign cin = 1'b0;

fa_ripple fr(.a(a), .b(b), .cin(cin), .s(s));

seven_seg sev(.data(s), .seg(seg));
endmodule

-----------------------------------------------------------
module seven_adder_tb;

reg [3:0] a, b;

wire [6:0] seg;

seven_adder uut(.a(a), .b(b), .seg(seg));
initial begin
a = 4; b = 4; #10;
a = 2; b = 1; #10;
a = 3; b = 6; #10;
end
endmodule

