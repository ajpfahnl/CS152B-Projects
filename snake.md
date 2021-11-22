# Snake on Basys3

## Prerequisites
Install Vivado with Vitus (version 2021.2) and download the [Digilent Vivado library](https://github.com/Digilent/vivado-library/). I've installed Vivado and Vitus on my external SSD to a directory called `D:\Xilinx`. I've cloned the Digilent Vivado library to `D:\Xilinx\Libraries\vivado-library`.

We will be using the __Pmod BT2__ module. Check out the following resources:
 * Digilent Vivado library [IP, drivers, and example code](https://github.com/Digilent/vivado-library/tree/master/ip/Pmods/PmodBT2_v1_0)
 * Pmod BT2 [reference manual](https://digilent.com/reference/pmod/pmodbt2/reference-manual)
 * Nexys-3 Pmod BT2 [demo](https://digilent.com/reference/learn/programmable-logic/tutorials/nexsys-3-pmodbt2-demo/start), specifically how to connect to the module via Bluetooth to your computer

## Creating the hardware
In this repo, I created a Vivado project under `snake_hw`.
 1. Create a project and ensure that the __Basys3__ board is chosen as the default part.
 2. Download the Basys3 master constraints file from [here](https://raw.githubusercontent.com/Digilent/Basys3/master/Projects/GPIO/src/constraints/Basys3_Master.xdc) and add it as a constraint file to the project (click _Add Sources_).
 3. Create a block design and follow the steps [here](https://digilent.com/reference/programmable-logic/guides/getting-started-with-ipi) to add Microblaze to the design.
    * Connect system clock board component, and run connection automation
    * Add the Microblaze IP, run connection automation, and configure with 32KB of local memory
    * Connect USB UART to `UART` of `AXI Uartlite` and run connection automation
 4. Under project manager settings, under _Project Settings -> IP -> Repository_, add the Digilent Vivado library (`D:\Xilinx\Libraries\vivado-library`) so that we can load Digilent's IPs. Also configure this under _Tool Settings -> IP Defaults_ to have the library available for all future projects automatically.
 5. In the block diagram, select _Add IP_ and add `PmodBT2_v1_0` and run connection automation.
 6. I'm connecting to the `JB` GPIO port, so connect the `JB Connector` to `Pmod_out` of the `PmodBT_0` component.
 7. Validate design and ensure that validation is successful.
 8. Create an `HDL Wrapper` for block design.
 9. Run synthesis. You can ignore the critical warnings about the PmodBT2 IP being packaged with a different board originally.
 10. Open the synthesized design, select _Window -> I/O ports_ and under `jb_54576 -> Scalar ports (8)` (or equivalent) set `jb_pin7_0`'s package pin to `A15`, and the following to `A17`, `C15`, and `C16`. Set all I/O standards to `LVCMOS33`. Save and write to the board constraint file.
 11. Click _Generate Bitstream_.
 12. Select _File -> Export -> Export Hardware_, include the bitstream, and remember where the `.xsa` file is stored for use Vitus (the software development kit).

## Creating the software