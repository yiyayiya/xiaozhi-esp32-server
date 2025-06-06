# XiaoZhi ESP32 Server 生产环境部署指南

## 🚀 概述

本指南帮助你在阿里云服务器上部署小智ESP32服务器，实现开机自启动和后台运行。

## 📋 系统要求

- Ubuntu/CentOS Linux 系统
- Java 21
- Maven 3.6+
- Node.js 16+
- NPM 8+
- Python 3.9+
- Conda/Miniconda
- Docker
- Redis 容器

## 🛠️ 一键部署

### 1. 环境检查
```bash
cd /root/workspaces/xiaozhi-esp32-server
./check-environment.sh
```

### 2. 安装系统服务（一次性操作）
```bash
sudo ./install-services.sh
```

### 3. 启动服务
```bash
./service-manager.sh start
```

### 4. 检查状态
```bash
./quick-status.sh
```

## 📊 服务管理

### 基本命令
```bash
# 启动所有服务
./service-manager.sh start

# 停止所有服务
./service-manager.sh stop

# 重启所有服务
./service-manager.sh restart

# 查看服务状态
./service-manager.sh status

# 快速状态检查
./quick-status.sh
```

### 日志查看
```bash
# 查看API服务日志
./service-manager.sh logs api

# 查看Python服务日志
./service-manager.sh logs server

# 查看Web服务日志
./service-manager.sh logs web
```

### 手动服务管理
```bash
# 启动单个服务
sudo systemctl start xiaozhi-manager-api
sudo systemctl start xiaozhi-server
sudo systemctl start xiaozhi-manager-web

# 停止单个服务
sudo systemctl stop xiaozhi-manager-api
sudo systemctl stop xiaozhi-server
sudo systemctl stop xiaozhi-manager-web

# 查看服务状态
sudo systemctl status xiaozhi-manager-api
sudo systemctl status xiaozhi-server
sudo systemctl status xiaozhi-manager-web

# 查看服务日志
sudo journalctl -u xiaozhi-manager-api -f
sudo journalctl -u xiaozhi-server -f
sudo journalctl -u xiaozhi-manager-web -f
```

## 🌐 服务地址

### 本地地址
- 管理后台: http://localhost:8080
- API文档: http://localhost:8080/doc.html
- WebSocket: ws://172.16.32.214:8000/xiaozhi/v1/
- OTA更新: http://172.16.32.214:8002/xiaozhi/ota/

### 公网地址
- WebSocket: ws://120.24.78.231:8000/xiaozhi/v1/
- OTA更新: http://120.24.78.231:8002/xiaozhi/ota/

## 🔧 服务配置

### 服务启动顺序
1. **xiaozhi-manager-api** - Spring Boot后端API（依赖Redis）
2. **xiaozhi-server** - Python WebSocket服务器
3. **xiaozhi-manager-web** - Vue.js前端应用

### 自动重启
所有服务都配置了自动重启机制：
- 如果服务异常退出，systemd会在10秒后自动重启
- 系统重启后，所有服务会自动启动

## 🗂️ 文件结构

```
/root/workspaces/xiaozhi-esp32-server/
├── install-services.sh        # 服务安装脚本
├── service-manager.sh         # 服务管理脚本
├── quick-status.sh           # 快速状态检查
├── check-environment.sh      # 环境检查脚本
├── systemd-services/         # systemd服务配置文件
│   ├── xiaozhi-manager-api.service
│   ├── xiaozhi-server.service
│   └── xiaozhi-manager-web.service
└── main/                     # 项目源码
    ├── manager-api/          # Spring Boot API
    ├── manager-web/          # Vue.js Web应用
    └── xiaozhi-server/       # Python服务器
```

## 🔍 故障排除

### 常见问题

1. **服务启动失败**
   ```bash
   # 查看服务状态
   sudo systemctl status xiaozhi-manager-api
   
   # 查看详细日志
   sudo journalctl -u xiaozhi-manager-api -n 50
   ```

2. **Redis连接失败**
   ```bash
   # 检查Redis容器状态
   docker ps | grep redis
   
   # 启动Redis容器
   docker start xiaozhi-esp32-server-redis
   ```

3. **端口占用**
   ```bash
   # 检查端口占用
   sudo netstat -tulpn | grep :8080
   sudo netstat -tulpn | grep :8000
   ```

4. **权限问题**
   ```bash
   # 确保脚本有执行权限
   chmod +x *.sh
   ```

### 日志位置
- systemd日志: `sudo journalctl -u <service-name>`
- 应用日志: `/var/log/xiaozhi/`

## 🚀 生产环境建议

1. **备份配置**：定期备份配置文件和数据库
2. **监控服务**：设置服务监控和告警
3. **安全设置**：配置防火墙和SSL证书
4. **性能优化**：根据负载调整JVM参数和Conda环境

## 📞 支持

如果遇到问题，请检查：
1. 运行环境检查脚本：`./check-environment.sh`
2. 查看服务状态：`./quick-status.sh`
3. 查看详细日志：`./service-manager.sh logs <service>`

---
✅ **部署完成！** 现在你的小智ESP32服务器已经配置为开机自启动，即使终端关闭或系统重启，服务也会持续运行。
