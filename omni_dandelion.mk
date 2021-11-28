#
# Copyright (C) 2019 Potato Open Sauce Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/dandelion

# Release name
PRODUCT_RELEASE_NAME := dandelion

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root) \
    $(DEVICE_PATH)/prebuilt/dtb:dtb.img

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := dandelion
PRODUCT_NAME := omni_dandelion
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 9A
PRODUCT_MANUFACTURER := xiaomi

# Health
PRODUCT_PACKAGES += \
     android.hardware.health@2.1-service \
     android.hardware.health@2.1-impl

# Keymaster
PRODUCT_PACKAGES += \
     android.hardware.keymaster@3.0-service \
     android.hardware.keymaster@3.0-impl

# Gatekeeper
PRODUCT_PACKAGES += \
     android.hardware.gatekeeper@1.0-service \
     android.hardware.gatekeeper@1.0-impl

# uncrypt
PRODUCT_PACKAGES += \
     uncrypt

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# fastbootd
PRODUCT_PACKAGES += \
     android.hardware.fastboot@1.0-impl-mock

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2020-01-05
	
# Resolution
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600

