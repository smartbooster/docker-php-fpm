login:
	docker login

build:
	docker build -t smartbooster/docker-php-fpm .
	docker build -t smartbooster/docker-php-fpm:builder ./builder

push:
	docker push smartbooster/docker-php-fpm
	docker push smartbooster/docker-php-fpm:builder

pull:
	docker pull smartbooster/docker-php-fpm
	docker pull smartbooster/docker-php-fpm:builder
