# Go images

Go, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `go1.24` | `golang:1.24-trixie` | `ghcr.io/calagopus/oci-images:go1.24` | Yes | Yes | Yes | Yes |
| `go1.25` | `golang:1.25-trixie` | `ghcr.io/calagopus/oci-images:go1.25` | Yes | Yes | Yes | Yes |
| `go1.26` | `golang:1.26-trixie` | `ghcr.io/calagopus/oci-images:go1.26` | Yes | Yes | Yes | Yes |
| `go1.27` | `golang:1.27-trixie` | `ghcr.io/calagopus/oci-images:go1.27` | Yes | Yes | Yes | Yes |

`GOPATH` is `/home/container/go`, so modules and installed tools stay with the server. `GOTOOLCHAIN` is `local`, so Go does not download another toolchain.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg GO_VERSION=1.27 -t ghcr.io/calagopus/oci-images:go1.27 go
```
