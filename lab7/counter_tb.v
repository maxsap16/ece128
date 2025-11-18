module counter_tb;
reg clk;
wire done;
wire[11:0] bin;

counter uut(.clk(clk), .done(done), .bin(bin));

always #5 clk = ~clk; //100 MHz

initial begin
    clk = 0;
    #100000; //run simulation
    $stop;
end

endmodule
