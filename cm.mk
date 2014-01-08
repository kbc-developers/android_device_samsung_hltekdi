$(call inherit-product, device/samsung/hltekdi/full_hltekdi.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hltekdi TARGET_DEVICE=hltekdi BUILD_FINGERPRINT="KDDI/SCL22/SCL22:4.3/JSS15J/SCL22KDUBML1:user/release-keys" PRIVATE_BUILD_DESC="hltekdi-user 4.3 JSS15J SCL22KDUBML1 release-keys"


PRODUCT_NAME := cm_hltekdi
PRODUCT_DEVICE := hltekdi
