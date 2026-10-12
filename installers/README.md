# Installer images

The images that server installation scripts run in. They run as `root`, have no entrypoint and add `file`, `jq`, `unzip`, `wget` and `zip` to their base image.

| Tag | Built on | Image | `steamcmd-install` | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `installers_alpine` | `base_alpine` | `ghcr.io/calagopus/oci-images:installers_alpine` | No | Yes | Yes | Yes | Yes |
| `installers_debian` | `base_debian` | `ghcr.io/calagopus/oci-images:installers_debian` | Yes | Yes | Yes | Yes | Yes |
| `installers_ubuntu` | `base_ubuntu` | `ghcr.io/calagopus/oci-images:installers_ubuntu` | Yes | Yes | Yes | Yes | Yes |

On `amd64`, the Debian and Ubuntu installers also have `lib32gcc-s1`, which SteamCMD needs.

## steamcmd-install

[`steamcmd-install`](./scripts/steamcmd-install) installs SteamCMD into `/mnt/server/steamcmd` and the Steam app into `/mnt/server`. If the download or the installation fails, it writes the reason to `INSTALL_STATUS_FILE`, so the installation is marked as failed.

SteamCMD is a 32-bit x86 program, so the script only works on `amd64`. On the other platforms it stops with a message.

The installation script of a Steam game can be this:

```bash
#!/bin/bash
steamcmd-install
```

| Variable | Meaning |
| :--- | :--- |
| `SRCDS_APPID` | The Steam app to install. Required. |
| `STEAM_USER`, `STEAM_PASS`, `STEAM_AUTH` | The Steam login. Without a user or a password, the login is anonymous. |
| `WINDOWS_INSTALL` | `1` installs the Windows version of the app. |
| `SRCDS_BETAID`, `SRCDS_BETAPASS` | The beta branch and its password. |
| `HLDS_GAME` | The mod to install for app `90`. |
| `INSTALL_FLAGS` | Extra arguments for SteamCMD. |

## Build

Run from the root of the repository:

```bash
docker buildx build -f installers/debian/Dockerfile -t ghcr.io/calagopus/oci-images:installers_debian installers
```
