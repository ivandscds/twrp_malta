MKBOOTIMG := $(HOST_OUT_EXECUTABLES)/mkbootimg
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img

# Definimos las rutas si no estaban definidas antes
INSTALLED_KERNEL_TARGET := $(TARGET_PREBUILT_KERNEL)
RECOVERY_RAMDISK_TARGET := $(PRODUCT_OUT)/ramdisk-recovery.img

# Regla para generar el boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) \
        $(INSTALLED_KERNEL_TARGET) \
        $(RECOVERY_RAMDISK_TARGET)
	@echo "Creating custom boot.img: $@"
	$(MKBOOTIMG) --kernel $(INSTALLED_KERNEL_TARGET) \
		--ramdisk $(RECOVERY_RAMDISK_TARGET) \
		--base 0x40000000 \
		--pagesize 2048 \
		--ramdisk_offset 0x11b00000 \
		--tags_offset 0x07880000 \
		--header_version 2 \
		--dtb $(TARGET_PREBUILT_DTB) \
		--cmdline "bootopt=64S3,32S1,32S1 buildvariant=user" \
		--output $@
