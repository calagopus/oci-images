ARG         BASE_IMAGE=calagopus/oci-images:base_debian
ARG         JAVA_VERSION=25

FROM        --platform=$TARGETOS/$TARGETARCH ibm-semeru-runtimes:open-${JAVA_VERSION}-jdk AS jdk

RUN         cp -aL "${JAVA_HOME}" /opt/jdk \
            && rm -rf /opt/jdk/jmods

FROM        --platform=$TARGETOS/$TARGETARCH ${BASE_IMAGE}

ARG         JAVA_VERSION

# Metadata
LABEL       org.opencontainers.image.title="java${JAVA_VERSION}_semeru"
LABEL       org.opencontainers.image.description="IBM Semeru Runtime Open Edition (JDK ${JAVA_VERSION}) image."

ENV         JAVA_HOME=/opt/java/openjdk
ENV         PATH="${JAVA_HOME}/bin:${PATH}"
COPY        --from=jdk /opt/jdk ${JAVA_HOME}

COPY        entrypoint.d/ /entrypoint.d/
