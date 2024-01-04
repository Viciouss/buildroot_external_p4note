#!/bin/bash

set -e

# $2 contains the name of the device tree, unfortunately with the samsung
# prefix so we first have to get rid of that
dtb_with_prefix=$2
dtb_no_prefix=${dtb_with_prefix:8}

kernel_out=${BINARIES_DIR}/zImage.$dtb_no_prefix
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