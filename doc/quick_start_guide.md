# 快速上手

基于正点原子的imx6ull阿尔法开发板，移植OpenWRT23.05，仅支持SD卡启动。

功能列表：

- RTL8188EU无线
- EC20 4G联网
- WEB 升级

## 1、硬件环境

正点原子阿尔法开发板。核心板V1.6，底板V2.2。4G模块使用EC20-CEHDLG，无线模块使用RTL8188EU。

![](https://github.com/boxwoodt/imx6ull_openwrt/blob/imx6ull_openwrt/doc/img/atk_board.jpg?raw=true)

## 2、软件环境

编译环境：Ubantu20.04。

OpenWRT版本：23.05，uboot版本：2022.01， 内核版本：v5.15.148。

## 3、编译固件

### a、安装编译依赖

```shell
sudo apt-get install binutils bzip2 diff find flex gawk gcc-6+ getopt grep install libc-dev libz-dev make4.1+ perl python3.7+ rsync subversion unzip which
```

### b、下载源码

```
git clone git@github.com:boxwoodt/imx6ull_openwrt.git -b imx6ull_openwrt
```

### c、更新和安装软件包

```
./scripts/feeds update -a
./scripts/feeds install -a
```

### d、拷贝配置文件

```
cp atk_imx6ull_defconfig .config
```

### e、编译固件

```
make V=s > make.log 2>&1
```

## 4、固件烧录

通过`balenaEtcher`软件，将固件烧录到SD卡中。

烧录软件下载地址：https://etcher.balena.io/#download-etcher

IMX6ULL固件地址：https://github.com/boxwoodt/imx6ull_openwrt/releases/download/v1.0/openwrt-23.05-snapshot-r0+23781-0844937947-imx-cortexa7-imx6ull-atk-emmc-squashfs-combined.bin

![](https://github.com/boxwoodt/imx6ull_openwrt/blob/imx6ull_openwrt/doc/img/firmware_burn.png?raw=true)

## 5、运行

![](https://github.com/boxwoodt/imx6ull_openwrt/blob/imx6ull_openwrt/doc/img/openwrt_status.png?raw=true)

![](https://github.com/boxwoodt/imx6ull_openwrt/blob/imx6ull_openwrt/doc/img/openwrt_network.png?raw=true)

![](https://github.com/boxwoodt/imx6ull_openwrt/blob/imx6ull_openwrt/doc/img/openwrt_wireless.png?raw=true)


