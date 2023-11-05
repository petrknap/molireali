FROM php:cli

# hadolint ignore=DL3008
RUN pecl install xdebug \
 && docker-php-ext-enable xdebug \
;
