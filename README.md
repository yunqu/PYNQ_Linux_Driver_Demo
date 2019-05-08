## Linux Driver Demo for PYNQ v2.4 ##

This repo is a demonstration on how to compile and use a kernel driver for the PYNQ v2.4 system. Note that this demo assumes that system has an image.ub file that contains a device tree compiled with symbols, and that the pynq package has the functionality to insert a device tree overlay.

### Set-up ###
To setup the kernel for compiling Linux Device Drivers run the setup_kernel.sh script. This will unpack the kernel headers on the board and run the make steps necessary to enable drivers to be compiled.

### Compiling a Kernel Driver ###
A sample kernel driver, gpio-byu.c, with a Makefile has been provided as a demonstration on how to compile it. To compile the gpio-byu.c kernel driver simply run `make`.

### Inserting the Kernel Driver ###
There are two ways to insert the kernel driver:  

The first method is to use the following command:  
```sudo insmod gpio-byu.ko```  
This command will insert the gpio-byu driver into the kernel for as long as the board is powered on or until   
```sudo rmmod gpio-byu```  
 is run. This is useful for development because changes can be made quickly to the kernel driver. Confirmation that these commands worked can be recieved by running `lsmod` to see if the module was inserted or removed.
 
 The second method is to run  
```sudo make install```  
This will insert the kernel driver into the kernel in a way that will persist between power cycles. This is useful once the kernel driver is ready to be deployed into the system.

### Running the Demo ###
Once the kernel driver has been inserted, the dtbo_led_demo.ipynb can be run to demonstrate inserting a device tree overlay that uses the newly inserted driver to blink the leds on the board.
