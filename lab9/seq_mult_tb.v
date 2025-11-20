module seq_mult_tb;
    reg clk, rst;
    reg [3:0] a, b;
    wire [7:0] p;
    
    seq_mult uut(clk, rst, a, b, p);
    
    always #10 clk = ~clk;
    
    initial begin
    clk  = 0;
    rst = 1;
    #100;
    rst = 0;
    assign a = 4'b1010;
    assign b = 4'b1010;
    // p = 10*10 = 100
    #500
    rst = 1;
    #100;
    rst = 0;
    assign a = 4'b0110;
    assign b = 4'b1110;
    // p = 6*14 = 84
    #500
    rst = 1;
    #100;
    rst = 0;
    assign a = 4'b1001;
    assign b = 4'b1100;
    // p = 9*12 = 108
    #500
    assign a = 4'b1010;
    assign b = 4'b0001;
    // p = 10*1 = 10
    rst = 1;
    #100;
    rst = 0;
    end
endmodule
