# Wine images

For Windows game servers. The images add Wine from the WineHQ repository and Winetricks to `steamcmd_debian`, so the server can also be updated through SteamCMD.

| Tag | WineHQ package | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `wine_stable` | `winehq-stable` | `ghcr.io/calagopus/oci-images:wine_stable` | Yes | No | No | No |
| `wine_staging` | `winehq-staging` | `ghcr.io/calagopus/oci-images:wine_staging` | Yes | No | No | No |
| `wine_devel` | `winehq-devel` | `ghcr.io/calagopus/oci-images:wine_devel` | Yes | No | No | No |
| `wine_8` | `winehq-stable` 8.0 | `ghcr.io/calagopus/oci-images:wine_8` | Yes | No | No | No |
| `wine_9` | `winehq-stable` 9.0 | `ghcr.io/calagopus/oci-images:wine_9` | Yes | No | No | No |
| `wine_10` | `winehq-stable` 10.0 | `ghcr.io/calagopus/oci-images:wine_10` | Yes | No | No | No |
| `wine_11` | `winehq-stable` 11.0 | `ghcr.io/calagopus/oci-images:wine_11` | Yes | No | No | No |

`wine_stable` always has the newest stable Wine. The numbered tags stay on their version, with the newest point release WineHQ publishes for it, so a server can stay on a Wine version that works for it.

WineHQ only publishes its packages for x86, so there are only `amd64` images.

## Variables

Before the server starts, [`wine.sh`](./entrypoint.d/wine.sh) starts a virtual display and installs what `WINETRICKS_RUN` lists. The variables of the [SteamCMD image](../steamcmd) work here too.

| Variable | Default | Meaning |
| :--- | :--- | :--- |
| `XVFB` | `1` | `1` starts a virtual display on `:0`. |
| `DISPLAY_WIDTH`, `DISPLAY_HEIGHT`, `DISPLAY_DEPTH` | `1024`, `768`, `16` | The size and colour depth of the virtual display. |
| `WINETRICKS_RUN` | | What to install, separated by spaces. `mono` and `gecko` install Wine Mono and Wine Gecko, everything else is passed to Winetricks. |
| `WINEPREFIX` | `/home/container/.wine` | Where Wine keeps its files. |
| `WINEDLLOVERRIDES` | `mscoree,mshtml=` | Keeps Wine from asking for Mono and Gecko. |

## Build

Run from the root of the repository. `WINE_BRANCH` is `stable`, `staging`, `devel` or a stable version such as `10`:

```bash
docker buildx build --build-arg WINE_BRANCH=stable -t ghcr.io/calagopus/oci-images:wine_stable wine
```
