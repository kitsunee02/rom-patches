#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/blossom/device.mk)

# Inherit common lineage configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device / branding
PRODUCT_NAME := lineage_blossom
PRODUCT_DEVICE := blossom
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi


# GMS
WITH_GMS := false

# Malloc / performance tweaks
PRODUCT_DISABLE_SCUDO := true
TARGET_DISABLE_MATLOG := true

# Display / animation
scr_resolution := 720
TARGET_BOOT_ANIMATION_RES := 720
TARGET_SUPPORTS_BLUR := true

# Audio
BOMB_AUDIOFX := true
TARGET_EXCLUDES_AUDIOFX := true

# Build metadata
LINEAGE_VERSION_APPEND_TIME_OF_DAY := true

# Feature flags
TARGET_INCLUDE_VIA := true
TARGET_INCLUDE_REVAMPED := false
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_INCLUDE_DOLBY := false

# Private signing keys (only if available)
-include vendor/lineage-priv/keys/keys.mk

PERF_ANIM_OVERRIDE := true
WITH_BCR := true
TARGET_ENABLE_BLUR := false
