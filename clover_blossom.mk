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

#Clover maintainer
CLOVER_MAINTAINER := fiyuu
CLOVER_BUILDTYPE := UNOFFICIAL

#Gms
WITH_GMS := true

#Sign build with private key
-include vendor/lineage-priv/keys/keys.mk

#Enable Blur
TARGET_ENABLE_BLUR := false
TARGET_SUPPORTS_BLUR := true
BOMB_AUDIOFX := true

#Bomb AudioFx

#Bomb malloc and aperture
TARGET_DISABLE_MATLOG := true
PRODUCT_NO_CAMERA := false

# always append time of day
LINEAGE_VERSION_APPEND_TIME_OF_DAY := true

#Include some stuff
TARGET_INCLUDE_VIA := true
TARGET_INCLUDE_REVAMPED := false
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_DOLBY := false
TARGET_EXCLUDES_AUDIOFX := true
