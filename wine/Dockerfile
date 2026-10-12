ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:steamcmd_debian

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         WINE_BRANCH=stable

# Metadata
LABEL       org.opencontainers.image.title="wine_${WINE_BRANCH}"
LABEL       org.opencontainers.image.description="Wine ${WINE_BRANCH} image for Windows game servers."

USER        root

# Install necessary packages
RUN         curl -fsSL -o /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
            && curl -fsSL -o /etc/apt/sources.list.d/winehq-trixie.sources https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources \
            && apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                cabextract \
                libegl1 \
                libegl1:i386 \
                winbind \
                xauth \
                xvfb \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --install-recommends \
                winehq-${WINE_BRANCH} \
            && rm -rf /var/lib/apt/lists/*

# Install Winetricks
RUN         curl -fsSL -o /usr/local/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
            && chmod +x /usr/local/bin/winetricks

ENV         WINEPREFIX=/home/container/.wine
ENV         WINEDLLOVERRIDES="mscoree,mshtml="
ENV         DISPLAY=:0
ENV         DISPLAY_WIDTH=1024
ENV         DISPLAY_HEIGHT=768
ENV         DISPLAY_DEPTH=16
ENV         XVFB=1

# Copy the entrypoint scripts
COPY        entrypoint.d/ /entrypoint.d/

USER        container
