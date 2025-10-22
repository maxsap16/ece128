module srflipflop_tb;
reg s, r, clk;
wire q, qbar;

srflipflop uut(.q(q), .qbar(qbar), .r(r), .clk(clk), .s(s));

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    s = 1; r = 0;
    #100 s = 0; r = 1;
    #100 s = 0; r = 0;
    #100 s = 1; r = 0;
    #100 s = 1; r = 1;
end
endmodule