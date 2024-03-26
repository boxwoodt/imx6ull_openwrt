#
# Copyright (C) 2021 ImmortalWrt
# <https://immortalwrt.org>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8188eu
PKG_RELEASE=1

PKG_SOURCE_URL:=git@github.com:ivanovborislav/rtl8188eu.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-3-15
PKG_SOURCE_VERSION:=163badb4564be50ce11aa3e6fdd2e18f3e4c4b90
PKG_MIRROR_HASH:=aa1ae4c0bc015f0506cfd15f938e2ff415612e32a1a236d9d1ae0c607e57c1aa

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h
 
include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8188eu
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for RTL8188EU Wireless Chipsets
  DEPENDS:= +kmod-cfg80211 +rtl8188eu-firmware +kmod-usb-core +@DRIVER_11N_SUPPORT
  FILES:=$(PKG_BUILD_DIR)/8188eu.ko
  AUTOLOAD:=$(call AutoProbe,8188eu)
  PROVIDES:=kmod-rtl8188eu
endef

NOSTDINC_FLAGS := \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/include \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-include backport/backport.h

CT_MAKEDEFS += CONFIG_RTL8188EU=m

NOSTDINC_FLAGS+=-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DBUILD_OPENWRT -D_LINUX_BYTEORDER_SWAB_H -DCONFIG_LITTLE_ENDIAN

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
	$(KERNEL_MAKE_FLAGS) \
	M="$(PKG_BUILD_DIR)" \
	NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
	$(CT_MAKEDEFS) modules
endef

$(eval $(call KernelPackage,rtl8188eu))

