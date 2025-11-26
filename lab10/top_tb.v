`timescale 1ns / 1ps

module top_tb;
    reg clk, rst;
    reg [2:0] adr1;
    reg [2:0] adr2;
    wire [8-1:0] out;
    
    top uut(clk, rst, adr1, adr2, out);
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        
        //start of numbers
        adr1 = 3'b001; 
        adr2 = 3'b010;
        #100;
        adr1 = 3'b101;
        adr2 = 3'b111;
        #100;
        adr1 = 3'b000; 
        adr2 = 3'b110;
        #100;
        adr1 = 3'b011;
        adr2 = 3'b100;
        #100;
        $stop;
    end
endmodule
