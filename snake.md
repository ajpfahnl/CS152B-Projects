# Snake on Basys3

## Prerequisites
Install Vivado with Vitus (version 2021.2) and download the [Digilent Vivado library](https://github.com/Digilent/vivado-library/). I've installed Vivado and Vitus on my external SSD to a directory called `D:\Xilinx`. I've cloned the Digilent Vivado library to `D:\Xilinx\Libraries\vivado-library`.

We will be using the __Pmod BT2__ and __Pmod JSTK__ modules. Check out the following resources:
 * Digilent Vivado library [IP, drivers, and example code](https://github.com/Digilent/vivado-library/tree/master/ip/Pmods/PmodBT2_v1_0) for Pmod BT2
 * Pmod BT2 [reference manual](https://digilent.com/reference/pmod/pmodbt2/reference-manual)
 * Nexys-3 Pmod BT2 [demo](https://digilent.com/reference/learn/programmable-logic/tutorials/nexsys-3-pmodbt2-demo/start), specifically how to connect to the module via Bluetooth to your computer
 * Digilent Vivado library [IP, drivers, and example code](https://github.com/Digilent/vivado-library/tree/master/ip/Pmods/PmodJSTK_v1_0) for Pmod JSTK
 * Pmod JSTK [reference manual](https://digilent.com/reference/pmod/pmodjstk/reference-manual)

Also check out the Basys3 reference manual [here](https://digilent.com/reference/programmable-logic/basys-3/reference-manual).

## Creating the hardware
In this repo, I created a Vivado project under `snake_hw`.
 1. Create a project and ensure that the __Basys3__ board is chosen as the default part.
 2. Download the Basys3 master constraints file from [here](https://raw.githubusercontent.com/Digilent/digilent-xdc/master/Basys-3-Master.xdc) and add it as a constraint file to the project (click _Add Sources_).
 3. Create a block design and follow the steps [here](https://digilent.com/reference/programmable-logic/guides/getting-started-with-ipi) to add Microblaze to the design.
    * Connect system clock board component, and run connection automation
    * Add the Microblaze IP, run connection automation, and configure with 32KB of local memory
    * Connect USB UART to `UART` of `AXI Uartlite` and run connection automation
 4. Under project manager settings, under _Project Settings -> IP -> Repository_, add the Digilent Vivado library (`D:\Xilinx\Libraries\vivado-library`) so that we can load Digilent's IPs. Also configure this under _Tool Settings -> IP Defaults_ to have the library available for all future projects automatically.
 5. Add Bluetooth IP:
    * In the block diagram, select _Add IP_ and add `PmodBT2_v1_0` and run connection automation.
    * I'm connecting to the `JB` GPIO port, so connect the `JB Connector` to `Pmod_out` of the `PmodBT_0` component.
 6. Add joystick IP:
    * In the block diagram, double clock on `clk_wiz_0` and add a second clock with a frequency of 16 MHz.
    * Add the `PmodJSTK_v1_0` IP and connect `ext_spi_clk` to the 16 MHz clock.
    * Run connection automation.
    * I'm connecting to the `JA` GPIO port, so connect the `JA connector` to `Pmod_out` of the `PmodJSTK_0` component.
 7. Validate design and ensure that validation is successful.
 8. Create an `HDL Wrapper` for block design.
 9. Edit the Basys3 constraint file with new constraints. [Here is mine](snake_hw/snake_hw.srcs/constrs_1/imports/Downloads/Basys3_Master.xdc). I had to manually configure the bottom four pins for both `JA` and `JB`.
 10. Run synthesis. You can ignore the critical warnings about the PmodBT2 IP being packaged with a different board originally. You can the layout to I/O planning if you want to edit the constraints in a more interactive manner.
 11. Click _Generate Bitstream_.
 12. Select _File -> Export -> Export Hardware_, include the bitstream, and remember where the `.xsa` file is stored for use Vitus (the software development kit).

![snake_block_diagram](snake_hw/design_1.png)

## Creating the software
In this repo, I created a Vitus (essentially Eclipse) workspace under `snake_sw`.
 1. Open Vitus and create a new application project.
 2. Switch to _Create a new platform from hardware (XSA)_ and add the path to the `.xsa` file generated above. Name the project `snake` with the auto-generated system name `snake_system`.
 3. Create an empty C project and create a `main.c` file.
 4. Drivers for the Pmods are automatically associated, so all you need to do is add `#include "PmodBT2.h"` and `#include "PmodJSTK.h"` to include the driver code.
 5. Check the APIs for the drivers and check out the example code in the Pmod folders in the Digilent Vivado repository to determine how to interface and create your program. Here is my [`main.c`](snake_sw/snake/src/main.c).
 6. Click _Xilinx -> Program Device_ to program the FPGA with the bitstream generated in the Vivado.
 7. Right click on the _snake_ application in the explorer and select _Run as -> 1 Launch Hardware_.
 8. Connect your host computer to the bluetooth device named `RSBT_XXXX`. Mine was named `RSBT_681C`. See the Nexys-3 Pmod BT2 [demo](https://digilent.com/reference/learn/programmable-logic/tutorials/nexsys-3-pmodbt2-demo/start), specifically how to connect to the module via Bluetooth to your computer if you run into issues.
 9. I'm using _Tera Term_ to interface with serial ports. Open two terminals connected to serial ports. The port dropdown should be automatically populated with at least two COM numbers, one for serial over bluetooth and one for USB serial.
 10. Typing into the USB serial connection, you should see text echo in both the Bluetooth terminal and USB terminal. When typing text in the Bluetooth terminal, you should see text echo in the USB terminal. Running [snake](snake_sw/pythonBluetooth.py) (with the appropriate COM port), you can control the game with the joystick.