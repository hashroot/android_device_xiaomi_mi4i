# Inherit common AOSP-CAF stuff
$(call inherit-product, vendor/aosp/common.mk)

# Inherit device configurations
$(call inherit-product, device/xiaomi/ferrari/full_ferrari.mk)

# Device display
TARGET_SCREEN_HEIGHT :=1920
TARGET_SCREEN_WIDTH := 1080

# Device identifications
PRODUCT_DEVICE := ferrari
PRODUCT_NAME := aosp_ferrari
PRODUCT_BRAND := xiaomi
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_MODEL := xiaomi MI4i
