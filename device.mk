#
# Copyright (C) 2018-2021 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

DEVICE_PATH := device/lenovo/TB371FC

#Suppot to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Audio
PRODUCT_PACKAGES += \
    libaacwrapper

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1840
TARGET_SCREEN_WIDTH := 2944

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.kona.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Common init scripts
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc \
    init.recovery.usb.rc \
    fstab.qcom.ramdisk

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# F2FS utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Kernel
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/dtb.img:dtb.img

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2

# Properties
include $(LOCAL_PATH)/properties/default.mk

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Update engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

# Vendor boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# VNDK
PRODUCT_TARGET_VNDK_VERSION := current