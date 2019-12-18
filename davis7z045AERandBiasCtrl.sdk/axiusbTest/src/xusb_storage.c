/* $Id: xusb_storage.c,v 1.1.2.2 2010/08/17 02:35:21 vidhum Exp $ */
/******************************************************************************
*
* Copyright (C) 2006 Vreelin Engineering, Inc.  All Rights Reserved.
* (c) Copyright 2007-2009 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/
/*****************************************************************************/
/**
 * @file xusb_storage.c
 *
 * This file contains Mass storage device application related functions.
 *
 * @note	The example is tested on MicroBlaze, PPC405 and 440 systems
 *		with caches included in the H/W design  and also with systems
 *		not having caches.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- ---- -----------------------------------------------------------------
 * 1.00a hvm  2/22/07 First release
 * 1.01a hvm  5/30/07 Added code to handle endpoint zero class specific
 *		      commands. Added support for PPC.
 * 1.01a hvm  10/2/08 The complete SCSI READ command processing implementation
 *			is modified. The send processing is shifted into the
 *			endpoint one interrupt handler.Updated the code to
 *			enable caches.
 * 2.00a hvm  12/08/08 Updated the example with cache APIs
 * 2.00a hvm  03/12/09 Updated the example with DMA Done check for every
 *			transaction initiated.
 * 3.00a hvm  11/18/09 Updated to use HAL processor APIs.
 *		       XUsb_mReadReg is renamed to XUsb_ReadReg and
 *		       XUsb_mWriteReg is renamed to XUsb_WriteReg.
 * 3.02a hvm  08/16/10 Updated with the little endian support changes.
 *
 * </pre>
 *****************************************************************************/
/***************************** Include Files *********************************/

#include "xusb.h"
#include "xusb_storage.h"
#include "xenv_standalone.h"
#include "xil_exception.h"
#include "xil_cache.h"

#ifdef XPAR_INTC_0_DEVICE_ID
#include "xintc.h"
#include <stdio.h>
#else
#include "xscugic.h"
#include "xil_printf.h"
#endif

/************************** Constant Definitions *****************************/

#define USB_DEVICE_ID		XPAR_USB_0_DEVICE_ID


#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_INTC_0_DEVICE_ID
#define USB_INTR		XPAR_INTC_0_USB_0_VEC_ID
#else
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define USB_INTR		XPAR_FABRIC_USB_0_VEC_ID
#endif /* XPAR_INTC_0_DEVICE_ID */


#define ULPI_HSIC_REGISTER1	0x2A
#define ULPI_HSIC_REGISTER2	0x2B
#define ULPI_HSIC_STATUS_REGISTER	0x29
#define WRITE_REG_DATA		0xAA

#define READ_COMMAND		1
#define WRITE_COMMAND		2
#undef XUSB_MS_DEBUG

/************************** Variable Definitions *****************************/

#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC		XIntc
#define INTC_HANDLER	XIntc_InterruptHandler
#else
#define INTC		XScuGic
#define INTC_HANDLER	XScuGic_InterruptHandler
#endif /* XPAR_INTC_0_DEVICE_ID */


XUsb UsbInstance;		/* The instance of the USB device */
XUsb_Config *UsbConfigPtr;	/* Instance of the USB config structure */
//XClk_Wiz_Config *clkWizConfigPtr;

INTC InterruptController;	/* Instance of the Interrupt Controller */

volatile u8 CmdFlag = 0;

volatile u8 FirstPkt = 0;
u8  *WrRamDiskPtr;
u8 *RdRamDiskPtr;
volatile u8 RdIndex = 0;
volatile unsigned int read_int_occured = 0;
volatile unsigned int write_int_occured = 0;
volatile int write_index=0;
volatile int write_block_count = RAMDISKSECTORS-2;
volatile int usb_packet_size = 512;
#define PERF		0

 /*****************************************************************************/
 /**
  * This main function starts the USB application.
  *
  *
  * @param	None.
  *
  * @return
  *		- XST_SUCCESS if successful.
  *		- XST_FAILURE if test fails.
  * @note	None.
  *
  *****************************************************************************/
