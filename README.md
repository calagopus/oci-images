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

Every image is a tag of `ghcr.io/calagopus/oci-images`. Each directory has a README with all its tags and platforms.

| Directory | Tags | Platforms | Contents |
| :--- | :--- | :--- | :--- |
| [`base`](./base) | `base_alpine`, `base_debian`, `base_ubuntu` | All | Plain OS images with the shared packages, the `container` user and the entrypoint |
| [`installers`](./installers) | `installers_alpine`, `installers_debian`, `installers_ubuntu` | All | For server installation scripts, run as root |
| [`bun`](./bun) | `bun1` | `amd64`, `arm64` | Bun 1 |
| [`go`](./go) | `go<version>`, for example `go1.27` | All | Go 1.24 to 1.27 |
| [`java`](./java) | `java<version>_<vendor>`, for example `java21_temurin` | Depends on the vendor | Java 8, 11, 17, 21, 25, 26 and 27 |
| [`nodejs`](./nodejs) | `nodejs<version>`, for example `nodejs24` | `amd64`, `arm64`, `ppc64le` | Node.js 18 to 26 |
| [`python`](./python) | `python<version>`, for example `python3.14` | All | Python 3.9 to 3.15 |
| [`rust`](./rust) | `rust1` | All | Rust 1 |
| [`steamcmd`](./steamcmd) | `steamcmd_debian`, `steamcmd_ubuntu`, `steamcmd_dotnet`, `steamcmd_proton`, `steamcmd_sniper` | `amd64` | For Steam game servers |
| [`wine`](./wine) | `wine_stable`, `wine_staging`, `wine_devel` | `amd64` | For Windows game servers |

"All" means `linux/amd64`, `linux/arm64`, `linux/ppc64le` and `linux/riscv64`.

## How it works

The base images hold the shared packages, the `container` user, `dumb-init` and the entrypoint. The runtime images copy their runtime from the official upstream image onto `base_debian`, and the installer, SteamCMD and Wine images add their packages on top. `steamcmd_sniper` is Valve's Steam Runtime 3 with the same entrypoint. When a server starts, the entrypoint runs the scripts in `/entrypoint.d/` and then `STARTUP`.

Each directory has its own workflow in [`.github/workflows`](./.github/workflows) with its versions. [`build.yml`](./.github/workflows/build.yml) builds them one after another, one job at a time, and only what changed. The scheduled run every Monday builds everything.

To build an image yourself, start with its base image, from the root of the repository:

```bash
docker buildx build -f base/debian/Dockerfile -t ghcr.io/calagopus/oci-images:base_debian base
docker buildx build --build-arg JAVA_VERSION=21 -f java/temurin/Dockerfile -t ghcr.io/calagopus/oci-images:java21_temurin java
```

## Maintaining

| Change | Where |
| :--- | :--- |
| Add or remove a package | The Dockerfile of the base image |
| Add or remove a version | The `matrix` in the workflow of the directory, and the table in its README |
| Change how servers are started | `base/entrypoint.sh` |
| Add a runtime | A new directory with a Dockerfile, an `entrypoint.d` script, a README and a workflow, plus a job, a `paths` entry and a `changes` entry for it in `build.yml` |

Every `FROM` line uses `--platform=$TARGETOS/$TARGETARCH`, except the download stage of `java/shenandoah`.

## License

See [LICENSE](https://github.com/calagopus/oci-images/blob/main/LICENSE).

## Star History

![Star History Chart](https://api.star-history.com/chart?repos=calagopus/oci-images&type=date&legend=top-left&sealed_token=B2O-QGHUHAa_2R6TXAtmVmA-ASHkIyhBD3Rm6jlD9mOeO9XJsHW0uBvsZ-5zINucUHJPH5c29w8c7lL_2Kr7tb5770-KK58lG2pGrET0ksegRMrP1IEbft05EdOtyO6RAUCo1FCK5gnNscF6lwXhRp5LLQd08n2sZgUisdnct1irxGRvQmzUx9o-Bk4o)
