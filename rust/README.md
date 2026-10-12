# Rust image

The Rust toolchain, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `rust1` | `rust:1-slim-trixie` | `ghcr.io/calagopus/oci-images:rust1` | Yes | Yes | Yes | Yes |

`CARGO_HOME` is `/home/container/.cargo`, so downloaded crates and installed tools stay with the server.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg RUST_VERSION=1 -t ghcr.io/calagopus/oci-images:rust1 rust
```
