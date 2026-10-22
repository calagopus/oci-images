# SteamCMD images

For game servers that are installed and updated through SteamCMD.

| Tag | Built on | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `steamcmd_debian` | `base_debian` | `ghcr.io/calagopus/oci-images:steamcmd_debian` | Yes | No | No | No |
| `steamcmd_ubuntu` | `base_ubuntu` | `ghcr.io/calagopus/oci-images:steamcmd_ubuntu` | Yes | No | No | No |
| `steamcmd_dotnet` | `steamcmd_debian` | `ghcr.io/calagopus/oci-images:steamcmd_dotnet` | Yes | No | No | No |
| `steamcmd_proton` | `steamcmd_debian` | `ghcr.io/calagopus/oci-images:steamcmd_proton` | Yes | No | No | No |
| `steamcmd_sniper` | `registry.gitlab.steamos.cloud/steamrt/sniper/platform` | `ghcr.io/calagopus/oci-images:steamcmd_sniper` | Yes | No | No | No |

SteamCMD is a 32-bit x86 program, so there are only `amd64` images.

- **Debian and Ubuntu** add the 32-bit libraries that Steam game servers need. Ubuntu has newer system libraries, for servers that need them.
- **.NET** adds the .NET 8, 9 and 10 runtimes with ASP.NET Core, for servers written in .NET. It has no .NET SDK.
- **Proton** adds the latest GE-Proton for Windows game servers, which are started with `proton run`, and `rcon`.
- **Sniper** is Valve's Steam Runtime 3, which Counter-Strike 2 is built for, with the same entrypoint as the other images.

## Update on start

Before the server starts, [`steamcmd.sh`](./entrypoint.d/steamcmd.sh) updates it with the SteamCMD in `/home/container/steamcmd`. The images do not contain SteamCMD itself. The installation script puts it there, for example with [`steamcmd-install`](../installers).

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

In the Proton image, [`proton.sh`](./proton/entrypoint.d/proton.sh) also points `STEAM_COMPAT_DATA_PATH` to `/home/container/.steam/steam/steamapps/compatdata/<SRCDS_APPID>`, so the Proton prefix stays with the server.

## Build

Run from the root of the repository:

```bash
docker buildx build -f steamcmd/debian/Dockerfile -t ghcr.io/calagopus/oci-images:steamcmd_debian steamcmd
```
