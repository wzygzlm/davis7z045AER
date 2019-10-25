// SPDX-License-Identifier: GPL-2.0
/*
 * vdma_app_zc702.c
 *
 *  Created on: 27 Nov 2018
 *      Author: florentw
 */


/***************************** Include Files *********************************/

#include "xparameters.h"	/* EDK generated parameters */
#include "xspips.h"		/* SPI device driver */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "ff.h"

#include "xeventstreamtoconstencntframestream.h"

//#include "iic_utils.h"
//#include "app_hdmi.h"

//XIicPs IicPs_inst;
//XV_tpg tpg_inst;
//XV_tpg_Config *tpg_config;
XEventstreamtoconstencntframestream etf_inst;

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define SPI_DEVICE_ID		XPAR_XSPIPS_0_DEVICE_ID

#define MODULE_ADDR_OFFSET		0
#define PARAM_ADDR_OFFSET	1

#define OVERHEAD_SIZE		2
#define DATA_SIZE		4

#define BUFFER_SIZE		DATA_SIZE + OVERHEAD_SIZE

/*
 * The following constant defines the slave select signal that is used to
 * to select the EEPROM device on the SPI bus, this signal is typically
 * connected to the chip select of the device
 */
#define DVS_SPI_SELECT	0x01

/**************************** Type Definitions *******************************/

typedef u8 SPIBuffer[BUFFER_SIZE];


// Macros
#define REG_READ(addr) \
    ({int val;int a=addr; asm volatile ("ldr   %0,[%1]\n" : "=r"(val) : "r"(a)); val;})

#define REG_WRITE(addr,val) \
    ({int v = val; int a = addr; __asm volatile ("str  %1,[%0]\n" :: "r"(a),"r"(v)); v;})

/************************** Variable Definitions *****************************/

/*
 * The instances to support the device drivers are global such that the
 * are initialized to zero each time the program runs.  They could be local
 * but should at least be static so they are zeroed.
 */
static XSpiPs SpiInstance;

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
int dvsSPIInit(XSpiPs *SpiInstancePtr, u16 SpiDeviceId)
{
	int Status;
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
	 * Assert the DVS SPI select
	 */
	XSpiPs_SetSlaveSelect(SpiInstancePtr, DVS_SPI_SELECT);

	uint32_t retData;

//	dvsSPIRead(SpiInstancePtr, 0x01, 0x3, &retData);
//	Status = dvsSPIWrite(SpiInstancePtr, 0x01, 0x3, 1);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	dvsSPIWrite(SpiInstancePtr, 0x00, 0x0, 1);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	dvsSPIWrite(SpiInstancePtr, 0x00, 0x1, 1);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	dvsSPIWrite(SpiInstancePtr, 0x00, 0x3, 1);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	dvsSPIWrite(SpiInstancePtr, 0x00, 0x4, 1);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	dvsSPIWrite(SpiInstancePtr, 0x00, 0x5, 1);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	dvsSPIRead(SpiInstancePtr, 0x01, 0x3, &retData);

	// Check logic version and chip id
	dvsSPIRead(SpiInstancePtr, 0x06, 0x0, &retData);
	dvsSPIRead(SpiInstancePtr, 0x06, 0x1, &retData);

	dvsSPIRead(SpiInstancePtr, 0x01, 0x0, &retData);
	dvsSPIRead(SpiInstancePtr, 0x01, 0x1, &retData);


	return XST_SUCCESS;
}


// Set up the initial Multiplexer settings for Davis Fx3 motherboard + Tower wafer chips
static int MUXInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr[5] = {0,0,0,0,0};
	uint8_t paramAddr[5] = {0,1,3,4,5};
	int value[5] = {1,1,1,1,1};

	for (uint8_t a = 0; a < 5; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr[a], paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}


// Set up the initial DVS settings for Davis Fx3 motherboard + Tower wafer chips
static int DVSInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 1;
	uint8_t paramAddr[12] = {3,4,5};
	int value[12] = {1,0,0};

	for (uint8_t a = 0; a < 3; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}


