# Node.js images

Node.js, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `nodejs18` | `node:18-slim` | `ghcr.io/calagopus/oci-images:nodejs18` | Yes | Yes | Yes | No |
| `nodejs19` | `node:19-slim` | `ghcr.io/calagopus/oci-images:nodejs19` | Yes | Yes | Yes | No |
| `nodejs20` | `node:20-slim` | `ghcr.io/calagopus/oci-images:nodejs20` | Yes | Yes | Yes | No |
| `nodejs21` | `node:21-slim` | `ghcr.io/calagopus/oci-images:nodejs21` | Yes | Yes | Yes | No |
| `nodejs22` | `node:22-slim` | `ghcr.io/calagopus/oci-images:nodejs22` | Yes | Yes | Yes | No |
| `nodejs23` | `node:23-slim` | `ghcr.io/calagopus/oci-images:nodejs23` | Yes | Yes | Yes | No |
| `nodejs24` | `node:24-slim` | `ghcr.io/calagopus/oci-images:nodejs24` | Yes | Yes | Yes | No |
| `nodejs25` | `node:25-slim` | `ghcr.io/calagopus/oci-images:nodejs25` | Yes | Yes | Yes | No |
| `nodejs26` | `node:26-slim` | `ghcr.io/calagopus/oci-images:nodejs26` | Yes | Yes | Yes | No |

There is no official Node.js image for `riscv64`. Node.js 25 and newer no longer include Corepack, and the official Node.js 26 image no longer includes Yarn.

Node.js 18, 19, 20, 21, 23 and 25 are end of life and get no security fixes.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg NODE_VERSION=24 -t ghcr.io/calagopus/oci-images:nodejs24 nodejs
```