#if PERF
 int main()
 {
 	int Status;

 	xil_printf("Inside main \n\r");

 	/*
 	 * Initialize the USB driver.
 	 */
 	UsbConfigPtr = XUsb_LookupConfig(USB_DEVICE_ID);
 	if (NULL == UsbConfigPtr) {
 		return XST_FAILURE;
 	}
 #ifdef __PPC__

 	Xil_ICacheEnableRegion (0x80000001);
 	Xil_DCacheEnableRegion (0x80000001);
 #endif
 #ifdef __MICROBLAZE__
 	Xil_ICacheInvalidate();
 	Xil_ICacheEnable();


 	Xil_DCacheInvalidate();
 	Xil_DCacheEnable();
 #endif

 	/*
 	 * We are passing the physical base address as the third argument
 	 * because the physical and virtual base address are the same in our
 	 * example. For systems that support virtual memory, the third
 	 * argument needs to be the virtual base address.
 	 */
 	Status = XUsb_CfgInitialize(&UsbInstance,
 				    UsbConfigPtr, UsbConfigPtr->BaseAddress);
 	if (XST_SUCCESS != Status) {
 		return XST_FAILURE;
 	}

 	/*
 	 * Initialize the USB instance as required for the mass storage
 	 * application.
 	 */
 	InitUsbInterface(&UsbInstance);

 	/*
 	 * Set our function address to 0 which is the unenumerated state.
 	 */
 	Status = XUsb_SetDeviceAddress(&UsbInstance, 0);
 	if (XST_SUCCESS != Status) {
 		return XST_FAILURE;
 	}

 	/*
 	 * Setup the interrupt handlers.
 	 */
 	XUsb_IntrSetHandler(&UsbInstance, (void *) UsbIfIntrHandler,
 			    &UsbInstance);

 	XUsb_EpSetHandler(&UsbInstance, 0,
 			  (XUsb_EpHandlerFunc *) Ep0IntrHandler, &UsbInstance);

 	/*
 	 * Setup the interrupt system.
 	 */
 	Status = SetupInterruptSystem(&UsbInstance);
 	if (Status != XST_SUCCESS) {
 		return XST_FAILURE;
 	}

 	/*
 	 * Enable the interrupts.
 	 */
 	XUsb_IntrEnable(&UsbInstance, XUSB_STATUS_GLOBAL_INTR_MASK |
 			XUSB_STATUS_RESET_MASK |
 			XUSB_STATUS_SUSPEND_MASK |
 			XUSB_STATUS_DISCONNECT_MASK |
 			XUSB_STATUS_FIFO_BUFF_RDY_MASK |
 			XUSB_STATUS_FIFO_BUFF_FREE_MASK |
 			XUSB_STATUS_EP0_BUFF1_COMP_MASK
 			);

 	XUsb_Start(&UsbInstance);

 	/*
 	 * Set the device configuration to unenumerated state.
 	 */
 	UsbInstance.DeviceConfig.CurrentConfiguration = 0;
 	while (1) {

 			/*
 			 * Process Rx Commands on End point 2. The
 			 * processing is off-loaded from ISR so as to do
 			 * a minimal processing in ISR.
 			 */
 			/* Write endpoint */
 			{
 				u8 EpNum  = 2;
 				/*
 				 * Set the correct buffer ready mask and
 				 * enable the DMA transfer.
 				 */

 				XUsb_WriteReg(UsbInstance.Config.BaseAddress,
 					XUSB_BUFFREADY_OFFSET, 1 << EpNum);

 				/*
 				 * Set the correct buffer ready mask and
 				 * enable the DMA transfer
 				 */
 					XUsb_WriteReg(UsbInstance.Config.BaseAddress,
 					XUSB_BUFFREADY_OFFSET,
 					(1 << (EpNum +
 						XUSB_STATUS_EP_BUFF2_SHIFT)));

 			}

 			/* Read endpoint */
 			{
 			u8 EpNum  = 1;

 			/*
 			 * Set the Buffer count register with transmit length.
 			 */
 			XUsb_WriteReg(UsbInstance.Config.BaseAddress,
 					(UsbInstance.EndPointOffset[EpNum] +
 					XUSB_EP_BUF0COUNT_OFFSET), 512);
 			/*
 			 * Enable the transmission.
 			 */
 			XUsb_WriteReg(UsbInstance.Config.BaseAddress,
 					XUSB_BUFFREADY_OFFSET, (1 << EpNum));

 			/*
 			 * Set the Buffer count register with transmit length
 			 * and enable the buffer for transmission.
 			 */
 			XUsb_WriteReg(UsbInstance.Config.BaseAddress,
 					(UsbInstance.EndPointOffset[EpNum] +
 					XUSB_EP_BUF1COUNT_OFFSET), 512);
 			/*
 			 * Enable the Transmission.
 			 */
 			XUsb_WriteReg(UsbInstance.Config.BaseAddress,
 				XUSB_BUFFREADY_OFFSET, (1 << (EpNum +
 					XUSB_STATUS_EP_BUFF2_SHIFT)));
 		}
 	}
 }

