/* $Id: xusb_cp9.c,v 1.1.2.2 2010/08/17 02:35:21 vidhum Exp $ */
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
 * @file xusb_cp9.c
 *
 * This file contains the USB Chapter 9 related functions.
 *
 * @note	None.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- ---- -----------------------------------------------------------------
 * 1.00a hvm  2/22/07 First release
 * 1.01a hvm  5/30/07 Moved the USB class specific command processing to
 *		      application files.
 * 3.00a hvm  11/18/09 Updated to use HAL processor APIs.
 *		       XUsb_mReadReg is renamed to XUsb_ReadReg and
 *		       XUsb_mWriteReg is renamed to XUsb_WriteReg.
 * 3.02a hvm  08/16/10 Updated with the little endian support changes.
 *
 * </pre>
 *****************************************************************************/
/***************************** Include Files *********************************/

#include "xusb_cp9.h"
#include <xparameters.h>

#define XUSB_CH9_DEBUG

#ifdef XUSB_CH9_DEBUG
#include "stdio.h"
#endif

/************************** Constant Definitions ******************************/

/************************** Variable Definitions ******************************/

IntChar UsbMemData;		/* Dual Port memory */

/*
 * Instance of the Chapter 9 command buffer.
 */
USB_CMD_BUF Ch9_CmdBuf;

/*
 * Maximum control pkt size.
 */
u16 MaxControlSize = 8;

/*
 * Standard USB structure instances.
 */
extern USB_STD_DEV_DESC DeviceDescriptor;
extern USB_STD_QUAL_DESC QualifierDescriptor;
extern FPGA1_CONFIGURATION HsUsbConfig;
extern FPGA1_CONFIGURATION FsUsbConfig;
extern USB_STD_STRING_DESC LangId;
extern USB_STD_STRING_MAN_DESC Manufacturer;
extern USB_STD_STRING_PS_DESC ProductString;
extern USB_STD_STRING_SN_DESC SerialNumber;

#ifdef HID_DEVICES
extern USB_STD_HID_DESC HidDescriptor;
#endif

#ifdef USB_KEYBOARD
const unsigned char ReportDesc[0x2b] =   // Report descriptor
	{
	0x05,0x01,		/* Usage Page (generic desktop) */
	0x09,0x06,		/* Usage (keyboard) */
	0xA1,0x01,		/* Collection */
	0x05,0x07,		/*   Usage Page 7 (keyboard/keypad) */
	0x19,0xE0,		/*   Usage Minimum = 224 */
	0x29,0xE7,		/*   Usage Maximum = 231 */
	0x15,0x00,		/*   Logical Minimum = 0 */
	0x25,0x01,		/*   Logical Maximum = 1 */
	0x75,0x01,		/*   Report Size = 1 */
	0x95,0x08,		/*   Report Count = 8 */
	0x81,0x02,		/*  Input(Data,Variable,Absolute) */
	0x95,0x01,		/*   Report Count = 1 */
	0x75,0x08,		/*   Report Size = 8 */
	0x81,0x01,		/*  Input(Constant) */
	0x19,0x00,		/*   Usage Minimum = 0 */
	0x29,0x65,		/*   Usage Maximum = 101 */
	0x15,0x00,		/*   Logical Minimum = 0 */
	0x25,0x65,		/*   Logical Maximum = 101 */
	0x75,0x08,		/*   Report Size = 8 */
	0x95,0x01,		/*   Report Count = 1 */
	0x81,0x00,		/*  Input(Data,Variable,Array) */
	0xC0};			/* End Collection */
#endif

#ifdef USB_MOUSE
const unsigned char ReportDesc[0x34] =   // Report descriptor
	{
	0x05,0x01,		/* Usage Page (generic desktop) */
	0x09,0x02,		/* Usage (mouse) */
	0xA1,0x01,		/* Collection */
	0x09,0x01,		/*   Usage Page 7 () */
	0xA1,0x00,		/*   Usage Minimum = 224 */
	0x05,0x09,		/*   Usage Maximum = 231 */
	0x19,0x01,		/*   Logical Minimum = 0 */
	0x29,0x03,		/*   Logical Maximum = 1 */
	0x15,0x00,		/*   Report Size = 1 */
	0x25,0x01,		/*   Report Count = 8 */
	0x95,0x03,		/*  Input(Data,Variable,Absolute) */
	0x75,0x01,		/*   Report Count = 1 */
	0x81,0x02,		/*   Report Size = 8 */
	0x95,0x01,		/*  Input(Constant) */
	0x75,0x05,		/*   Usage Minimum = 0 */
	0x81,0x01,		/*   Usage Maximum = 101 */
	0x05,0x01,		/*   Logical Minimum = 0 */
	0x09,0x30,		/*   Logical Maximum = 101 */
	0x09,0x31,		/*   Report Size = 8 */
	0x09,0x38,
	0x15,0x81,		/*   Report Count = 1 */
	0x25,0x7F,		/*  Input(Data,Variable,Array) */
	0x75,0x08,
	0x95,0x03,
	0x81,0x06,
	0xC0,
	0xC0};			/* End Collection */
#endif

/************************** Function Prototypes *******************************/

/****************************************************************************
 * Function: noop
 * Description:
 ****************************************************************************/
