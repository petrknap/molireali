FROM php:cli

# hadolint ignore=DL3008
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng-dev \
 && docker-php-ext-configure gd \
 && docker-php-ext-install -j"$(nproc)" gd \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
;
