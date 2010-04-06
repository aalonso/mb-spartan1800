#define TESTAPP_GEN

/* $Id: spi_intr_header.h,v 1.1.2.1 2009/04/09 04:58:14 svemula Exp $ */


#include "xbasic_types.h"
#include "xstatus.h"

int SpiIntrExample(XIntc *IntcInstancePtr, \
                       XSpi *SpiInstancePtr, \
                       u16 SpiDeviceId, \
                       u16 SpiIntrId);


