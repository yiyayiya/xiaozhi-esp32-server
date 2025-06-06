#!/bin/bash

# 快速状态检查脚本

echo "========================================"
echo "   XiaoZhi ESP32 Server 快速状态检查"
echo "========================================"
echo

# 检查系统服务状态
echo "🔍 系统服务状态："
echo "----------------------------------------"

api_status=$(systemctl is-active xiaozhi-manager-api 2>/dev/null)
server_status=$(systemctl is-active xiaozhi-server 2>/dev/null)
web_status=$(systemctl is-active xiaozhi-manager-web 2>/dev/null)

if [ "$api_status" = "active" ]; then
    echo "✅ Manager API:   运行中"
else
    echo "❌ Manager API:   已停止"
fi

if [ "$server_status" = "active" ]; then
    echo "✅ XiaoZhi Server: 运行中"
else
    echo "❌ XiaoZhi Server: 已停止"
fi

if [ "$web_status" = "active" ]; then
    echo "✅ Manager Web:   运行中"
else
    echo "❌ Manager Web:   已停止"
fi

echo
echo "🌐 服务地址："
echo "----------------------------------------"
echo "管理后台: http://localhost:8080"
echo "API文档:  http://localhost:8080/doc.html"
echo "WebSocket: ws://localhost:8000/xiaozhi/v1/"
echo "OTA更新:  http://localhost:8002/xiaozhi/ota/"

echo
echo "📊 快速命令："
echo "----------------------------------------"
echo "查看详细状态: ./service-manager.sh status"
echo "查看API日志:  ./service-manager.sh logs api"
echo "查看服务日志: ./service-manager.sh logs server"
echo "查看Web日志:  ./service-manager.sh logs web"
echo "重启所有服务: ./service-manager.sh restart"

echo
echo "========================================"
