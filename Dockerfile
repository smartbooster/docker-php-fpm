FROM php:7.4-fpm

RUN apt-get update \
    && apt-get install \
    libicu-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libsodium-dev \
    libpq-dev \
    -y --no-install-recommends

ADD ./etc/php/php.ini /usr/local/etc/php/php.ini

RUN apt-get install libicu-dev -yqq

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql \
    && docker-php-ext-enable pdo_pgsql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install intl \
    && docker-php-ext-install sodium

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Install Imagemagick & PHP Imagick ext
RUN apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Cleaning
RUN apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -Rf /tmp/*

WORKDIR /var/www

# Fix droit d'écriture de nginx sur les sources
RUN chown www-data:www-data -R /var/www

EXPOSE 9000
CMD ["php-fpm"]
