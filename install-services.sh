#!/bin/bash

# XiaoZhi ESP32 Server 系统服务安装脚本
# 此脚本将安装并启用开机自启动服务

echo "=========================================="
echo "XiaoZhi ESP32 Server 系统服务安装程序"
echo "=========================================="

# 检查是否以root权限运行
if [ "$EUID" -ne 0 ]; then
    echo "错误: 请以root权限运行此脚本"
    echo "使用: sudo bash install-services.sh"
    exit 1
fi

# 创建日志目录
mkdir -p /var/log/xiaozhi

# 复制服务文件到systemd目录
echo "正在安装系统服务..."

# 复制服务文件
cp ./systemd-services/xiaozhi-manager-api.service /etc/systemd/system/
cp ./systemd-services/xiaozhi-manager-web.service /etc/systemd/system/
cp ./systemd-services/xiaozhi-server.service /etc/systemd/system/

# 重新加载systemd配置
echo "重新加载systemd配置..."
systemctl daemon-reload

# 启用服务（开机自启动）
echo "启用开机自启动..."
systemctl enable xiaozhi-manager-api.service
systemctl enable xiaozhi-manager-web.service
systemctl enable xiaozhi-server.service

echo "=========================================="
echo "服务安装完成！"
echo "=========================================="
echo ""
echo "可用命令："
echo "启动所有服务:"
echo "  sudo systemctl start xiaozhi-manager-api"
echo "  sudo systemctl start xiaozhi-manager-web"
echo "  sudo systemctl start xiaozhi-server"
echo ""
echo "查看服务状态:"
echo "  sudo systemctl status xiaozhi-manager-api"
echo "  sudo systemctl status xiaozhi-manager-web"
echo "  sudo systemctl status xiaozhi-server"
echo ""
echo "查看服务日志:"
echo "  sudo journalctl -u xiaozhi-manager-api -f"
echo "  sudo journalctl -u xiaozhi-manager-web -f"
echo "  sudo journalctl -u xiaozhi-server -f"
echo ""
echo "停止服务:"
echo "  sudo systemctl stop xiaozhi-manager-api"
echo "  sudo systemctl stop xiaozhi-manager-web"
echo "  sudo systemctl stop xiaozhi-server"
echo ""
echo "禁用开机自启动:"
echo "  sudo systemctl disable xiaozhi-manager-api"
echo "  sudo systemctl disable xiaozhi-manager-web"
echo "  sudo systemctl disable xiaozhi-server"
echo ""
echo "现在你可以重启服务器来测试开机自启动功能。"
