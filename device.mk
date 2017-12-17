#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL fascinate4gubi devices, and
# are also specific to fascinate4gubi devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/samsung/fascinate4gubi-kernel/zImage
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


# Inherit Aries common device configuration.
$(call inherit-product, device/samsung/galaxys4g-common/device_base.mk)

# Inherit the vendor blobs
$(call inherit-product, vendor/samsung/fascinate4gubi/fascinate4gubi-vendor.mk)
