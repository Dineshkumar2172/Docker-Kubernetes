FROM php:latest

WORKDIR /var/www/html

COPY src .

RUN docker-php-ext-install pdo pdo_mysql
