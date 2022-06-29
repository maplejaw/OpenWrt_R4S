## 在线编译旁路由版！！！
>编译教程参考：https://github.com/P3TERX/Actions-OpenWrt

本固件基于immortalwrt-21.02编译，**仅自用！！！**

如有想借鉴编译的，请fork后自定义scripts/diy-part2.sh中的side_ip和main_ip，并且注释掉修改密码的那行。默认开启IPV6和DHCP，如果旁路由不需要的话，可登录后台手动关闭！

**关闭DHCP**：
1. 网络->接口->编辑->DHCP服务器->常规设置：勾选忽略此接口。

**关闭IPV6**：
1. 网络->接口->编辑->DHCP服务器->IPv6设置：禁用RA服务、禁用DHCPv6服务、禁用NDP代理。
2. 网络->接口->编辑->高级设置：取消勾选委托IPv6前缀。

**默认插件**：可自行修改config插件定制增删
* luci-app-frpc
* luci-app-openclash
* luci-app-passwall

**旁路由使用方法**：
* 侵入式：旁路由开启DHCP，主路由默认网关和DNS改成旁路由IP。
* 非侵入式：旁路由关闭DHCP，设备改成静态IP,网关和DNS设置成旁路由IP.

**config文件生成备忘**：
1. 常用命令
```bash

# 拉取分支
git clone -b openwrt-21.02 --single-branch https://github.com/immortalwrt/immortalwrt
cd immortalwrt

# 更新下载安装订阅源包含的软件包
./scripts/feeds update -a
./scripts/feeds install -a 

# 定制组件
make menuconfig

# 若在调整OpenWrt系统组件的过程有多次保存操作，则建议先删除.config.old文件再继续操作
rm -f .config.old

# 根据编译环境生成默认配置
make defconfig

# 对比默认配置的差异部分生成配置文件（可以理解为增量）
./scripts/diffconfig.sh > seed.config

# 剔除#号开头的行
sed -i '/^#/d' seed.config

```
2. 配置config
```bash
# 选择编译平台
Target System (Rockchip)  --->
Subtarget (RK33xx boards (64 bit))  --->
Target Profile (FriendlyARM NanoPi R4S)  --->

# 自定义固件大小
(64) Kernel partition size (in MB) (NEW)
(1024) Root filesystem partition size (in MB) (NEW)

# 勾选zsh
Utilities --> Shells --> zsh

# 勾选ipv6
Extra packages ---> ipv6helper

# 勾选主题
LuCI ---> Themes ---> luci-theme-argon

# 勾选luci插件
LuCI ---> Applications ---> luci-app-argon-config
LuCI ---> Applications ---> luci-app-frpc
LuCI ---> Applications ---> luci-app-passwall
LuCI ---> Applications ---> luci-app-openclash
