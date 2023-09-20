# Inherit common products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configurations
$(call inherit-product, device/lenovo/TB371FC/device.mk)

# Inherit common lineagos configurations
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)


PRODUCT_BRAND := lenovo # 产品品牌
PRODUCT_DEVICE := TB371FC # 产品设备名
PRODUCT_MANUFACTURER := lenovo # 产品制造商
PRODUCT_MODEL := TB371FC # 产品型号
PRODUCT_NAME := lineage_TB371FC # 产品名


