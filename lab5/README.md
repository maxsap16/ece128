### Project Description
The purpose of this lab was to build off of the work we did with lab3, the bcd to seven segment display. This time our goal was to be able to produce and display output with a value greater than one digit (output > 9) since we didn't code the individual anodes for lab3. This is to be done through the creation of an "anode generator" module that can take the input from the previously designed four bit full adder and seven segment decoder and delegate which anode displays what number.

### Implementation Intsructions
1. After the source code and testbench files are written (testbench values should just be whatever values you want to use to test, ther are no specific values you should test), run the synthesis of your code to make sure there are no errors.
2. Then locate the dropdown on the left where you can run a behavioral simulation and observe the waveform diagram. Verify that everything looks correct; make sure that the four anodes are each getting the correct digit for the number you're testing.
3. If everything looks good, assign your inputs in a similar way as last lab (since we are using the same adder for input) and your ouput to the BCD to seven segment display. All 16 switches should be utilized with each group of four pertaining to the value of one digit.
4. Generate the bitsream, open the hardware manager, and load the bitstream file into your FPGA board.
5. When the implementation is loaded, start to alter the switches to test your design and observe how the 4 bit full adder functions by looking are your 4 digit output on the BCD to sevent segment display.
