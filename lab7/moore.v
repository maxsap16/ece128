`timescale 1ns / 1ps

module moore(
    input p1, clk, rst,
    output reg y
    );
    
        parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4;
    
    reg[2:0] ps, ns;
    
    //start initialization
    always @ (posedge clk) begin
        if(rst)
            ps <= s0;
        else
            ps <= ns;
    end
    
    //state transition
    always @ (*) begin
        case(ps)
            s0: begin
                if(p1)
                    ns = s1;
                else
                    ns = s0;
            end
            s1: begin
                if(p1)
                    ns = s2;
                else
                    ns = s0;
            end
            s2: begin
                if(!p1)
                    ns = s3;
                else
                    ns = s2;
            end
            s3: begin
                    if(!p1)
                        ns = s4;
                    else
                        ns = s1;
            end
            s4: begin
                    if(!p1)
                        ns = s0;
                    else
                        ns = s1;
            end
        endcase
    end  
    
    //output
    always @ (*) begin
        case(ps)
            s0 : y = 0;
            s1 : y = 0;
            s2 : y = 0;
            s3 : y = 0;
            s4 : y = 1;
        endcase
    end
endmodule
