# This is automatically generated file using StackAndroidARMConfig on 31 October 2014 3:11:56.657123 pm
TOP_PATH := $(call my-dir)/../..
# Build VirtualMachine
include $(CLEAR_VARS)
LOCAL_MODULE :=VirtualMachine
TARGET_ARCH := arm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/android/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/src/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/unix/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/Cross/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/build
LOCAL_CFLAGS += -DNOEXECINFO
LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DLSB_FIRST=0
LOCAL_CFLAGS += -DAVOID_OPENGL_H
LOCAL_CFLAGS += -DSTACKVM
LOCAL_CFLAGS += -DNO_VM_PROFILE
LOCAL_CFLAGS += -DFT2_BUILD_LIBRARY 
LOCAL_CFLAGS += -DITIMER_HEARTBEAT=1
LOCAL_CFLAGS += -DVM_TICKER=1
LOCAL_LDLIBS += -llog
LOCAL_SRC_FILES += $(TOP_PATH)/src/vm/gcc3x-interp.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/Cross/vm/sqHeapMap.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/Cross/vm/sqTicker.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/Cross/vm/sqExternalSemaphores.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/Cross/vm/sqNamedPrims.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/Cross/vm/sqVirtualMachine.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/aio.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/debug.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/osExports.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixCharConv.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixExternalPrims.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixHeartbeat.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixMain.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixMemory.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixThreads.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqUnixVMProfile.c
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm/sqAndroidNativeHook.c
$(TOP_PATH)/build/version.c:
	$(TOP_PATH)/platforms/unix/config/verstamp $(TOP_PATH)/build/version.c gcc


LOCAL_SRC_FILES += $(TOP_PATH)/build/version.c


include $(TOP_PATH)/build/AndroidPlugin/Android.mk
include $(TOP_PATH)/build/BitBltPlugin/Android.mk
include $(TOP_PATH)/build/BMPReadWriterPlugin/Android.mk
include $(TOP_PATH)/build/CroquetPlugin/Android.mk
include $(TOP_PATH)/build/ZipPlugin/Android.mk
include $(TOP_PATH)/build/DropPlugin/Android.mk
include $(TOP_PATH)/build/DSAPrims/Android.mk
include $(TOP_PATH)/build/FFTPlugin/Android.mk
include $(TOP_PATH)/build/FileCopyPlugin/Android.mk
include $(TOP_PATH)/build/FilePlugin/Android.mk
include $(TOP_PATH)/build/FloatArrayPlugin/Android.mk
include $(TOP_PATH)/build/FloatMathPlugin/Android.mk
include $(TOP_PATH)/build/JoystickTabletPlugin/Android.mk
include $(TOP_PATH)/build/LargeIntegers/Android.mk
include $(TOP_PATH)/build/Matrix2x3Plugin/Android.mk
include $(TOP_PATH)/build/MiscPrimitivePlugin/Android.mk
include $(TOP_PATH)/build/SecurityPlugin/Android.mk
include $(TOP_PATH)/build/SerialPlugin/Android.mk
include $(TOP_PATH)/build/SocketPlugin/Android.mk
include $(TOP_PATH)/build/StarSqueakPlugin/Android.mk
include $(BUILD_SHARED_LIBRARY)

# Build vm-display-null
include $(CLEAR_VARS)
LOCAL_MODULE :=vm-display-null
TARGET_ARCH := arm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/android/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/src/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/unix/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/Cross/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/build
LOCAL_CFLAGS += -DNOEXECINFO
LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DLSB_FIRST=0
LOCAL_CFLAGS += -DAVOID_OPENGL_H
LOCAL_CFLAGS += -DSTACKVM
LOCAL_CFLAGS += -DNO_VM_PROFILE
LOCAL_CFLAGS += -DFT2_BUILD_LIBRARY 
LOCAL_CFLAGS += -DITIMER_HEARTBEAT=1
LOCAL_CFLAGS += -DVM_TICKER=1
LOCAL_LDLIBS += -llog
LOCAL_SHARED_LIBRARIES := VirtualMachine
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm-display-null/sqUnixDisplayNull.c
include $(BUILD_SHARED_LIBRARY)

# Build vm-display-android
include $(CLEAR_VARS)
LOCAL_MODULE :=vm-display-android
TARGET_ARCH := arm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/android/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/src/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/unix/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/Cross/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/build
LOCAL_CFLAGS += -DNOEXECINFO
LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DLSB_FIRST=0
LOCAL_CFLAGS += -DAVOID_OPENGL_H
LOCAL_CFLAGS += -DSTACKVM
LOCAL_CFLAGS += -DNO_VM_PROFILE
LOCAL_CFLAGS += -DFT2_BUILD_LIBRARY 
LOCAL_CFLAGS += -DITIMER_HEARTBEAT=1
LOCAL_CFLAGS += -DVM_TICKER=1
LOCAL_LDLIBS += -llog
LOCAL_SHARED_LIBRARIES := VirtualMachine
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm-display-android/sqAndroidDisplay.c
include $(BUILD_SHARED_LIBRARY)

# Build vm-sound-null
include $(CLEAR_VARS)
LOCAL_MODULE :=vm-sound-null
TARGET_ARCH := arm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/android/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/src/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/unix/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/platforms/Cross/vm
LOCAL_C_INCLUDES += $(TOP_PATH)/build
LOCAL_CFLAGS += -DNOEXECINFO
LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DLSB_FIRST=0
LOCAL_CFLAGS += -DAVOID_OPENGL_H
LOCAL_CFLAGS += -DSTACKVM
LOCAL_CFLAGS += -DNO_VM_PROFILE
LOCAL_CFLAGS += -DFT2_BUILD_LIBRARY 
LOCAL_CFLAGS += -DITIMER_HEARTBEAT=1
LOCAL_CFLAGS += -DVM_TICKER=1
LOCAL_LDLIBS += -llog
LOCAL_SHARED_LIBRARIES := VirtualMachine
LOCAL_SRC_FILES += $(TOP_PATH)/platforms/unix/vm-sound-null/sqUnixSoundNull.c
include $(BUILD_SHARED_LIBRARY)


