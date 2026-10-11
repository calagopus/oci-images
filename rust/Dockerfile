ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         RUST_VERSION=1

FROM        --platform=$TARGETOS/$TARGETARCH rust:${RUST_VERSION}-slim-trixie AS rust

RUN         cp -a "$(rustc --print sysroot)" /opt/rust

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         RUST_VERSION

# Metadata
LABEL       org.opencontainers.image.title="rust${RUST_VERSION}"
LABEL       org.opencontainers.image.description="Rust ${RUST_VERSION} image."

ENV         CARGO_HOME=/home/container/.cargo
ENV         PATH="${CARGO_HOME}/bin:/opt/rust/bin:${PATH}"
COPY        --from=rust /opt/rust /opt/rust

COPY        entrypoint.d/ /entrypoint.d/
