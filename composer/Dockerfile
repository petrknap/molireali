FROM php:8.1-cli

# region included composer
# hadolint ignore=DL3008
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      git \
      unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
;
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
# endregion

# region included bcmath
# hadolint ignore=DL3008
RUN docker-php-ext-install \
      bcmath \
;
# endregion

# region included gd
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
# endregion

WORKDIR /app