#else
int main()
{
	int Status;

	/* Initialize the GPIO driver */
	Status = XGpio_Initialize(&Gpio, XPAR_GPIO_0_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("Gpio Initialization Failed\r\n");
		return XST_FAILURE;
	}

	XGpio_SetDataDirection(&Gpio, 1, 0);

//	/* Initialize the Clock Wizard driver */
//	clkWizConfigPtr = XClk_Wiz_LookupConfig(XPAR_CLK_WIZ_0_DEVICE_ID);
//	if (NULL == clkWizConfigPtr) {
//		return XST_FAILURE;
//	}
//	Status = XClk_Wiz_CfgInitialize(&ClkWiz, clkWizConfigPtr, clkWizConfigPtr->BaseAddr);
//	if (Status != XST_SUCCESS) {
//		xil_printf("Clock Wizard Initialization Failed\r\n");
//		return XST_FAILURE;
//	}
//
//	XClk_Wiz_WriteReg(ClkWiz.Config.BaseAddr, 0x20c, 0);
//	XClk_Wiz_WriteReg(ClkWiz.Config.BaseAddr, 0x25c, 0x3);

	/*
	 * Initialize the USB driver.
	 */
	UsbConfigPtr = XUsb_LookupConfig(USB_DEVICE_ID);
	if (NULL == UsbConfigPtr) {
		return XST_FAILURE;
	}
#ifdef __PPC__

	Xil_ICacheEnableRegion (0x80000001);
	Xil_DCacheEnableRegion (0x80000001);
#endif
#ifdef __MICROBLAZE__
	Xil_ICacheInvalidate();
	Xil_ICacheEnable();


	Xil_DCacheInvalidate();
	Xil_DCacheEnable();
#endif

	/*
	 * We are passing the physical base address as the third argument
	 * because the physical and virtual base address are the same in our
	 * example. For systems that support virtual memory, the third
	 * argument needs to be the virtual base address.
	 */
	Status = XUsb_CfgInitialize(&UsbInstance,
				    UsbConfigPtr, UsbConfigPtr->BaseAddress);
	if (XST_SUCCESS != Status) {
		return XST_FAILURE;
	}

	/*
	 * Initialize the USB instance as required for the mass storage
	 * application.
	 */
	InitUsbInterface(&UsbInstance);

	xil_printf("\r\n\r\n\r\n\r\nInitialization\r\n");

	/*
	 * Set our function address to 0 which is the unenumerated state.
	 */
	Status = XUsb_SetDeviceAddress(&UsbInstance, 0);
	if (XST_SUCCESS != Status) {
		return XST_FAILURE;
	}

	/*
	 * Setup the interrupt handlers.
	 */
	XUsb_IntrSetHandler(&UsbInstance, (void *) UsbIfIntrHandler,
			    &UsbInstance);

	XUsb_EpSetHandler(&UsbInstance, 0,
			  (XUsb_EpHandlerFunc *) Ep0IntrHandler, &UsbInstance);

	XUsb_EpSetHandler(&UsbInstance, 1,
			  (XUsb_EpHandlerFunc *) Ep1IntrHandler, &UsbInstance);

	XUsb_EpSetHandler(&UsbInstance, 2,
			  (XUsb_EpHandlerFunc *) Ep2IntrHandler, &UsbInstance);

	/*
	 * Setup the interrupt system.
	 */
	Status = SetupInterruptSystem(&UsbInstance);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupts.
	 */
	XUsb_IntrEnable(&UsbInstance, XUSB_STATUS_GLOBAL_INTR_MASK |
			XUSB_STATUS_RESET_MASK |
			XUSB_STATUS_SUSPEND_MASK |
			XUSB_STATUS_DISCONNECT_MASK |
			XUSB_STATUS_FIFO_BUFF_RDY_MASK |
			XUSB_STATUS_FIFO_BUFF_FREE_MASK |
			XUSB_STATUS_EP0_BUFF1_COMP_MASK |
			XUSB_STATUS_EP1_BUFF1_COMP_MASK |
			XUSB_STATUS_EP2_BUFF1_COMP_MASK |
			XUSB_STATUS_EP1_BUFF2_COMP_MASK |
			XUSB_STATUS_EP2_BUFF2_COMP_MASK);

//	XUsb_IntrEnable(&UsbInstance, 0xffffffff);


	XUsb_Start(&UsbInstance);

	//xil_printf("Wait untill the USB device is enumerated\r\n");

	/*
	 * Set the device configuration to unenumerated state.
	 */
	UsbInstance.DeviceConfig.CurrentConfiguration = 0;


	/*
	 * Wait untill the USB device is enumerated.
	 */
	while (!UsbInstance.DeviceConfig.CurrentConfiguration)
	{
	}


	xil_printf("USB Enumeration Completed. Waiting for data transfer request\r\n");

	while (1) {

			/*
			 * Process Rx Commands on End point 2. The
			 * processing is off-loaded from ISR so as to do
			 * a minimal processing in ISR.
			 */
			if (UsbInstance.DeviceConfig.CurrentSpeed ==
									    XUSB_EP_HIGH_SPEED)
			{
				usb_packet_size = 512;
			}
			else
			{
				usb_packet_size = 64;
			}

			if (UsbInstance.Config.DmaEnabled)
					{
						/* Flush the cache before DMA transfer */
						Xil_DCacheFlushRange((u32)(USB_MEMORY + write_index * usb_packet_size),(u32)usb_packet_size);
					}

			if (XUsb_EpDataRecv(&UsbInstance, 2,
					(u8 *)(USB_MEMORY + write_index * usb_packet_size),
					usb_packet_size) == XST_SUCCESS)
			{
#ifdef XUSB_MS_DEBUG
				xil_printf("BufferPtr = 0x%x\r\n",(USB_MEMORY + write_index * usb_packet_size));
#endif
				if(write_block_count == 0)
				{
					write_index=0;
					write_block_count = RAMDISKSECTORS-2;
				}
				write_index++;
				write_block_count--;
				if (UsbInstance.Config.DmaEnabled)
				{

					while ((XUsb_ReadReg(
						UsbInstance.Config.BaseAddress,
						XUSB_DMA_STATUS_OFFSET) &
						XUSB_DMA_DMASR_BUSY)
						== XUSB_DMA_DMASR_BUSY);
				}

			}

			if(read_int_occured==0)
			{
		        // Flushing the DCache before sending new data packet
				Xil_DCacheFlushRange((u32)USB_MEMORY, usb_packet_size);

				if(XUsb_EpDataSend(&UsbInstance, 1,(u8 *)USB_MEMORY,usb_packet_size)==XST_SUCCESS)
				{
					/* If read interrupt has not occurred keep dumping data */
					UsbInstance.DeviceConfig.Ep[1].Buffer0Ready = 0;
					UsbInstance.DeviceConfig.Ep[1].Buffer1Ready = 0;
				}
				else
				{
					/* If read interrupt has not occurred keep dumping data */
					UsbInstance.DeviceConfig.Ep[1].Buffer0Ready = 0;
					UsbInstance.DeviceConfig.Ep[1].Buffer1Ready = 0;
					/* Always making buffer 0 ready */
					UsbInstance.DeviceConfig.Ep[1].CurBufNum ^= 1;
				}
			}

	}
}
#endif
/*****************************************************************************/
/**
 * This is the USB initialization function. This example initializes the device
 * for Mass Storage Application. The following configuration is done.
 *	- EP0 : CONTROL end point, Bidirectional, Packet size 64 bytes.
 *	- EP1 : NON_ISOCHRONOUS, BULK_IN, packet size 512 bytes.
 *	- EP2 : NON_ISOCHRONOUS, BULK_OUT, packet size 512 bytes
 *
 *
 * @param	InstancePtr is a pointer to the XUsb instance.
 *
 * @return	None.
 *
 * @note	None.
 *
 ******************************************************************************/
