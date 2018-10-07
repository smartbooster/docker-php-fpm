FROM php:7.2-fpm

RUN apt-get update \
    && apt-get install \
    libicu-dev \
    -y --no-install-recommends

ADD ./etc/php/php.ini /usr/local/etc/php/php.ini

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install intl

# Cleaning
RUN apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -Rf /tmp/*

WORKDIR /var/www

# Fix droit d'écriture de nginx sur les sources
RUN chown www-data:www-data -R /var/www

EXPOSE 9000
CMD ["php-fpm"]
