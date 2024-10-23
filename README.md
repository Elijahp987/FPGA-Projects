**Overview:**

This project implements an Arithmetic Logic Unit (ALU) using VHDL. The ALU takes two 2-bit binary inputs (A and B) and computes five different operations simultaneously. A 4-bit opcode (S) determines which operation's result is passed to the 4-bit output (Y), which is displayed on four LEDs on the Xilinx Zynq-7010 FPGA development board.

**Features:**

Inputs:<br/>
Two 2-bit binary numbers (A and B)<br/>
A 4-bit opcode (S) to select the desired operation<br/>

Outputs:<br/>
A 4-bit result (Y) displayed on four LEDs<br/>
Functions: The ALU supports five operations, including basic arithmetic and logic functions.<br/>
FPGA Integration: Fully compatible with Xilinx-based FPGA platforms.<br/>

**Project Files:**

Source File: ALU_Module.vhd<br/>
Created an entity, ALU1, with inputs A, B, S, and output Y. Also describes the architecture for each of the five ALU functions.

Simulation File: TbenchALU1.vhd<br/>
Establishes a testbench of our ALU module. Establishes all inputs and outputs as signals. Also utilizes a Unit Under Test (UUT) and sim_proc process to test our functions.

Constraints File: ALU.xdc<br/>
Maps inputs and outputs in our design to corresponding pins on the Zynq-7010 FPGA board.

**Usage:**

This project is a great introduction to ALU design, binary operations, and VHDL development. It demonstrates how to control multiple operations through opcodes and display results using FPGA I/O. The design is scalable and can be adapted for higher-bit operations or expanded with additional functions.
