FROM        --platform=$TARGETOS/$TARGETARCH alpine:3.24

# Metadata
LABEL       org.opencontainers.image.source="https://github.com/calagopus/oci-images"
LABEL       org.opencontainers.image.licenses="MIT"
LABEL       org.opencontainers.image.title="base_alpine"
LABEL       org.opencontainers.image.description="Alpine base image for the Calagopus images."

# Install necessary packages
RUN         apk add --no-cache \
                bash \
                ca-certificates \
                curl \
                dumb-init \
                git \
                iproute2 \
                openssl \
                tar \
                tzdata \
                xz \
            && adduser -D -h /home/container container

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
