`timescale 1ns / 1ps

module control(
    input clk, reset,
    input [2:0] adr1,
    input [2:0] adr2,
    output reg w_rf,
    output reg [2:0] adr,//rom address
    output reg DA,SA,SB,
    output reg [2:0] st_out,
    //output reg done,
    output reg w_ram,
    output reg [4-1 : 0] ram_adr
    );
parameter S0_idle = 0, S1_send_adr1 = 1, S2_send_adr2 = 2,S3_multiply = 3,S4_write_ram = 4, S5_read_ram=5;
reg [2:0] PS,NS;

always@(posedge clk or posedge reset)
	begin
        if(reset)
               	PS <= S0_idle;   
        else    
               	PS <= NS ;
	end
	always@(*)
        	begin 
        	case(PS)
			S0_idle:begin
				NS = S1_send_adr1;
                		st_out <= 3'b000;
                		ram_adr <= 4'd0;
				end
				
			S1_send_adr1:begin	
				w_rf <=1'b1;
			        adr<=adr1;
		        	DA <=1'b0;
			        SA <=1'b0;
		    	        SB <=1'b1;
			        st_out <= 3'b001;
		                NS = S2_send_adr2;
				end
				
			S2_send_adr2:begin
		       		w_rf <= 1'b1; //copying the thing above
				adr<=adr2;
				NS = S3_multiply; //pls check the possibility of this
				DA <=1'b1;
				SA <=1'b0;
				SB <=1'b1;
                    		st_out <= 3'b010;
			        end
			
		        S3_multiply: begin
				NS = S4_write_ram; //i think these just have to go down straight through
                    		st_out <= 3'b011;
			        w_ram<= 1'b1; //pls check this
			    	end

                	S4_write_ram: begin
                    		w_ram <= 1'b1; //this could be completely wrong
                    		st_out <= 3'b100;
				NS = S5_read_ram;
				ram_adr <= 4'd0;
				end
				
			S5_read_ram: begin
                    		w_ram<= 1'b0; //pls keep this in mind
                    		st_out <= 3'b101;
                    		ram_adr <= 4'd0;
				if(!reset) begin
				        NS = S1_send_adr1; 
				end
				else begin
				        NS = S0_idle;
				end
				end
	       		endcase
		end
endmodule
