#!/bin/sh

# we need a dummy initrd as the buildroot image will be flashed to the system partition

# based on and credits to: https://forum.xda-developers.com/showthread.php?t=1974014

image_file=${BINARIES_DIR}/ext4.img

# 2k * 200 = 400kb
echo "creating dummy initrd image"

mkdir -p initrd
touch initrd/test.txt

rm $image_file
mke2fs -L '' -N 0 -O ^64bit -d initrd/ -m 5 -r 1 -t ext2 $image_file 64K

# xz the image
xz --stdout $image_file > $image_file.xz

echo "initrd successfully created"
