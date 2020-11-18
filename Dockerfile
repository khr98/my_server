FROM debian:buster

RUN apt-get update && apt-get install -y \
		nginx \
		php-fpm \
		vim \
		openssl \
		mariadb-server \
		php-mysql \
		php-mbstring

COPY /srcs/default ./etc/nginx/sites-available/
COPY /srcs/phpMyAdmin-5.0.2-all-languages.tar.gz ./
COPY /srcs/config.inc.php ./
COPY /srcs/latest.tar.gz ./
COPY /srcs/wp-config.php ./
COPY /srcs/install.sh ./

EXPOSE 80 443

CMD bash install.sh

