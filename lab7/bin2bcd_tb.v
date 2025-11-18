module bin2bcd_tb;
reg clk;
reg en;
reg [11:0] in;
wire [15:0] out;
wire rdy;

//bin2bcd uut(.clk(clk), .en(en), .in(bin_d_in), .out(bin_d_out), .rdy(rdy));
bin2bcd uut(clk,en,in,out,rdy);

//generate a 10ns clock
always #5 clk = ~clk;

//simulus
initial begin
    clk = 0;
    en = 0;
    in = 0;
    
    //wait a bit for stability
    #10;
    
    //test 1
    in = 12'd0;
    en = 1;
    #10 en = 0; //short enable pulse
   // wait(rdy); //wait for conversion
    #1800;
    
    //test 2
    in = 12'd1234;
    en = 1;
    #10 en = 0; //short enable pulse
    //wait(rdy); //wait for conversion
    #1800;
    
    //test 3
    in = 12'd4095;
    en = 1;
    #10 en = 0; //short enable pulse
   // wait(rdy); //wait for conversion
    #1800;
    
    //test 4
    in = 12'd875;
    en = 1;
    #10 en = 0; //short enable pulse
   // wait(rdy); //wait for conversion
    #1800;
    
    //stop sim
    #50
    $stop;
end

endmodule
