user_kernel_pre_configure() {
    # 检查是否已经存在，避免重复执行
    if [ -d "drivers/net/amneziawg" ]; then
        display_alert "AmneziaWG" "Already patched into kernel tree, skipping..." "info"
        return
    fi

    display_alert "AmneziaWG" "Injecting source code into kernel tree..." "warn"

    # 1. 下载源码到 drivers/net/amneziawg
    # 注意：我们克隆的是 kernel module 仓库
    git clone https://github.com/amnezia-vpn/amneziawg-linux-kernel-module.git drivers/net/amneziawg

    # 2. 修改 drivers/net/Makefile
    # 告诉内核编译系统，如果有 CONFIG_AMNEZIAWG，就去编译 amneziawg 目录
    echo 'obj-$(CONFIG_AMNEZIAWG) += amneziawg/' >> drivers/net/Makefile

    # 3. 修改 drivers/net/Kconfig
    # 将 AmneziaWG 的配置菜单加入到 "Network device support" 下
    # 我们使用 sed 在 "endmenu" 之前插入 source 语句
    sed -i '/endmenu/i source "drivers/net/amneziawg/Kconfig"' drivers/net/Kconfig

    display_alert "AmneziaWG" "Injection complete. Check Network device support in menuconfig." "info"
}
