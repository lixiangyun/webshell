FROM ubuntu:xenial
MAINTAINER lixiangyun "linimbus@126.com"

RUN apt-get update 
RUN apt-get -q install -y curl python wget

# install pip tools
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py

# install tornado & pillow
RUN pip install 'tornado==2.4.1'
RUN pip install Pillow

# install gateone
WORKDIR /opt
RUN wget https://github.com/downloads/liftoff/GateOne/gateone-1.1.tar.gz
RUN tar -zxvf gateone-1.1.tar.gz

WORKDIR /opt/GateOne
RUN python setup.py install

CMD ./gateone.py
