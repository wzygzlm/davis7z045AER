/* $Id: xusb_types.h,v 1.1.2.1 2010/07/16 05:36:25 vidhum Exp $ */
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
/******************************************************************************/
/**
 * @file xusb_types.h
 *
 * This file contains the constants, type definitions, variables as used in the
 * USB chapter 9 and mass storage demo application.
 *
 * @note     None.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- ---- ------------------------------------------------------------------
 * 1.00a hvm  2/22/07 First release
 *
 * </pre>
 *****************************************************************************/

#ifndef __XUSBTYPES_H__
#define __XUSBTYPES_H__
#ifdef __cplusplus
extern "C" {
#endif

/*
 * Application specific constant.
 */
#undef HID_DEVICES
#undef USB_KEYBOARD
#undef USB_MOUSE
#define MASS_STORAGE_DEVICE
/*
 * Chapter 9 requests
 */
#define GET_STATUS				0x00
#define CLEAR_FEATURE				0x01
#define GET_STATE				0x02
#define SET_FEATURE				0x03
#define SET_ADDRESS				0x05
#define GET_DESCRIPTOR				0x06
#define SET_DESCRIPTOR				0x07
#define GET_CONFIGURATION			0x08
#define SET_CONFIGURATION		 	0x09
#define GET_INTERFACE				0x0A
#define SET_INTERFACE				0x0B
#define SYCH_FRAME				0x0C

/*
 * Test Mode Options
 */
#define TEST_J					1
#define TEST_K					2
#define TEST_SE0_NAK				3
#define TEST_PKT				4

/*
 * USB Mass Storage requests
 */
#define MS_RESET				0xFF
#define MS_GETMAXLUN		   		0xFE

/*
 * USB Human Interface Device constant.
 */
#define USB_CLASS_HID			0x03

/*
 * Request types used during USB enumeration.
 */
#define STANDARD_IN_DEVICE			0x80
#define STANDARD_IN_INTERFACE			0x81
#define STANDARD_IN_ENDPOINT			0x82
#define STANDARD_OUT_DEVICE			0x00
#define STANDARD_OUT_INTERFACE			0x01
#define STANDARD_OUT_ENDPOINT			0x02
#define TYPE_MASK			 	0x60
#define TYPE_STANDARD				0x00
#define TYPE_CLASS				0x20
#define TYPE_VENDOR				0x40
#define TYPE_RESERVED				0x60

/*
 * DATA Transfer Direction
 */
#define DIR_DEVICE_TO_HOST			0x80

/*
 * Descriptor Types
 */
#define DEVICE_DESCR				0x01
#define CONFIG_DESCR				0x02
#define STRING_DESCR				0x03
#define INTERFACE_DESCR				0x04
#define ENDPOINT_DESCR				0x05
#define QUALIFIER_DESCR				0x06
#define OSD_CONFIG_DESCR			0x07
#define HID_DESC			      	0x21	// Get descriptor: HID
#define REPORT_DESC			        0x22	// Get descriptor:Report

/*
 * Feature Selectors
 */

#define DEVICE_REMOTE_WAKEUP	0x01
#define TEST_MODE				0x02

/*
 * Phase States
 */
#define SETUP_PHASE				0x0000
#define DATA_PHASE				0x0001
#define STATUS_PHASE		   	0x0002

/*
 * End point types.
 */
#define EP_CONTROL			0	/**< Control Endpoint */
#define EP_ISOCHRONOUS			1	/**< Isochronous Endpoint */
#define EP_BULK				2	/**< Bulk Endpoint */
#define EP_INTERRUPT			3	/**< Interrupt Endpoint */

/*
 * Maximum number of USB interfaces.
 */
#define MAX_INTERFACES			0x01

/*
 * FPGA Configuration Number
 */
#define CONFIGURATION_ONE	   	0x01

/*
 * EP0 Setup data size.
 */
#define EP0_SETUP_DATA				64

/*
 * Command Buffer Structure.
 */
typedef struct {
	union {
		u8 StandardDeviceRequest;
		u8 bmRequestType;
	} Byte0;
	union {
		u8 FbRequest;
		u8 bRequest;
	} Byte1;
	union {
		struct {
			u8 bDescriptorIndex;
			u8 bDescriptorType;
		} Byte23;
		u16 FwValue;
		u16 wValue;
		u16 wFeatureSelector;
	} Word1;
	union {
		struct {
			u8 Byteh;
			u8 Bytel;
		} Byte45;
		u16 wTargetSelector;
		u16 FwIndex;
		u16 wIndex;
	} Word2;
	union {
		struct {
			u8 Byteh;
			u8 Bytel;
		} Byte67;
		u16 wLength;
	} Word3;
	u8 *ContReadPtr;
	u8 *ContWritePtr;
	u32 ContReadCount;
	u32 ContWriteCount;
	u32 SetupSeqTX;
	u32 SetupSeqRX;
	u8 ContReadDataBuffer[EP0_SETUP_DATA];
} USB_CMD_BUF;

/*
 * Standard USB structures as per 2.0 specification
 */
typedef struct {
	u8 bLength;
	u8 bDescriptorType;
	u16 bcdUSB;
	u8 bDeviceClass;
	u8 bDeviceSubClass;
	u8 bDeviceProtocol;
	u8 bMaxPacketSize0;
	u16 idVendor;
	u16 idProduct;
	u16 bcdDevice;
	u8 iManufacturer;
	u8 iProduct;
	u8 iSerialNumber;
	u8 bNumConfigurations;
} USB_STD_DEV_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u8 bVersionLow;
	u8 bVersionHigh;
	u8 bDeviceClass;
	u8 bDeviceSubClass;
	u8 bProtocol;
	u8 bMaxPkt0;
	u8 bNumberConfigurations;
	u8 breserved;
} USB_STD_QUAL_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u8 bTotalLength;
	u8 bCorrection;
	u8 bNumberInterfaces;
	u8 bConfigValue;
	u8 bIConfigString;
	u8 bAttributes;
	u8 bMaxPower;
} USB_STD_CFG_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u8 bTotalLength;
	u8 bCorrection;
	u8 bNumberInterfaces;
	u8 bConfigValue;
	u8 bIConfigString;
	u8 bAttributes;
	u8 bMaxPower;
} USB_STD_QUA_DESC;

