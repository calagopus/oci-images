ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         BUN_VERSION=1

FROM        --platform=$TARGETOS/$TARGETARCH oven/bun:${BUN_VERSION} AS bun

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         BUN_VERSION

# Metadata
LABEL       org.opencontainers.image.title="bun${BUN_VERSION}"
LABEL       org.opencontainers.image.description="Bun ${BUN_VERSION} image."

ENV         BUN_RUNTIME_TRANSPILER_CACHE_PATH=0
ENV         PATH="${PATH}:/usr/local/bun-node-fallback-bin"
COPY        --from=bun /usr/local /usr/local

COPY        entrypoint.d/ /entrypoint.d/
