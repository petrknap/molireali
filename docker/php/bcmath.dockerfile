FROM php:cli

# hadolint ignore=DL3008
RUN docker-php-ext-install \
      bcmath \
;
