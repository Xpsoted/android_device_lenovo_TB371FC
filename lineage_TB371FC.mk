# Inherit common products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configurations
$(call inherit-product, device/lenovo/TB371FC/device.mk)

# Inherit common lineagos configurations
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)


PRODUCT_BRAND := lenovo
PRODUCT_DEVICE := TB371FC
PRODUCT_MANUFACTURER := lenovo
PRODUCT_MODEL := TB371FC
PRODUCT_NAME := lineage_TB371FC

PRODUCT_CHARACTERISTICS := nosdcard

