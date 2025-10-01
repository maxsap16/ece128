### Project Description
The main purpose of this lab is to create a design that simulates the safety mechanisms within a car. The design is to consider various inputs (such as whether or not the key is in the ignition, if the driver door is open, if the battery at an ok temperature, etc.) and map them together to display various outputs (such as various warning signals and whether or not the car can start safely). This design is made using a complex system of combinational logic with a very complicated truth table, but since this is a more practical example of how FPGA boards can be used, most of the design can be figured out intuitively (e.g. the car cannot safely turn on if the key is not inserted). The many inputs and outputs are to be implemented through the switches and leds respectively so that the safety system's capabilities can be observed in real time.

### Implementation Instructions
1. After the source code and testbench files are written, run the synthesis of your code to make sure there are no errors.
2. Then locate the dropdown on the left where you can run a behavioral simulation and observe the waveform diagram. Verify that everything looks correct, which may take some time to do since the truth table for this design is quite complex and asymmetrical.
3. If everything looks good, assign the many inputs to the switches and outputs to the leds. Most of them will be used.
4. Generate the bitsream, open the hardware manager, and load the bitstream file into your FPGA board.
5. When the implementation is loaded, start to alter the switches to test your design and 
see how the safety mechanism reacts to different signals being activated. There are many combinations of inputs you can try, but make sure that all of the warning lights turn on when necessary and that there is a scenario where your car can start.