int noop(int n)
 {
  // a noop delay loop
  int a,b, i;
  a = 0x12345678;
  b = 0x9f3d1046;
  for (i=0; i<n; i++) {  // wait here for a while
    a = (b >> 5) ^ (b << 6);
    b = (a >> 3) ^ (a << 5);
  }
  return b;
}


/******************************************************************************/
/**
* This routine is called when an OUT transaction for Endpoint Zero is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note		None.
*
******************************************************************************/
void EP0ProcessOutToken(XUsb * InstancePtr)
{
	u8 Count;
	u8 *RamBase;
	u16 Index;

	switch (Ch9_CmdBuf.SetupSeqRX) {
	case STATUS_PHASE:
		xil_printf("OUTToken STATUS_PHASE\r\n");
		/*
		 * This resets both state machines for the next
		 * Setup packet.
		 */
		Ch9_CmdBuf.SetupSeqRX = SETUP_PHASE;
		Ch9_CmdBuf.SetupSeqTX = SETUP_PHASE;
		break;

	case DATA_PHASE:
		xil_printf("OUTToken DATA_PHASE\r\n");

		Count = XUsb_ReadReg(InstancePtr->Config.BaseAddress,
					XUSB_EP_BUF0COUNT_OFFSET);
			/*
			 * Copy the data to be received from the DPRAM.
			*/
			RamBase = (u8 *) (InstancePtr->Config.BaseAddress +
					((InstancePtr->DeviceConfig.Ep[0].
						RamBase) << 2));

			xil_printf("Received data buffer is:\r\n");

			for (Index = 0; Index < Count; Index++) {

				xil_printf("%x \t", *RamBase);

				*Ch9_CmdBuf.ContReadPtr++ = *RamBase++;
			}
			xil_printf("\n\r");

			Ch9_CmdBuf.ContReadCount += Count;

			if (Ch9_CmdBuf.Word3.wLength == Ch9_CmdBuf.ContReadCount) {
				Ch9_CmdBuf.SetupSeqRX = STATUS_PHASE;
				ExecuteCommand(InstancePtr);
			} else {
				/*
				 * Set the Tx packet size and the Tx enable bit.
				 */
				XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					XUSB_EP_BUF0COUNT_OFFSET, Count);

				XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					XUSB_BUFFREADY_OFFSET, 1);

				InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
			}
			break;

	default:
		break;
	}
}

/******************************************************************************/
/**
* This routine is called when IN transaction for Endpoint Zero is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note     	None.
*
******************************************************************************/
void EP0ProcessInToken(XUsb * InstancePtr)
{
	u32 EpCfgReg;

	u8 *buf = (u8 *)(&Ch9_CmdBuf);

//	xil_printf("Read count is : %d\r\n", Ch9_CmdBuf.ContReadCount);
//	xil_printf("Write count is : %d\r\n", Ch9_CmdBuf.ContWriteCount);
//
//	xil_printf("CMD buffer is:\r\n");
//	for(int i = 0; i < 16; i++)
//	{
//		xil_printf("%x \t", buf[i]);
//	}
//	xil_printf("\n\r");

	switch (Ch9_CmdBuf.SetupSeqTX) {
	case STATUS_PHASE:
		xil_printf("INToken STATUS_PHASE\r\n");

		if (Ch9_CmdBuf.Byte1.bRequest == SET_ADDRESS) {
			/*
			 * Set the address of the device.
			 */
			XUsb_SetDeviceAddress(InstancePtr,
					      Ch9_CmdBuf.Word1.Byte23.
					      bDescriptorIndex);
		}
		else if (Ch9_CmdBuf.Byte1.bRequest == SET_FEATURE) {
			if (Ch9_CmdBuf.Byte0.bmRequestType ==
			    STANDARD_OUT_DEVICE) {
#ifdef __LITTLE_ENDIAN__
			Ch9_CmdBuf.Word1.wValue =
			((u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) |
			(u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorType	<< 8));
#endif

				if (Ch9_CmdBuf.Word1.wValue == TEST_MODE) {
					XUsb_SetTestMode(InstancePtr, TEST_J,
							 NULL);
				}
			}
		}
		break;

	case DATA_PHASE:
		xil_printf("INToken DATA_PHASE\r\n");

		if (Ch9_CmdBuf.ContWriteCount == 0) {
			/*
			 * We're done with data transfer, next
			 * will be zero length OUT with data toggle of
			 * 1. Setup data_toggle.
			 */
			EpCfgReg = XUsb_ReadReg(InstancePtr->Config.
						 BaseAddress,
						 InstancePtr->
						 EndPointOffset[0]);
			EpCfgReg |= XUSB_EP_CFG_DATA_TOGGLE_MASK;
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				       InstancePtr->EndPointOffset[0],
				       EpCfgReg);
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				       (InstancePtr->EndPointOffset[0] +
					XUSB_EP_BUF0COUNT_OFFSET), 0);
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				       XUSB_BUFFREADY_OFFSET, 1);
			InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;

			Ch9_CmdBuf.SetupSeqTX = STATUS_PHASE;

		}
		else {
			LoadEP0(InstancePtr);
		}
		break;

	default:
		break;
	}

}

