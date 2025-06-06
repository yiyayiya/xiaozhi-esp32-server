

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



本地websocket 和 ota 地址
ws://172.16.32.214:8000/xiaozhi/v1/
http://172.16.32.214:8002/xiaozhi/ota/

公网websocket 和 ota 地址
ws://120.24.78.231:8000/xiaozhi/v1/
http://120.24.78.231:8002/xiaozhi/ota/
