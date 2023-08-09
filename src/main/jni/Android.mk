LOCAL_PATH := $(call my-dir)
MAIN_LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := libdobby
LOCAL_SRC_FILES := Dobby/libraries/$(TARGET_ARCH_ABI)/libdobby.a
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_STATIC_LIBRARIES := libdobby

# Here is the name of your lib.
# When you change the lib name, change also on System.loadLibrary("") under OnCreate method on StaticActivity.java
# Both must have same name
LOCAL_MODULE    := $(TARGET_ARCH_ABI)

# Code optimization
# -std=c++17 is required to support AIDE app with NDK
LOCAL_CFLAGS := -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w
LOCAL_CFLAGS += -fno-rtti -fno-exceptions -fpermissive
LOCAL_CPPFLAGS := -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w -Werror -s -std=c++17
LOCAL_CPPFLAGS += -Wno-error=c++11-narrowing -fms-extensions -fno-rtti -fno-exceptions -fpermissive
LOCAL_LDFLAGS += -Wl,--gc-sections,--strip-all, -llog
LOCAL_ARM_MODE := arm

LOCAL_C_INCLUDES += $(MAIN_LOCAL_PATH)

# Here you add the cpp file
LOCAL_SRC_FILES := Main.cpp \
    KittyMemory/KittyMemory.cpp \
    KittyMemory/MemoryPatch.cpp \
    KittyMemory/MemoryBackup.cpp \
    KittyMemory/KittyUtils.cpp \
    ImGui/imgui.cpp \
    ImGui/imgui_draw.cpp \
    ImGui/imgui_widgets.cpp \
    ImGui/imgui_tables.cpp \
    ImGui/imgui_demo.cpp \
    ImGui/backends/imgui_impl_android.cpp \
    ImGui/backends/imgui_impl_opengl3.cpp \

LOCAL_LDLIBS := -llog -landroid -lGLESv2 -lEGL -lGLESv3

include $(BUILD_SHARED_LIBRARY)
