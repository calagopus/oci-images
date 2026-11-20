ARG         BASE_IMAGE=calagopus/oci-images:base_debian
ARG         PHP_VERSION=8.5

FROM        --platform=$TARGETOS/$TARGETARCH php:${PHP_VERSION}-cli-trixie AS php

ARG         IPE_VERSION=2.13.2
ARG         IPE_SHA256=27fa8d80bd4e22feb9ddcadff1ca40c8f3e8ea942eb2dd8f446ed1afd2f2f0ab

# Install the extensions
RUN         curl -fsSL -o /usr/local/bin/install-php-extensions "https://github.com/mlocati/docker-php-extension-installer/releases/download/${IPE_VERSION}/install-php-extensions" \
            && echo "${IPE_SHA256}  /usr/local/bin/install-php-extensions" | sha256sum -c - \
            && chmod +x /usr/local/bin/install-php-extensions \
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
            && cp "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini" \
            && find /usr/local -type f \( -executable -o -name '*.so' \) -exec ldd '{}' ';' 2> /dev/null \
                | awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); printf "*%s\n", so }' \
                | sort -u \
                | xargs -r dpkg-query --search \
                | awk '/^diversion / { next } { sub(/: \/.*/, ""); n = split($0, packages, ", "); for (i = 1; i <= n; i++) { sub(/:.*/, "", packages[i]); print packages[i] } }' \
                | sort -u > /php-packages \
            && test -s /php-packages

FROM        --platform=$TARGETOS/$TARGETARCH composer:2 AS composer

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         PHP_VERSION

# Metadata
LABEL       org.opencontainers.image.title="php${PHP_VERSION}"
LABEL       org.opencontainers.image.description="PHP ${PHP_VERSION} image."

USER        root

# Install necessary packages
COPY        --from=php /php-packages /tmp/php-packages
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                $(cat /tmp/php-packages) \
                unzip \
            && rm -rf /var/lib/apt/lists/* /tmp/php-packages

COPY        --from=php /usr/local /usr/local
COPY        --from=composer /usr/bin/composer /usr/local/bin/composer

ENV         COMPOSER_HOME=/home/container/.composer
ENV         PATH="${COMPOSER_HOME}/vendor/bin:${PATH}"

COPY        entrypoint.d/ /entrypoint.d/

USER        container
