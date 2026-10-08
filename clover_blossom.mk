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

# Inherit some common clover stuff.
$(call inherit-product, vendor/clover/config/common_full_phone.mk)

# Malloc
PRODUCT_DISABLE_SCUDO := true

scr_resolution := 720
TARGET_SUPPORTS_BLUR := true
TARGET_ENABLE_BLUR := true
TARGET_BOOT_ANIMATION_RES := 720

PRODUCT_NAME := clover_blossom
PRODUCT_DEVICE := blossom
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

#Enable blur
TARGET_ENABLE_BLUR := true

#Quicktap
TARGET_SUPPORTS_QUICK_TAP := true

#Nerver complie this
TARGET_EXCLUDES_AUDIOFX := true
TARGET_INCLUDE_VIA := false

#Clover maintainer
CLOVER_MAINTAINER := fiyuu

#Gms
WITH_GMS := true

#Sign build with private key
-include vendor/lineage-priv/keys/keys.mk
