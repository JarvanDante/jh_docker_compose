FROM php:7.4-fpm
LABEL maintainer="kugou_stock_points api Maintainers <jarvenwang@kugou.net>"
RUN echo "deb http://mirrors.aliyun.com/debian/ bullseye main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian-security/ bullseye-security main \n \
    deb-src http://mirrors.aliyun.com/debian-security/ bullseye-security main \n \
    deb http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib \n \
    deb http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib \n \
    deb-src http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libzip-dev
RUN apt-get -y install gcc make autoconf libc-dev pkg-config\
    && apt-get -y install libmcrypt-dev
RUN apt-get install -y git
RUN docker-php-ext-install mysqli\
    && docker-php-ext-install sockets\
    && docker-php-ext-install pdo_mysql\
    && docker-php-ext-install zip\
    && pecl install swoole-4.4.17\
    && docker-php-ext-enable swoole\
    && pecl install redis-5.2.1\
    && docker-php-ext-enable redis\
    && pecl install mcrypt\
    && docker-php-ext-enable mcrypt
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"\
    && php composer-setup.php\
    && mv composer.phar /usr/local/bin/composer\
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/