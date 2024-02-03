# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Configure full_base_telephony.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure updatable_apex.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Configure developer_gsi_keys.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Inherit common LineageOS configurations
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configurations
$(call inherit-product, $(DEVICE_PATH)/device.mk)

DEVICE_PATH := device/lenovo/TB371FC

PRODUCT_BRAND := lenovo
PRODUCT_DEVICE := TB371FC
PRODUCT_MANUFACTURER := lenovo
PRODUCT_MODEL := TB371FC
PRODUCT_NAME := lineage_TB371FC

PRODUCT_CHARACTERISTICS := nosdcard

