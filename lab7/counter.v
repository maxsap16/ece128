`timescale 1ns / 1ps

module counter(

input clk,
output done,
output [11:0] bin);

parameter size = 34;

reg [size -1:0] count = 0;
reg fin = 0;
reg old = 0;


 always @(posedge clk)
    begin
    count <= count+1;
        if((old && !count[size-12]) || (!old && count[size-12]))
            begin
            fin <=1;
            end
        else
            begin
            fin <=0;
            end
         old <=count[size-12];
         end
     
assign bin =  count[size-1: size-12];
assign done = fin;  
   
endmodule
