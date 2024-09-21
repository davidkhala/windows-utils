# Install

## For Desktop
Install by Visual Studio installer wizard
> [As of Visual Studio 2022 version 17.6, the vcpkg C/C++ package manager is included as an installable component for the C++ Desktop and C++ Gaming workloads](https://devblogs.microsoft.com/cppblog/vcpkg-is-now-included-with-visual-studio/)
- `$env:VCPKG_ROOT="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\vcpkg"` for [use it in rust](https://docs.rs/vcpkg/latest/vcpkg/#static-vs-dynamic-linking)
## Build from Source
[vcpkg.yaml](https://github.com/davidkhala/windows-utils/blob/master/.github/workflows/vcpkg.yaml) give an example of
- build it from cloning open source repository
- publish the output binary to [Github Release of this repository](https://github.com/davidkhala/windows-utils/releases)
