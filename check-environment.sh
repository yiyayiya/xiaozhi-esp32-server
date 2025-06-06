#!/bin/bash

# XiaoZhi ESP32 Server 环境检查脚本

echo "=========================================="
echo "XiaoZhi ESP32 Server 环境检查"
echo "=========================================="

# 检查Java环境
echo "检查Java环境..."
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1)
    echo "✓ Java已安装: $JAVA_VERSION"
else
    echo "✗ Java未安装，请先安装Java 21"
fi

# 检查Maven
echo "检查Maven..."
if command -v mvn &> /dev/null; then
    MVN_VERSION=$(mvn -version 2>&1 | head -n 1)
    echo "✓ Maven已安装: $MVN_VERSION"
else
    echo "✗ Maven未安装，请先安装Maven"
fi

# 检查Node.js
echo "检查Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✓ Node.js已安装: $NODE_VERSION"
else
    echo "✗ Node.js未安装，请先安装Node.js"
fi

# 检查NPM
echo "检查NPM..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo "✓ NPM已安装: $NPM_VERSION"
else
    echo "✗ NPM未安装，请先安装NPM"
fi

# 检查Python/Conda
echo "检查Python/Conda环境..."
if command -v conda &> /dev/null; then
    CONDA_VERSION=$(conda --version)
    echo "✓ Conda已安装: $CONDA_VERSION"
    
    # 检查xiaozhi-esp32-server环境
    if conda env list | grep -q "xiaozhi-esp32-server"; then
        echo "✓ Conda环境 'xiaozhi-esp32-server' 已存在"
    else
        echo "✗ Conda环境 'xiaozhi-esp32-server' 不存在"
        echo "  请创建环境: conda create -n xiaozhi-esp32-server python=3.9"
        echo "  然后激活环境并安装依赖: conda activate xiaozhi-esp32-server && pip install -r requirements.txt"
    fi
else
    echo "✗ Conda未安装，请先安装Miniconda或Anaconda"
fi

# 检查Docker
echo "检查Docker..."
if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version)
    echo "✓ Docker已安装: $DOCKER_VERSION"
    
    # 检查Redis容器
    if docker ps -a | grep -q "xiaozhi-esp32-server-redis"; then
        echo "✓ Redis容器 'xiaozhi-esp32-server-redis' 已存在"
    else
        echo "✗ Redis容器 'xiaozhi-esp32-server-redis' 不存在"
        echo "  请创建Redis容器"
    fi
else
    echo "✗ Docker未安装，请先安装Docker"
fi

echo "=========================================="
echo "环境检查完成"
echo "=========================================="
