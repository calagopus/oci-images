ARG         BASE_IMAGE=calagopus/oci-images:base_debian
ARG         DOTNET_VERSION=10

FROM        --platform=$TARGETOS/$TARGETARCH mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION}.0 AS dotnet

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         DOTNET_VERSION

# Metadata
LABEL       org.opencontainers.image.title="dotnet${DOTNET_VERSION}"
LABEL       org.opencontainers.image.description=".NET ${DOTNET_VERSION} image."

USER        root

# Install necessary packages
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                libgdiplus \
                libicu76 \
            && rm -rf /var/lib/apt/lists/* \
            && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENV         DOTNET_ROOT=/usr/share/dotnet
ENV         DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV         PATH="/home/container/.dotnet/tools:${PATH}"
COPY        --from=dotnet /usr/share/dotnet /usr/share/dotnet

COPY        entrypoint.d/ /entrypoint.d/

USER        container
