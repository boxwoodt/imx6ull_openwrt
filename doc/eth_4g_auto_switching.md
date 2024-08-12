# 有线网络和 4G 网络切换

OpenWRT 系统的路由器在实践过程中发现接入 4G 网络和有线网络的情况下，断开 4G 或者有线网络后，4G和有线不能自动切换。

经检查是接口设置中没有设置 metric 参数导致的问题，在接口的网络配置文件中分别设置 4G 和有线的 metric 参数就可以实现网络的自动切换。

```shell
config interface 'wan'
	option device 'eth0'
	option proto 'dhcp'
	option metric '0'   // 增加

config interface 'wan_4g'
	option proto 'dhcp'
	option device 'usb0'
	option metric '1'   // 增加
```

## 1、说明

> Metric：为路由指定所需跃点数的整数值（范围是 1 ~ 9999），它用来在路由表里的多个路由中选择与转发包中的目标地址最为匹配的路由。所选的路由具有最少的跃点数。跃点数能够反映跃点的数量、路径的速度、路径可靠性、路径吞吐量以及管理属性。

**Metric的值越小，优先级越高。如果两块网卡的Metric的值相同，就会出现抢占优先级继而网卡冲突，将会有一块网卡无法连接。**

## 2、默认配置

4G网络接口配置：修改 `package/base-files/files/bin/config_generate` 文件。其中 `generate_4g_network` 函数是《OpenWRT 使用 4G/5G 无线网卡模块上网》文档中增加的。

```bash
generate_4g_network() {
	uci -q batch <<-EOF
		delete network.wan_4g
		set network.wan_4g='interface'
		set network.wan_4g.proto='dhcp'
		set network.wan_4g.device='usb0'
		set network.wan_4g.metric='1'     # 新增加
	EOF
}
```

以太网接口配置：同样修改 `package/base-files/files/bin/config_generate` 文件。根据逻辑判断，当接口为 wan 时，设置 metric 为 0。

```bash
		dhcp)
			# fixup IPv6 slave interface if parent is a bridge
			[ "$type" = "bridge" ] && device="br-$1"

            # 新增加开始
			[ "$1" = "wan" ] && {
				uci -q batch <<-EOF
					set network.$1.metric='0'
				EOF
			}
            # 新增加结束

			uci set network.$1.proto='dhcp'
			[ -e /proc/sys/net/ipv6 ] && {
				uci -q batch <<-EOF
					delete network.${1}6
					set network.${1}6='interface'
					set network.${1}6.device='$device'
					set network.${1}6.proto='dhcpv6'
				EOF
			}
		;;
```

