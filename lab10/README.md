### Project Description
The goal of this lab is to make use several previous designs and concepts to create a multiplier that can read its two multiplcands from one location and write the product to another. This design makes use of submodules from previous labs such as a ROM, RAM, and combinational multiplier but also calls for the creation of a new submodule that handles the data reading, writing, and multiplcation process. Of course, a top module is necessary to establish the connection between these submodules and a testbench to validate its functionality.

### Implementation Instructions
1. After the source code and testbench files are written, run the synthesis of your code to make sure there are no errors.
2. Then locate the dropdown on the left where you can run a behavioral simulation and observe the waveform diagram. This design is quite complex, so adding the submodules to the simulation waveform may help when tracking how the data moves from the rom, control unit, and ram.
3. If everything looks good, assign your inputs and outputs: turn on the system clock, use 3 switches per ram in put address, a switch for the reset, and the LEDs for your output.
5. Generate the bitsream, open the hardware manager, and load the bitstream file into your FPGA board.
6. When the implementation is loaded, alter the address switches to see how the different values stored in your rom can be multiplied together.
