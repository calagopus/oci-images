ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         PYTHON_VERSION=3.14

FROM        --platform=$TARGETOS/$TARGETARCH python:${PYTHON_VERSION}-slim-trixie AS python

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         PYTHON_VERSION

# Metadata
LABEL       org.opencontainers.image.title="python${PYTHON_VERSION}"
LABEL       org.opencontainers.image.description="Python ${PYTHON_VERSION} image."

COPY        --from=python /usr/local /usr/local

COPY        entrypoint.d/ /entrypoint.d/
