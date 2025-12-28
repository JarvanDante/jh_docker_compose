#!/bin/sh
set -e

# 启动 PHP-FPM（后台）
php-fpm -D

# 清除缓存
php /var/www/html/md_ol/md-service/artisan config:clear
php /var/www/html/md_ol/md-service/artisan cache:clear
php /var/www/html/md_ol/md-service/artisan route:clear
php /var/www/html/md_ol/md-service/artisan view:clear
# /var/www/html/md_ol/md-service/composer dump-autoload

# 启动 Swoole（后台）
# echo "Starting Laravel Swoole HTTP server..."
# nohup php /var/www/html/md_ol/md-service/artisan swoole:http start > /var/log/swoole.log 2>&1 &

# 检查 Swoole 是否启动成功（最多等待 15 秒）
# for i in $(seq 1 15); do
#     if netstat -tuln | grep -q ":1215"; then
#         echo "✅ Swoole started successfully on port 1215"
#         break
#     fi
#     echo "⏳ Waiting for Swoole to start ($i/15)..."
#     sleep 1
# done


# 前台保持容器运行
tail -f /var/log/swoole.log
