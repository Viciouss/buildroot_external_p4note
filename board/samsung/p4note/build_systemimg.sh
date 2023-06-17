#!/bin/sh

echo "building system image"

rootfs=${BINARIES_DIR}/rootfs.ext2
systemimg=${BINARIES_DIR}/system.img

if ! [ -f "$rootfs" ]; then
  echo "Missing root fs at $rootfs"
  exit
fi

tune2fs -c0 -i0 $rootfs
img2simg $rootfs $systemimg 4096

echo "system image successfully created"