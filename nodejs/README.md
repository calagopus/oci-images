# Node.js images

Node.js, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `nodejs22` | `node:22-trixie-slim` | `ghcr.io/calagopus/oci-images:nodejs22` | Yes | Yes | Yes | No |
| `nodejs24` | `node:24-trixie-slim` | `ghcr.io/calagopus/oci-images:nodejs24` | Yes | Yes | Yes | No |

There is no official Node.js image for `riscv64`.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg NODE_VERSION=24 -t ghcr.io/calagopus/oci-images:nodejs24 nodejs
```
