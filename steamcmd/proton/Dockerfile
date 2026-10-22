ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:steamcmd_debian

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         RCON_VERSION=0.10.3
ARG         RCON_SHA256=6962a641ebf9a5957bd0cda1b8acf3e34a23686ae709f6c6a14ac3898521a5cc

# Metadata
LABEL       org.opencontainers.image.title="steamcmd_proton"
LABEL       org.opencontainers.image.description="SteamCMD image with GE-Proton for Windows game servers."

USER        root

# Install necessary packages
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                libfontconfig1:i386 \
                libfreetype6:i386 \
                python3 \
                winbind \
                xauth \
                xvfb \
            && rm -rf /var/lib/apt/lists/* \
            && printf '%s\n' "$(od -An -tx1 -N16 /dev/urandom | tr -d ' \n')" > /etc/machine-id

# Install the latest GE-Proton
RUN         PROTON_TAG=$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/GloriousEggroll/proton-ge-custom/releases/latest | sed 's#.*/##') \
            && cd /tmp \
            && curl -fsSLO "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${PROTON_TAG}/${PROTON_TAG}-x86_64.tar.gz" \
            && curl -fsSLO "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${PROTON_TAG}/${PROTON_TAG}-x86_64.sha512sum" \
            && sha512sum -c "${PROTON_TAG}-x86_64.sha512sum" \
            && mkdir /opt/proton \
            && tar -xzf "${PROTON_TAG}-x86_64.tar.gz" -C /opt/proton --strip-components=1 --no-same-owner \
            && rm -f /tmp/GE-Proton*

# Install rcon
RUN         curl -fsSL -o /tmp/rcon.tar.gz "https://github.com/gorcon/rcon-cli/releases/download/v${RCON_VERSION}/rcon-${RCON_VERSION}-amd64_linux.tar.gz" \
            && echo "${RCON_SHA256}  /tmp/rcon.tar.gz" | sha256sum -c - \
            && tar -xzf /tmp/rcon.tar.gz -C /usr/local/bin --strip-components=1 --no-same-owner "rcon-${RCON_VERSION}-amd64_linux/rcon" \
            && rm -f /tmp/rcon.tar.gz

ENV         PATH="/opt/proton:${PATH}"
ENV         STEAM_COMPAT_CLIENT_INSTALL_PATH=/home/container/.steam/steam

# Copy the entrypoint scripts
COPY        proton/entrypoint.d/ /entrypoint.d/

USER        container