/******************************************************************************/
/**
* This routine is called when a chapter 9 command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	The setup request value to be processed by the upper layer.
*
* @note     	None.
*
******************************************************************************/
int Chapter9(XUsb * InstancePtr)
{
	volatile unsigned int *RamBase;

	/*
	 * Load up the chapter 9 command buffer.
	 */
	RamBase = (unsigned int *) (InstancePtr->Config.BaseAddress +
					XUSB_SETUP_PKT_ADDR_OFFSET);
	/*
	 * Get the first 4 bytes of the setup packet.
	 */
	UsbMemData.Word = *RamBase;
	Ch9_CmdBuf.Byte0.bmRequestType = UsbMemData.Byte.Zero;
	Ch9_CmdBuf.Byte1.bRequest = UsbMemData.Byte.One;
	Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex = UsbMemData.Byte.Two;
	Ch9_CmdBuf.Word1.Byte23.bDescriptorType = UsbMemData.Byte.Three;

	if(UsbMemData.Byte.Zero == 0x80)
	{
		int tmp = 0;
	}

	/*
	 * Get the last 4 bytes of the setup packet.
	 */
	RamBase += 1;
	UsbMemData.Word = *RamBase;

	/*
	 * Byte swapping for next 4 bytes for BE machines is defined in
	 * the different layout of BECB verses LECB.
	 */
#ifdef __LITTLE_ENDIAN__
	Ch9_CmdBuf.Word2.Byte45.Byteh = UsbMemData.Byte.Zero;
	Ch9_CmdBuf.Word2.Byte45.Bytel = UsbMemData.Byte.One;
	Ch9_CmdBuf.Word3.Byte67.Byteh = UsbMemData.Byte.Two;
	Ch9_CmdBuf.Word3.Byte67.Bytel = UsbMemData.Byte.Three;
#else
	Ch9_CmdBuf.Word2.Byte45.Bytel = UsbMemData.Byte.Zero;
	Ch9_CmdBuf.Word2.Byte45.Byteh = UsbMemData.Byte.One;
	Ch9_CmdBuf.Word3.Byte67.Bytel = UsbMemData.Byte.Two;
	Ch9_CmdBuf.Word3.Byte67.Byteh = UsbMemData.Byte.Three;
#endif
	/*
	 * Restore ReadPtr to data buffer.
	 */
	Ch9_CmdBuf.ContReadPtr = &Ch9_CmdBuf.ContReadDataBuffer[0];

#ifdef	XUSB_CH9_DEBUG
	xil_printf("bmRequestType is 0x%x \t", Ch9_CmdBuf.Byte0.bmRequestType);
	xil_printf("bmRequest is 0x%x \t", Ch9_CmdBuf.Byte1.bRequest);
	xil_printf("wValue is 0x%x \t", Ch9_CmdBuf.Word1.wValue);
	xil_printf("wIndex is 0x%x \t", Ch9_CmdBuf.Word2.wIndex);
	xil_printf("wLength is 0x%x \t", Ch9_CmdBuf.Word3.wLength);
	xil_printf("\r\n");
#endif


	if (Ch9_CmdBuf.Byte0.bmRequestType & DIR_DEVICE_TO_HOST) {
		/*
		 * Execute the get command.
		 */
		Ch9_CmdBuf.SetupSeqRX = STATUS_PHASE;
		Ch9_CmdBuf.SetupSeqTX = DATA_PHASE;
		return (ExecuteCommand(InstancePtr));
	}
	else {
		/*
		 * Execute the put command.
		 */
		Ch9_CmdBuf.SetupSeqRX = DATA_PHASE;
		Ch9_CmdBuf.SetupSeqTX = STATUS_PHASE;
		if (Ch9_CmdBuf.Word3.wLength == 0)
		{
			return (ExecuteCommand(InstancePtr));
		}
		else
		{
			Ch9_CmdBuf.ContReadCount = 0;

			InstancePtr->DeviceConfig.Ep[0].Buffer0Count = 0;
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					(InstancePtr->EndPointOffset[0] +
					XUSB_EP_BUF0COUNT_OFFSET), 0);
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					XUSB_BUFFREADY_OFFSET, 1);
			return XST_SUCCESS;
		}
	}
	/*
	 *  Control should never reach here
	 */
	return XST_FAILURE;
}


/* Vendor request for DVS logic */
void GetDVSData(XUsb * InstancePtr)
{
	u32 *RamBase;

	UsbMemData.Word = 0x00;
	RamBase = (u32 *) (InstancePtr->Config.BaseAddress +
			   ((InstancePtr->DeviceConfig.Ep[0].RamBase) << 2));
	UsbMemData.Byte.Zero = 0;
	UsbMemData.Byte.One = 0x32;
	UsbMemData.Byte.Two = 0;
	UsbMemData.Byte.Three = 0;

	*RamBase = UsbMemData.Word;

	InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			(InstancePtr->EndPointOffset[0] +
			XUSB_EP_BUF0COUNT_OFFSET), 4);
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			XUSB_BUFFREADY_OFFSET, 1);
	Ch9_CmdBuf.ContWriteCount = 0;

}

