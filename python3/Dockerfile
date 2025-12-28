FROM ubuntu:20.04

RUN apt-get update
RUN set -ex \
    && apt-get install vim -y -qq \
    && apt-get install wget -y -qq \
    && apt-get update -qq \
    && apt-get install gcc automake autoconf libtool make -y -qq \
#    && apt-get install  openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel  -y  -qq \
    && apt-get install -y git \
    && apt-get install zlib* -y


RUN apt-get update

# 安装Python
RUN wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz
RUN tar -zxvf  Python-3.9.7.tgz
RUN mv Python-3.9.7 /usr/local/
RUN cd /usr/local/Python-3.9.7;  ./configure prefix=/usr/local/python3; make && make install
RUN ln -s -f /usr/local/python3/bin/python3 /usr/bin/python

ENV PYTHON_VERSION 3.9.7
RUN apt-get update \
    && apt-get install -y python3-pip

# 添加需要的第三方库
RUN pip install Django \
    && pip install requests


EXPOSE 16000