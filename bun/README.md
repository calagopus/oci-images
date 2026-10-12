# Bun image

Bun, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `bun1` | `oven/bun:1` | `ghcr.io/calagopus/oci-images:bun1` | Yes | Yes | No | No |

The official Bun image only exists for `amd64` and `arm64`.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg BUN_VERSION=1 -t ghcr.io/calagopus/oci-images:bun1 bun
```
