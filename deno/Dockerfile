ARG         BASE_IMAGE=calagopus/oci-images:base_debian
ARG         DENO_VERSION=2

FROM        --platform=$TARGETOS/$TARGETARCH denoland/deno:bin AS deno

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         DENO_VERSION

# Metadata
LABEL       org.opencontainers.image.title="deno${DENO_VERSION}"
LABEL       org.opencontainers.image.description="Deno ${DENO_VERSION} image."

ENV         DENO_DIR=/home/container/.deno
ENV         DENO_INSTALL_ROOT=/home/container/.deno
ENV         PATH="${DENO_INSTALL_ROOT}/bin:${PATH}"
COPY        --from=deno /deno /usr/local/bin/deno

COPY        entrypoint.d/ /entrypoint.d/
