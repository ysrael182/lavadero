FROM php:7.1-apache

RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && apt-get upgrade -y libpng-dev
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN a2enmod rewrite

ADD . /var/www/html