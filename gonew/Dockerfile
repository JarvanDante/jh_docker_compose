FROM golang:1.20.2 AS builder

WORKDIR /build

# 这里他的 main.go 没有直接在项目主目录，不同于其他 golang 开源项目。
RUN git clone --depth 1 --branch v1.20.2 https://github.com/go-delve/delve.git && \
    cd /build/delve/cmd/dlv && \
    go build -o /build/delve/bin/dlv

FROM golang:1.20.2
COPY --from=builder /build/delve/bin/dlv /usr/local/bin/dlv
RUN go env -w GO111MODULE=on
RUN go env -w CGO_ENABLED=0
RUN go env -w GOOS=linux
RUN go env -w GOARCH=amd64
RUN go env -w GOPROXY=https://goproxy.cn,direct
# COPY go.mod .
# COPY go.sum .
# RUN go mod tidy
RUN echo "deb http://mirrors.aliyun.com/debian/ bullseye main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian-security/ bullseye-security main \n \
    deb-src http://mirrors.aliyun.com/debian-security/ bullseye-security main \n \
    deb http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git zlib1g-dev
RUN chmod -R 777 /usr/local/go/
WORKDIR  /var/www/html

