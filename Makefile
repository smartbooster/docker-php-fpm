login:
	docker login

build:
	docker build -t smartbooster/php-fpm:7.3 .
	docker build -t smartbooster/php-fpm:7.3-builder ./builder

push:
	docker push smartbooster/php-fpm:7.3
	docker push smartbooster/php-fpm:7.3-builder

pull:
	docker pull smartbooster/php-fpm
	docker pull smartbooster/php-fpm:builder

ssh:
	docker run --rm -it -v $(PWD)/:/var/www smartbooster/php-fpm:7.3-builder bash
