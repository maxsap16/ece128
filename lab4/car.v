`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 01:40:37 PM
// Design Name: 
// Module Name: car
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//legal requirements for driving
module car(sbd, door, key, brk, park, hood, bat, air, tmp, pass, sbp, trunk, pbrk, srv,
start_permit, chime, warn_pr2, warn_pr1, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, air_warn, temp_warn);
input sbd, door, key, brk, park, hood, bat, air, tmp, pass, sbp, trunk, pbrk, srv;
output start_permit, chime, warn_pr2, warn_pr1, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, air_warn, temp_warn;

//choose the dataflow way to do this
assign seat_warn = (~sbd ) | (pass & ~sbp);
assign door_warn = (~door);
assign hood_warn = (~hood);
assign trunk_warn = (~trunk);
assign bat_warn = (~bat);
assign air_warn = (~air);
assign temp_warn = (~tmp);

//pr2 has the non-lethal issues while pr1 has directly dangerous issues
assign warn_pr2 = (seat_warn) | (door_warn) | (hood_warn) | (trunk_warn); //second highest priority
assign warn_pr1 = (bat_warn) | (air_warn) | (temp_warn); //highest priority warning

//chime if any warnings happen
assign chime = (warn_pr2) | (warn_pr1); //almost the bottom because the other things are important to chime

//can start car
assign start_permit = (~chime) & (key) & (brk) & (park) & (pbrk) & (srv); //at the bottom due to being the last thing to check

endmodule

-------------------------------------------------------------------------------------------------------------------------------
module car_tb;
reg sbd, door, key, brk, park, hood, bat, air, tmp, pass, sbp, trunk, pbrk, srv;
wire start_permit, chime, warn_pr2, warn_pr1, seat_warn, door_warn, hood_warn, trunk_warn, bat_warn, air_warn, temp_warn;

car uut(.sbd(sbd), .door(door), .key(key), .brk(brk), .park(park), .hood(hood), .bat(bat), .air(air), .tmp(tmp), .pass(pass), .sbp(sbp), .trunk(trunk), .pbrk(pbrk), .srv(srv),
.start_permit(start_permit), .chime(chime), .warn_pr2(warn_pr2), .warn_pr1(warn_pr1), .seat_warn(seat_warn), .door_warn(door_warn), .hood_warn(hood_warn), .trunk_warn(trunk_warn),
.bat_warn(bat_warn), .air_warn(air_warn), .temp_warn(temp_warn));

initial begin

    //intitalize everything to 1 
    #10 sbd = 1'b1; door = 1'b1; key = 1'b1; brk = 1'b1; park = 1'b1; hood = 1'b1; bat = 1'b1; air = 1'b1; tmp = 1'b1; pass = 1'b1; sbp = 1'b1; trunk = 1'b1; pbrk = 1'b1; srv = 1'b1;

    //11 tests as there are 11 lights that can turn on
    #10 sbd = 1'b0; //to turn on the warning we set the input to 0 and using this logic of 0 = bad 1 = good
    #10 sbd = 1'b1; door = 1'b0; //going down the line we corrected the inputs to show how only one is wrong at a time
    #10 door = 1'b1; hood = 1'b0;
    #10 hood = 1'b1; bat = 1'b0;
    #10 bat = 1'b1; air = 1'b0;
    #10 air = 1'b1; trunk = 1'b0;
    #10 trunk = 1'b1; tmp = 1'b0;
    #10 tmp = 1'b1; pass = 1'b1; sbp = 1'b0;
    #10 sbp = 1'b1; srv = 1'b0;
    #10 srv = 1'b1; pbrk = 1'b0;
    #10 pbrk = 1'b1; key = 1'b1; brk = 1'b1; park = 1'b1; 
    #10 $stop;
end

endmodule
