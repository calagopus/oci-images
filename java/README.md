# Java images

A JDK, copied from the vendor onto `base_debian`. The tag is `java<version>_<vendor>`, for example `java21_temurin`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `java8_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java8_corretto` | Yes | Yes | No | No |
| `java11_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java11_corretto` | Yes | Yes | No | No |
| `java17_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java17_corretto` | Yes | Yes | No | No |
| `java21_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java21_corretto` | Yes | Yes | No | No |
| `java25_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java25_corretto` | Yes | Yes | No | No |
| `java17_graalvm-ce` | `ghcr.io/graalvm/jdk-community` | `ghcr.io/calagopus/oci-images:java17_graalvm-ce` | Yes | Yes | No | No |
| `java21_graalvm-ce` | `ghcr.io/graalvm/jdk-community` | `ghcr.io/calagopus/oci-images:java21_graalvm-ce` | Yes | Yes | No | No |
| `java25_graalvm-ce` | `ghcr.io/graalvm/jdk-community` | `ghcr.io/calagopus/oci-images:java25_graalvm-ce` | Yes | Yes | No | No |
| `java21_graalvm-ee` | `container-registry.oracle.com/graalvm/jdk` | `ghcr.io/calagopus/oci-images:java21_graalvm-ee` | Yes | Yes | No | No |
| `java25_graalvm-ee` | `container-registry.oracle.com/graalvm/jdk` | `ghcr.io/calagopus/oci-images:java25_graalvm-ee` | Yes | Yes | No | No |
| `java8_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java8_shenandoah` | Yes | Yes | No | No |
| `java11_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java11_shenandoah` | Yes | Yes | No | No |
| `java17_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java17_shenandoah` | Yes | Yes | Yes | Yes |
| `java21_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java21_shenandoah` | Yes | Yes | Yes | Yes |
| `java25_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java25_shenandoah` | Yes | Yes | Yes | Yes |
| `java8_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java8_temurin` | Yes | Yes | Yes | No |
| `java11_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java11_temurin` | Yes | Yes | Yes | No |
| `java17_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java17_temurin` | Yes | Yes | Yes | Yes |
| `java21_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java21_temurin` | Yes | Yes | Yes | Yes |
| `java25_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java25_temurin` | Yes | Yes | Yes | Yes |
| `java8_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java8_zulu` | Yes | Yes | No | No |
| `java11_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java11_zulu` | Yes | Yes | No | No |
| `java17_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java17_zulu` | Yes | Yes | No | No |
| `java21_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java21_zulu` | Yes | Yes | No | No |
| `java25_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java25_zulu` | Yes | Yes | No | No |

The upstream images of Corretto, GraalVM and Zulu only exist for `amd64` and `arm64`. Temurin has no `riscv64` build before Java 17. The Shenandoah collector is not available on `ppc64le` and `riscv64` before Java 17.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg JAVA_VERSION=21 -f java/temurin/Dockerfile -t ghcr.io/calagopus/oci-images:java21_temurin java
```
