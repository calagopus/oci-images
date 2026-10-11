ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         NODE_VERSION=24

FROM        node:${NODE_VERSION}-trixie-slim AS node

FROM        ${BASE_IMAGE}

ARG         NODE_VERSION

# Metadata
LABEL       org.opencontainers.image.title="nodejs${NODE_VERSION}"
LABEL       org.opencontainers.image.description="Node.js ${NODE_VERSION} image."

COPY        --from=node /usr/local /usr/local
COPY        --from=node /opt /opt

COPY        entrypoint.d/ /entrypoint.d/
