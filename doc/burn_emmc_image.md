# 基于 SD卡 烧录 eMMC 固件

基于 SD卡 启动的 OpenWRT 系统，将固件烧录到 eMMC 设备上，并以 eMMC 方式启动。

## 1、烧录uboot固件

1. 使用 `balenaEtcher` 软件，烧录固件到 SD卡 中，并通过 SD卡 启动方式，运行 OpenWrt 系统。

2. 将 uboot 固件拷贝到运行的 OpenWRT 系统中。可以通过 scp 命令方式或者 MobaXterm 传输方式，这里不在详细介绍。scp 指令方式示例，其中 192.168.6.102 为开发板地址：

```shell
cd bin/targets/imx/cortexa7/u-boot-mx6ull_atk_mmc
scp u-boot.imx root@192.168.6.102:/root
```

3. 指定的 MMC 块设备 mmcblk1boot0 ，设置为读写模式

```shell
echo 0 > /sys/block/mmcblk1boot0/force_ro
```

4. 把当前目录下的 uboot 固件烧写至 eMMC 的启动分区

```shell
dd if=u-boot.imx of=/dev/mmcblk1boot0 bs=1024 seek=1 conv=fsync
```

5.  烧写完成后，关闭要烧写的启动分区

```shell
echo 1 >/sys/block/mmcblk1boot0/force_ro
```

## 2、删除 eMMC 原有分区

以下操作需要登录终端操作，我们可以使用 ssh 软件登录，也可使用串口登录。

```shell
fdisk /dev/mmcblk1
p
d
d
w

reboot // 重启
```

## 3、烧录固件到 eMMC

等待重启完成后继续打开终端，然后在终端中执行以下命令，进行镜像的烧录

```shell
# 传输固件到设备
scp openwrt-23.05-snapshot-r23789-f7c771329e-imx-cortexa7-imx6ull-atk-mmc-squashfs-combined.bin root@192.168.6.101:/root

# 进入SD卡启动，烧录镜像
dd if=openwrt-23.05-snapshot-r23789-f7c771329e-imx-cortexa7-imx6ull-atk-mmc-squashfs-combined.bin of=/dev/mmcblk1 bs=1M conv=notrunc
```

## 4、系统运行

- 将 SD卡 从开发板上去下。

- 拨码开关调整为 EMMC 启动。

- 上电后，系统自动运行，可以通过串口观察系统启动流程。

