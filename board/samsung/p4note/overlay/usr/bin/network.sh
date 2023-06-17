#!/bin/bash

# sleep 10 seconds to allow for network connection
sleep 10

# print network configuration to screen of the device
ifconfig > /dev/tty0
