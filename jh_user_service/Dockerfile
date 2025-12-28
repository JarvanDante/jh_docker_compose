FROM golang:1.25.3

# 禁用 CGO，编译出纯 Go 二进制，跨平台兼容性更好
RUN go env -w CGO_ENABLED=0

# # 编译目标操作系统为 Linux
# RUN go env -w GOOS=linux

# # 编译目标架构为 amd64
# RUN go env -w GOARCH=amd64

# 设置 Go 代理为国内镜像
RUN go env -w GOPROXY=https://goproxy.cn,direct

# 在临时目录安装 Delve
RUN mkdir -p /tmp/dlv && cd /tmp/dlv && go mod init dlv && go install github.com/go-delve/delve/cmd/dlv@latest && rm -rf /tmp/dlv

WORKDIR /var/www/html/jh/jh_user_service

COPY ./jh_user_service ./

# 保持容器运行，等待手动执行调试命令
# CMD ["tail", "-f", "/dev/null"]
CMD ["./jh_user_service"]

