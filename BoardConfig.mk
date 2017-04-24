#
# Copyright (C) 2016 The CyanogenMod Project
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

include device/cyanogen/msm8916-common/BoardConfigCommon.mk

include device/xiaomi/ferrari/board/*.mk

TARGET_BOARD_INFO_FILE := device/xiaomi/ferrari/board-info.txt

# inherit from the proprietary version
-include vendor/xiaomi/ferrari/BoardConfigVendor.mk
BOARD_VENDOR := xiaomi

LOCAL_PATH := device/xiaomi/ferrari

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8916
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_RECOVERY_DEVICE_MODULES := libinit_msm8916

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8916
TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false

# Architecture
ifneq ($(FERRARI_32_BIT),true)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
else
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
endif
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405
TARGET_BOARD_SUFFIX := _32

# CPU
TARGET_CPU_CORTEX_A53 := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user userdebug),true)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true
