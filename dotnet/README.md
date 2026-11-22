# .NET images

The .NET SDK, copied from the official image onto `base_debian`.

| Tag | Built from | Image | `amd64` | `arm64` | `ppc64le` | `riscv64` |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| `dotnet7` | `mcr.microsoft.com/dotnet/sdk:7.0` | `ghcr.io/calagopus/oci-images:dotnet7`, `calagopus/oci-images:dotnet7` | ✅ | ✅ | ❌ | ❌ |
| `dotnet8` | `mcr.microsoft.com/dotnet/sdk:8.0` | `ghcr.io/calagopus/oci-images:dotnet8`, `calagopus/oci-images:dotnet8` | ✅ | ✅ | ❌ | ❌ |
| `dotnet9` | `mcr.microsoft.com/dotnet/sdk:9.0` | `ghcr.io/calagopus/oci-images:dotnet9`, `calagopus/oci-images:dotnet9` | ✅ | ✅ | ❌ | ❌ |
| `dotnet10` | `mcr.microsoft.com/dotnet/sdk:10.0` | `ghcr.io/calagopus/oci-images:dotnet10`, `calagopus/oci-images:dotnet10` | ✅ | ✅ | ❌ | ❌ |

The official .NET SDK image only exists for `amd64` and `arm64`. .NET 7, 8 and 9 are end of life and get no security fixes.

`DOTNET_CLI_TELEMETRY_OPTOUT` is `1`, and the commands of global .NET tools in `/home/container/.dotnet/tools` are in the `PATH`.

## Build

Run from the root of the repository:

```bash
docker buildx build --build-arg DOTNET_VERSION=10 -t calagopus/oci-images:dotnet10 dotnet
```
