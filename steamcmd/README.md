# SteamCMD image

For game servers that are installed and updated through SteamCMD. It adds the 32-bit libraries those servers need to `base_debian`.

| Tag | Built on | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `steamcmd_debian` | `base_debian` | `ghcr.io/calagopus/oci-images:steamcmd_debian` | Yes | No | No | No |

SteamCMD is a 32-bit x86 program, so there is only an `amd64` image.

## Update on start

Before the server starts, [`steamcmd.sh`](./entrypoint.d/steamcmd.sh) updates it with the SteamCMD in `/home/container/steamcmd`. The image does not contain SteamCMD itself. The installation script puts it there, for example with [`steamcmd-install`](../installers).

| Variable | Meaning |
| :--- | :--- |
| `AUTO_UPDATE` | The update runs when this is `1` or not set. |
| `SRCDS_APPID` | The Steam app to update. Without it, the update is skipped. |
| `STEAM_USER`, `STEAM_PASS`, `STEAM_AUTH` | The Steam login. Without a user, the login is anonymous. |
| `WINDOWS_INSTALL` | `1` updates the Windows version of the app. |
| `SRCDS_BETAID`, `SRCDS_BETAPASS` | The beta branch and its password. |
| `HLDS_GAME` | The mod to install for app `90`. |
| `INSTALL_FLAGS` | Extra arguments for SteamCMD. |
| `VALIDATE` | `1` validates the server files. |

## Build

Run from the root of the repository:

```bash
docker buildx build -f steamcmd/debian/Dockerfile -t ghcr.io/calagopus/oci-images:steamcmd_debian steamcmd
```
