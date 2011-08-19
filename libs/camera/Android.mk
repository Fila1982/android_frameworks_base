LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	Camera.cpp \
	CameraParameters.cpp \
	ICamera.cpp \
	ICameraClient.cpp \
	ICameraService.cpp \
	ICameraRecordingProxy.cpp \
	ICameraRecordingProxyListener.cpp

ifeq ($(BOARD_OVERLAY_BASED_CAMERA_HAL),true)
    LOCAL_CFLAGS += -DUSE_OVERLAY_CPP
    LOCAL_SRC_FILES += Overlay.cpp
endif

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	libbinder \
	libhardware \
	libui \
	libgui

LOCAL_MODULE:= libcamera_client

ifeq ($(BOARD_CAMERA_USE_GETBUFFERINFO),true)
    LOCAL_CFLAGS += -DUSE_GETBUFFERINFO
endif

ifeq ($(BOARD_CAMERA_CUSTOM_PARAMETERS),true)
    LOCAL_CFLAGS += -DUSE_CUSTOM_PARAMETERS
endif

include $(BUILD_SHARED_LIBRARY)