void InitUsbInterface(XUsb * InstancePtr)
{

	XUsb_DeviceConfig DeviceConfig;

	/*
	 * Setup Endpoint 0.
	 */
	DeviceConfig.Ep[0].RamBase = 0x22;
	DeviceConfig.Ep[0].Size = 0x40;
	DeviceConfig.Ep[0].EpType = 0;
	DeviceConfig.Ep[0].OutIn = XUSB_EP_DIRECTION_OUT;


	/*
	 * Setup EP 1  512 byte packets, BULK IN.
	 */
	DeviceConfig.Ep[1].RamBase = 0x1000;
	DeviceConfig.Ep[1].Size = 0x200;
	DeviceConfig.Ep[1].EpType = 0;
	DeviceConfig.Ep[1].OutIn = XUSB_EP_DIRECTION_IN;

	/*
	 * Setup EP 2  512 byte packets, BULK OUT.
	 */
	DeviceConfig.Ep[2].RamBase = 0x1100;
	DeviceConfig.Ep[2].Size = 0x200;
	DeviceConfig.Ep[2].EpType = 0;
	DeviceConfig.Ep[2].OutIn = XUSB_EP_DIRECTION_OUT;

	InstancePtr->DeviceConfig.NumEndpoints = 3;
	DeviceConfig.NumEndpoints = 3;

	/*
	 * Initialize the device configuration.
	 */
	XUsb_ConfigureDevice(InstancePtr, &DeviceConfig);

	XUsb_EpEnable(InstancePtr, 0);
	XUsb_EpEnable(InstancePtr, 1);
	XUsb_EpEnable(InstancePtr, 2);

	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
		       XUSB_BUFFREADY_OFFSET, 1 << 2);

	InstancePtr->DeviceConfig.Ep[2].Buffer0Ready = 1;

	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
		       XUSB_BUFFREADY_OFFSET, (1 <<
					       (2 +
						XUSB_STATUS_EP_BUFF2_SHIFT)));

	InstancePtr->DeviceConfig.Ep[2].Buffer1Ready = 1;

	MaxControlSize = 64;

	/*
	 * Store the actual RAM address offset in the device structure, so as to
	 * avoid the multiplication during processing.
	 */
	InstancePtr->DeviceConfig.Ep[1].RamBase <<= 2;
	InstancePtr->DeviceConfig.Ep[2].RamBase <<= 2;
	InstancePtr->DeviceConfig.Status = XUSB_RESET;


}
u32 previousIntrStatus = 0;
/*****************************************************************************/
/**
 * This function is the interrupt handler for the USB mass storage device
 * application.
 *
 *
 * @param    	CallBackRef is the callback reference passed from the interrupt
 *           	handler, which in our case is a pointer to the driver instance.
 * @param    	IntrStatus is a bit mask indicating pending interrupts.
 *
 * @return   	None.
 *
 * @note        None.
 *
 ******************************************************************************/