// Set up the initial APS settings for Davis Fx3 motherboard + Tower wafer chips
static int APSInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr[6] = {2,2,5,2,2,2};
	uint8_t paramAddr[6] = {4,5,142,7,12,13};
	int value[6] = {1,1,1,1,302400,3024000};

	for (uint8_t a = 0; a < 6; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr[a], paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
}


// Set up the initial IMU settings for Davis Fx3 motherboard + Tower wafer chips
static int IMUInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 3;
	uint8_t paramAddr[7] = {2,3,4,5,6,7,10};
	int value[7] = {0,0,0,0,1,2,2};

	for (uint8_t a = 0; a < 7; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}


// Set up the initial External Input settings for Davis Fx3 motherboard + Tower wafer chips
static int ExternalInputInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 4;
	uint8_t paramAddr[6] = {0,1,2,3,4,5};
	int value[6] = {0,0,0,1,1,120};

	for (uint8_t a = 0; a < 6; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}

static int chipBiasCurrentConfig(XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 5;
	int value[37] = {0x19b,0x195,0x1e0,0x1c1,0x1d5,
					 0, 0, 0,
					 0x5a4f,0x7d7e,0x427f,0x5fff,0x400f,
					 0x690f,0x23ad,0x110d,0x419d,0x614d,
					 0x6dbf,0x514d,0x1f,0x63cd,0x531f,
					 0x65bf,0x450d,0x798d,0x5fff,0x5fff,
					 0,0,0,0,0,0,
					 0x5fef,
					 0x8410,0x8410};

	for (int a = 0; a < 37; a = a + 1 )
	{
		if(a < 5 || (a > 7 && a < 28) || a > 33)
		{
			status = dvsSPIWrite(SpiInstancePtr, moduleAddr, a, value[a]);
			if (status != XST_SUCCESS) {
				return XST_FAILURE;
			}
		}
	}

	for(int a = 0; a < 37; a++)
	{
		if(a < 5 || (a > 7 && a <28) || a > 33)
		{
			int retData;
			dvsSPIRead(SpiInstancePtr, moduleAddr, a, &retData);
			printf("New davis346 bias values --- Bias%d is 0x%x.\n\r", a, retData);
		}
	}

	return XST_SUCCESS;
}

// Set up the Analog & Digital MUX and the CalibNeuron.
static int ChipDiagnosticChainInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 5;
	uint8_t paramAddr[15] = {128,129,130,131,132,133,134,135,136,137,138,140,141,143,144};
	int value[15] = {0,0,0,0,0,0,0,0,1,0,1,0,0,1,0};

	for (uint8_t a = 0; a < 15; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}


//set the Preferences List configurations
static int PreferencesListSetup (XSpiPs *SpiInstancePtr) {
	int status;
	//Enable the chip's bias generator, powering it up.
	status = MUXInitialization(SpiInstancePtr);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//set up the DVS configurations.
	status = DVSInitialization(SpiInstancePtr);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
//	//set up the APS configurations.
//	status = APSInitialization(SpiInstancePtr);
//	if (status != XST_SUCCESS) {
//		return XST_FAILURE;
//
//	//set up the IMU configurations.
//	status = IMUInitialization(SpiInstancePtr);
//	if (status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//	//set up the External Input configurations.
//	status = ExternalInputInitialization(SpiInstancePtr);
//	if (status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
	//Set up the Analog & Digital MUX and the CalibNeuron.
	chipBiasCurrentConfig(SpiInstancePtr);
	status = ChipDiagnosticChainInitialization(SpiInstancePtr);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
//	while(1)
//	{
//		int tmpData;
//		dvsSPIRead(SpiInstancePtr, 5, 8, &tmpData);
//		if(tmpData >= 0xa) tmpData = 0;
//		status = dvsSPIWrite(SpiInstancePtr, 5, 8, tmpData + 1);
//		if (status != XST_SUCCESS) {
//			return XST_FAILURE;
//		}
//	}

	return XST_SUCCESS;
}

