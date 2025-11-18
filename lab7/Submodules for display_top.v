---------------------------------------------------------------------
module clk_divider(clock_in,clock_out);
    input clock_in; // input clock on FPGA
    output reg clock_out; // output clock after dividing the input clock by divisor
    reg[27:0] counter=28'd0;
    parameter DIVISOR = 28'd2; //the following comments are with the help of prof
    // You will modify the DIVISOR parameter value to 28'd50.000.000
    // Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
    always @(posedge clock_in)
        begin
            counter <= counter + 28'd1;
            if(counter>=(DIVISOR-1))
                counter <= 28'd0;
            clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
        end
endmodule
-----------------------------------------------------------------------
module multi(
input clk,
 input [15:0] bcd_in,
 output [3:0] an,
 output [6:0] cath);

parameter g_s = 5;
parameter gt = 4;

wire [6:0] sseg_o;
reg [3:0] anode =4'b0001;
reg [3:0] bcd_seg =4'b0000;
reg [g_s-1:0] g_count =0;

ss_decode ss_dec(clk, bcd_seg,sseg_o);

    always @(posedge clk)
    begin
    g_count =g_count+1;
        if(g_count == 0)
            begin
            if(anode == 4'b0001)
                begin
                anode = 4'b1000;
                end  
            else
                begin
                anode = anode >>1;
                end
             end
             
         if(&g_count[g_s-1:gt])
            begin
            case (anode) //case statement
            4'b1000 : bcd_seg = bcd_in[15:12];
            4'b0100 : bcd_seg = bcd_in[11:8];
            4'b0010 : bcd_seg = bcd_in[7:4];
            4'b0001 : bcd_seg = bcd_in[3:0];
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : bcd_seg = 4'b1111;
            endcase
         end
         
         else
            begin
            bcd_seg = 4'b1111;
            end
          end
assign  an = ~anode;  
assign  cath =  sseg_o;    
       
endmodule
----------------------------------------------------------------------
module ss_decode(clk, bcd,seg);
 input clk;
 input [3:0] bcd;
 output reg[6:0] seg;
 
//always block for converting bcd digit into 7 segment format
    always @(posedge clk)
    begin
        case (bcd) //case statement
       
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : seg = 7'b1111111;
           
        endcase
       
        end
endmodule
----------------------------------------------------------------------