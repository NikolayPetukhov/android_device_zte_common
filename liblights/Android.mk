# Copyright (C) 2008 The Android Open Source Project
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
LOCAL_PATH:= $(call my-dir)
# HAL module implemenation, not prelinked and stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lights.c
LOCAL_C_INCLUDES += $(LOCAL_PATH)

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_SHARED_LIBRARIES := liblog

LOCAL_MODULE_TAGS := optional

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),skate)
LOCAL_MODULE := lights.skate
include $(BUILD_SHARED_LIBRARY)
else ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),blade)
LOCAL_MODULE := lights.blade
include $(BUILD_SHARED_LIBRARY)
else ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),blade2)
LOCAL_MODULE := lights.blade2
include $(BUILD_SHARED_LIBRARY)
else ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),v9)
LOCAL_MODULE := lights.v9
include $(BUILD_SHARED_LIBRARY)
endif
