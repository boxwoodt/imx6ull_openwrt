### iMX6ULL-OpenWRT

基于正点原子的imx6ull阿尔法开发板，移植OpenWRT23.05，仅支持SD卡启动。

功能列表：

- RTL8188J无线

- EC20 4G联网

- WEB 升级

## 1、硬件环境

正点原子阿尔法开发板。核心板V1.6，底板V2.2。4G模块使用EC20-CEHDLG，无线模块使用RTL8188EU。

![](https://note.youdao.com/yws/api/personal/file/AB51D6138FE8481EAF296ED035646EB3?method=download&shareKey=88cd58f57454fcf49b6c3231237d5126)

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

通过`balenaEtcher`软件，将固件烧录到SD卡中。下载地址为https://etcher.balena.io/#download-etcher。

![](https://note.youdao.com/yws/api/personal/file/D54428B206104E4880499C59C485835B?method=download&shareKey=ddbe86b62ec09026f4dbfe696d05c137)

## 5、运行

![](https://note.youdao.com/yws/api/personal/file/47788461E1F64CF5A8CFA06ABC8E7486?method=download&shareKey=c2d8a834c08cfe71af986f413c3aaf4c)

![](https://note.youdao.com/yws/api/personal/file/717C8C16BBD74458A8817083AD94CDA3?method=download&shareKey=1522d44748bf996f20fad6a48fefaf77)

![](https://note.youdao.com/yws/api/personal/file/C60C2963074E49F68F97C1E481E3C38B?method=download&shareKey=245fa26ffd5299a6bb2f7636ea3fff27)