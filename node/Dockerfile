FROM node:20-alpine

#node -v
#v20.19.6
#npm -v
#10.8.2
#pnpm -v
#10.24.0

# 使用 corepack 启用 pnpm（Node.js 16.13+ 自带）
RUN corepack enable
RUN corepack prepare pnpm@10.24.0 --activate

RUN pnpm config set use-hard-links false
RUN pnpm config set store-dir /tmp/pnpm-store
RUN pnpm config set verify-store-integrity false

# 设置 store 到临时目录
# ENV PNPM_HOME=/tmp/pnpm
# ENV PNPM_STORE_PATH=/tmp/pnpm-store

WORKDIR  /var/www/html
