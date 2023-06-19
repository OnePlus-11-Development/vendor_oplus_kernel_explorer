$(warning explorer makefile should only work on QCOM platform)

#For explorer on QCOM platform
#Makefile for use with Android's kernel/build system
M=$(PWD)
EXPLORER_ROOT=$(KERNEL_SRC)/$(M)

KBUILD_OPTIONS += MODNAME=explorer
KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)
KBUILD_OPTIONS := EXPLORER_ROOT=$(EXPLORER_ROOT)
KBUILD_OPTIONS += KBUILD_EXTRA_SYMBOLS=$(ANDROID_BUILD_TOP)/out/vendor/qcom/opensource/camera-kernel/Module.symvers

all: modules

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean
