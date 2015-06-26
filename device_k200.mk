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

$(call inherit-product-if-exists, vendor/amlogic/k200/k200-vendor.mk)

DEVICE_FOLDER := device/amlogic/k200

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

PRODUCT_AAPT_CONFIG := small large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

PRODUCT_TAGS += dalvik.gc.type-precise

# Prebuilt
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/set_display_mode.sh:recovery/root/sbin/set_display_mode.sh \
    $(DEVICE_FOLDER)/prebuilt/aml_nftl_dev.ko:root/aml_nftl_dev.ko


# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/ramdisk/ueventd.amlogic.rc:root/ueventd.amlogic.rc \
    $(DEVICE_FOLDER)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(DEVICE_FOLDER)/ramdisk/init.rc:recovery/root/init.rc \
    $(DEVICE_FOLDER)/ramdisk/twrp.fstab:recovery/root/etc/twrp.fstab
