#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from malta device
$(call inherit-product, device/motorola/malta/device.mk)

# Inherit TWRP common configs instead of Omni
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := malta
PRODUCT_NAME := twrp_malta
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto e(7)
PRODUCT_MANUFACTURER := motorola