/******************************************************************************/
/**
* This function executes the chapter 9 command processing
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	The request value to be processed by the upper layer if the
*		request is not handled.
*		XST_SUCCESS if the request is successfully processed.
*
* @note		None.
*
******************************************************************************/
int ExecuteCommand(XUsb * InstancePtr)
{
	if ((Ch9_CmdBuf.Byte0.bmRequestType & TYPE_MASK) == TYPE_STANDARD) {
		/*
		 * Process the chapter 9 command.
		 */
		switch (Ch9_CmdBuf.Byte1.bRequest) {
		case GET_STATUS:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Get Status \r\n");
#endif
			GetStatus(InstancePtr);
			break;

		case CLEAR_FEATURE:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Clear Feature \r\n");
#endif
			SetClearFeature(InstancePtr, FALSE);
			break;

		case SET_FEATURE:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Set Feature \r\n");
#endif
			SetClearFeature(InstancePtr, TRUE);
			break;

		case SET_ADDRESS:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Set address \r\n");
#endif
			SetupControlWriteStatusStage(InstancePtr);
			break;

		case GET_DESCRIPTOR:
			GetDescriptor(InstancePtr);
			break;

		case SET_DESCRIPTOR:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Set Descriptor  \r\n");
#endif
			SetDescriptor(InstancePtr);
			break;

		case GET_CONFIGURATION:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Get Configuration  \r\n");
#endif
			GetConfiguration(InstancePtr);
			break;

		case SET_CONFIGURATION:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Set Configuration  \r\n");
#endif
			SetConfiguration(InstancePtr);
			break;

		case GET_INTERFACE:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Get Interface  \r\n");
#endif
			GetInterface(InstancePtr);
			break;

		case SET_INTERFACE:
#ifdef	XUSB_CH9_DEBUG
			xil_printf("Set Interface  \r\n");
#endif
			SetInterface(InstancePtr);
			break;

		case SYCH_FRAME:
			break;

		default:
			/*
			 * The default is to stall the end point zero.
			 */
			XUsb_EpStall(InstancePtr, 0);
			break;
		}

	}
	else if ((Ch9_CmdBuf.Byte0.bmRequestType & TYPE_MASK) == TYPE_CLASS) {
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Sub class code %d \r\n", Ch9_CmdBuf.Byte1.bRequest);
#endif
		return (Ch9_CmdBuf.Byte1.bRequest);
	}
	else if ((Ch9_CmdBuf.Byte0.bmRequestType & TYPE_MASK) == TYPE_VENDOR) {
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Vendor request 0x%x received \r\n", Ch9_CmdBuf.Byte1.bRequest);
#endif
		if (Ch9_CmdBuf.Byte0.bmRequestType & DIR_DEVICE_TO_HOST) {
			GetDVSData(InstancePtr);
		}
		else
		{
			u32 EpCfgReg;

			EpCfgReg = XUsb_ReadReg(InstancePtr->Config.BaseAddress,
						 InstancePtr->EndPointOffset[0]);
			EpCfgReg |= XUSB_EP_CFG_DATA_TOGGLE_MASK;

			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				       InstancePtr->EndPointOffset[0], EpCfgReg);
			InstancePtr->DeviceConfig.Ep[0].Buffer0Count = 0;
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					(InstancePtr->EndPointOffset[0] +
					XUSB_EP_BUF0COUNT_OFFSET), 0);
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					XUSB_BUFFREADY_OFFSET, 1);
		}
//		return (Ch9_CmdBuf.Byte1.bRequest);
	}
	else {
		/*
		 * Unsupported command. Stall the end point.
		 */
		XUsb_EpStall(InstancePtr, 0);
	}
	return XST_SUCCESS;
}


/******************************************************************************
		Start of Chapter 9 Commands
******************************************************************************/

/*****************************************************************************/
/**
* This function responds to the GET_INTERFACE command.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note     	None.
*
******************************************************************************/
void GetInterface(XUsb * InstancePtr)
{
	u32 *RamBase;

#ifdef __LITTLE_ENDIAN__
	Ch9_CmdBuf.Word1.wValue =
		((u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) |
		(u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorType	<< 8));
#endif

	if (Ch9_CmdBuf.Word1.wValue == 0) {
		RamBase = (u32 *) (InstancePtr->Config.BaseAddress +
					((InstancePtr->DeviceConfig.Ep[0].
					 RamBase) << 2));
		UsbMemData.Word = 0x0;
		*RamBase = UsbMemData.Word;
		InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;

		XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			       (InstancePtr->EndPointOffset[0] +
				XUSB_EP_BUF0COUNT_OFFSET), 1);
		XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				XUSB_BUFFREADY_OFFSET, 1);

	}
	else {
		XUsb_EpStall(InstancePtr, 0);
	}

}

/******************************************************************************/
/**
* This function responds to the SET_INTERFACE command.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note     	None.
*
******************************************************************************/
void SetInterface(XUsb * InstancePtr)
{
	if ((Ch9_CmdBuf.Word1.wValue == 0) && (Ch9_CmdBuf.Word2.wIndex == 0)) {
		SetupControlWriteStatusStage(InstancePtr);
	}
	else {
#ifdef MICROPHONE
 		SetupControlWriteStatusStage(InstancePtr);
#else
		XUsb_EpStall(InstancePtr, 0);
#endif
	}

}

