DEVICE_PATH := device/lenovo/TB371FC

# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Configure full_base_telephony.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit common LineageOS configurations
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit device configurations
$(call inherit-product, $(DEVICE_PATH)/device.mk)

PRODUCT_BRAND := lenovo
PRODUCT_DEVICE := TB371FC
PRODUCT_MANUFACTURER := lenovo
PRODUCT_MODEL := TB371FC
PRODUCT_NAME := lineage_TB371FC

PRODUCT_CHARACTERISTICS := tablet
TARGET_BOOT_ANIMATION_RES := 1440