void UsbIfIntrHandler(void *CallBackRef, u32 IntrStatus)
{	XUsb *InstancePtr;



	InstancePtr = (XUsb *) CallBackRef;


	if (IntrStatus & XUSB_STATUS_RESET_MASK) {
		/*
		 * Set device address to 0 (required by reset).
		 */
		xil_printf("USB Received reset from HOST\r\n");

		if (InstancePtr->DeviceConfig.CurrentConfiguration == 1) {
			InstancePtr->DeviceConfig.CurrentConfiguration = 0;
			XUsb_SetDeviceAddress(InstancePtr, 0);
		}
		XUsb_IntrDisable(InstancePtr, XUSB_STATUS_RESET_MASK);
		XUsb_IntrEnable(InstancePtr, (XUSB_STATUS_DISCONNECT_MASK |
					      XUSB_STATUS_SUSPEND_MASK));
	}
	if ( (previousIntrStatus & XUSB_STATUS_RESET_MASK) && !(IntrStatus & XUSB_STATUS_RESET_MASK) )
	{
		xil_printf("USB Reset finished\r\n");
	}
	if ( IntrStatus & XUSB_STATUS_HIGH_SPEED_MASK )
	{
		xil_printf("USB entered into high-speed mode\r\n");
	}
	if (IntrStatus & XUSB_STATUS_DISCONNECT_MASK) {

		xil_printf("USB disconnected\r\n");

		read_int_occured = 0;


		if (InstancePtr->DeviceConfig.CurrentConfiguration == 1) {
			XUsb_Stop(InstancePtr);
			InstancePtr->DeviceConfig.CurrentConfiguration = 0;
			InstancePtr->DeviceConfig.Status = XUSB_DISCONNECTED;
			InitUsbInterface(InstancePtr);
			XUsb_SetDeviceAddress(InstancePtr, 0);
			XUsb_Start(InstancePtr);
		}
		XUsb_IntrDisable(InstancePtr, XUSB_STATUS_DISCONNECT_MASK);
		XUsb_IntrEnable(InstancePtr, (XUSB_STATUS_RESET_MASK |
					      XUSB_STATUS_SUSPEND_MASK));
	}
	if (IntrStatus & XUSB_STATUS_SUSPEND_MASK) {
		xil_printf("USB suspended\r\n");

		XUsb_IntrDisable(InstancePtr, XUSB_STATUS_SUSPEND_MASK);
		XUsb_IntrEnable(InstancePtr, (XUSB_STATUS_RESET_MASK |
					      XUSB_STATUS_DISCONNECT_MASK));
	}

	previousIntrStatus = IntrStatus;

}