/******************************************************************************/
/**
 * This function sets the basic Control status words.
 *
 * @param	InstancePtr is a pointer to the XUsb instance of the controller.
 *
 * @return 	None.
 *
 * @note     	None.
 *
 ******************************************************************************/
void SetupControlWriteStatusStage(XUsb * InstancePtr)
{
	u32 EpCfgReg;

	EpCfgReg = XUsb_ReadReg(InstancePtr->Config.BaseAddress,
				 InstancePtr->EndPointOffset[0]);
	EpCfgReg |= XUSB_EP_CFG_DATA_TOGGLE_MASK;

	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
		       InstancePtr->EndPointOffset[0], EpCfgReg);
	InstancePtr->DeviceConfig.Ep[0].Buffer0Count = 0;
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			(InstancePtr->EndPointOffset[0] +
			XUSB_EP_BUF0COUNT_OFFSET), 0);
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			XUSB_BUFFREADY_OFFSET, 1);
}

/******************************************************************************/
/**
* This routine is called when a GET_STATUS command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note     	None.
*
******************************************************************************/
void GetStatus(XUsb * InstancePtr)
{
	u32 *RamBase;
	u8 EndPoint;

	UsbMemData.Word = 0x0;
	RamBase = (u32 *) (InstancePtr->Config.BaseAddress +
			((InstancePtr->DeviceConfig.Ep[0].RamBase) << 2));

	switch (Ch9_CmdBuf.Byte0.bmRequestType) {
	case STANDARD_IN_DEVICE:
		UsbMemData.Byte.Zero = 0x01;
		UsbMemData.Byte.One = 0x00;

		*RamBase = UsbMemData.Word;

		InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
		XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			       (InstancePtr->EndPointOffset[0] +
				XUSB_EP_BUF0COUNT_OFFSET), 2);
		XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			       XUSB_BUFFREADY_OFFSET, 1);
		break;

	case STANDARD_IN_INTERFACE:
		if ((Ch9_CmdBuf.Word2.wIndex > 0) &&
		    (Ch9_CmdBuf.Word2.wIndex <= MAX_INTERFACES)) {
			UsbMemData.Byte.Zero = 0;
			UsbMemData.Byte.One = 0;
			*RamBase = UsbMemData.Word;
			InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
			XUsb_WriteReg(InstancePtr->Config.
				BaseAddress, (InstancePtr->EndPointOffset
					[0] + XUSB_EP_BUF0COUNT_OFFSET),
				       2);
			XUsb_WriteReg(InstancePtr->Config.BaseAddress,
					XUSB_BUFFREADY_OFFSET, 1);
		}
		else {
			XUsb_EpStall(InstancePtr, 0);
		}
		break;

	case STANDARD_IN_ENDPOINT:
		EndPoint = (unsigned int) (Ch9_CmdBuf.Word2.wIndex & 0x07);
		UsbMemData.Byte.Zero =
			(u8) (((XUsb_ReadReg(InstancePtr->Config.BaseAddress,
						InstancePtr->
						EndPointOffset[EndPoint]))
						& XUSB_EP_CFG_STALL_MASK) >>
						XUSB_EP_CFG_STALL_SHIFT);
		UsbMemData.Byte.One = 0;

		*RamBase = UsbMemData.Word;

		InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
		XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				(InstancePtr->EndPointOffset[0] +
				XUSB_EP_BUF0COUNT_OFFSET), 2);
		XUsb_WriteReg(InstancePtr->Config.BaseAddress,
				XUSB_BUFFREADY_OFFSET, 1);
		break;

	default:
		/*
		 * The default is to stall the end point.
		 */
		XUsb_EpStall(InstancePtr, 0);
		break;
	}
}