typedef struct {
	u8 bLength;
	u8 bDescriptorType;
	u8 bInterfaceNumber;
	u8 bAlternateSetting;
	u8 bNumEndPoints;
	u8 bInterfaceClass;
	u8 bInterfaceSubClass;
	u8 bInterfaceProtocol;
	u8 iInterface;

} USB_STD_IF_DESC;

typedef struct {
	u8 bLength;
	u8 bDescriptorType;
	u8 bcdHIDL;
	u8 bcdHIDH;
	u8 bCountryCode;
	u8 bNumDescriptors;
	u8 bReportDescriptorType;
	u8 wDescriptorLengthL;
	u8 wDescriptorLengthH;

} USB_STD_HID_DESC;
/*
 * The standard USB structures as per USB 2.0 specification.
 */
typedef struct {
	u8 bLength;
	u8 bDescriptorType;
	u8 bEndpointAddress;
	u8 bmAttributes;
	u8 bMaxPacketSizeL;
	u8 bMaxPacketSizeH;
	u8 bInterval;
} USB_STD_EP_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u16 wLANGID[1];
} USB_STD_STRING_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u8 bString[14];
} USB_STD_STRING_MAN_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u8 bString[10];
} USB_STD_STRING_PS_DESC;

typedef struct {
	u8 bLength;
	u8 bType;
	u8 bString[42];
} USB_STD_STRING_SN_DESC;

#ifdef MASS_STORAGE_DEVICE
/*
 * USB configuration structure.
 */
typedef struct {
	USB_STD_CFG_DESC stdCfg;
	USB_STD_IF_DESC ifCfg;
	USB_STD_EP_DESC epCfg1;
	USB_STD_EP_DESC epCfg2;
} FPGA1_CONFIGURATION;

#endif

#ifdef HID_DEVICES
/*
 * USB configuration structure.
 */
typedef struct {
	USB_STD_CFG_DESC	stdCfg;
	USB_STD_IF_DESC		ifCfg;
	USB_STD_HID_DESC	hidCfg;
	USB_STD_EP_DESC		epCfg1;

} FPGA1_CONFIGURATION;

#endif

#ifdef __cplusplus
}
#endif
#endif /* __XUSBTYPES_H__ */

