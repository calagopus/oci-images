ARG         BASE_IMAGE=calagopus/oci-images:base_debian
ARG         DENO_VERSION=2
ARG         DENO_TAG=bin

FROM        --platform=$TARGETOS/$TARGETARCH denoland/deno:${DENO_TAG} AS deno

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         DENO_VERSION

# Metadata
LABEL       org.opencontainers.image.title="deno${DENO_VERSION}"
LABEL       org.opencontainers.image.description="Deno ${DENO_VERSION} image."

ENV         PATH="/home/container/.deno/bin:${PATH}"
COPY        --from=deno /deno /usr/local/bin/deno

COPY        entrypoint.d/ /entrypoint.d/
