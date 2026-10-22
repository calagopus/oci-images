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

Every image is a tag of `ghcr.io/calagopus/oci-images`. The platforms are `linux/amd64`, `linux/arm64`, `linux/ppc64le` and `linux/riscv64`. Where an image is not built for all four, the table says which. Each directory has a README with its tags, platforms and build command.

| Directory | Tags | Platforms | Contents |
| :--- | :--- | :--- | :--- |
| [`base`](./base) | `base_alpine`, `base_debian`, `base_ubuntu` | All | Plain OS images with the shared packages, the `container` user and the entrypoint |
| [`installers`](./installers) | `installers_alpine`, `installers_debian`, `installers_ubuntu` | All | For server installation scripts, run as root |
| [`bun`](./bun) | `bun1` | `amd64`, `arm64` | Bun |
| [`go`](./go) | `go1.24`, `go1.25`, `go1.26`, `go1.27` | All | Go |
| [`java`](./java) | `java<version>_<vendor>`, for example `java21_temurin` | `amd64`, `arm64`, more for some vendors | Java 8, 11, 17, 21, 25, 26 and 27 |
| [`nodejs`](./nodejs) | `nodejs18`, `nodejs19`, `nodejs20`, `nodejs21`, `nodejs22`, `nodejs23`, `nodejs24`, `nodejs25`, `nodejs26` | `amd64`, `arm64`, `ppc64le` | Node.js |
| [`python`](./python) | `python3.9`, `python3.10`, `python3.11`, `python3.12`, `python3.13`, `python3.14`, `python3.15` | All | Python |
| [`rust`](./rust) | `rust1` | All | Rust |
| [`steamcmd`](./steamcmd) | `steamcmd_debian`, `steamcmd_ubuntu`, `steamcmd_dotnet`, `steamcmd_proton`, `steamcmd_sniper` | `amd64` | For Steam game servers |
| [`wine`](./wine) | `wine_stable`, `wine_staging`, `wine_devel` | `amd64` | For Windows game servers |

Of the Java images, Temurin is also built for `ppc64le`, and Shenandoah from Java 17 on for all four platforms.

## How the images are built

Everything starts from a base image. It carries what the other images share: the packages, the `container` user, `dumb-init` and the entrypoint. When a server starts, the entrypoint runs the scripts in `/entrypoint.d/`, fills each `{{VARIABLE}}` in `STARTUP` with the matching environment variable and runs the result.

The other images build on that:

- **Runtime images** take the runtime from its official upstream image and copy it onto `base_debian`, together with a script for `/entrypoint.d/` that prints the version. They install no packages of their own, and the version comes in as a build argument, so a single Dockerfile covers every version.
- **Installer images** are built on the base image of the same name. They run as `root` and have no entrypoint, since installation scripts are started with their own command. The Debian and Ubuntu installers come with [`steamcmd-install`](./installers/scripts/steamcmd-install), which installs SteamCMD and the app set in `SRCDS_APPID` and reports a failed installation. The installation script of a Steam game can be that one command.
- **The SteamCMD images** are built on `base_debian` and `base_ubuntu`. They add the 32-bit libraries that Steam game servers need and a script that updates the server through SteamCMD before it starts. The .NET and Proton images add the .NET runtimes and GE-Proton to `steamcmd_debian`, and the Sniper image is Valve's Steam Runtime 3 with the same entrypoint.
- **The Wine images** are built on `steamcmd_debian`, because most Windows game servers are installed and updated through SteamCMD. They add Wine from the WineHQ repository, with the branch as a build argument, and Winetricks. Their script starts a virtual display and installs what `WINETRICKS_RUN` lists.

Where several Dockerfiles share files, as in `base`, `installers`, `java` and `steamcmd`, each Dockerfile has its own subdirectory and the directory above it is the build context.

The [workflow](./.github/workflows/build.yml) builds the base images first, and `steamcmd_debian` before the .NET, Proton and Wine images. Every job builds its image, starts it once to make sure it works and then pushes it.

To build an image yourself, run the commands from the root of the repository. The base image comes first, because the other images are built on it:

```bash
docker buildx build -f base/debian/Dockerfile -t ghcr.io/calagopus/oci-images:base_debian base
docker buildx build --build-arg JAVA_VERSION=21 -f java/temurin/Dockerfile -t ghcr.io/calagopus/oci-images:java21_temurin java
```

## Maintaining

| Change | Where |
| :--- | :--- |
| Add or remove a package | The Dockerfile of the base image |
| Add or remove a version | The `matrix` of the job in the workflow, and the table in the README of the directory |
| Change the platforms | `PLATFORMS` in the workflow, at the top for all images or in the `env` of a job for its images, and the tables in the READMEs |
| Change how servers are started | `base/entrypoint.sh` |
| Add a script for installation scripts | `installers/scripts` |
| Add a runtime | A new directory with a Dockerfile, an `entrypoint.d` script and a README, plus a job and the directory in both `paths` lists of the workflow |

Every `FROM` line names its platform with `--platform=$TARGETOS/$TARGETARCH`. The only exception is the first stage of `java/shenandoah`, which downloads its JDK on the build platform because the upstream image only exists for `linux/amd64`.

## License

See [LICENSE](https://github.com/calagopus/oci-images/blob/main/LICENSE).

## Star History

![Star History Chart](https://api.star-history.com/chart?repos=calagopus/oci-images&type=date&legend=top-left&sealed_token=B2O-QGHUHAa_2R6TXAtmVmA-ASHkIyhBD3Rm6jlD9mOeO9XJsHW0uBvsZ-5zINucUHJPH5c29w8c7lL_2Kr7tb5770-KK58lG2pGrET0ksegRMrP1IEbft05EdOtyO6RAUCo1FCK5gnNscF6lwXhRp5LLQd08n2sZgUisdnct1irxGRvQmzUx9o-Bk4o)
