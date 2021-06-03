FROM smartbooster/php-fpm:7.4-wordpress

RUN apt-get update \
    && apt-get install \
    vim \
    git \
    zip \
    unzip \
    wget \
    -y --no-install-recommends

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install PHP Xdebug configuration, (see https://blog.eleven-labs.com/fr/debugger-avec-xdebug/)
ADD ./etc/php/xdebug.ini /etc/php/conf.d/

# Install de Composer
## Composer needs : git - zip - unzip
## Composer needs : git - zip - unzip
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer config --global repo.packagist composer https://packagist.org

# Install Node et Yarn
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    sudo

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update &&  apt-get install yarn
# sudo apt-get -o Dpkg::Options::="--force-overwrite" install yarn

# Zip - for simple-phpunit
# RUN apt-get install zlib1g-dev -y
# RUN docker-php-ext-install zip

# https://symfony.com/download
RUN  wget https://get.symfony.com/cli/installer -O - | bash
RUN  mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Cleaning
RUN apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -Rf /tmp/*

RUN useradd --shell /bin/bash -u 1000 -o -c "" -m dev
COPY .bashrc /home/dev/.bashrc
RUN export HOME=/home/dev
RUN adduser dev sudo
