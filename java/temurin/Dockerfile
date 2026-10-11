ARG         BASE_IMAGE=ghcr.io/calagopus/oci-images:base_debian
ARG         JAVA_VERSION=25

FROM        eclipse-temurin:${JAVA_VERSION}-jdk-noble AS jdk

RUN         cp -aL "${JAVA_HOME}" /opt/jdk

FROM        ${BASE_IMAGE}

ARG         JAVA_VERSION

# Metadata
LABEL       org.opencontainers.image.title="java${JAVA_VERSION}_temurin"
LABEL       org.opencontainers.image.description="Eclipse Temurin (JDK ${JAVA_VERSION}) image."

ENV         JAVA_HOME=/opt/java/openjdk
ENV         PATH="${JAVA_HOME}/bin:${PATH}"
COPY        --from=jdk /opt/jdk ${JAVA_HOME}

COPY        entrypoint.d/ /entrypoint.d/