/*****************************************************************************/
/**
 * This function is the interrupt handler for the USB End point Zero events.
 *
 *
 * @param    	CallBackRef is the callback reference passed from the interrupt.
 *           	handler, which in our case is a pointer to the driver instance.
 * @param	EpNum is the end point number.
 * @param    	IntrStatus is a bit mask indicating pending interrupts.
 *
 * @return	None.
 *
 * @note	EpNum is not used in this function as the handler is attached
 *		specific to end point zero. This parameter is useful when a
 *		single handler is used for processing all end point interrupts.
 *
 ******************************************************************************/
void Ep0IntrHandler(void *CallBackRef, u8 EpNum, u32 IntrStatus)
{

	XUsb *InstancePtr;
	int SetupRequest;

	InstancePtr = (XUsb *) CallBackRef;

	/*
	 * Process the end point zero buffer interrupt.
	 */
	if (IntrStatus & XUSB_BUFFREADY_EP0_BUFF_MASK) {
		if (IntrStatus & XUSB_STATUS_SETUP_PACKET_MASK) {
			/*
			 * Received a setup packet. Execute the chapter 9
			 * command.
			 */
			xil_printf("\r\nProcess Setup Token \n\r");

			XUsb_IntrEnable(InstancePtr,
					(XUSB_STATUS_DISCONNECT_MASK |
					 XUSB_STATUS_SUSPEND_MASK |
					 XUSB_STATUS_RESET_MASK));
			SetupRequest = Chapter9(InstancePtr);
			if (SetupRequest != XST_SUCCESS) {
				switch (SetupRequest) {
					case MS_RESET:
						MassStorageReset(InstancePtr);
						xil_printf("Reset \n\r");
						break;

					case MS_GETMAXLUN:
						GetMaxLUN(InstancePtr);
						xil_printf("Getmaxlun \n\r");
						break;
					default:
						/*
						 * Unsupported command. Stall
						 * the end point.
						 */
						xil_printf("Unsupported command. SetupReuest: 0x%x \n\r", SetupRequest);
						XUsb_EpStall(InstancePtr, 0);
						break;
				}

			}
		}
		else if (IntrStatus & XUSB_STATUS_FIFO_BUFF_RDY_MASK) {
			// Generate a pulse
			u32 tmpGipoVal =  XGpio_DiscreteRead(&Gpio, 1);
			XGpio_DiscreteWrite(&Gpio, 1, tmpGipoVal | 0x00000004);
			XGpio_DiscreteWrite(&Gpio, 1, tmpGipoVal & ~0x00000004);

			xil_printf("Process out Token \n\r");

			EP0ProcessOutToken(InstancePtr);
		}
		else if (IntrStatus & XUSB_STATUS_FIFO_BUFF_FREE_MASK) {
			// Generate a pulse
			u32 tmpGipoVal =  XGpio_DiscreteRead(&Gpio, 1);
			XGpio_DiscreteWrite(&Gpio, 1, tmpGipoVal | 0x00000001);
			XGpio_DiscreteWrite(&Gpio, 1, tmpGipoVal & ~0x00000001);

			xil_printf("Process in Token \n\r");

			EP0ProcessInToken(InstancePtr);
			//read_int_occured = 0;
		}
	}




}

/*****************************************************************************/
/**
 * This function is the interrupt handler for the USB End point one events.
 *
 * @param    	CallBackRef is the callback reference passed from the interrupt
 *           	handler, which in our case is a pointer to the driver instance.
 * @param	EpNum is the end point number.
 * @param    	IntrStatus is a bit mask indicating pending interrupts.
 *
 * @return	None.
 *
 * @note	EpNum is not used in this function as the handler is attached
 *		specific to end point one. This parameter is useful when a
 *		single handler is used for processing all end point interrupts.
 *
 ******************************************************************************/
