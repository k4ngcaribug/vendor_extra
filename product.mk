# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/certs/releasekey.pk8))
    $(warning Using custom signing keys from vendor/certs/)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
    LINEAGE_EXTRAVERSION := signed
else
    $(warning Not using custom signing keys, play integrity will fail)
endif
endif

# Updater
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += lineage.updater.allow_downgrading=true
