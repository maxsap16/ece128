### Project Description
The main purpose of this lab was to learn how to use the BCD (binary coded decimal) to seven segment display on the FPGA board. This was done through the use of the 4-bit full adder from the previous lab (lab 2) as a top level module. The 4-bit full adder's output provides the input needed to display the result of a given operation. The design is then to be implemented onto the FPGA board in a similar manner as last lab, but this time with the output being observed on the seven segment display instead of the LED lights.

### Implementation Instructions
1. After the source code and testbench files are written, run the synthesis of your code to make sure there are no errors.
2. Then locate the dropdown on the left where you can run a behavioral simulation and observe the waveform diagram. Verify that everything looks correct, which may take some time to do since there isn't an immediately noticeable pattern to how the output is supposed to look in the diagram.
3. If everything looks good, assign your inputs in a similar way as last week (since we are using the same adder for input) and your ouput to the BCD to seven segment display. Be mindful of how the output is assigned because it may show up mirrored on the display. If that happens just reverse the order of which the seven segments are assigned in the constraints file.
4. Generate the bitsream, open the hardware manager, and load the bitstream file into your FPGA board.
5. When the implementation is loaded, start to alter the switches to test your design and observe how the 4 bit full adder functions by looking are your output on the BCD to sevent segment display.
