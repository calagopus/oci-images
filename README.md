![Calagopus Logo](https://calagopus.com/fulllogo.svg)

# Calagopus OCI Images

[![GitHub issues](https://img.shields.io/github/issues/calagopus/oci-images)](https://github.com/calagopus/oci-images/issues)
[![GitHub stars](https://img.shields.io/github/stars/calagopus/oci-images)](https://github.com/calagopus/oci-images/stargazers)
[![Discord](https://img.shields.io/discord/1429911351777824892?label=discord&logo=discord&color=5865F2)](https://discord.gg/uSM8tvTxBV)

OCI images for [Calagopus](https://calagopus.com). This repository hosts the container images used to install and run servers, such as the installer images that server installation scripts run in.

The images are built for the Calagopus project.

> [!NOTE]
> This repository is new and we are still testing the images, so expect things to change. Contributions are welcome. Please stick to the structure described below.

## Images

Every image is a tag of `ghcr.io/calagopus/oci-images` and is built for `linux/amd64` and `linux/arm64`.

| Directory | Tags | Contents |
| :--- | :--- | :--- |
| [`base`](./base) | `base_alpine`, `base_debian` | Shared packages, the `container` user and the entrypoint |
| [`installers`](./installers) | `installers_alpine`, `installers_debian` | Tools for server installation scripts, runs as root |
| [`bun`](./bun) | `bun1` | Bun |
| [`go`](./go) | `go1.26`, `go1.27` | Go |
| [`java`](./java) | `java<version>_<vendor>`, for example `java21_temurin` | Java 8, 11, 17, 21 and 25 |
| [`nodejs`](./nodejs) | `nodejs22`, `nodejs24` | Node.js |
| [`python`](./python) | `python3.11`, `python3.12`, `python3.13`, `python3.14` | Python |
| [`rust`](./rust) | `rust1` | Rust |

## How the images are built

Everything starts from a base image. The base images carry what all the other images share: the packages, the `container` user, `dumb-init` and the entrypoint. Both of them use the same [`base/entrypoint.sh`](./base/entrypoint.sh), which is why they are built with `base` as the build context.

A runtime image takes the runtime from its official upstream image and copies it onto `base_debian`. It installs no packages of its own, and the version comes in as a build argument, so a single Dockerfile covers every version.

The installer images sit on the base image of the same name. They run as `root` and have no entrypoint, since installation scripts are started with their own command.

When a server starts, the entrypoint runs the scripts in `/entrypoint.d/`, fills each `{{VARIABLE}}` in `STARTUP` with the matching environment variable and runs the result. Runtime images put a script in there that prints their version.

The [workflow](./.github/workflows/build.yml) builds the base images first. After that, every job builds its image, starts it once to make sure it works and then pushes it for both platforms.

To build an image yourself, run the commands from the root of the repository. The base image comes first, because the other images are built on it:

```bash
docker buildx build -f base/debian/Dockerfile -t ghcr.io/calagopus/oci-images:base_debian base
docker buildx build --build-arg JAVA_VERSION=21 -f java/temurin/Dockerfile -t ghcr.io/calagopus/oci-images:java21_temurin java
```

## Maintaining

| Change | Where |
| :--- | :--- |
| Add or remove a package | The Dockerfile of the base image |
| Add or remove a version | The `matrix` of the job in the workflow |
| Change how servers are started | `base/entrypoint.sh` |
| Add a runtime | A new directory with a Dockerfile and an `entrypoint.d` script, a job copied from an existing one, and the directory in both `paths` lists of the workflow |

Every `FROM` line names its platform with `--platform=$TARGETOS/$TARGETARCH`. The only exception is the first stage of `java/shenandoah`, which downloads its JDK on the build platform because the upstream image only exists for `linux/amd64`.

## License

See [LICENSE](https://github.com/calagopus/oci-images/blob/main/LICENSE).

## Star History

![Star History Chart](https://api.star-history.com/chart?repos=calagopus/oci-images&type=date&legend=top-left&sealed_token=B2O-QGHUHAa_2R6TXAtmVmA-ASHkIyhBD3Rm6jlD9mOeO9XJsHW0uBvsZ-5zINucUHJPH5c29w8c7lL_2Kr7tb5770-KK58lG2pGrET0ksegRMrP1IEbft05EdOtyO6RAUCo1FCK5gnNscF6lwXhRp5LLQd08n2sZgUisdnct1irxGRvQmzUx9o-Bk4o)