/******************************************************************************/
/**
* This routine is called when a GET_DESCRIPTOR command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note     	None.
*
******************************************************************************/
void GetDescriptor(XUsb * InstancePtr)
{
	switch (Ch9_CmdBuf.Word1.Byte23.bDescriptorType) {
	case DEVICE_DESCR:
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Get Dev Decriptor \r\n");
#endif
		if (InstancePtr->DeviceConfig.CurrentSpeed ==
			XUSB_EP_HIGH_SPEED) {
			Ch9_CmdBuf.ContWritePtr =
				(unsigned char *) &DeviceDescriptor;
		}
		else {
			Ch9_CmdBuf.ContWritePtr = (u8 *) &DeviceDescriptor;
		}
		Ch9_CmdBuf.ContWriteCount = sizeof(USB_STD_DEV_DESC);
		Ch9_CmdBuf.ContWriteCount = 0x12;

		if (Ch9_CmdBuf.ContWriteCount > Ch9_CmdBuf.Word3.wLength) {
			Ch9_CmdBuf.ContWriteCount = Ch9_CmdBuf.Word3.wLength;
		}
		break;

	case QUALIFIER_DESCR:
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Get Qua Decriptor \r\n");
#endif
		Ch9_CmdBuf.ContWritePtr =
			(unsigned char *) &QualifierDescriptor;
		Ch9_CmdBuf.ContWriteCount = sizeof(USB_STD_QUAL_DESC);
		if (Ch9_CmdBuf.ContWriteCount > Ch9_CmdBuf.Word3.wLength) {
			Ch9_CmdBuf.ContWriteCount = Ch9_CmdBuf.Word3.wLength;
		}
		break;

	case CONFIG_DESCR:
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Get Config Decriptor \r\n");
#endif
		if (Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex <=
		    DeviceDescriptor.bNumConfigurations) {
			switch (Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) {
			case 0:
				/*
				 * Duplicate this for each configuration
				 * supported.
				 */
				if (InstancePtr->DeviceConfig.
				    CurrentSpeed == XUSB_EP_HIGH_SPEED) {
#ifdef	XUSB_CH9_DEBUG
					xil_printf("High Speed  \r\n");
#endif
					HsUsbConfig.stdCfg.bType = CONFIG_DESCR;
					Ch9_CmdBuf.ContWritePtr =
						(u8 *) &HsUsbConfig;
					Ch9_CmdBuf.ContWriteCount =
						HsUsbConfig.stdCfg.bTotalLength;
				}
				else {
					FsUsbConfig.stdCfg.bType = CONFIG_DESCR;
					Ch9_CmdBuf.ContWritePtr =
						(u8 *) &FsUsbConfig;
					Ch9_CmdBuf.ContWriteCount =
						FsUsbConfig.stdCfg.bTotalLength;
				}
				if (Ch9_CmdBuf.ContWriteCount >
				    Ch9_CmdBuf.Word3.wLength) {
					Ch9_CmdBuf.ContWriteCount =
						Ch9_CmdBuf.Word3.wLength;
				}
				break;

			default:
				XUsb_EpStall(InstancePtr, 0);
				goto Func_Exit7;
				break;
			}
		}
		else {
			XUsb_EpStall(InstancePtr, 0);
			goto Func_Exit7;
		}
		break;

	case OSD_CONFIG_DESCR:
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Get OSD Config Decriptor \r\n");
#endif
		if (Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex <=
		    DeviceDescriptor.bNumConfigurations) {
			switch (Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) {
			case 0:
				/*
				 * Duplicate this for each
				 * configuration supported.
				 */
				if (InstancePtr->DeviceConfig.
				    CurrentSpeed == XUSB_EP_HIGH_SPEED) {
					FsUsbConfig.stdCfg.bType =
						OSD_CONFIG_DESCR;
					Ch9_CmdBuf.ContWritePtr =
						(u8 *) &FsUsbConfig;
					Ch9_CmdBuf.ContWriteCount =
						FsUsbConfig.stdCfg.bTotalLength;
				}
				else {
					HsUsbConfig.stdCfg.bType =
						OSD_CONFIG_DESCR;
					Ch9_CmdBuf.ContWritePtr =
						(u8 *) &HsUsbConfig;
					Ch9_CmdBuf.ContWriteCount =
						HsUsbConfig.stdCfg.bTotalLength;
				}
				if (Ch9_CmdBuf.ContWriteCount >
				    Ch9_CmdBuf.Word3.wLength) {
					Ch9_CmdBuf.ContWriteCount =
						Ch9_CmdBuf.Word3.wLength;
				}
				break;

			default:
				XUsb_EpStall(InstancePtr, 0);
				goto Func_Exit7;
				break;
			}
		}
		else {
			XUsb_EpStall(InstancePtr, 0);
			goto Func_Exit7;
		}
		break;

	case STRING_DESCR:
		if (Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex <= 3) {
			switch (Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) {
			case 0:
				/*
				 * Set the language ID's.
				 */
#ifdef	XUSB_CH9_DEBUG
				xil_printf("Get LangId  \r\n");
#endif
				Ch9_CmdBuf.ContWritePtr =
					(unsigned char *) &LangId;
				Ch9_CmdBuf.ContWriteCount = LangId.bLength;
				if (Ch9_CmdBuf.ContWriteCount >
				    Ch9_CmdBuf.Word3.wLength) {
					Ch9_CmdBuf.ContWriteCount =
						Ch9_CmdBuf.Word3.wLength;
				}
				break;

			case 1:
				/*
				 * Set the Manufacturer's String.
				 */
#ifdef	XUSB_CH9_DEBUG
				xil_printf("Get Manuferer  \r\n");
#endif
				Ch9_CmdBuf.ContWritePtr =
					(unsigned char *) &Manufacturer;
				Ch9_CmdBuf.ContWriteCount =
					Manufacturer.bLength;
				if (Ch9_CmdBuf.ContWriteCount >
				    Ch9_CmdBuf.Word3.wLength) {
					Ch9_CmdBuf.ContWriteCount =
						Ch9_CmdBuf.Word3.wLength;
				}
				break;

			case 2:
				/*
				 * Set the Product String.
				 */
#ifdef	XUSB_CH9_DEBUG
				xil_printf("Get Product Id  \r\n");
#endif
				Ch9_CmdBuf.ContWritePtr =
					(unsigned char *) &ProductString;
				Ch9_CmdBuf.ContWriteCount =
					ProductString.bLength;
				if (Ch9_CmdBuf.ContWriteCount >
				    Ch9_CmdBuf.Word3.wLength) {
					Ch9_CmdBuf.ContWriteCount =
						Ch9_CmdBuf.Word3.wLength;
				}
				break;

			case 3:
				/*
				 * Set the Serial Number String.
				 */
#ifdef	XUSB_CH9_DEBUG
				xil_printf("Get Serial No  \r\n");
#endif
				Ch9_CmdBuf.ContWritePtr =
					(unsigned char *) &SerialNumber;
				Ch9_CmdBuf.ContWriteCount =
					SerialNumber.bLength;
				if (Ch9_CmdBuf.ContWriteCount >
				    Ch9_CmdBuf.Word3.wLength) {
					Ch9_CmdBuf.ContWriteCount =
						Ch9_CmdBuf.Word3.wLength;
				}
				break;
			default:
				XUsb_EpStall(InstancePtr, 0);
				goto Func_Exit7;
				break;
			}
		}
		else {
			XUsb_EpStall(InstancePtr, 0);
			goto Func_Exit7;
		}
		break;

#ifdef HID_DEVICES
	case HID_DESC:
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Get HID descriptor \r\n");
#endif
		Ch9_CmdBuf.ContWritePtr = (unsigned char *)&HidDescriptor;
		Ch9_CmdBuf.ContWriteCount =
			HidDescriptor.bLength;
		if (Ch9_CmdBuf.ContWriteCount >
		    Ch9_CmdBuf.Word3.wLength) {
			Ch9_CmdBuf.ContWriteCount =
				Ch9_CmdBuf.Word3.wLength;
		}
		break;
	case REPORT_DESC:
#ifdef 	XUSB_CH9_DEBUG
		xil_printf(" Get Report descriptor \r\n");
#endif
		Ch9_CmdBuf.ContWritePtr = (unsigned char *) &ReportDesc[0];
		Ch9_CmdBuf.ContWriteCount = sizeof (ReportDesc);
		if (Ch9_CmdBuf.ContWriteCount >
		    Ch9_CmdBuf.Word3.wLength) {
			Ch9_CmdBuf.ContWriteCount =
				Ch9_CmdBuf.Word3.wLength;
		}
		break;
#endif
	default:
		/*
		 * The default is to stall the end point zero.
		 */
		XUsb_EpStall(InstancePtr, 0);
		goto Func_Exit7;
		break;

	}
	LoadEP0(InstancePtr);

      Func_Exit7:
	return;
}

