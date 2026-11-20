# PHP images

PHP and Composer, copied from the official images onto `base_debian`. The images also have the extensions `bcmath`, `exif`, `gd`, `gmp`, `intl`, `mysqli`, `opcache`, `pcntl`, `pdo_mysql`, `pdo_pgsql`, `redis`, `sockets` and `zip`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `php8.1` | `php:8.1-cli-trixie` | `ghcr.io/calagopus/oci-images:php8.1`, `calagopus/oci-images:php8.1` | ✅ | ✅ | ✅ | ✅ |
| `php8.2` | `php:8.2-cli-trixie` | `ghcr.io/calagopus/oci-images:php8.2`, `calagopus/oci-images:php8.2` | ✅ | ✅ | ✅ | ✅ |
| `php8.3` | `php:8.3-cli-trixie` | `ghcr.io/calagopus/oci-images:php8.3`, `calagopus/oci-images:php8.3` | ✅ | ✅ | ✅ | ✅ |
| `php8.4` | `php:8.4-cli-trixie` | `ghcr.io/calagopus/oci-images:php8.4`, `calagopus/oci-images:php8.4` | ✅ | ✅ | ✅ | ✅ |
| `php8.5` | `php:8.5-cli-trixie` | `ghcr.io/calagopus/oci-images:php8.5`, `calagopus/oci-images:php8.5` | ✅ | ✅ | ✅ | ✅ |

PHP 8.1 is end of life and gets no security fixes. PHP 8.2 gets security fixes until 31 December 2026.

`php.ini` is the production configuration of PHP. Composer keeps its files in `/home/container/.composer`, and the commands of global Composer packages are in the `PATH`.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg PHP_VERSION=8.5 -t calagopus/oci-images:php8.5 php
```
