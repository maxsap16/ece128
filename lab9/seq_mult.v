`timescale 1ns / 1ps

module seq_mult(clk, rst, a, b, p);
    input clk, rst;
    input [3:0] a, b;
    output reg [7:0] p;
    
    reg [3:0] operand_b, shift_count;
    reg [7:0] partial_product, multiplicand;
    reg [2:0] PS, NS;
    
    parameter s0_idle =0 , s1_multiply = 1, s2_update = 2, s3_done = 3;
    
    always @ (posedge clk)
        begin
            if(rst)
                PS <= s0_idle;
            else
                PS <= NS;
        end
    
    //state description
    always @ (posedge clk)
        begin
            case(PS)
                s0_idle: begin
                    multiplicand <= {4'b0, a};
                    partial_product <= 8'b0;
                    shift_count <= 3'b0;
                    operand_b <= b;
                    NS = s1_multiply;
                end 
                s1_multiply: begin
                    NS = s2_update;
                    if(operand_b[0] == 0 && shift_count < 4) begin
                        multiplicand <= multiplicand << 1;
                        partial_product <= partial_product;
                        shift_count <= shift_count + 1;
                        operand_b <= operand_b >> 1;
                        NS <= s1_multiply;
                    end
                    else if (operand_b[0] == 1 && shift_count < 4) begin
                        multiplicand <= multiplicand << 1;
                        partial_product <= partial_product + multiplicand;
                        shift_count <= shift_count + 1;
                        operand_b <= operand_b >> 1;
                        NS <= s1_multiply;
                    end    
                    else if (shift_count == 4) begin
                        NS <= s2_update;
                    end
                end        
                s2_update: begin
                    if(shift_count == 4) begin
                        NS <= s3_done;
                        //partial_product <= partial_product;
                    end
                    else
                        NS <= s1_multiply;
                end        
                s3_done: begin
                    p <= partial_product;
                end
            endcase
        end
endmodule
