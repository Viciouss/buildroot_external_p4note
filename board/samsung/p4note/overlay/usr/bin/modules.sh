#!/bin/sh

# If you want to flash a custom kernel with corresponding modules, just
# remove the .depmod file and on the next boot it will automatically
# execute depmod.

filename="/usr/lib/modules/.depmod"
if [ -f $filename ]; then
        echo "Module dependencies already created, skipping..."
else
        echo "Executing depmod for module dependencies..."
        depmod
        touch $filename
fi
