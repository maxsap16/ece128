module dflipflopsync_tb;
    reg clk, d, rstn;
    reg [2:0] delay;
    
    dflipflopsync uut(.d(d), .rstn(rstn), .clk(clk), .q(q));
    
    //generate clock
    always #10 clk = ~clk;
    
    integer i;
    
    //testcase
    initial begin
        clk <= 0;
        d <= 0;
        rstn <= 0;
        
        #15 d <= 1;
        #10 rstn <= 1;
        for(i = 0; i < 5; i = i+1)begin
            delay = $random;
            #(delay) d <= 1;
        end
        
        #15 d <= 0;
        #15 rstn <= 0;
        
        #15 d <= 1;
        #15 rstn <= 0;
    end           
endmodule