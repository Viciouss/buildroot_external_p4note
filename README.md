# Requirements

* **abootimg** and **img2simg** for the build
* **heimdall** for flashing

# How to Use

* download a copy of buildroot 2023.02 or later
* checkout this repository
* adjust wpa_supplicant.conf with your wifi name and password if you want to auto connect
* go to the buildroot directory and execute the following:
  * `make BR2_EXTERNAL=/path/to/this/repo n80(xx)_defconfig`
  * `make`

To flash, attach the device via USB cable, put it into download mode and execute `make flash-all`.

# After Boot

To connect you can either use:

* cdc ethernet via the USB cable
* wifi

The IP addresses for both will be printed on screen after boot for your convenience.

User/Password is root/root.