FROM --platform=linux/amd64 squishyu/bun-alpine

WORKDIR  /app
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

RUN npm config set registry https://registry.npmmirror.com
#设置pnpm统一管理包目录，不能使用宿主机的挂载目录，权限修改控制不了
RUN pnpm config set store-dir /app/.pnpm-store
RUN mkdir /app/.pnpm-store
RUN chmod -R 777 /app/.pnpm-store
# RUN apk add autoconf libpng-dev make libtool automake nasm
# RUN apk add g++ autoconf libpng-dev make libtool automake nasm
# RUN apk add libtool automake autoconf nasm?
# RUN apk add --no-cache g++ autoconf

