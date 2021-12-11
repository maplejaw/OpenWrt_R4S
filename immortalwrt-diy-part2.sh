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

# =======旁路由设置 END=========


# 修改默认密码
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$EVQNUXgW$MBP1fj3byNZHdT63eYpig\//g' package/emortal/default-settings/files/99-default-settings
