module moore_tb;
reg p1, clk, rst; 
wire y;

//instantiate
moore uut(.p1(p1), .clk(clk), .rst(rst), .y(y));

//clk stuff
initial begin
    clk = 1'b0;
    rst = 1'b1;
    #15 rst = 1'b0;
end 

always #5 clk = ~clk;

//actual testbench
initial begin
    #10 p1 = 0;
    #10 p1 = 1; 
    #10 p1 = 0; 
    #10 p1 = 0;
    #10 p1 = 1;
    #10 p1 = 1;
    #10 p1 = 1;
    #10 p1 = 1;
    #10 p1 = 1;
    #10 p1 = 0;
    #10 p1 = 1;
    #10 p1 = 1;
    #10 p1 = 0;
    #10 p1 = 0;
    #10 p1 = 0;
    #10 p1 = 0;
    #10 p1 = 1;
    #10 $finish;
end 
endmodule
