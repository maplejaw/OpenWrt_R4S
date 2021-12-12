## 在线编译旁路由版！！！
>编译教程参考：https://github.com/P3TERX/Actions-OpenWrt

本固件基于immortalwrt-21.02和Lede编译，**仅自用！！！**

如有想借鉴编译的，请fork后自定义diy-part2.sh中的side_ip和main_ip，并且注释掉修改密码的那行。默认开启IPV6和DHCP，如果旁路由不需要的话，可登录后台手动关闭！

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