// Set up the initial chip biases for Davis Fx3 motherboard + Tower wafer chips
static int ShiftedSourceInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 5;
	uint8_t paramAddr[2] = {35,36};
	int value[2] = {33808,33808};

	for (uint8_t a = 0; a < 2; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}

// Set up the initial chip biases for Davis Fx3 motherboard + Tower wafer chips
static int VDACBiasInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 5;
	uint8_t paramAddr[5] = {0,1,2,3,4};
	int value[5] = {411,405,478,449,469};

	for (uint8_t a = 0; a < 5; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}


// Set up the initial chip biases for Davis Fx3 motherboard + Tower wafer chips
static int CoarseFineBiasInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	uint8_t moduleAddr = 5;
	uint8_t paramAddr[21] = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,34};
//	int value[21] = {23119,32127,17023,24575,16399,22559,9133,4365,16797,24909,28095,20813,31,25549,21279,26047,17677,31117,24575,24575,24559};
	int value[21] = {23119,32127,17023,24575,16399,22559,9133,4365,16797,24909,28095,20813,31,25549,21279,26047,17677,31117,24575,24575,24559};

	for (uint8_t a = 0; a < 21; a = a + 1 ) {
		status = dvsSPIWrite(SpiInstancePtr, moduleAddr, paramAddr[a], value[a]);
		if (status != XST_SUCCESS) {
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}


// Set up the initial chip biases for Davis Fx3 motherboard + Tower wafer chips
static int BiasInitialization (XSpiPs *SpiInstancePtr) {
	int status;
	status = ShiftedSourceInitialization(SpiInstancePtr);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	status = VDACBiasInitialization(SpiInstancePtr);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	status = CoarseFineBiasInitialization(SpiInstancePtr);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}


// This function is a patch for the native vivado driver to solve the problem that DDR3 address wire A3 and A4 is swapped on the pcb board.
void ZynqDAVISDDR3Patch()
{
	REG_WRITE(0xf8006000, 0x200);   // Put the DDRC into a reset state.

	REG_WRITE(0xf800602c, 0x30);  // MR3 = 0, MR2 = 0x30 (Be careful: A3 and A4 is swapped.)
	REG_WRITE(0xf8006030, 0x40328); // MR1 = 0x4, MR0 = 0x328 (Be careful: A3 and A4 is swapped.)

//	REG_WRITE(0xf8000008,  0x0000DF0D); // unlock slrc
//
//    REG_WRITE(0xf8000b70, 0x822);  // Reset DCI first
//	REG_WRITE(0xf8000b6c, 0x209);
////	data = REG_READ(0xf8000b74);
////	while((data & 0x0200) != 0)
////	{
////		data = REG_READ(addr);
////	}
//    REG_WRITE(0xf8000b70, 0x823);  // then enable DCI again
//
//    for (int j=0; j<4; j++)
//    {
//      REG_WRITE(0xf8006140 + 4*j, 0x24 );  // always needed
//      REG_WRITE(0xf8006168 + 4*j, 0x2A );  // needed for ddr2 or manual
//
//      REG_WRITE(0xf8006154 + 4*j, 0x20 );  // adjust write dqs
//      REG_WRITE(0xf8006118 + 4*j, 0x28000001);
//      REG_WRITE(0xf800617C + 4*j, 0x48);
//    }
//    REG_WRITE(0xf8006120, 0x28000000);
//    REG_WRITE(0xf8006124, 0x28000000);
//
//
	REG_WRITE(0xf8006000, 0x85);   // Put the DDRC into a reset state.
	// wait mode_st_register to become 0x1;

    // wait a while
//    noop(1000000);

}

int main()
{
	int Status;
    init_platform();

    print("VDMA application on davis 7z045 using PMOD VGA\n\r");

    ZynqDAVISDDR3Patch();

    //Configure the ZC702 On-board HDMI
//    zc702_set_on_board_hdmi(&IicPs_inst);

//    xil_printf("HDMI Setup Complete!\r\n");

    //Initialize the TPG IP
//    Status = XV_tpg_Initialize(&tpg_inst, XPAR_V_TPG_0_DEVICE_ID);
//    if(Status!= XST_SUCCESS)
//    {
//    	xil_printf("TPG configuration failed\r\n");
//    	return(XST_FAILURE);
//    }

    //Configure the TPG
//    app_hdmi_conf_tpg(&tpg_inst, 600, 800, 0, XTPG_BKGND_TARTAN_COLOR_BARS);

    //Configure the moving box of the TPG
//    app_hdmi_conf_tpg_box(&tpg_inst, 50, 1);

    //Start the TPG
//    XV_tpg_EnableAutoRestart(&tpg_inst);
//    XV_tpg_Start(&tpg_inst);
//    xil_printf("TPG started!\r\n");

    //Initialize the ETF IP
    Status = XEventstreamtoconstencntframestream_Initialize(&etf_inst, XPAR_EVENTSTREAMTOCONSTEN_0_DEVICE_ID);
    if(Status!= XST_SUCCESS)
    {
    	xil_printf("ETF configuration failed\r\n");
    	return(XST_FAILURE);
    }

    // Configure teh ETF
    uint32_t configEn = XEventstreamtoconstencntframestream_Get_ctrl_V(&etf_inst);
    uint32_t sliceDuration = XEventstreamtoconstencntframestream_Get_configRegs_V(&etf_inst);
    configEn = 0x11;
    sliceDuration = 20;
    XEventstreamtoconstencntframestream_Set_configRegs_V(&etf_inst, sliceDuration);   // Set config enable
    XEventstreamtoconstencntframestream_Set_ctrl_V(&etf_inst, configEn);
    XEventstreamtoconstencntframestream_Set_configRegs_V(&etf_inst, sliceDuration);   // Clear config enable

	/* Start of VDMA Configuration */
    Xil_Out32 (XPAR_AXI_VDMA_0_BASEADDR + 0x30, 0x8B);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0xAC, 0xD000000);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0xB0, 0xE000000);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0xB4, 0xF000000);
    Xil_Out32 (XPAR_AXI_VDMA_0_BASEADDR + 0xA8, 800*3);
    Xil_Out32 (XPAR_AXI_VDMA_0_BASEADDR + 0xA4, 800*3);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0xA0, 600);

    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0x00, 0x8B);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0x5C, 0xD000000);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0x60, 0xE000000);
    Xil_Out32(XPAR_AXI_VDMA_0_BASEADDR + 0x64, 0xF000000);
    Xil_Out32 (XPAR_AXI_VDMA_0_BASEADDR + 0x58, 800*3);
    Xil_Out32 (XPAR_AXI_VDMA_0_BASEADDR + 0x54, 800*3);
    Xil_Out32 (XPAR_AXI_VDMA_0_BASEADDR + 0x50, 600);
	/* End of VDMA Configuration */

	xil_printf("Start to configure various DVS state machines. \r\n");

	/*
	 * Run the Spi Interrupt example.
	 */
	Status = dvsSPIInit(&SpiInstance, SPI_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		xil_printf("Init Failed\r\n");
		return XST_FAILURE;
	}

	Status = PreferencesListSetup(&SpiInstance);
	if (Status != XST_SUCCESS) {
		xil_printf("Configure Failed\r\n");
		return XST_FAILURE;
	}

//	Status = BiasInitialization(&SpiInstance);
//	if (Status != XST_SUCCESS) {
//		xil_printf("Bias Configure Failed\r\n");
//		return XST_FAILURE;
//	}
	xil_printf("Successfully configured and started DVS.\r\n");


    cleanup_platform();
    return 0;
}


