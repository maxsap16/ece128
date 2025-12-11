module adder_top_tb;
    reg [7:0] A, B;
    wire [8:0] S;
    
    adder_top dut (.A_0(A), .B_0(B), .S_0(S));

    initial begin
    $dumpfile("adder_top_tb.vcd");
    $dumpvars(0, adder_top_tb);
    end

    initial begin
         A = 0; B = 0;
         #10;
         A = 8'd5; B = 8'd7; #10;
         A = 8'd100; B = 8'd28; #10;
         A = 8'd255; B = 8'd255; #10;
         repeat (10) begin
         A = $urandom_range(0,255);
         B = $urandom_range(0,255);
         #10;
         end
         #50 $finish;
         end
         // Optional live print
         initial $monitor("t=%0t ns A=%0d B=%0d S=%0d", $time, A, B, S);
endmodule