/******************************************************************************/
/**
* This routine is called when a SET_DESCRIPTOR command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note		None.
*
******************************************************************************/
void SetDescriptor(XUsb * InstancePtr)
{
	/*
	 * Command not supported.
	 */
	XUsb_EpStall(InstancePtr, 0);
}

/******************************************************************************/
/**
* This routine is called when a GET_CONFIGURATION command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note		None.
*
******************************************************************************/
void GetConfiguration(XUsb * InstancePtr)
{
	u32 *RamBase;

	UsbMemData.Word = 0x00;
	RamBase = (u32 *) (InstancePtr->Config.BaseAddress +
			   ((InstancePtr->DeviceConfig.Ep[0].RamBase) << 2));
	UsbMemData.Byte.Zero = InstancePtr->DeviceConfig.CurrentConfiguration;
	UsbMemData.Byte.One = 0;
	UsbMemData.Byte.Two = 0;
	UsbMemData.Byte.Three = 0;

	*RamBase = UsbMemData.Word;

	InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			(InstancePtr->EndPointOffset[0] +
			XUSB_EP_BUF0COUNT_OFFSET), 1);
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
			XUSB_BUFFREADY_OFFSET, 1);
	Ch9_CmdBuf.ContWriteCount = 0;

}

/******************************************************************************/
/**
* This routine is called when a SET_CONFIGURATION command is received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note		None.
*
******************************************************************************/
void SetConfiguration(XUsb * InstancePtr)
{
	u8 Index;

#ifdef __LITTLE_ENDIAN__
	Ch9_CmdBuf.Word1.wValue =
		((u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) |
		(u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorType	<< 8));
#endif

	switch (Ch9_CmdBuf.Word1.wValue) {
	case 0:
		/*
		 * This configuration value resets the device to the
		 * un configured state like power up.
		 */
#ifdef	XUSB_CH9_DEBUG
		xil_printf("Reset Configuration \r\n");
#endif
		InstancePtr->DeviceConfig.CurrentConfiguration = 0;
		InitUsbInterface(InstancePtr);
		/*
		 * Cause a valid status phase to be issued.
		 */
		SetupControlWriteStatusStage(InstancePtr);
		break;

	case CONFIGURATION_ONE:
#ifdef	XUSB_CH9_DEBUG
		xil_printf("USB enumerated \r\n");
#endif
		InstancePtr->DeviceConfig.CurrentConfiguration = 1;


		SetupControlWriteStatusStage(InstancePtr);

		for (Index = 0; Index < InstancePtr->DeviceConfig.NumEndpoints;
		Index++){

			if (Index != 0){
				if (InstancePtr->DeviceConfig.Ep[Index].OutIn ==
						XUSB_EP_DIRECTION_OUT) {
					XUsb_WriteReg(InstancePtr->Config.BaseAddress,
						       XUSB_BUFFREADY_OFFSET, 1 << Index);

					InstancePtr->DeviceConfig.Ep[Index].Buffer0Ready = 1;

					XUsb_WriteReg(InstancePtr->Config.BaseAddress,
						       XUSB_BUFFREADY_OFFSET, (1 <<
								       (Index +
										XUSB_STATUS_EP_BUFF2_SHIFT)));
					InstancePtr->DeviceConfig.Ep[Index].Buffer1Ready = 1;
				}
			}
		}
		break;

		/*
		 * Additional configurations can be added here.
		 */
	default:
		/*
		 * stall the end point.
		 */
		XUsb_EpStall(InstancePtr, 0);
		break;
	}
}

