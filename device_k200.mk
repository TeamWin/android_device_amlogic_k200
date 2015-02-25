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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

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
    $(DEVICE_FOLDER)/ramdisk/init.amlogic.board.rc:root/init.amlogic.board.rc \
    $(DEVICE_FOLDER)/ramdisk/init.amlogic.rc:root/init.amlogic.rc \
    $(DEVICE_FOLDER)/ramdisk/ueventd.amlogic.rc:root/ueventd.amlogic.rc \
    $(DEVICE_FOLDER)/ramdisk/ueventd.rc:root/ueventd.rc \
    $(DEVICE_FOLDER)/ramdisk/init.rc:recovery/root/init.rc \
    $(DEVICE_FOLDER)/ramdisk/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(DEVICE_FOLDER)/ramdisk/init.amlogic.usb.rc:root/init.amlogic.usb.rc \
    $(DEVICE_FOLDER)/ramdisk/fstab.amlogic:root/fstab.amlogic


PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072 \
    drm.service.enabled=true \
    wifi.interface=wlan0 \
    gps.enable=false \
    ro.carrier=wifi-only \
    ro.platform.has.pppoe=true

PRODUCT_PACKAGES += \
    make_ext4fs \
    resize2fs \
    setup_fs \
    librs_jni \
    libnetcmdiface \
    com.android.future.usb.accessory

# HAL
PRODUCT_PACKAGES += \
    power.$(TARGET_BOARD_PLATFORM) \
    sensors.$(TARGET_BOARD_HARDWARE) \
    gralloc.$(TARGET_BOARD_HARDWARE) \
    hwcomposer.$(TARGET_BOARD_HARDWARE) \
    lights.$(TARGET_BOARD_HARDWARE)

#wifi
WIFI_BAND := 802_11_BG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_k200
PRODUCT_DEVICE := k200
