# Copyright (C) 2013 OmniROM Project
# Copyright (C) 2012 The CyanogenMod Project
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


DEVICE_FOLDER := device/amlogic/k200

# inherit from the proprietary version
$(call inherit-product-if-exists, vendor/amlogic/k200/BoardConfigVendor.mk)

# Camera
USE_CAMERA_STUB := false

# board
TARGET_BOOTLOADER_BOARD_NAME := k200
TARGET_BOARD_PLATFORM := meson8
TARGET_BOARD_HARDWARE := amlogic
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_SIMULATOR := false
TARGET_NO_BOOTLOADER := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel
BOARD_MKBOOTIMG_ARGS := --second $(DEVICE_FOLDER)/prebuilt/dtb

#misc
USING_ION:=true
USE_OPENGL_RENDERER := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_USES_HWCOMPOSER := true
ENABLE_WEBGL := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_MMCUTILS := true
TARGET_USES_ION := true
TARGET_FORCE_CPU_UPLOAD := true
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg

# partition info
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE:= 12884901888
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/ramdisk/fstab.amlogic
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/ramdisk/init.rc
BOARD_UMS_LUNFILE := "/sys/devices/lm0/gadget/lun0/file"
BOARD_UMS_2ND_LUNFILE := "/sys/devices/lm0/gadget/lun1/file"
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_15x24.h\"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

#TWRP
DEVICE_RESOLUTION := 1920x1200
TW_BOARD_CUSTOM_GRAPHICS := ../../../$(DEVICE_FOLDER)/ramdisk/graphics.c
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_SCREEN_BLANK := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TWHAVE_SELINUX := true
TW_NO_BATT_PERCENT := true
TW_INCLUDE_FB2PNG := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_REBOOT_BOOTLOADER := true
TW_ROUND_SCREEN := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"
