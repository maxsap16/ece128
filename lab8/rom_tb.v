module rom_tb;
    reg [2:0] adr;
    wire [3:0] data;
    
    //instantiate
    rom uut(.adr(adr), .data(data));
    
    //seems to be a more simple version of ram
    initial begin
        //initialize adr
        adr = 3'b000;
        
        //test the addresses
        #10; adr = 3'b000;
        #10; adr = 3'b001;
        #10; adr = 3'b010;
        #10; adr = 3'b011;
        #10; adr = 3'b100;
        #10; adr = 3'b101;
        #10; adr = 3'b110;
        #10; adr = 3'b111;
        
        //end sim
        #20
        $stop;
    end
endmodule
