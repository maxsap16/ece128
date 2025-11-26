`timescale 1ns / 1ps

module top(
    input clk, rst,
    input [2:0] adr1,
    input [2:0] adr2,
    output [8-1:0] out
    );
    
    wire w_rf,w_ram;
    wire [2:0] rom_adr;
    wire [3:0]ram_adr;
    wire DA,SA,SB;
    wire [3:0] A,B,data_in;
    wire [7:0] p;
    
    control cu(.clk(clk), .reset(rst),.adr1(adr1),.adr2(adr2), .w_rf(w_rf),.adr(rom_adr), .DA(DA),.SA(SA),.SB(SB),.w_ram(w_ram),.ram_adr(ram_adr));
    reg_file fr(A, B, SA, SB, data_in, DA, w_rf, rst, clk); //Getting input from rom and sending to Multiplier//DA,SA,SB-Adress of Register coming from cu
    comb_mult mult(A, B, p);
    ram ram(clk, rst, w_ram, p, ram_adr, out); //out --final result
    rom rom1(rom_adr, data_in);
endmodule
