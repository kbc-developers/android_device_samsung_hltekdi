$(call inherit-product, device/samsung/hltekdi/full_hltekdi.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_DEVICE := hltekdi
PRODUCT_NAME := cm_hltekdi
