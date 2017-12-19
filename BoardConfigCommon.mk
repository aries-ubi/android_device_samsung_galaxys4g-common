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

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/galaxys4g-common/bluetooth

# Import the aries-common BoardConfigCommon.mk
include device/samsung/aries-common/BoardConfigCommon.mk

# Override stuff that doesn't match aries-common
BOARD_SECOND_CAMERA_DEVICE := /dev/video2
BOARD_CAMERA_FFC_FLIPPED := true
TARGET_RECOVERY_FSTAB := device/samsung/galaxys4g-common/rootdir/fstab.aries

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/galaxys4g-common/sepolicy

# Filesystems and sizes
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 629145600
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600

# TWRP
RECOVERY_SDCARD_ON_DATA := true
TW_EXTERNAL_STORAGE_MOUNT_POINT :=
TW_EXTERNAL_STORAGE_PATH :=
TW_INTERNAL_STORAGE_MOUNT_POINT :=
TW_INTERNAL_STORAGE_PATH :=
