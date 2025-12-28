FROM golang:1.24
RUN go env -w GO111MODULE=on
RUN go env -w CGO_ENABLED=0
RUN go env -w GOOS=linux
RUN go env -w GOARCH=amd64
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN echo "deb http://mirrors.aliyun.com/debian/ bullseye main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian-security/ bullseye-security main \n \
    deb-src http://mirrors.aliyun.com/debian-security/ bullseye-security main \n \
    deb http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git openssh-server
# RUN echo "export PATH=$GOPATH/bin:$PATH " >> /etc/profile
# RUN source /etc/profile
# RUN chmod -R 777 /usr/local/go/ /go
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN cp /go/bin/linux_amd64/dlv /go/bin/dlv
# RUN cd /usr/local/go/src/
# RUN git clone https://github.com/go-delve/delve.git && \
#     cd delve/cmd/dlv/ && \
#     go build && \
#     go install
WORKDIR  /var/www/html
# 创建运行服务所需要的目录
RUN mkdir -p /var/run/shhd /run/sshd /root/.ssh
RUN chmod 755 /run/sshd
RUN sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd
# 将宿主机产生的authorized.keys文件复制镜像的/root/.ssh/目录下
COPY authorized_keys /root/.ssh/authorized_keys
# 将run.sh脚本文件复制到根目录下,并配置执行权限
COPY run.sh /run.sh
RUN chmod 755 /run.sh
EXPOSE 22
# 设置启动sshd服务命令
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
# CMD ["/run.sh"]