void Ep1IntrHandler(void *CallBackRef, u8 EpNum, u32 IntrStatus)
{
	XUsb *InstancePtr;

	InstancePtr = (XUsb *) CallBackRef;
#ifdef XUSB_MS_DEBUG
	xil_printf("Got Ep1IntrHandler interrupt \n\r");
#endif
	read_int_occured = 1;

	/*
	 * Process the End point 1 interrupts.
	 */
	if (IntrStatus & XUSB_BUFFREADY_EP1_BUFF1_MASK) {
		InstancePtr->DeviceConfig.Ep[1].Buffer0Ready = 0;
	}
	if (IntrStatus & XUSB_BUFFREADY_EP1_BUFF2_MASK) {
		InstancePtr->DeviceConfig.Ep[1].Buffer1Ready = 0;
	}
#ifdef XUSB_MS_DEBUG
	xil_printf("CmdFlag = %d \n\r",CmdFlag);
	xil_printf("InstancePtr->DeviceConfig.Ep[1].Buffer0Ready = %d \n\r",\
			InstancePtr->DeviceConfig.Ep[1].Buffer0Ready);
	xil_printf("InstancePtr->DeviceConfig.Ep[1].Buffer1Ready = %d \n\r",\
			InstancePtr->DeviceConfig.Ep[1].Buffer1Ready);

	xil_printf("BlockCount.IntBlockCount = %d \n\r",\
			BlockCount.IntBlockCount);
	xil_printf("Lba.IntLba = %d \n\r",\
			Lba.IntLba);

#endif
	if(BlockCount.IntBlockCount==0)
	{
		BlockCount.IntBlockCount = RAMDISKSECTORS-2;
		Lba.IntLba = 0;
	}


		if (InstancePtr->DeviceConfig.CurrentSpeed ==
				    XUSB_EP_HIGH_SPEED)
		{
			if (FirstPkt == 0)
			{
				BlockCount.IntBlockCount--;
				Lba.IntLba++;
			}
			FirstPkt = 1;
		}
		if (BlockCount.IntBlockCount > 0)
		{

			RdRamDiskPtr = (u8 *)(USB_MEMORY + Lba.IntLba * usb_packet_size);

			if (InstancePtr->Config.DmaEnabled)
			{

				Xil_DCacheFlushRange((u32)RdRamDiskPtr, usb_packet_size);
			}

			if (InstancePtr->DeviceConfig.CurrentSpeed ==
				    XUSB_EP_HIGH_SPEED)
			{

				XUsb_EpDataSend(&UsbInstance, 1, RdRamDiskPtr,
						usb_packet_size);

				BlockCount.IntBlockCount--;
				Lba.IntLba++;
			}
			else
			{
				RdRamDiskPtr += (usb_packet_size * RdIndex);
/*
				if (InstancePtr->Config.DmaEnabled)
				{
					Xil_DCacheFlushRange((u32)RdRamDiskPtr,
							usb_packet_size);
				}
*/
				XUsb_EpDataSend(&UsbInstance, 1, RdRamDiskPtr,
						usb_packet_size);
				RdIndex += 1;
				if (RdIndex == 8)
				{
					RdIndex = 0;
					BlockCount.IntBlockCount--;
					Lba.IntLba++;
				}
			}


		}
		else
		{
			FirstPkt = 0;
			CmdFlag = 0;
			CmdStatusBlock.bCSWStatus = CMD_PASSED;
			CmdStatusBlock.Residue.value = 0;

			if (InstancePtr->Config.DmaEnabled)
			{
				Xil_DCacheFlushRange((u32)&CmdStatusBlock,
					USBCSW_LENGTH);
			}

			XUsb_EpDataSend(&UsbInstance, 1,
			    (unsigned char *) &CmdStatusBlock, USBCSW_LENGTH);
		}
		if (InstancePtr->Config.DmaEnabled) {

			while ((XUsb_ReadReg(
				UsbInstance.Config.BaseAddress,
				XUSB_DMA_STATUS_OFFSET) &
				XUSB_DMA_DMASR_BUSY)
				== XUSB_DMA_DMASR_BUSY);
		}


}

/*****************************************************************************/
/**
 * This function is the interrupt handler for the USB End point two events.
 *
 * @param    	CallBackRef is the callback reference passed from the interrupt
 *           	handler, which in our case is a pointer to the driver instance.
 * @param	EpNum is the end point number.
 * @param    	IntrStatus is a bit mask indicating pending interrupts.
 *
 * @return	None.
 *
 * @note	EpNum is not used in this function as the handler is attached
 *		specific to end point two. This parameter is useful when a
 *		single handler is used for processing all end point interrupts.
 *
 ******************************************************************************/
