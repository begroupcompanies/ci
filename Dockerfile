FROM php:7.4

RUN apt-get update

RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libzip-dev

RUN apt-get clean

RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt
RUN docker-php-ext-install pdo_mysql zip

RUN curl --silent --show-error "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require "laravel/envoy=~2.7"
