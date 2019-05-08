TARGET_MODULE:=gpio-byu

ccflags-y := -std=gnu99 -Wno-declaration-after-statement

# If we are running by kernel building system
ifneq ($(KERNELRELEASE),)
	obj-m := $(TARGET_MODULE).o
# If we running without kernel build system
else
	BUILDSYSTEM_DIR:=/lib/modules/$(shell uname -r)/build
	PWD:=$(shell pwd)

all :
	# run kernel build system to make module
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules

clean:
	# run kernel build system to cleanup in current directory
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) clean

install:
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules_install
	sudo depmod -a
endif
