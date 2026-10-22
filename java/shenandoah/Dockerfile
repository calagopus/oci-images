ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         JAVA_VERSION=25

FROM        --platform=$BUILDPLATFORM ${BASE_IMAGE} AS jdk

ARG         JAVA_VERSION
ARG         TARGETARCH

USER        root

RUN         case "${TARGETARCH}" in \
                amd64) JAVA_ARCH="x86_64" ;; \
                arm64) JAVA_ARCH="aarch64" ;; \
                ppc64le) JAVA_ARCH="ppc64le" ;; \
                riscv64) JAVA_ARCH="riscv64" ;; \
                *) echo "Unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
            esac \
            && curl -fsSL --retry 3 -o /tmp/jdk.tar.xz "https://builds.shipilev.net/openjdk-jdk${JAVA_VERSION}/openjdk-jdk${JAVA_VERSION}-linux-${JAVA_ARCH}-server.tar.xz" \
            && mkdir /opt/jdk \
            && tar -xJf /tmp/jdk.tar.xz -C /opt/jdk --strip-components=1 --no-same-owner \
            && test -x /opt/jdk/bin/java \
            && find /opt/jdk -type d \( -name fastdebug -o -name slowdebug \) -prune -exec rm -rf {} + \
            && rm -rf /opt/jdk/jmods

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         JAVA_VERSION

# Metadata
LABEL       org.opencontainers.image.title="java${JAVA_VERSION}_shenandoah"
LABEL       org.opencontainers.image.description="Shipilev OpenJDK / Shenandoah (JDK ${JAVA_VERSION}) image."

ENV         JAVA_HOME=/opt/java/openjdk
ENV         PATH="${JAVA_HOME}/bin:${PATH}"
COPY        --from=jdk /opt/jdk ${JAVA_HOME}

COPY        entrypoint.d/ /entrypoint.d/
