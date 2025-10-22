module threebitcounter_tb;
    reg clk;
    wire q1, q2, q3;
    
    threebitcounter uut(.clk(clk), .q1(q1), .q2(q2), .q3(q3));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        #200; //makes sure it runs for 200 ns
        $finish;
    end
    
endmodule