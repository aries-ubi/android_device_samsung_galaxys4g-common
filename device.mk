# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.

# These are the hardware-specific configuration files
DEVICE_PACKAGE_OVERLAYS += \
	device/samsung/galaxys4gmtd/overlay

PRODUCT_COPY_FILES := \
	device/samsung/galaxys4gmtd/asound.conf:system/etc/asound.conf

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/samsung/galaxys4gmtd/aries-keypad.kl:system/usr/keylayout/aries-keypad.kl \
	device/samsung/galaxys4gmtd/aries-keypad.kcm:system/usr/keychars/aries-keypad.kcm \
	device/samsung/galaxys4gmtd/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/galaxys4gmtd/init.aries.rc:root/init.aries.rc \
	device/samsung/galaxys4gmtd/init.recovery.aries.rc:root/init.recovery.aries.rc \
	device/samsung/galaxys4gmtd/init.aries.gps.rc:root/init.aries.gps.rc \
	device/samsung/galaxys4gmtd/ueventd.aries.rc:root/ueventd.aries.rc \
	device/samsung/galaxys4gmtd/bml_over_mtd.sh:bml_over_mtd.sh

# FSTAB files
PRODUCT_COPY_FILES += \
	device/samsung/galaxys4gmtd/fstab.aries:root/fstab.aries \
	device/samsung/galaxys4gmtd/twrp.fstab:recovery/root/etc/twrp.fstab

# Misc files
PRODUCT_COPY_FILES += \
	    device/samsung/galaxys4gmtd/updater.sh:updater.sh

# GPSInit files
PRODUCT_COPY_FILES += \
	device/samsung/galaxys4gmtd/gps.sh:system/bin/gps.sh

# GPS wrapper
PRODUCT_PACKAGES += \
	gpsd

# HSPA+/HSUPA Overrides
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ril.gprsclass=12 \
	ro.ril.hsdpa.category=14 \
	ro.ril.hsupa.category=6 \
	ro.ril.hsxpa=2 \
	net.tcp.buffersize.hsdpa = 4094,87380,393216,4096,16384,110208

# Build messaging app
PRODUCT_PACKAGES += \
	messaging

# Inherit Aries common device configuration.
$(call inherit-product, device/samsung/aries-common/device_base.mk)

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/galaxys4gmtd/galaxys4gmtd-vendor.mk)