/******************************************************************************/
/**
* This routine is called when a SET_FEATURE or a CLEAR_FEATURE command is
* received.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
* @param	flag specifies whether it is a SET_FEATURE (TRUE)or a
*		CLEAR_FEATURE (FALSE) command.
*
* @return	None.
*
* @note 	None.
*
******************************************************************************/
void SetClearFeature(XUsb * InstancePtr, int flag)
{
	u8 EndPoint;
	u8 OutInbit;
	u32 EpCfgReg;

#ifdef __LITTLE_ENDIAN__
	Ch9_CmdBuf.Word1.wValue =
		((u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorIndex) |
		(u16)(Ch9_CmdBuf.Word1.Byte23.bDescriptorType	<< 8));
#endif

	switch (Ch9_CmdBuf.Byte0.bmRequestType) {
	case STANDARD_OUT_DEVICE:
		switch (Ch9_CmdBuf.Word1.wValue) {
		case DEVICE_REMOTE_WAKEUP:
			/*
			 * User needs to add code here.
			 */
			break;

		case TEST_MODE:
			/*
			 * The Test Mode will be executed
			 * after the status phase.
			 */
			break;

		default:
			XUsb_EpStall(InstancePtr, 0);
			break;
		}
		break;

	case STANDARD_OUT_ENDPOINT:
		if (Ch9_CmdBuf.Word1.wValue == 0) {
			EndPoint = Ch9_CmdBuf.Word2.wIndex & 0xf;
			OutInbit = Ch9_CmdBuf.Word2.wIndex & 0x80;
			OutInbit = OutInbit >> 7;

			/*
			 * Make sure direction matches.
			 */
			if (OutInbit !=
			    InstancePtr->DeviceConfig.Ep[EndPoint].OutIn) {
				XUsb_EpStall(InstancePtr, 0);
				goto Func_Exit10;
			}

			if (EndPoint == 0) {
				/*
				 * Clear the stall.
				 */
				XUsb_EpUnstall(InstancePtr, 0);

				break;
			}
			else {
				if (flag == TRUE) {
					XUsb_EpStall(InstancePtr, EndPoint);
				}
				else {
					XUsb_EpUnstall(InstancePtr, EndPoint);

					/*
					 * Clear the data toggle.
					 */
					EpCfgReg =
						XUsb_ReadReg(InstancePtr->
							      Config.
							      BaseAddress,
							      InstancePtr->
							      EndPointOffset
							      [EndPoint]);
					EpCfgReg &=
						~XUSB_EP_CFG_DATA_TOGGLE_MASK;
					XUsb_WriteReg(InstancePtr->Config.
						       BaseAddress,
						       InstancePtr->
						       EndPointOffset[EndPoint],
						       EpCfgReg);
				}
			}
		}
		break;

		/*
		 * Add more here as needed.
		 */
	default:
		XUsb_EpStall(InstancePtr, 0);
		goto Func_Exit10;
		break;
	}

	/*
	 * Cause and valid status phase to be issued.
	 */
	SetupControlWriteStatusStage(InstancePtr);

      Func_Exit10:
	return;
}

/******************************************************************************/
/**
* This routine copies the EP0 related data to the DPRAM.
*
* @param	InstancePtr is a pointer to the XUsb instance of the controller.
*
* @return 	None.
*
* @note		None.
*
******************************************************************************/
void LoadEP0(XUsb * InstancePtr)
{
	u16 Count;
	u8 *RamBase;
	u16 Index;

//	xil_printf("In function LoadEP0\r\n");

	if (MaxControlSize >= Ch9_CmdBuf.ContWriteCount) {
		Count = Ch9_CmdBuf.ContWriteCount;
	}
	else {
		Count = MaxControlSize;
	}

//	Count = 64;

	/*
	 * Copy the data to be transmitted into the DPRAM.
	 */
	RamBase = (u8 *) (InstancePtr->Config.BaseAddress +
			  ((InstancePtr->DeviceConfig.Ep[0].RamBase) << 2));
	for (Index = 0; Index < Count; Index++) {

		*RamBase++ = *Ch9_CmdBuf.ContWritePtr++;
	}

	/*
	 * Set the Tx packet size and enable the Transmission.
	 */
	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
		       XUSB_EP_BUF0COUNT_OFFSET, Count);

	XUsb_WriteReg(InstancePtr->Config.BaseAddress,
		       XUSB_BUFFREADY_OFFSET, 1);

	// Generate a pulse
	u32 tmpGipoVal =  XGpio_DiscreteRead(&Gpio, 1);
	XGpio_DiscreteWrite(&Gpio, 1, tmpGipoVal | 0x00000002);
	XGpio_DiscreteWrite(&Gpio, 1, tmpGipoVal & ~0x00000002);

//	noop( 100 );  // wait a while

	InstancePtr->DeviceConfig.Ep[0].Buffer0Ready = 1;

	Ch9_CmdBuf.ContWriteCount -= Count;
}
