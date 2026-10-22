ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_ubuntu

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

# Metadata
LABEL       org.opencontainers.image.title="steamcmd_ubuntu"
LABEL       org.opencontainers.image.description="Ubuntu SteamCMD image for Steam game servers."

USER        root

# Install necessary packages
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                lib32gcc-s1 \
                lib32stdc++6 \
                lib32tinfo6 \
                lib32z1 \
                libcurl3t64-gnutls:i386 \
                libsdl2-2.0-0 \
                libsdl2-2.0-0:i386 \
            && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint scripts
COPY        entrypoint.d/ /entrypoint.d/

USER        container
