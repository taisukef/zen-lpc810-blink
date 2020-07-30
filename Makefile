#!/bin/sh

BAS2BIN="../../c/bas2bin_for_IchigoJam/bas2bin"
LPC21ISP="../../c/lpc21isp_197k/lpc21isp"
USBSERIAL="/dev/tty.SLAB_USBtoUART"
OBJCOPY=arm-none-eabi-objcopy
#OBJCOPY=/usr/local/opt/llvm/bin/llvm-objcopy

DST=dst
NAME=boot

all: build write

build:
	-mkdir ${DST}
	zen build-exe src/boot.zen --name ${DST}/${NAME} -target thumb-freestanding-eabi -mcpu cortex-m0 --strip --release-small --linker-script src/linker.ld --emit asm
	#${OBJCOPY} -S ${DST}/${NAME} -g -O binary --only-section=.text ${DST}/${NAME}.bin
	${OBJCOPY} -S ${DST}/${NAME} -g -O binary --remove-section=.ARM.exidx ${DST}/${NAME}.bin
	ls -l ${DST}/${NAME}.bin

clean:
	#rm -r zen-cache
	-rm -r ${DST}

write:
	${LPC21ISP} -control -bin ${DST}/${NAME}.bin ${USBSERIAL} 115200 1200

disasm:
	arm-none-eabi-objdump -D -bbinary -marm -Mforce-thumb2 $(DST)/${NAME}.bin
	#objdump -D -marm -Mforce-thumb2 $(DST)/${NAME}.axf
	wc -c < $(DST)/${NAME}.bin

sections:
	arm-none-eabi-objdump -x $(DST)/${NAME}
