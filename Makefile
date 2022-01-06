ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := Hello.o
ccflags-y += -g
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp Hello.ko Hello.ko.unstripped
	$(CROSS_COMPILE)strip -g Hello.ko
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif
