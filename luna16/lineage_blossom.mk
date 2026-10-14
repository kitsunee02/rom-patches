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
TARGET_EXCLUDES_AUDIOFX := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)


# Allow Jelly to be missing from the tree
PRODUCT_ENFORCE_PACKAGES_EXIST_ALLOW_LIST += Jelly

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

WITH_GMS := false

-include vendor/lineage-priv/keys/keys.mk

PERF_ANIM_OVERRIDE := true
WITH_BCR := true
TARGET_ENABLE_BLUR := false
LUNARIS_BUILD_TYPE := UNOFFICIAL
