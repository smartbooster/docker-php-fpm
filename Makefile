login:
	docker login

build:
	#docker build -t smartbooster/php-fpm .
	#docker build -t smartbooster/php-fpm:builder ./builder
	docker build -t smartbooster/php-fpm:7.4-wordpress .
	docker build -t smartbooster/php-fpm:7.4-wordpress-builder ./builder

push:
	#docker push smartbooster/php-fpm
	#docker push smartbooster/php-fpm:builder
	docker push smartbooster/php-fpm:7.4-wordpress
	docker push smartbooster/php-fpm:7.4-wordpress-builder

pull:
	docker pull smartbooster/php-fpm
	docker pull smartbooster/php-fpm:builder

ssh:
	docker run --rm -it -v $(PWD)/:/var/www smartbooster/php-fpm:builder bash
