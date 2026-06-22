#!/bin/bash
set -e
IMAGE=${1:-"./firmware/build/firmware.bin"}
echo "启动虚拟STM32，镜像路径：$IMAGE"
qemu-system-arm \
-M stm32f407 \
-kernel "$IMAGE" \
-serial pty \
-netdev user,id=net0 \
-device lan9118,netdev=net0 \
-nographic
