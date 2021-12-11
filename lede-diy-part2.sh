#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: lede-diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP
sed -i 's/192.168.1.1/192.168.50.2/g' package/base-files/files/bin/config_generate

# 修改默认密码
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$EVQNUXgW$MBP1fj3byNZHdT63eYpig\//g' package/lean/default-settings/files/zzz-default-settings

