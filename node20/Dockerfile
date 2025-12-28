FROM node:22-alpine
RUN node -v
RUN npm -v
RUN npm install -g pnpm
#设置pnpm统一管理包目录，不能使用宿主机的挂载目录，权限修改控制不了
RUN pnpm config set store-dir /app/.pnpm-store
RUN mkdir -p /app/.pnpm-store
RUN chmod -R 777 /app/.pnpm-store
CMD ["top"]
