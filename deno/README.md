# Deno image

Deno, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `deno2` | `denoland/deno:bin` | `ghcr.io/calagopus/oci-images:deno2`, `calagopus/oci-images:deno2` | ✅ | ✅ | ❌ | ❌ |

The official Deno image only exists for `amd64` and `arm64`.

`DENO_DIR` and `DENO_INSTALL_ROOT` are `/home/container/.deno`, so downloaded modules and installed scripts stay with the server, and their commands are in the `PATH`.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg DENO_VERSION=2 -t calagopus/oci-images:deno2 deno
```
