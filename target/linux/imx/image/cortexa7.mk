DEVICE_VARS += UBOOT

include common.mk

define Device/Default
  PROFILES := Default
  FILESYSTEMS := squashfs ext4
  KERNEL_INSTALL := 1
  KERNEL_SUFFIX := -uImage
  KERNEL_NAME := zImage
  KERNEL := kernel-bin | uImage none
  KERNEL_LOADADDR := 0x80008000
  IMAGES :=
endef

define Device/technexion_imx7d-pico-pi
  DEVICE_VENDOR := TechNexion
  DEVICE_MODEL := PICO-PI-IMX7D
  UBOOT := pico-pi-imx7d
  DEVICE_DTS := imx7d-pico-pi
  DEVICE_PACKAGES := kmod-sound-core kmod-sound-soc-imx kmod-sound-soc-imx-sgtl5000 \
	kmod-can kmod-can-flexcan kmod-can-raw kmod-leds-gpio \
	kmod-input-touchscreen-edt-ft5x06 kmod-usb-hid kmod-btsdio \
	kmod-brcmfmac brcmfmac-firmware-4339-sdio cypress-nvram-4339-sdio
  FILESYSTEMS := squashfs
  IMAGES := combined.bin sysupgrade.bin
  IMAGE/combined.bin := append-rootfs | pad-extra 128k | imx-sdcard-raw-uboot
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += technexion_imx7d-pico-pi

define Device/imx6ull-atk-mmc
  DEVICE_VENDOR := Alientek
  DEVICE_MODEL := atk-mmc
  UBOOT := mx6ull_atk_mmc
  DEVICE_DTS := imx6ull-atk-mmc
  DEVICE_PACKAGES := kmod-usb2 kmod-usb3 kmod-usb-ohci kmod-usb-uhci \
		kmod-usb-wdm kmod-usb-core kmod-usb-hid kmod-usb-net \
		kmod-usb-net-cdc-ether kmod-usb-net-cdc-mbim kmod-usb-net-cdc-subset
  FILESYSTEMS := squashfs
  IMAGES := combined.bin sysupgrade.bin
  IMAGE/combined.bin := append-rootfs | pad-extra 128k | imx6ull-sdcard-raw-uboot
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += imx6ull-atk-mmc
