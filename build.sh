#!/bin/bash

function replace_userpatches_dir() {
    # 1. 定义源和目标
    SRC="userpatches"
    DEST_PARENT="build"
    DEST="build/userpatches"
    
    # 2. 如果目标目录已存在，强制删除
    if [ -d "$DEST" ]; then
        echo "发现旧目录 $DEST，正在删除..."
        rm -rf "$DEST"
    fi
    
    # 3. 确保 build 父目录存在 (防止 cp 报错)
    mkdir -p "$DEST_PARENT"
    
    # 4. 执行复制
    # 使用 -a 保留权限 (Archive mode)，这对脚本文件很重要
    # 只有当源目录存在时才复制
    if [ -d "$SRC" ]; then
        echo "正在复制 $SRC 到 $DEST_PARENT ..."
        cp -a "$SRC" "$DEST_PARENT/"
        echo "完成。"
    else
        echo "错误：源目录 $SRC 不存在！"
        exit 1
    fi
}

sudo apt install git lsof curl wget jq yq -y

if [ -d "build" ]; then
    echo "Directory 'build' exists. Updating..."
    replace_userpatches_dir
    cd build
    git pull
else
    echo "Directory 'build' not found. Cloning..."
    git clone https://github.com/armbian/build
    replace_userpatches_dir
    cd build
fi

./compile.sh build BOARD=nanopi-r5s BRANCH=current BUILD_DESKTOP=no BUILD_MINIMAL=no KERNEL_CONFIGURE=no RELEASE=trixie
./compile.sh build BOARD=nanopi-r5s BRANCH=current BUILD_DESKTOP=no BUILD_MINIMAL=yes KERNEL_CONFIGURE=no RELEASE=trixie

./compile.sh build BOARD=hinlink-h66k BRANCH=current BUILD_DESKTOP=no BUILD_MINIMAL=no KERNEL_CONFIGURE=no RELEASE=trixie
./compile.sh build BOARD=hinlink-h66k BRANCH=current BUILD_DESKTOP=no BUILD_MINIMAL=yes KERNEL_CONFIGURE=no RELEASE=trixie

ls -la output/images
