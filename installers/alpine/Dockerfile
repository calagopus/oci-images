ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_alpine

FROM        ${BASE_IMAGE}

# Metadata
LABEL       org.opencontainers.image.title="installers_alpine"
LABEL       org.opencontainers.image.description="Alpine installer image for the Calagopus installation scripts."

USER        root
ENV         USER=root HOME=/root
WORKDIR     /

# Install necessary packages
RUN         apk add --no-cache \
                file \
                jq \
                unzip \
                wget \
                zip

ENTRYPOINT  []
CMD         [ "/bin/ash" ]
