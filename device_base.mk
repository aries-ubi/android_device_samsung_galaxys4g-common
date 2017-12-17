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

# This file includes all definitions that apply to ALL galaxys4g-common devices, and
# are also specific to galaxys4g-common devices
#
# Everything in this directory will become public


ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/samsung/galaxys4g-common-kernel/zImage
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/samsung/galaxys4g-common/config/asound.conf:system/etc/asound.conf

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/galaxys4g-common/rootdir/init.aries.rc:root/init.aries.rc \
    device/samsung/galaxys4g-common/rootdir/init.recovery.aries.rc:root/init.recovery.aries.rc \
    device/samsung/galaxys4g-common/rootdir/ueventd.aries.rc:root/ueventd.aries.rc

# FSTAB files
PRODUCT_COPY_FILES += \
    device/samsung/galaxys4g-common/rootdir/fstab.aries:root/fstab.aries \
    device/samsung/galaxys4g-common/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
    device/samsung/galaxys4g-common/config/aries-keypad.kl:system/usr/keylayout/aries-keypad.kl \
    device/samsung/galaxys4g-common/config/aries-keypad.kcm:system/usr/keychars/aries-keypad.kcm \
    device/samsung/galaxys4g-common/config/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl

# updater.sh
PRODUCT_COPY_FILES += \
    device/samsung/galaxys4g-common/updater.sh:updater.sh

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi xhdpi xxhdpi

# Utilities
PRODUCT_PACKAGES += \
    utility_mksquashfs \
    utility_ubiupdatevol

# HSPA+/HSUPA Overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=14 \
    ro.ril.hsupa.category=6 \
    ro.ril.hsxpa=2 \
    net.tcp.buffersize.hsdpa=4094,87380,393216,4096,16384,110208

# Inherit Aries common device configuration.
$(call inherit-product, device/samsung/aries-common/device_base.mk)
