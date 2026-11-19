ARG         BASE_IMAGE=calagopus/oci-images:base_debian
ARG         PHP_VERSION=8.4

FROM        --platform=$TARGETOS/$TARGETARCH php:${PHP_VERSION}-fpm-trixie AS php
FROM        --platform=$TARGETOS/$TARGETARCH composer:2 AS composer

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         PHP_VERSION

# Metadata
LABEL       org.opencontainers.image.title="php${PHP_VERSION}"
LABEL       org.opencontainers.image.description="PHP ${PHP_VERSION} image."

USER        root

# Copy PHP runtime and Composer from official images
COPY        --from=php /usr/local /usr/local
COPY        --from=composer /usr/bin/composer /usr/local/bin/composer

# Install runtime libraries and common PHP extensions
ADD         --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                libargon2-1 \
                libcurl4t64 \
                libonig5 \
                libreadline8t64 \
                libsodium23 \
                libxml2 \
                libzip5 \
                unzip \
            && install-php-extensions \
                bcmath \
                exif \
                gd \
                gmp \
                intl \
                mysqli \
                opcache \
                pcntl \
                pdo_mysql \
                pdo_pgsql \
                redis \
                sockets \
                zip \
            && rm -f /usr/local/bin/install-php-extensions \
            && rm -rf /var/lib/apt/lists/* \
            && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

ENV         COMPOSER_HOME=/home/container/.composer
ENV         PATH="${COMPOSER_HOME}/vendor/bin:${PATH}"

COPY        entrypoint.d/ /entrypoint.d/

USER        container
