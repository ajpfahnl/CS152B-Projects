
/*******************************************************************
*
* CAUTION: This file is automatically generated by HSI.
* Version: 2021.2
* DO NOT EDIT.
*
* Copyright (C) 2010-2021 Xilinx, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT 

* 
* Description: Driver configuration
*
*******************************************************************/

#include "xparameters.h"
#include "xgpio.h"

/*
* The configuration table for devices
*/

XGpio_Config XGpio_ConfigTable[XPAR_XGPIO_NUM_INSTANCES] =
{
	{
		XPAR_AXI_GPIO_SSD_DEVICE_ID,
		XPAR_AXI_GPIO_SSD_BASEADDR,
		XPAR_AXI_GPIO_SSD_INTERRUPT_PRESENT,
		XPAR_AXI_GPIO_SSD_IS_DUAL
	},
	{
		XPAR_AXI_GPIO_BTNS_DEVICE_ID,
		XPAR_AXI_GPIO_BTNS_BASEADDR,
		XPAR_AXI_GPIO_BTNS_INTERRUPT_PRESENT,
		XPAR_AXI_GPIO_BTNS_IS_DUAL
	}
};


