#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the proprietary version
-include vendor/lenovo/TB371FC/BoardConfigVendor.mk

DEVICE_PATH := device/lenovo/TB371FC
TB371FC_PREBUILT := device/lenovo/TB371FC_PREBUILT

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor
BOARD_USES_RECOVERY_AS_BOOT := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 340

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 androidboot.selinux=permissive
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
TBOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_KERNEL_CONFIG := TB371FC_defconfig
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := lenovo_dynamic_partitions
BOARD_PREBUILT_ODMIMAGE := $(TB371FC_PREBUILT)/odm.img
BOARD_PREBUILT_VENDORIMAGE := $(TB371FC_PREBUILT)/vendor.img
BOARD_LENOVO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
BOARD_LENOVO_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR := vendor

# Platform
BOARD_USES_QCOM_HARDWARE := true # 指定使用 Qualcomm 硬件
TARGET_BOARD_PLATFORM := kona # 指定平台为 kona

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true # 指定包含 recovery DTBO
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom # 指定 recovery fstab 文件
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888 # 指定 recovery 像素格式
TARGET_USERIMAGES_USE_F2FS := true # 指定 userdata 使用 f2fs

# Verified Boot
BOARD_AVB_ENABLE := true # 指定启用 AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3 # 指定 AVB flags 为 3
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag # 指定 AVB 为禁用
BOARD_AVB_VBMETA_SYSTEM := system system_ext# 指定使用 AVB 的分区
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048 # 指定 AVB 加密算法为 SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem # 指定 AVB 密钥
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP) # 指定 AVB 回滚索引
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1 # 指定 AVB 回滚索引位置

# Sepolicy
include device/qcom/sepolicy/SEPolicy.mk

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.device.xml

# VNDK
BOARD_VNDK_VERSION := current