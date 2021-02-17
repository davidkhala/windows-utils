## Install Docker
Reference: https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server
1. Open an elevated PowerShell session and install the Docker-Microsoft PackageManagement Provider from the PowerShell Gallery.
    - `Install-Module -Name DockerMsftProvider -Repository PSGallery -Force`
      > If you're prompted to install the NuGet provider, type `Y` to install it as well.
1. Use the PackageManagement PowerShell module to install the latest version of Docker.
    - `Install-Package -Name docker -ProviderName DockerMsftProvider`
      > When PowerShell asks you whether to trust the package source 'DockerDefault', type `A` to continue the installation.
1. `Restart-Computer -Force`

## Trouble shoot
- **Run as administrator**
- Hyper-V status check  
    - PowerShell: `> Install-WindowsFeature -Name Hyper-V -IncludeManagementTools`
- Docker Daemon status
    - PowerShell: `> Start-Service Docker`
- `docker pull mcr.microsoft.com/windows/nanoserver:1903`
    - If you see an error message that says `no matching manifest for <...> in the manifest list entries`, make sure Docker isn't configured to run Linux containers.

