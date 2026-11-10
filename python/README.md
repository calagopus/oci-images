# Python images

Python, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `python3.9` | `python:3.9-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.9`, `calagopus/oci-images:python3.9` | ✅ | ✅ | ✅ | ✅ |
| `python3.10` | `python:3.10-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.10`, `calagopus/oci-images:python3.10` | ✅ | ✅ | ✅ | ✅ |
| `python3.11` | `python:3.11-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.11`, `calagopus/oci-images:python3.11` | ✅ | ✅ | ✅ | ✅ |
| `python3.12` | `python:3.12-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.12`, `calagopus/oci-images:python3.12` | ✅ | ✅ | ✅ | ✅ |
| `python3.13` | `python:3.13-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.13`, `calagopus/oci-images:python3.13` | ✅ | ✅ | ✅ | ✅ |
| `python3.14` | `python:3.14-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.14`, `calagopus/oci-images:python3.14` | ✅ | ✅ | ✅ | ✅ |
| `python3.15` | `python:3.15-slim-trixie` | `ghcr.io/calagopus/oci-images:python3.15`, `calagopus/oci-images:python3.15` | ✅ | ✅ | ✅ | ✅ |

Python 3.9 and 3.10 are end of life and get no security fixes.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg PYTHON_VERSION=3.14 -t ghcr.io/calagopus/oci-images:python3.14 python
```
