#!/bin/bash
set -e
echo "更新软件源"
sudo apt update && sudo apt upgrade -y
echo "安装编译、QEMU、性能工具"
sudo apt install -y make cmake gcc g++ qemu-system-arm qemu-utils fio tcpdump openssl git vim
echo "安装ARM交叉编译器"
sudo apt install -y gcc-arm-none-eabi
echo "安装Python3自动化依赖"
sudo apt install -y python3 python3-pip
pip3 install pyserial paramiko
echo "====环境校验===="
arm-none-eabi-gcc --version
qemu-system-arm --version
python3 -c "import serial,paramiko;print('Python库加载正常')"
echo "全部依赖安装完成"
