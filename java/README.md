# Java images

A JDK, copied from the vendor onto `base_debian`. The tag is `java<version>_<vendor>`, for example `java21_temurin`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `java8_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java8_corretto` | Yes | Yes | No | No |
| `java11_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java11_corretto` | Yes | Yes | No | No |
| `java17_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java17_corretto` | Yes | Yes | No | No |
| `java21_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java21_corretto` | Yes | Yes | No | No |
| `java25_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java25_corretto` | Yes | Yes | No | No |
| `java26_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java26_corretto` | Yes | Yes | No | No |
| `java27_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java27_corretto` | Yes | Yes | No | No |
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
| `java26_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java26_shenandoah` | Yes | Yes | Yes | Yes |
| `java27_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java27_shenandoah` | Yes | Yes | Yes | Yes |
| `java8_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java8_temurin` | Yes | Yes | Yes | No |
| `java11_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java11_temurin` | Yes | Yes | Yes | No |
| `java17_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java17_temurin` | Yes | Yes | Yes | No |
| `java21_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java21_temurin` | Yes | Yes | Yes | No |
| `java25_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java25_temurin` | Yes | Yes | Yes | No |
| `java26_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java26_temurin` | Yes | Yes | Yes | No |
| `java27_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java27_temurin` | Yes | Yes | Yes | No |
| `java8_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java8_zulu` | Yes | Yes | No | No |
| `java11_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java11_zulu` | Yes | Yes | No | No |
| `java17_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java17_zulu` | Yes | Yes | No | No |
| `java21_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java21_zulu` | Yes | Yes | No | No |
| `java25_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java25_zulu` | Yes | Yes | No | No |
| `java26_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java26_zulu` | Yes | Yes | No | No |

The upstream images of Corretto, GraalVM and Zulu only exist for `amd64` and `arm64`. Temurin is built from Adoptium's default image, which has no `riscv64` build. The Shenandoah collector is not available on `ppc64le` and `riscv64` before Java 17, and the Java 8 build from Shipilev has no Shenandoah collector at all.

Java 27 is only built for Corretto, Shenandoah and Temurin so far, because Zulu and GraalVM have no Java 27 image yet.

GraalVM CE for Java 17 and 21 is no longer updated upstream, so those images stay on 17.0.9 and 21.0.2. GraalVM CE 25 is built from the `25i-ol10` tag, because the plain `25` tag is no longer updated.

The JDKs come without `jmods`, so `jlink` only works on JDKs that can link without them, such as Temurin 25. The Shenandoah JDKs also come without their debug JVMs.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg JAVA_VERSION=21 -f java/temurin/Dockerfile -t ghcr.io/calagopus/oci-images:java21_temurin java
```
