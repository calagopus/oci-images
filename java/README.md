# Java images

A JDK, copied from the vendor onto `base_debian`. The tag is `java<version>_<vendor>`, for example `java21_temurin`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `java8_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java8_corretto`, `calagopus/oci-images:java8_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java11_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java11_corretto`, `calagopus/oci-images:java11_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java17_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java17_corretto`, `calagopus/oci-images:java17_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java21_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java21_corretto`, `calagopus/oci-images:java21_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java25_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java25_corretto`, `calagopus/oci-images:java25_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java26_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java26_corretto`, `calagopus/oci-images:java26_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java27_corretto` | `amazoncorretto` | `ghcr.io/calagopus/oci-images:java27_corretto`, `calagopus/oci-images:java27_corretto` | ✅ | ✅ | ❌ | ❌ |
| `java17_graalvm-ce` | `ghcr.io/graalvm/jdk-community` | `ghcr.io/calagopus/oci-images:java17_graalvm-ce`, `calagopus/oci-images:java17_graalvm-ce` | ✅ | ✅ | ❌ | ❌ |
| `java21_graalvm-ce` | `ghcr.io/graalvm/jdk-community` | `ghcr.io/calagopus/oci-images:java21_graalvm-ce`, `calagopus/oci-images:java21_graalvm-ce` | ✅ | ✅ | ❌ | ❌ |
| `java25_graalvm-ce` | `ghcr.io/graalvm/jdk-community` | `ghcr.io/calagopus/oci-images:java25_graalvm-ce`, `calagopus/oci-images:java25_graalvm-ce` | ✅ | ✅ | ❌ | ❌ |
| `java21_graalvm-ee` | `container-registry.oracle.com/graalvm/jdk` | `ghcr.io/calagopus/oci-images:java21_graalvm-ee`, `calagopus/oci-images:java21_graalvm-ee` | ✅ | ✅ | ❌ | ❌ |
| `java25_graalvm-ee` | `container-registry.oracle.com/graalvm/jdk` | `ghcr.io/calagopus/oci-images:java25_graalvm-ee`, `calagopus/oci-images:java25_graalvm-ee` | ✅ | ✅ | ❌ | ❌ |
| `java8_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java8_shenandoah`, `calagopus/oci-images:java8_shenandoah` | ✅ | ✅ | ❌ | ❌ |
| `java11_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java11_shenandoah`, `calagopus/oci-images:java11_shenandoah` | ✅ | ✅ | ❌ | ❌ |
| `java17_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java17_shenandoah`, `calagopus/oci-images:java17_shenandoah` | ✅ | ✅ | ✅ | ✅ |
| `java21_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java21_shenandoah`, `calagopus/oci-images:java21_shenandoah` | ✅ | ✅ | ✅ | ✅ |
| `java25_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java25_shenandoah`, `calagopus/oci-images:java25_shenandoah` | ✅ | ✅ | ✅ | ✅ |
| `java26_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java26_shenandoah`, `calagopus/oci-images:java26_shenandoah` | ✅ | ✅ | ✅ | ✅ |
| `java27_shenandoah` | `builds.shipilev.net` | `ghcr.io/calagopus/oci-images:java27_shenandoah`, `calagopus/oci-images:java27_shenandoah` | ✅ | ✅ | ✅ | ✅ |
| `java8_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java8_temurin`, `calagopus/oci-images:java8_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java11_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java11_temurin`, `calagopus/oci-images:java11_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java17_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java17_temurin`, `calagopus/oci-images:java17_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java21_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java21_temurin`, `calagopus/oci-images:java21_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java25_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java25_temurin`, `calagopus/oci-images:java25_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java26_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java26_temurin`, `calagopus/oci-images:java26_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java27_temurin` | `eclipse-temurin` | `ghcr.io/calagopus/oci-images:java27_temurin`, `calagopus/oci-images:java27_temurin` | ✅ | ✅ | ✅ | ❌ |
| `java8_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java8_zulu`, `calagopus/oci-images:java8_zulu` | ✅ | ✅ | ❌ | ❌ |
| `java11_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java11_zulu`, `calagopus/oci-images:java11_zulu` | ✅ | ✅ | ❌ | ❌ |
| `java17_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java17_zulu`, `calagopus/oci-images:java17_zulu` | ✅ | ✅ | ❌ | ❌ |
| `java21_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java21_zulu`, `calagopus/oci-images:java21_zulu` | ✅ | ✅ | ❌ | ❌ |
| `java25_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java25_zulu`, `calagopus/oci-images:java25_zulu` | ✅ | ✅ | ❌ | ❌ |
| `java26_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java26_zulu`, `calagopus/oci-images:java26_zulu` | ✅ | ✅ | ❌ | ❌ |
| `java27_zulu` | `azul/zulu-openjdk` | `ghcr.io/calagopus/oci-images:java27_zulu`, `calagopus/oci-images:java27_zulu` | ✅ | ✅ | ❌ | ❌ |

The upstream images of Corretto, GraalVM and Zulu only exist for `amd64` and `arm64`. Temurin is built from Adoptium's default image, which has no `riscv64` build. The Shenandoah collector is not available on `ppc64le` and `riscv64` before Java 17, and the Java 8 build from Shipilev has no Shenandoah collector at all.

Java 26 and 27 are not built for GraalVM, because GraalVM has no Java 26 or 27 image.

GraalVM CE for Java 17 and 21 is no longer updated upstream, so those images stay on 17.0.9 and 21.0.2 and get no security fixes. GraalVM CE 25 is built from the `25i-ol10` tag, because the plain `25` tag is no longer updated.

Java 26 is end of life: Temurin and Zulu 26 ended in September 2026, and Corretto 26 ended on 31 October 2026.

The JDKs come without `jmods`, so `jlink` only works on JDKs that can link without them, such as Temurin 25. The Shenandoah JDKs also come without their debug JVMs.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg JAVA_VERSION=21 -f java/temurin/Dockerfile -t ghcr.io/calagopus/oci-images:java21_temurin java
```