void Ep2IntrHandler(void *CallBackRef, u8 EpNum, u32 IntrStatus)
{

	XUsb *InstancePtr;

	InstancePtr = (XUsb *) CallBackRef;
#ifdef XUSB_MS_DEBUG
	xil_printf("Got Ep2IntrHandler interrupt \n\r");
#endif

	read_int_occured = 1;

	/*
	 * Process end point 2 interrupts.
	 */
	if (IntrStatus & XUSB_BUFFREADY_EP2_BUFF1_MASK) {
		InstancePtr->DeviceConfig.Ep[2].Buffer0Ready = 0;

	}
	if (IntrStatus & XUSB_BUFFREADY_EP2_BUFF2_MASK) {
		InstancePtr->DeviceConfig.Ep[2].Buffer1Ready = 0;
	}
}

/******************************************************************************/
/**
* This routine is called when a RESET class command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note    	None.
*
******************************************************************************/
void MassStorageReset(XUsb * InstancePtr)
{
	switch (CmdBlock.OpCode) {
	case SCSI_READ_10:
		Read10Abort = 1;
		break;

	case SCSI_WRITE_10:
		Write10Abort = 1;
		break;

	default:
		break;
	}

	/*
	 * Set the basic control status words.
	 */
	SetupControlWriteStatusStage(InstancePtr);
	return;
}

/* Class Commands */
/******************************************************************************/
/**
* This routine is called when a GETMAXLUN class command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note		None.
*
******************************************************************************/
void GetMaxLUN(XUsb * InstancePtr)
{
	u32 *RamBase;

	Ch9_CmdBuf.ContWriteCount = 0;
	RamBase = (u32 *) (InstancePtr->Config.BaseAddress +
			   ((InstancePtr->DeviceConfig.Ep[0].RamBase) << 2));
	UsbMemData.Byte.Zero = 0;

	*RamBase = UsbMemData.Word;

	InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			(InstancePtr->EndPointOffset[0] +
			XUSB_EP_BUF0COUNT_OFFSET), 1);
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			XUSB_BUFFREADY_OFFSET, 1);
}

/******************************************************************************/
/**
*
* This function sets up the interrupt system such that interrupts can occur
* for the USB. This function is application specific since the actual
* system may or may not have an interrupt controller. The USB could be
* directly connected to a processor without an interrupt controller.  The
* user should modify this function to fit the application.
*
* @param	InstancePtr contains a pointer to the instance of the USB
*		component, which is going to be connected to the interrupt
*		controller.
*
* @return
*		- XST_SUCCESS if successful.
*		- XST_FAILURE. if it fails.
*
* @note		None
*
*******************************************************************************/
static int SetupInterruptSystem(XUsb * InstancePtr)
{
	int Status;


#ifdef XPAR_INTC_0_DEVICE_ID
	/*
	 * Initialize the interrupt controller driver.
	 */
	Status = XIntc_Initialize(&InterruptController, INTC_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Connect a device driver handler that will be called when an interrupt
	 * for the USB device occurs.
	 */
	Status = XIntc_Connect(&InterruptController, USB_INTR,
			       (XInterruptHandler) XUsb_IntrHandler,
			       (void *) InstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller such that interrupts are enabled for
	 * all devices that cause interrupts, specific real mode so that
	 * the USB can cause interrupts through the interrupt controller.
	 */
	Status = XIntc_Start(&InterruptController, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the USB.
	 */
	XIntc_Enable(&InterruptController, USB_INTR);

#else
	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&InterruptController, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	XScuGic_SetPriorityTriggerType(&InterruptController, USB_INTR,
					0xA0, 0x3);

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	Status = XScuGic_Connect(&InterruptController, USB_INTR,
				 (Xil_ExceptionHandler)XUsb_IntrHandler,
				 InstancePtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	/*
	 * Enable the interrupt for the USB device.
	 */
	XScuGic_Enable(&InterruptController, USB_INTR);


#endif

	/*
	 * Initialize the exception table
	 */
	Xil_ExceptionInit();

	/*
	 * Register the interrupt controller handler with the exception table
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler)INTC_HANDLER,
				&InterruptController);

	/*
	 * Enable non-critical exceptions
	 */
	Xil_ExceptionEnable();




	return XST_SUCCESS;
}


