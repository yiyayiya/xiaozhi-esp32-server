#!/bin/bash

# XiaoZhi ESP32 Server 服务管理脚本

case "$1" in
    start)
        echo "启动所有XiaoZhi服务..."
        sudo systemctl start xiaozhi-manager-api
        sudo systemctl start xiaozhi-server
        sudo systemctl start xiaozhi-manager-web
        echo "所有服务已启动"
        ;;
    stop)
        echo "停止所有XiaoZhi服务..."
        sudo systemctl stop xiaozhi-manager-web
        sudo systemctl stop xiaozhi-server
        sudo systemctl stop xiaozhi-manager-api
        echo "所有服务已停止"
        ;;
    restart)
        echo "重启所有XiaoZhi服务..."
        sudo systemctl stop xiaozhi-manager-web
        sudo systemctl stop xiaozhi-server
        sudo systemctl stop xiaozhi-manager-api
        sleep 2
        sudo systemctl start xiaozhi-manager-api
        sudo systemctl start xiaozhi-server
        sudo systemctl start xiaozhi-manager-web
        echo "所有服务已重启"
        ;;
    status)
        echo "========== XiaoZhi服务状态 =========="
        echo ""
        echo "Manager API状态:"
        sudo systemctl status xiaozhi-manager-api --no-pager -l
        echo ""
        echo "XiaoZhi Server状态:"
        sudo systemctl status xiaozhi-server --no-pager -l
        echo ""
        echo "Manager Web状态:"
        sudo systemctl status xiaozhi-manager-web --no-pager -l
        ;;
    logs)
        case "$2" in
            api)
                sudo journalctl -u xiaozhi-manager-api -f
                ;;
            web)
                sudo journalctl -u xiaozhi-manager-web -f
                ;;
            server)
                sudo journalctl -u xiaozhi-server -f
                ;;
            *)
                echo "查看日志用法: $0 logs [api|web|server]"
                echo "或者使用以下命令查看特定服务日志:"
                echo "  sudo journalctl -u xiaozhi-manager-api -f"
                echo "  sudo journalctl -u xiaozhi-manager-web -f"
                echo "  sudo journalctl -u xiaozhi-server -f"
                ;;
        esac
        ;;
    *)
        echo "XiaoZhi ESP32 Server 服务管理脚本"
        echo ""
        echo "用法: $0 {start|stop|restart|status|logs}"
        echo ""
        echo "命令说明:"
        echo "  start   - 启动所有服务"
        echo "  stop    - 停止所有服务"
        echo "  restart - 重启所有服务"
        echo "  status  - 查看所有服务状态"
        echo "  logs    - 查看服务日志 (需要指定服务: api|web|server)"
        echo ""
        echo "示例:"
        echo "  $0 start        # 启动所有服务"
        echo "  $0 status       # 查看服务状态"
        echo "  $0 logs api     # 查看API服务日志"
        exit 1
        ;;
esac
