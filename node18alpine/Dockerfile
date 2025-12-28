FROM node:18-alpine

WORKDIR  /app
RUN corepack enable
RUN corepack prepare pnpm@8.6.10 --activate

RUN npm config set registry https://registry.npmmirror.com
#设置pnpm统一管理包目录，不能使用宿主机的挂载目录，权限修改控制不了
RUN pnpm config set store-dir /app/.pnpm-store
RUN mkdir /app/.pnpm-store
RUN chmod -R 777 /app/.pnpm-store
