# webshell

## 安装pip
```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
```

## 安装tornado、Pillow
```
pip install 'tornado==2.4.1'
pip install Pillow
```

## 下载GateOne且安装
```
wget https://github.com/downloads/liftoff/GateOne/gateone-1.1.tar.gz
tar -zxvf gateone-1.1.tar.gz
```
```
cd GateOne
python setup.py install
```

## 修改GateOne配置远程管理
```
vi /opt/gateone/server.conf
```
```
dtach = False
origins = "http://localhost;https://localhost;http://127.0.0.1;https://127.0.0.1;https://47.94.11.195:4200"
session_timeout = "20m"
```

## 运行GateOne
```
cd /opt/gateone
nohup ./gateone.py &
```

## 访问
```
https://192.168.0.21:443
```

## 自制镜像
```
docker build -t webshell .
docker run -d -p 443:443 webshell
```

## 默认镜像启动
```
docker run -d -p 443:443 --restart=always linimbus/webshell
```
