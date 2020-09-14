ARCHS = arm64 arm64e
TARGET = iphone:clang:13.0:13.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = MuseUI

MuseUI_FILES = MuseUI.m MUILabelView.m UIImage+MuseUI.m
MuseUI_PUBLIC_HEADERS = MuseUI.h MUILabelView.h UIImage+MuseUI.h
MuseUI_INSTALL_PATH = /Library/Frameworks
MuseUI_CFLAGS = -fobjc-arc
#MuseUI_CFLAGS = -std=c++11 -stdlib=libc++
#MuseUI_LDFLAGS = -std=c++11 -stdlib=libc++

include $(THEOS_MAKE_PATH)/framework.mk
#include $(THEOS_MAKE_PATH)/tweak.mk

MUSEUI_THEOS_FRAMWORK_STAGING_DIR = $(THEOS_PROJECT_DIR)/theos_framework
FRAMEWORK_PATH = $(MUSEUI_THEOS_FRAMWORK_STAGING_DIR)/$(FRAMEWORK_NAME).framework
export TBD_INPUT_PATH = $(THEOS_OBJ_DIR)/$(FRAMEWORK_NAME).dylib
export TBD_OUTPUT_PATH = $(FRAMEWORK_PATH)/$(FRAMEWORK_NAME).tbd
internal-all::
	mkdir -p $(FRAMEWORK_PATH)/Headers
	find $(THEOS_PROJECT_DIR) -maxdepth 1 -name "*.h" -exec cp {} $(FRAMEWORK_PATH)/Headers \;
	#chmod +x $(MUSEUI_THEOS_FRAMWORK_STAGING_DIR)/create_tbd.sh
	#$(MUSEUI_THEOS_FRAMWORK_STAGING_DIR)/create_tbd.sh

clean-env:
	rm -r $(MUSEUI_THEOS_FRAMWORK_STAGING_DIR)/$(FRAMEWORK_NAME).framework $(THEOS)/lib/$(FRAMEWORK_NAME).framework