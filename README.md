# webshell

基于web-ui的网络ssh终端，当前提供两种安装部署方式，基于ubuntu和docker容器；

## 1. ubuntu安装过程

### i.安装pip
```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
```

### ii.安装tornado、Pillow
```
pip install 'tornado==2.4.1'
pip install Pillow
```

### iii.下载GateOne且安装
```
wget https://github.com/downloads/liftoff/GateOne/gateone-1.1.tar.gz
tar -zxvf gateone-1.1.tar.gz
```
```
cd GateOne
python setup.py install
```

### iv.修改GateOne配置远程管理
```
vi /opt/gateone/server.conf
```
```
dtach = False
origins = "http://localhost;https://localhost;http://127.0.0.1;https://127.0.0.1;https://47.94.11.195:4200"
session_timeout = "20m"
```

### v.运行GateOne
```
cd /opt/gateone
nohup ./gateone.py &
```

### vi.访问测试
```
https://192.168.0.111:443
```

## 2. 基于docker容器

### i.本地docker构建镜像&启动
```
docker build -t webshell .
docker run -d --net=host --restart=always -e IP_ORIGINS=192.168.0.111 webshell
```

### ii.默认dockerhub下载镜像&启动
```
docker run -d --net=host --restart=always -e IP_ORIGINS=192.168.0.111 linimbus/webshell
```

使用浏览器打开
```
https://192.168.0.111:443
```

### iii. 绑定域名方式

```
docker run -d --net=host --restart=always -e IP_ORIGINS=you.domain.com linimbus/webshell
```

使用浏览器打开
```
https://you.domain.com:443
```
