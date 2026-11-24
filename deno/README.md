# Deno images

Deno, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `deno1` | `denoland/deno:bin-1.46.3` | `ghcr.io/calagopus/oci-images:deno1`, `calagopus/oci-images:deno1` | ✅ | ✅ | ❌ | ❌ |
| `deno2` | `denoland/deno:bin` | `ghcr.io/calagopus/oci-images:deno2`, `calagopus/oci-images:deno2` | ✅ | ✅ | ❌ | ❌ |

The official Deno image only exists for `amd64` and `arm64`.

Deno 1 is end of life and 1.46.3 is its last release. `deno2` has the newest Deno 2 release (it stays on the last one once Deno 3 is out).

Deno keeps downloaded modules in `/home/container/.cache/deno` and installed scripts in `/home/container/.deno`, so they stay with the server, and the commands of installed scripts are in the `PATH`.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg DENO_VERSION=2 -t calagopus/oci-images:deno2 deno
docker buildx build --build-arg DENO_VERSION=1 --build-arg DENO_TAG=bin-1.46.3 -t calagopus/oci-images:deno1 deno
```
