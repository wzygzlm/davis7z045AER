/******************************************************************************
*
* Copyright (C) 2010 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/
/*****************************************************************************/
/**
* @file xspips_eeprom_polled_example.c
*
* This file contains a design example using the SPI driver (XSpiPs) in
* polled mode and hardware device with a serial EEPROM device.  The
* hardware which this example runs on must have a serial EEPROM (Microchip
* 25XX320 or 25XX160) for it to run.  This example has been tested with the
* SPI EEPROM on the EP4.5 ARM processor.
*
* @note
*
* None.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.00  sdm  03/09/10 First release
* 1.00  sdm  10/25/11 Updated the chip select to be used to second chip select
*       ms   04/05/17 Modified Comment lines in functions to
*                     recognize it as documentation block for doxygen
*                     generation and also modified filename tag to include
*                     the file in doxygen examples.
*</pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xparameters.h"	/* EDK generated parameters */
#include "xspips.h"		/* SPI device driver */
#include "xil_printf.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define SPI_DEVICE_ID		XPAR_XSPIPS_0_DEVICE_ID

/*
 * The following constants define the commands which may be sent to the EEPROM
 * device.
 */
#define WRITE_STATUS_CMD	1
#define WRITE_CMD		2
#define READ_CMD		3
#define WRITE_DISABLE_CMD	4
#define READ_STATUS_CMD		5
#define WRITE_ENABLE_CMD	6

/*
 * The following constants define the offsets within a SPIBuffer data
 * type for each kind of data.  Note that the read data offset is not the
 * same as the write data because the SPI driver is designed to allow full
 * duplex transfers such that the number of bytes received is the number
 * sent and received.
 */
#define MODULE_ADDR_OFFSET		0
#define PARAM_ADDR_OFFSET	1
#define ADDRESS_LSB_OFFSET	2
#define DATA_OFFSET		3
#define WRITE_DATA_OFFSET	3
#define READ_DATA_OFFSET	6

/*
 * The following constants specify the extra bytes which are sent to the
 * various state machines on the SPI interface, that are not data, but control information
 * which includes the module address and parameter address
 */
#define OVERHEAD_SIZE		2
#define DATA_SIZE		4

/*
 * The following constants specify the page size and number of pages for the
 * EEPROM.  The page size specifies a max number of bytes that can be written
 * to the EEPROM with a single transfer using the SPI driver.
 */
#define PAGE_SIZE		16
#define PAGE_COUNT		128

/*
 * The following constants specify the max amount of data and the size of the
 * the buffer required to hold the data and overhead to transfer the data to
 * and from the EEPROM.
 */
#define MAX_DATA		PAGE_COUNT * PAGE_SIZE
#define BUFFER_SIZE		DATA_SIZE + OVERHEAD_SIZE

/*
 * The following constant defines the slave select signal that is used to
 * to select the EEPROM device on the SPI bus, this signal is typically
 * connected to the chip select of the device
 */
#define EEPROM_SPI_SELECT	0x01

/**************************** Type Definitions *******************************/

/*
 * The following data type is used to send and receive data to the serial
 * EEPROM device connected to the SPI interface.  It is an array of bytes
 * rather than a structure for portability avoiding packing issues.  The
 * application must setup the data to be written in this buffer and retrieve
 * the data read from it.
 */
typedef u8 SPIBuffer[BUFFER_SIZE];
typedef u8 DataBuffer[DATA_SIZE];


/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

void dvsSPIRead(XSpiPs *SpiPtr, uint8_t moduleAddr, uint8_t paramAddr, uint32_t *data);


int dvsSPIWrite(XSpiPs *SpiPtr, uint8_t moduleAddr, uint8_t paramAddr, int32_t data);


int dvsSPIExample(XSpiPs *SpiInstancePtr, u16 SpiDeviceId);

/************************** Variable Definitions *****************************/

/*
 * The instances to support the device drivers are global such that the
 * are initialized to zero each time the program runs.  They could be local
 * but should at least be static so they are zeroed.
 */
static XSpiPs SpiInstance;

/*
 * The following variable allows a test value to be added to the values that
 * are written to the EEPROM such that unique values can be generated to
 * guarantee the writes to the EEPROM were successful
 */
int Test;

/*
 * The following variables are used to read and write to the eeprom and they
 * are global to avoid having large buffers on the stack
 */
SPIBuffer ReadBuffer;
SPIBuffer WriteBuffer;

