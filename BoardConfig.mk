# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from common hlte
-include device/samsung/hlte-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := SCL22,hltekdi

# Kernel
TARGET_KERNEL_CONFIG := lineage_scl22_defconfig

#workaround for Android L (selinux permissive)
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F androidboot.selinux=permissive

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/hltekdi/init/init_hlte.cpp

# NFC
BOARD_NFC_CHIPSET := sony

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_CACHEIMAGE_PARTITION_SIZE := 322122752
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624

# inherit from the proprietary version
-include vendor/samsung/hltekdi/BoardConfigVendor.mk
