ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:steamcmd_debian

FROM        --platform=$TARGETOS/$TARGETARCH mcr.microsoft.com/dotnet/aspnet:8.0 AS dotnet8

FROM        --platform=$TARGETOS/$TARGETARCH mcr.microsoft.com/dotnet/aspnet:9.0 AS dotnet9

FROM        --platform=$TARGETOS/$TARGETARCH mcr.microsoft.com/dotnet/aspnet:10.0 AS dotnet10

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

# Metadata
LABEL       org.opencontainers.image.title="steamcmd_dotnet"
LABEL       org.opencontainers.image.description="SteamCMD image with the .NET 8, 9 and 10 runtimes for Steam game servers."

USER        root

# Install necessary packages
RUN         apt-get update \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                libgdiplus \
                libicu76 \
            && rm -rf /var/lib/apt/lists/* \
            && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENV         DOTNET_ROOT=/usr/share/dotnet
COPY        --from=dotnet8 /usr/share/dotnet /usr/share/dotnet
COPY        --from=dotnet9 /usr/share/dotnet /usr/share/dotnet
COPY        --from=dotnet10 /usr/share/dotnet /usr/share/dotnet

# Copy the entrypoint scripts
COPY        dotnet/entrypoint.d/ /entrypoint.d/

USER        container
