`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 01:45:53 PM
// Design Name: 
// Module Name: anode_gen
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


module anode_gen(clk, bcd_input, seg_anode_buf, bcd_out);
input clk;
input [15:0] bcd_input;

output reg [3:0] seg_anode_buf = 4'b1110;
reg [3:0] seg_anode = 4'b1110;
output reg [3:0] bcd_out;

reg [9:0] g_count = 0;

always@(posedge clk)
    begin
    g_count <= g_count + 1; //nonblocking
    
    if(g_count == 1023) begin
    //do something
        seg_anode <= {seg_anode[0], seg_anode[3:1]};
        seg_anode_buf <= seg_anode;
        case(seg_anode)
            4'b1110 : bcd_out <= bcd_input[3:0];
            4'b1101 : bcd_out <= bcd_input[7:4];
            4'b1011 : bcd_out <= bcd_input[11:8];
            4'b0111 : bcd_out <= bcd_input[15:12];
            default : bcd_out <= 4'b1111;
         endcase 
     end
     
     end
endmodule
---------------------------------------------------------
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 01:59:37 PM
// Design Name: 
// Module Name: seg_decode
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


module seg_decode(bcd_val, seg_cathode);
input [3:0] bcd_val;

output reg [6:0] seg_cathode;

//taken from the old seven seg stuff from lab 3
always@*
begin
    case(bcd_val)
        0 : seg_cathode = 7'b0000001;
        1 : seg_cathode = 7'b1001111;
        2 : seg_cathode = 7'b0010010;
        3 : seg_cathode = 7'b0000110;
        4 : seg_cathode = 7'b1001100;
        5 : seg_cathode = 7'b0100100;
        6 : seg_cathode = 7'b0100000;
        7 : seg_cathode = 7'b0001111;
        8 : seg_cathode = 7'b0000000;
        9 : seg_cathode = 7'b0000100;
    endcase
end
endmodule