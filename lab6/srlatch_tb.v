module srlatch_tb;
reg r, s;
wire q,qbar;

srlatch uut(.s(s), .r(r), .q(q), .qbar(qbar));

initial begin
    r = 0; s = 0;
    #5 s = 1;
    #5 s = 0;
    #5 r = 1;
    #5 r = 0; s = 1;
    #5 s = 0; r = 1;
    #5 r = 0;
    #5 r = 1; s = 1;
    end
    
endmodule