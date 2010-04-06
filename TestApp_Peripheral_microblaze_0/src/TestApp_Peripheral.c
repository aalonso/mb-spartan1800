/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * Xilinx EDK 11.5 EDK_LS5.70
 *
 * This file is a sample test application
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * XPS project when you run the "Generate Libraries" menu item
 * in XPS.
 *
 * Your XPS project directory is at:
 *    /home/aalonso/workspace/microblaze/mb-spartan1800/
 */


// Located in: microblaze_0/include/xparameters.h
#include "xparameters.h"

#include "stdio.h"

#include "xintc.h"
#include "intc_header.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "gpio_intr_header.h"
#include "xemaclite.h"
#include "xemaclite_example.h"
#include "emaclite_header.h"
#include "emaclite_intr_header.h"
#include "xspi.h"
#include "spi_header.h"
#include "spi_intr_header.h"
#include "xwdttb.h"
#include "wdttb_header.h"
#include "wdttb_intr_header.h"
#include "xtmrctr.h"
#include "tmrctr_header.h"
#include "tmrctr_intr_header.h"
#include "uartlite_header.h"

#define GPIO_CHANNEL1 1

//====================================================

int main (void) {


   static XIntc intc;

   /*
    * Enable and initialize cache
    */
   #if XPAR_MICROBLAZE_0_USE_ICACHE
      microblaze_invalidate_icache();
      microblaze_enable_icache();
   #endif

   #if XPAR_MICROBLAZE_0_USE_DCACHE
      microblaze_invalidate_dcache();
       microblaze_enable_dcache();
   #endif

   static XGpio Push_Buttons_Gpio;
   static XGpio DIP_Switches_8Bit_Gpio;
   static XEmacLite Ethernet_MAC_EmacLite;
   static XSpi SPI_FLASH_Spi;
   static XWdtTb xps_timebase_wdt_0_Wdttb;
   static XTmrCtr xps_timer_0_Timer;
   print("-- Entering main() --\r\n");


   {
      XStatus status;
      
      print("\r\n Runnning IntcSelfTestExample() for xps_intc_0...\r\n");
      
      status = IntcSelfTestExample(XPAR_XPS_INTC_0_DEVICE_ID);
      
      if (status == 0) {
         print("IntcSelfTestExample PASSED\r\n");
      }
      else {
         print("IntcSelfTestExample FAILED\r\n");
      }
   } 
	
   {
       XStatus Status;

       Status = IntcInterruptSetup(&intc, XPAR_XPS_INTC_0_DEVICE_ID);
       if (Status == 0) {
          print("Intc Interrupt Setup PASSED\r\n");
       } 
       else {
         print("Intc Interrupt Setup FAILED\r\n");
      } 
   }

   /*
    * Peripheral SelfTest will not be run for RS232_Uart_1
    * because it has been selected as the STDOUT device
    */



   {
      Xuint32 status;
      
      print("\r\nRunning GpioOutputExample() for LEDs_8Bit...\r\n");

      status = GpioOutputExample(XPAR_LEDS_8BIT_DEVICE_ID,8);
      
      if (status == 0) {
         print("GpioOutputExample PASSED.\r\n");
      }
      else {
         print("GpioOutputExample FAILED.\r\n");
      }
   }


   {
      Xuint32 status;
      
      print("\r\nRunning GpioInputExample() for Push_Buttons...\r\n");

      Xuint32 DataRead;
      
      status = GpioInputExample(XPAR_PUSH_BUTTONS_DEVICE_ID, &DataRead);
      
      if (status == 0) {
         xil_printf("GpioInputExample PASSED. Read data:0x%X\r\n", DataRead);
      }
      else {
         print("GpioInputExample FAILED.\r\n");
      }
   }
   {
      
      XStatus Status;
        
      Xuint32 DataRead;
      
      print(" Press button to Generate Interrupt\r\n");
      
      Status = GpioIntrExample(&intc, &Push_Buttons_Gpio, \
                               XPAR_PUSH_BUTTONS_DEVICE_ID, \
                               XPAR_XPS_INTC_0_PUSH_BUTTONS_IP2INTC_IRPT_INTR, \
                               GPIO_CHANNEL1, &DataRead);
	
      if (Status == 0 ){
             if(DataRead == 0)
                print("No button pressed. \r\n");
             else
                print("Gpio Interrupt Test PASSED. \r\n"); 
      } 
      else {
         print("Gpio Interrupt Test FAILED.\r\n");
      }
	
   }


   {
      Xuint32 status;
      
      print("\r\nRunning GpioInputExample() for DIP_Switches_8Bit...\r\n");

      Xuint32 DataRead;
      
      status = GpioInputExample(XPAR_DIP_SWITCHES_8BIT_DEVICE_ID, &DataRead);
      
      if (status == 0) {
         xil_printf("GpioInputExample PASSED. Read data:0x%X\r\n", DataRead);
      }
      else {
         print("GpioInputExample FAILED.\r\n");
      }
   }
   {
      
      XStatus Status;
        
      Xuint32 DataRead;
      
      print(" Press button to Generate Interrupt\r\n");
      
      Status = GpioIntrExample(&intc, &DIP_Switches_8Bit_Gpio, \
                               XPAR_DIP_SWITCHES_8BIT_DEVICE_ID, \
                               XPAR_XPS_INTC_0_DIP_SWITCHES_8BIT_IP2INTC_IRPT_INTR, \
                               GPIO_CHANNEL1, &DataRead);
	
      if (Status == 0 ){
             if(DataRead == 0)
                print("No button pressed. \r\n");
             else
                print("Gpio Interrupt Test PASSED. \r\n"); 
      } 
      else {
         print("Gpio Interrupt Test FAILED.\r\n");
      }
	
   }


   {
      XStatus status;
      
      print("\r\nRunning EmacLitePolledExample() for Ethernet_MAC...\r\n");
      status = EmacLitePolledExample(XPAR_ETHERNET_MAC_DEVICE_ID);
      if (status == 0) {
         print("EmacLite Polled Example PASSED\r\n");
      }
      else {
         print("EmacLite Polled Example FAILED\r\n");
      }
   }
   {
      XStatus Status;

      print("\r\n Running Interrupt Test  for Ethernet_MAC...\r\n");
      
      Status = EmacLiteIntrExample(&intc, &Ethernet_MAC_EmacLite, \
                               XPAR_ETHERNET_MAC_DEVICE_ID, \
                               XPAR_XPS_INTC_0_ETHERNET_MAC_IP2INTC_IRPT_INTR);
	
      if (Status == 0) {
         print("EmacLite Interrupt Test PASSED\r\n");
      } 
      else {
         print("EmacLite Interrupt Test FAILED\r\n");
      }

   }


   {
      XStatus status;
      
      print("\r\n Runnning SpiSelfTestExample() for SPI_FLASH...\r\n");
      
      status = SpiSelfTestExample(XPAR_SPI_FLASH_DEVICE_ID);
      
      if (status == 0) {
         print("SpiSelfTestExample PASSED\r\n");
      }
      else {
         print("SpiSelfTestExample FAILED\r\n");
      }
   }
    {
       XStatus Status;

       print("\r\n Running Interrupt Test for SPI_FLASH...\r\n");

       Status = SpiIntrExample(&intc, &SPI_FLASH_Spi, \
                                XPAR_SPI_FLASH_DEVICE_ID, \
                                XPAR_XPS_INTC_0_SPI_FLASH_IP2INTC_IRPT_INTR);
      if (Status == 0) {
         print("Spi Interrupt Test PASSED\r\n");
      } 
      else {
         print("Spi Interrupt Test FAILED\r\n");
      }

    }


   {
      XStatus status;
      
      print("\r\n Runnning WdtTbSelfTestExample() for xps_timebase_wdt_0...\r\n");
      
      status = WdtTbSelfTestExample(XPAR_XPS_TIMEBASE_WDT_0_DEVICE_ID);
      
      if (status == 0) {
         print("WdtTbSelfTestExample PASSED\r\n");
      }
      else {
         print("WdtTbSelfTestExample FAILED\r\n");
      }
   }
        
   {
      XStatus Status;
      
      print("\r\n Running Interrupt Test  for xps_timebase_wdt_0...\r\n");
      
      Status = WdtTbIntrExample(&intc, &xps_timebase_wdt_0_Wdttb, \
                                 XPAR_XPS_TIMEBASE_WDT_0_DEVICE_ID, \
                                 XPAR_XPS_INTC_0_XPS_TIMEBASE_WDT_0_WDT_INTERRUPT_INTR);
	
      if (Status == 0) {
         print("Wdttb Interrupt Test PASSED\r\n");
      } 
      else {
         print("Wdttb Interrupt Test FAILED\r\n");
      }


   }


   {
      XStatus status;
      
      print("\r\n Running TmrCtrSelfTestExample() for xps_timer_0...\r\n");
      
      status = TmrCtrSelfTestExample(XPAR_XPS_TIMER_0_DEVICE_ID, 0x0);
      
      if (status == 0) {
         print("TmrCtrSelfTestExample PASSED\r\n");
      }
      else {
         print("TmrCtrSelfTestExample FAILED\r\n");
      }
   }
   {
      XStatus Status;

      print("\r\n Running Interrupt Test  for xps_timer_0...\r\n");
      
      Status = TmrCtrIntrExample(&intc, &xps_timer_0_Timer, \
                                 XPAR_XPS_TIMER_0_DEVICE_ID, \
                                 XPAR_XPS_INTC_0_XPS_TIMER_0_INTERRUPT_INTR, 0);
	
      if (Status == 0) {
         print("Timer Interrupt Test PASSED\r\n");
      } 
      else {
         print("Timer Interrupt Test FAILED\r\n");
      }

   }


   {
      XStatus status;
      
      print("\r\nRunning UartLiteSelfTestExample() for mdm_0...\r\n");
      status = UartLiteSelfTestExample(XPAR_MDM_0_DEVICE_ID);
      if (status == 0) {
         print("UartLiteSelfTestExample PASSED\r\n");
      }
      else {
         print("UartLiteSelfTestExample FAILED\r\n");
      }
   }
   /*
    * Disable cache and reinitialize it so that other
    * applications can be run with no problems
    */
   #if XPAR_MICROBLAZE_0_USE_DCACHE
      microblaze_disable_dcache();
      microblaze_invalidate_dcache();
   #endif

   #if XPAR_MICROBLAZE_0_USE_ICACHE
      microblaze_disable_icache();
      microblaze_invalidate_icache();
   #endif


   print("-- Exiting main() --\r\n");
   return 0;
}

