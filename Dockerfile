FROM php:7.4

RUN apt-get update
RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev \
    libfreetype6-dev libbz2-dev libzip-dev libicu-dev libxslt-dev
RUN apt-get clean

RUN pecl install mcrypt-1.0.4 xdebug && docker-php-ext-enable mcrypt xdebug
RUN docker-php-ext-install pdo_mysql zip gd intl xsl

RUN curl --silent --show-error "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require "laravel/envoy:2.7" && \
    composer global require "squizlabs/php_codesniffer:3.6.1" && \
    composer global require "nunomaduro/larastan:1.0.1" --with-dependencies && \
    ln -s $(composer -n config --global home)/vendor/bin/phpcs /usr/bin/phpcs && \
    ln -s $(composer -n config --global home)/vendor/bin/phpstan /usr/bin/phpstan


RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs
RUN npx install-peerdeps -g eslint-config-airbnb-base@14.2.1
RUN npm install -g eslint-plugin-vue@7.20.0 eslint-formatter-gitlab
