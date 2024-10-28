FROM php:cli

WORKDIR /app
COPY . .
RUN composer install
