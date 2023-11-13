FROM php:cli

WORKDIR /app
COPY . .
RUN composer update --prefer-lowest
