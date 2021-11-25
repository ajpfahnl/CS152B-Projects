#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "PmodBT2.h"
#include "PmodJSTK.h"
#include "sleep.h"

#include "xuartlite.h"
typedef XUartLite SysUart;

#define DEBUG 1

#define SysUart_Send            XUartLite_Send
#define SysUart_Recv            XUartLite_Recv
#define SYS_UART_DEVICE_ID      XPAR_AXI_UARTLITE_0_DEVICE_ID
#define BT2_UART_AXI_CLOCK_FREQ XPAR_CPU_M_AXI_DP_FREQ_HZ

#define CPU_CLOCK_FREQ_HZ 		XPAR_CPU_CORE_CLOCK_FREQ_HZ

PmodBT2 myDevice;
SysUart myUart;
PmodJSTK joystick;

void Initialize();
void Run();
void SysUartInit();
void EnableCaches();
void DisableCaches();

int main() {
   Initialize();
   Run();
   DisableCaches();
   return XST_SUCCESS;
}

void Initialize() {
   EnableCaches();
   SysUartInit();
   BT2_Begin (
      &myDevice,
      XPAR_PMODBT2_0_AXI_LITE_GPIO_BASEADDR,
      XPAR_PMODBT2_0_AXI_LITE_UART_BASEADDR,
      BT2_UART_AXI_CLOCK_FREQ,
      115200
   );

   JSTK_begin(
      &joystick,
	  XPAR_PMODJSTK_0_AXI_LITE_SPI_BASEADDR,
      XPAR_PMODJSTK_0_AXI_LITE_GPIO_BASEADDR
   );
}

void Run() {
	JSTK_DataPacket rawdata;
	u8 led;

	u8 buf[1];
	int n;

	print("Initialized PmodBT2 Demo\n\r");
	print("Received data will be echoed here, type to send data\r\n");

	char * directions_debug[] = {"left", "right", "down", "up", "C", "Q"};
	char * directions = "adswcq";
	int directions_i = 4;
	int directions_i_prev = 4;

	while (1) {
		/* JOYSTICK */
		// Capture button states and positional data
		rawdata = JSTK_getDataPacket(&joystick);

		if (rawdata.YData < 200) {
			directions_i = 0;
		} else if (rawdata.YData > 850) {
			directions_i = 1;
		} else if (rawdata.XData > 750) {
			directions_i = 2;
		} else if (rawdata.XData < 250) {
			directions_i = 3;
		}

		if (DEBUG) {
			xil_printf(
				"X:%d\tY:%d\t%s%s%s%s\r\n",
				rawdata.XData,
				rawdata.YData,
				directions_debug[directions_i],
				(rawdata.Jstk != 0) ? "\tJoystick pressed" : "",
				(rawdata.Button1 != 0) ? "\tButton 1 pressed" : "",
				(rawdata.Button2 != 0) ? "\tButton 2 pressed" : ""
			);
		}

		// Wait for 50ms
		usleep(50000);
		// usleep(500000);

		// Map LEDs to adjacent buttons
		led = 0x0;
		if (rawdata.Button1 != 0) {
			led |= 0x1;
			directions_i = 4;
		}
		if (rawdata.Button2 != 0) {
			led |= 0x2;
			directions_i = 5;
		}
		JSTK_setLeds(&joystick, led);


		/* BLUETOOTH */
		// Echo all characters received from both BT2 and terminal to terminal
		// Forward all characters received from terminal to BT2
		if (directions_i != directions_i_prev) {
			BT2_SendData(&myDevice, (u8*)&directions[directions_i], 1);
		}

		n = SysUart_Recv(&myUart, buf, 1);
		if (n != 0) {
			SysUart_Send(&myUart, buf, 1);
			BT2_SendData(&myDevice, buf, 1);
		}

		n = BT2_RecvData(&myDevice, buf, 1);
		if (n != 0) {
			SysUart_Send(&myUart, buf, 1);
		}

		directions_i_prev = directions_i;
	}
}

// Initialize the system UART device
void SysUartInit() {
#ifdef __MICROBLAZE__
   // AXI Uartlite for MicroBlaze
   XUartLite_Initialize(&myUart, SYS_UART_DEVICE_ID);
#else
   // Uartps for Zynq
   XUartPs_Config *myUartCfgPtr;
   myUartCfgPtr = XUartPs_LookupConfig(SYS_UART_DEVICE_ID);
   XUartPs_CfgInitialize(&myUart, myUartCfgPtr, myUartCfgPtr->BaseAddress);
#endif
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}
