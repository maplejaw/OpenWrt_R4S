#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: immortalwrt-diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# =======旁路由设置 START=========

side_ip="192.168.50.2"  #旁路由IP
main_ip="192.168.50.1"  #主路由IP

# 修改默认IP
sed -i 's/192.168.1.1/'$side_ip'/g' package/base-files/files/bin/config_generate

# 修改默认网关和DNS
sed -i "/set network.\$1.netmask='\$netm'/a\\
				set network.\$1.gateway='$main_ip'\\
				set network.\$1.dns='$main_ip'\\
" package/base-files/files/bin/config_generate

# 可选项：1，DHCP忽略此接口；2，禁用IPV6。
#sed -i "/set network.\$1.proto='dhcp'/a\\
#				set dhcp.\$1.ignore='1'\\
#" package/base-files/files/bin/config_generate

# =======旁路由设置 END=========

# =======替换默认包 START======
pushd feeds/luci/applications

rm -rf luci-app-frpc
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-frpc

popd
# =======替换默认包 END======

pushd package/emortal/default-settings/files

# 修改默认语言为简体中文
sed -i 's/luci.main.lang=auto/luci.main.lang=zh_cn/g' 99-default-settings

# 修改默认密码( :0:99999:7::: 后缀不变)
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$NL4C3NBA$zW9T8HR88qfEWdMw7kLQx.:18972/g' 99-default-settings

popd

