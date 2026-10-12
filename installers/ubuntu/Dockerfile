ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:ubuntu

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

# Metadata
LABEL       org.opencontainers.image.title="installers_ubuntu"
LABEL       org.opencontainers.image.description="Ubuntu installer image for the Calagopus installation scripts."

USER        root
ENV         USER=root HOME=/root
ENV         DEBIAN_FRONTEND=noninteractive
WORKDIR     /

# Install necessary packages
RUN         apt-get update \
            && apt-get install -y --no-install-recommends \
                file \
                jq \
                ca-certificates \
                curl \
                git \
                unzip \
                wget \
                zip \
            && if [ "$(dpkg --print-architecture)" = "amd64" ]; then \
                apt-get install -y --no-install-recommends lib32gcc-s1; \
            fi \
            && rm -rf /var/lib/apt/lists/*

ENTRYPOINT  []
CMD         [ "/bin/bash" ]