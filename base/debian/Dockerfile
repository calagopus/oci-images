FROM        --platform=$TARGETOS/$TARGETARCH debian:trixie-slim

# Metadata
LABEL       org.opencontainers.image.source="https://github.com/calagopus/oci-images"
LABEL       org.opencontainers.image.licenses="MIT"
LABEL       org.opencontainers.image.title="base_debian"
LABEL       org.opencontainers.image.description="Debian base image for the Calagopus images."

# Install necessary packages
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                build-essential \
                ca-certificates \
                curl \
                dumb-init \
                fontconfig \
                git \
                iproute2 \
                libfreetype6 \
                libgif7 \
                libjpeg62-turbo \
                libncursesw6 \
                libstdc++6 \
                locales \
                lsof \
                netbase \
                openssl \
                sqlite3 \
                tar \
                tzdata \
                xz-utils \
            && rm -rf /var/lib/apt/lists/* \
            && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
            && locale-gen \
            && useradd -m -d /home/container container

# Set locale and language environment variables
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8
ENV         LC_ALL=en_US.UTF-8

# Copy the entrypoint script
COPY        entrypoint.sh /entrypoint.sh

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Set the entrypoint command
ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]
CMD         [ "/bin/bash", "/entrypoint.sh" ]
