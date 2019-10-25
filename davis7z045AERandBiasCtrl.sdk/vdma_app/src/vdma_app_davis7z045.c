// SPDX-License-Identifier: GPL-2.0
/*
 * vdma_app_zc702.c
 *
 *  Created on: 27 Nov 2018
 *      Author: florentw
 */


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "iic_utils.h"
//#include "app_hdmi.h"

XIicPs IicPs_inst;
//XV_tpg tpg_inst;
//XV_tpg_Config *tpg_config;

// Macros
#define REG_READ(addr) \
    ({int val;int a=addr; asm volatile ("ldr   %0,[%1]\n" : "=r"(val) : "r"(a)); val;})

#define REG_WRITE(addr,val) \
    ({int v = val; int a = addr; __asm volatile ("str  %1,[%0]\n" :: "r"(a),"r"(v)); v;})

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

	while(1)
	{
	}


    cleanup_platform();
    return 0;
}