/*****************************************************************************/
/**
*
* Main function to call the Spi Eeprom example.
*
* @param	None
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None
*
******************************************************************************/
int main(void)
{
	int Status;

	xil_printf("SPI EEPROM Polled Mode Example Test \r\n");

	/*
	 * Run the Spi Interrupt example.
	 */
	Status = dvsSPIExample(&SpiInstance, SPI_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("SPI EEPROM Polled Mode Example Test Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran SPI EEPROM Polled Mode Example Test\r\n");
	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* The purpose of this function is to illustrate how to use the XSpiPs
* device driver in polled mode. This test writes and reads data from a
* serial EEPROM. The serial EEPROM part must be present in the hardware
* to use this example.
*
* @param	SpiInstancePtr is a pointer to the Spi Instance.
* @param	SpiDeviceId is the Device Id of Spi.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note
*
* This function calls functions which contain loops that may be infinite
* if interrupts are not working such that it may not return. If the device
* slave select is not correct and the device is not responding on bus it will
* read a status of 0xFF for the status register as the bus is pulled up.
*
*****************************************************************************/
int dvsSPIExample(XSpiPs *SpiInstancePtr, u16 SpiDeviceId)
{
	int Status;
	u8 UniqueValue;
	int Count;
	XSpiPs_Config *SpiConfig;

	/*
	 * Initialize the SPI driver so that it's ready to use
	 */
	SpiConfig = XSpiPs_LookupConfig(SpiDeviceId);
	if (NULL == SpiConfig) {
		return XST_FAILURE;
	}

	Status = XSpiPs_CfgInitialize(SpiInstancePtr, SpiConfig,
				       SpiConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to check hardware build
	 */
	Status = XSpiPs_SelfTest(SpiInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the Spi device as a master. External loopback is required.
	 */
	XSpiPs_SetOptions(SpiInstancePtr, XSPIPS_MASTER_OPTION |
			   XSPIPS_FORCE_SSELECT_OPTION);

	XSpiPs_SetClkPrescaler(SpiInstancePtr, XSPIPS_CLK_PRESCALE_32);

	/*
	 * Initialize the write buffer for a pattern to write to the EEPROM
	 * and the read buffer to zero so it can be verified after the read, the
	 * test value that is added to the unique value allows the value to be
	 * changed in a debug environment to guarantee
	 */
	for (UniqueValue = 13, Count = 0; Count < MAX_DATA;
					Count++, UniqueValue++) {
		WriteBuffer[WRITE_DATA_OFFSET + Count] =
					(u8)(UniqueValue + Test);
		ReadBuffer[READ_DATA_OFFSET + Count] = 0xA5;
	}

	/*
	 * Assert the EEPROM chip select
	 */
	XSpiPs_SetSlaveSelect(SpiInstancePtr, EEPROM_SPI_SELECT);

	/*
	 * Write the data in the write buffer to the serial EEPROM a page at a
	 * time, read the data back from the EEPROM and verify it
	 */
	UniqueValue = 13;

	uint32_t retData;

	dvsSPIRead(SpiInstancePtr, 0x01, 0x3, &retData);
	Status = dvsSPIWrite(SpiInstancePtr, 0x01, 0x3, 1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	dvsSPIWrite(SpiInstancePtr, 0x00, 0x0, 1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	dvsSPIWrite(SpiInstancePtr, 0x00, 0x1, 1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	dvsSPIRead(SpiInstancePtr, 0x01, 0x3, &retData);

	// Check logic version

	dvsSPIRead(SpiInstancePtr, 0x06, 0x0, &retData);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function reads from the SPI interface.
*
* @param	SpiPtr is a pointer to the SPI driver component to use.
* @param	Address contains the address to read data from in the EEPROM.
* @param	ByteCount contains the number of bytes to read.
* @param	Buffer is a buffer to read the data into.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void dvsSPIRead(XSpiPs *SpiPtr, uint8_t moduleAddr, uint8_t paramAddr, uint32_t *data)
{
	SPIBuffer Buffer;
	/*
	 * Setup the write command with the specified address and data
	 */
	Buffer[MODULE_ADDR_OFFSET] = (moduleAddr & 0x7f) + 0x80;  // Read, set the MSB to 0;
	Buffer[PARAM_ADDR_OFFSET]  = paramAddr;

	/*
	 * Send the read command to the EEPROM to read the specified number
	 * of bytes from the EEPROM, send the read command and address and
	 * receive the specified number of bytes of data in the data buffer
	 */
	XSpiPs_PolledTransfer(SpiPtr, Buffer, Buffer,
				DATA_SIZE + OVERHEAD_SIZE);

	*data = 0;
	for(int i = 0; i < 4; i++)
	{
		int shiftBitNum = 8 * (3 - i);
		*data += ((Buffer[OVERHEAD_SIZE + i]) << (shiftBitNum));
	}
}

int dvsSPIWrite(XSpiPs *SpiPtr, uint8_t moduleAddr, uint8_t paramAddr, int32_t data)
{
	SPIBuffer Buffer;

	/*
	 * Setup the write command with the specified address and data
	 */
	Buffer[MODULE_ADDR_OFFSET] = (moduleAddr & 0x7f);      // Write, set the MSB to 0;
	Buffer[PARAM_ADDR_OFFSET]  = paramAddr;

	for(int i = 0; i < 4; i++)
	{
		int shiftBitNum = 8 * (3 - i);
		Buffer[OVERHEAD_SIZE + i] = ((data >> (shiftBitNum)) & 0xff);
	}

	/*
	 * Send the read command to the EEPROM to read the specified number
	 * of bytes from the EEPROM, send the read command and address and
	 * receive the specified number of bytes of data in the data buffer
	 */
	XSpiPs_PolledTransfer(SpiPtr, Buffer, NULL,
				DATA_SIZE + OVERHEAD_SIZE);

	uint32_t tmpData;
	dvsSPIRead(SpiPtr, moduleAddr, paramAddr, &tmpData);
	if(tmpData != data)
	{
		return XST_FAILURE;
	}
	else
	{
		return XST_SUCCESS;
	}
}
