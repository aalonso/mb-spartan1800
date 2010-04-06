
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = device-tree
 PARAMETER PROC_INSTANCE = microblaze_0
 PARAMETER bootargs = console=ttyUL0 ip=on root=/dev/xsa2 rw
 PARAMETER stdout = RS232_Uart_1
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu
 PARAMETER DRIVER_VER = 1.12.b
 PARAMETER HW_INSTANCE = microblaze_0
 PARAMETER COMPILER = mb-gcc
 PARAMETER ARCHIVER = mb-ar
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 1.00.a
 PARAMETER HW_INSTANCE = dlmb_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 1.00.a
 PARAMETER HW_INSTANCE = ilmb_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER DRIVER_VER = 1.00.a
 PARAMETER HW_INSTANCE = lmb_bram
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER DRIVER_VER = 1.14.a
 PARAMETER HW_INSTANCE = RS232_Uart_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER DRIVER_VER = 2.13.a
 PARAMETER HW_INSTANCE = LEDs_8Bit
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER DRIVER_VER = 2.13.a
 PARAMETER HW_INSTANCE = Push_Buttons
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER DRIVER_VER = 2.13.a
 PARAMETER HW_INSTANCE = DIP_Switches_8Bit
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = emaclite
 PARAMETER DRIVER_VER = 2.01.a
 PARAMETER HW_INSTANCE = Ethernet_MAC
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = spi
 PARAMETER DRIVER_VER = 2.01.b
 PARAMETER HW_INSTANCE = SPI_FLASH
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = mpmc
 PARAMETER DRIVER_VER = 3.01.a
 PARAMETER HW_INSTANCE = DDR2_SDRAM
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = wdttb
 PARAMETER DRIVER_VER = 1.11.a
 PARAMETER HW_INSTANCE = xps_timebase_wdt_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = tmrctr
 PARAMETER DRIVER_VER = 1.11.a
 PARAMETER HW_INSTANCE = xps_timer_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER DRIVER_VER = 1.00.a
 PARAMETER HW_INSTANCE = clock_generator_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER DRIVER_VER = 1.14.a
 PARAMETER HW_INSTANCE = mdm_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER DRIVER_VER = 1.00.a
 PARAMETER HW_INSTANCE = proc_sys_reset_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = intc
 PARAMETER DRIVER_VER = 1.11.a
 PARAMETER HW_INSTANCE = xps_intc_0
END


