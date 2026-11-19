# PHP images

PHP (CLI and FPM), Composer and Nginx, copied from the official images onto `base_debian` with common extensions pre-installed (`bcmath`, `exif`, `gd`, `gmp`, `intl`, `mysqli`, `opcache`, `pcntl`, `pdo_mysql`, `pdo_pgsql`, `redis`, `sockets`, `zip`).

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `php8.1` | `php:8.1-fpm-trixie` | `ghcr.io/calagopus/oci-images:php8.1`, `calagopus/oci-images:php8.1` | ✅ | ✅ | ✅ | ❌ |
| `php8.2` | `php:8.2-fpm-trixie` | `ghcr.io/calagopus/oci-images:php8.2`, `calagopus/oci-images:php8.2` | ✅ | ✅ | ✅ | ❌ |
| `php8.3` | `php:8.3-fpm-trixie` | `ghcr.io/calagopus/oci-images:php8.3`, `calagopus/oci-images:php8.3` | ✅ | ✅ | ✅ | ❌ |
| `php8.4` | `php:8.4-fpm-trixie` | `ghcr.io/calagopus/oci-images:php8.4`, `calagopus/oci-images:php8.4` | ✅ | ✅ | ✅ | ❌ |
| `php8.5` | `php:8.5-fpm-trixie` | `ghcr.io/calagopus/oci-images:php8.5`, `calagopus/oci-images:php8.5` | ✅ | ✅ | ✅ | ❌ |

PHP 8.1 is end of life and gets no security fixes.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg PHP_VERSION=8.4 -t calagopus/oci-images:php8.4 php
```
