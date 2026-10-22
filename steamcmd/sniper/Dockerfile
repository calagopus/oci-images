ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE} AS base

FROM        --platform=$TARGETOS/$TARGETARCH registry.gitlab.steamos.cloud/steamrt/sniper/platform:latest-container-runtime-depot

# Metadata
LABEL       org.opencontainers.image.source="https://github.com/calagopus/oci-images"
LABEL       org.opencontainers.image.licenses="MIT"
LABEL       org.opencontainers.image.title="steamcmd_sniper"
LABEL       org.opencontainers.image.description="Steam Runtime 3 (sniper) SteamCMD image for Steam game servers."

# Install necessary packages
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                dumb-init \
                iproute2 \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

# Set locale and language environment variables
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8
ENV         LC_ALL=en_US.UTF-8

# Copy the entrypoint scripts
COPY        --from=base /entrypoint.sh /entrypoint.sh
COPY        entrypoint.d/ /entrypoint.d/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Set the entrypoint command
ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]
CMD         [ "/bin/bash", "/entrypoint.sh" ]
