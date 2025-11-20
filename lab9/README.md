### Project Description
The main purpose of this lab was to learn about yet another fundamental component of digital logic circuits: multipliers. To understand them, this lab asks us to implement both a sequential and combinational multiplier that is capable of computing the output of two 4 bit numbers being multiplied. As a way to visualize the funcionality, we're also asked to either program the output to the LEDs or the seven segment display.

### Implementation Instructions
1. After the source code and testbench files are written, run the synthesis of your code to make sure there are no errors. The testbench files can consist of whatever values you wish to test.
2. Then, locate the dropdown on the left where you can run a behavioral simulation and observe the waveform diagrams. Make sure your output matches the product of your chosen inputs.
3. If everything looks good, then program your inputs on the switches and your ouput to the LEDs or seven segment display (if choosing seven segment display, you will need to write a top module to combine the necessary submodules). Each 4 bit input gets 4 switches, the sequential reset gets one switch, and the output gets 8 LEDs.
4. Generate the bitsream, open the hardware manager, and load the bitstream file into your FPGA board.
5. When the implementation is loaded, mess around with your inputs to observe the functionality of your multipliers. Note: when using the sequential multiplier, engage the reset after each operation.
