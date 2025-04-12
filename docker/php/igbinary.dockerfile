FROM php:cli

# hadolint ignore=DL3008
RUN pecl install -o -f \
      igbinary \
 && docker-php-ext-enable \
      igbinary \
;
