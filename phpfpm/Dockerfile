FROM php:7.4-fpm

# 设置阿里云源（移除 backports）
RUN echo "deb http://mirrors.aliyun.com/debian/ bullseye main non-free contrib\n\
    deb-src http://mirrors.aliyun.com/debian/ bullseye main non-free contrib\n\
    deb http://mirrors.aliyun.com/debian-security/ bullseye-security main\n\
    deb-src http://mirrors.aliyun.com/debian-security/ bullseye-security main\n\
    deb http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib\n\
    deb-src http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib" > /etc/apt/sources.list

COPY ./php.ini /usr/local/etc/php/php.ini

# 安装系统依赖和 PHP 扩展依赖
RUN apt-get update && apt-get install -y \
    vim \
    zlib1g-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libfreetype6-dev \
    cron \
    gcc \
    make \
    autoconf \
    libc-dev \
    pkg-config \
    libmcrypt-dev \
    && docker-php-ext-install bcmath \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install bcmath gd mysqli sockets pdo_mysql zip pcntl \
    && pecl install swoole-4.4.17 && docker-php-ext-enable swoole \
    && pecl install redis-5.2.1 && docker-php-ext-enable redis \
    && pecl install mcrypt && docker-php-ext-enable mcrypt \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 安装 Composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

WORKDIR /var/www/html/md_ol/md-service

# 复制启动脚本
# COPY docker-start.sh /usr/local/bin/docker-start.sh
# RUN chmod +x /usr/local/bin/docker-start.sh

# CMD ["sh", "/usr/local/bin/docker-start.sh"]


