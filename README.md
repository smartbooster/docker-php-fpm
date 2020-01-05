# SMARTBOOSTER - DOCKER-PHP-FPM

PHP-FPM is made for production.

*builder* folder contains sources code for development and CI.
Builder image extends production image and needs to be rebuild every time it's modified.

https://hub.docker.com/r/smartbooster/php-fpm

## Convention

Right now our stack use the lastest stable PHP so we're not using any version namming only the *latest* tag.
If version needs to be used someday, this repository will be reorganized into folders.

## Basic command

    make login
    make build
    make push
    make pull

## Contributing

Pull requests are welcome.

Thanks to [everyone who has contributed](https://github.com/smartbooster/docker-php-fpm/contributors) already.
