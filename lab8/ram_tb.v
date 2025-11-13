module ram_tb;
    reg clk, rst, w;
    reg [width - 1:0] in;
    reg [adr_w - 1 :0] adr;
    wire [width - 1:0] out;
    
    parameter width = 8;
    parameter adr_w = 4;
    parameter size = 8;
    
    ram uut(.clk(clk), .rst(rst), .w(w), .in(in), .adr(adr), .out(out));

    always #5 clk = ~clk; //clock generation 
    
    initial begin
        //initialize the values
        clk = 0;
        w = 0; 
        adr = 3'b000;
        in = 8'b00000000; 
        rst = 1;
        
        //wait some time
        #10;
        rst = 0;
        
        //write ops
        w = 1;
        adr = 3'b000; in = 8'h11; #10;
        adr = 3'b001; in = 8'h22; #10;
        adr = 3'b010; in = 8'h33; #10;
        adr = 3'b011; in = 8'h44; #10;
        adr = 3'b100; in = 8'h55; #10;
        adr = 3'b101; in = 8'h66; #10;
        adr = 3'b110; in = 8'h77; #10;
        adr = 3'b111; in = 8'h88; #10;
        
        //read ops
        w = 0; #5;
        adr = 3'b000; #10;
        adr = 3'b001; #10;
        adr = 3'b010; #10;
        adr = 3'b011; #10;
        adr = 3'b100; #10;
        adr = 3'b101; #10;
        adr = 3'b110; #10;
        adr = 3'b111; #10;
        
        //stop sim
        #20;
        $stop;
    end
endmodule
