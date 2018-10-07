FROM smartbooster/docker-php-fpm

COPY .bashrc /root/.bashrc

RUN apt-get update \
    && apt-get install \
    vim \
    git \
    zip \
    unzip\
    -y --no-install-recommends

# Install de Composer
## Composer needs : git - zip - unzip
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"

# Install Node et Yarn
RUN apt-get install -y \
    build-essential \
    apt-utils \
    gnupg \
    sudo

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update &&  apt-get install yarn
# sudo apt-get -o Dpkg::Options::="--force-overwrite" install yarn

# Zip - for simple-phpunit
# RUN apt-get install zlib1g-dev -y
# RUN docker-php-ext-install zip

# Cleaning
RUN apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -Rf /tmp/*
