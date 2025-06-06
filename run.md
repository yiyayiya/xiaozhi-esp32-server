

1. 启动 manager-api 
    cd ~/workspaces/xiaozhi-esp32-server/main/manager-api 
    docker start xiaozhi-esp32-server-redis
    mvn spring-boot:run

2. 启动manager-web 
    cd ~/workspaces/xiaozhi-esp32-server/main/manager-web
    npm run serve 
    

3. 启动xiaozhi-server
     cd ~/workspaces/xiaozhi-esp32-server/main/xiaozhi-server
     conda activate xiaozhi-esp32-server
     python app.py

## 系统服务方式运行（推荐用于生产环境）

### 安装系统服务（一次性操作）
```bash
cd ~/workspaces/xiaozhi-esp32-server
sudo bash install-services.sh
```

### 服务管理命令
```bash
# 启动所有服务
./service-manager.sh start

# 停止所有服务
./service-manager.sh stop

# 重启所有服务
./service-manager.sh restart

# 查看服务状态
./service-manager.sh status

# 查看服务日志
./service-manager.sh logs api     # 查看API服务日志
./service-manager.sh logs web     # 查看Web服务日志
./service-manager.sh logs server  # 查看Server服务日志
```

### 手动服务管理
```bash
# 启动服务
sudo systemctl start xiaozhi-manager-api
sudo systemctl start xiaozhi-server
sudo systemctl start xiaozhi-manager-web

# 查看服务状态
sudo systemctl status xiaozhi-manager-api
sudo systemctl status xiaozhi-server
sudo systemctl status xiaozhi-manager-web

# 查看服务日志
sudo journalctl -u xiaozhi-manager-api -f
sudo journalctl -u xiaozhi-server -f
sudo journalctl -u xiaozhi-manager-web -f
```

本地websocket 和 ota 地址
ws://172.16.32.214:8000/xiaozhi/v1/
http://172.16.32.214:8002/xiaozhi/ota/

公网websocket 和 ota 地址
ws://120.24.78.231:8000/xiaozhi/v1/
http://120.24.78.231:8002/xiaozhi/ota/
