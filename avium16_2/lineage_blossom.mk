#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/blossom/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Malloc
PRODUCT_DISABLE_SCUDO := true

scr_resolution := 720
TARGET_SUPPORTS_BLUR := true
TARGET_ENABLE_BLUR := true

PRODUCT_NAME := lineage_blossom
PRODUCT_DEVICE := blossom
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi


#Avium things
AVIUM_MAINTAINER := fiyuu
AVIUM_SETTINGS_SOC_MODEL_NAME := MTK G35
AVIUM_SETTINGS_DEVICE_CODENAME := Xiaomi 13 kiyuu
AVIUM_IS_OFFICIAL := false
WITH_GMS := false
AVIUM_FORCE_SET_FAKE_PROP := true
TARGET_FORCE_ENABLE_BLUR := false

-include vendor/lineage-priv/keys/keys.mk

#fix these when building
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="blossom-user 16 BP2A.250805.005 202610 release-keys" \
    BuildFingerprint=Xiaomi/blossom/blossom:16/BP2A.250805.005/eng.fiyuu.202610:userdebug/release-keys 
