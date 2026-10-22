ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         GO_VERSION=1.27

FROM        --platform=$TARGETOS/$TARGETARCH golang:${GO_VERSION}-trixie AS go

RUN         rm -rf /usr/local/go/api /usr/local/go/test

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         GO_VERSION

# Metadata
LABEL       org.opencontainers.image.title="go${GO_VERSION}"
LABEL       org.opencontainers.image.description="Go ${GO_VERSION} image."

ENV         GOTOOLCHAIN=local
ENV         GOPATH=/home/container/go
ENV         PATH="${GOPATH}/bin:/usr/local/go/bin:${PATH}"
COPY        --from=go /usr/local/go /usr/local/go

COPY        entrypoint.d/ /entrypoint.d/
