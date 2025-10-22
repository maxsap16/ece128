module threebitcounter(input clk, output q1, q2, q3);
    wire tt2;
    wire tt3;
    
    tflipflop num_1(.clk(clk), .t(1'b1), .q(q1));
    assign tt2 = q1;
    tflipflop num_2(.clk(clk), .t(tt2), .q(q2));
    assign tt3 = q2 & q1;
    tflipflop num_3(.clk(clk), .t(tt3), .q(q3));
    
endmodule