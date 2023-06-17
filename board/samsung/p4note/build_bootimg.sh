#!/bin/bash

kernel_out=${BINARIES_DIR}/zImage.$2
initrd_out=${BINARIES_DIR}/ext4.img.xz
boot_image=${BINARIES_DIR}/boot.img

if ! [ -f "$kernel_out" ]; then
  echo "Missing kernel at $kernel_out"
  exit
fi

if ! [ -f "$initrd_out" ]; then
  echo "Missing initrd file at $initrd_out"
  exit
fi

echo "creating boot image"
# create the boot image via abootimg, copy the bootimg-n8000.cfg to the build root dir first
abootimg --create $boot_image \
	-f ${BR2_EXTERNAL_P4NOTE_PATH}/board/samsung/p4note/bootimg.cfg \
	-r $initrd_out \
	-k $kernel_out

echo "boot image successfully created"