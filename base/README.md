# Base images

The images everything else is built on. Each one carries the shared packages, the `container` user, `dumb-init` and the [entrypoint](./entrypoint.sh).

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `base_alpine` | `alpine:3.24` | `ghcr.io/calagopus/oci-images:base_alpine` | Yes | Yes | Yes | Yes |
| `base_debian` | `debian:trixie-slim` | `ghcr.io/calagopus/oci-images:base_debian` | Yes | Yes | Yes | Yes |
| `base_ubuntu` | `ubuntu:26.04` | `ghcr.io/calagopus/oci-images:base_ubuntu` | Yes | Yes | Yes | Yes |

On `riscv64`, Ubuntu 26.04 only runs on CPUs with the RVA23 profile. Debian and Alpine have no such requirement.

## Build

Run from the root of the repository:

```bash
docker buildx build -f base/debian/Dockerfile -t ghcr.io/calagopus/oci-images:base_debian base
```
