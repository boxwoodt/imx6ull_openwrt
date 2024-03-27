### iMX6ULL-OpenWRT

基于正点原子的imx6ull阿尔法开发板，移植OpenWRT23.05，仅支持SD卡启动。

功能列表：

- RTL8188J无线

- EC20 4G联网

- WEB 升级

## 1、硬件环境

正点原子阿尔法开发板。核心板V1.6，底板V2.2。4G模块使用EC20-CEHDLG，无线模块使用RTL8188EU。

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
make V=s
```

## 4、固件烧录



## 5、运行