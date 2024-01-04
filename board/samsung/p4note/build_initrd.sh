#!/bin/sh

set -e

# we need a dummy initrd as the buildroot image will be flashed to the system partition
image_file=${BINARIES_DIR}/ext4.img

echo "creating dummy initrd image"

mkdir -p initrd
touch initrd/test.txt

rm $image_file
mke2fs -L '' -N 0 -O ^64bit -d initrd/ -m 5 -r 1 -t ext2 $image_file 256K

# xz the image
xz --stdout $image_file > $image_file.xz

echo "initrd successfully created"
