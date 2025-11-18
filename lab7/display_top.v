`timescale 1ns / 1ps

module display_top(

input mclk,
output wire [6:0] seg,
output wire [3:0] an);


 reg [15:0] stat_bcd = 16'b0;
 
 wire en;
 wire [11:0] bin_d_in;
 wire [15:0] bcd_d_out;
 wire rdy;
 wire clock_out;
 
 counter uut1(clock_out,en,bin_d_in);
 bin2bcd uut2(clock_out, en,bin_d_in,bcd_d_out,rdy);
 multi uut3(clock_out,stat_bcd,an, seg);
 clk_divider uut4(mclk,clock_out);
 
 always @(posedge mclk)
    begin
    if(rdy)
       begin
       stat_bcd<=bcd_d_out;
       end
     end
   
endmodule
