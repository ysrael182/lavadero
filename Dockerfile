FROM php:7.1-apache

RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && apt-get upgrade -y
RUN a2enmod rewrite
RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini-development
RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini-production
ADD . /var/www/html