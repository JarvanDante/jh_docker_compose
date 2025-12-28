# 使用 Go 1.25 官方镜像
FROM golang:1.25

RUN go env -w GO111MODULE=on

# 配置模块代理
RUN go env -w GOPROXY=https://goproxy.cn,direct