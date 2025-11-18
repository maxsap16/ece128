`timescale 1ns / 1ps

module mealy(
    input clk, rst, p1,
    output reg y
    );
    
    //overlapping mealy sequence detector
    
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    
    reg[1:0] ps, ns;
    
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
                    ns = s1;
            end
            s2: begin
                if(!p1)
                    ns = s3;
                else
                    ns = s2;
            end
            s3: begin
                    if(p1)
                        ns = s0;
                    else
                        ns = s1;
            end
            //default:
        endcase
    end  
    
    //output
    always @ (*) begin
        case(ps)
            s0 : y = 0;
            s1 : y = 0;
            s2 : y = 0;
            s3 : begin
                if(p1)
                    y = 1;
                end
        endcase
    end
endmodule
