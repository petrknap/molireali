FROM php:cli

# hadolint ignore=DL3008
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      git \
      unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
;
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
