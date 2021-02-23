# TODO Test
function Install-Docker {
    param (
        [ValidateSet('Linux', 'NT')]
        [Parameter(Position = 0)]
        [string]$Kernal = 'NT'
        
        
    )
    if ($Kernal = ='Linux') {
        # Enable Nested Virtualization if you’re running Docker Containers using Linux Virtual Machine running on Hyper-V.
        Get-VM WinContainerHost | Set-VMProcessor -ExposeVirtualizationExtensions $true
        Install-Module DockerProvider
        Install-Package Docker -ProviderName DockerProvider # -RequiredVersion preview
        [Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")

    }
    else {
        Install-Module -Name DockerMsftProvider -Repository PSGallery -Force # If you're prompted to install the NuGet provider, type `Y` to install it as well.
        Install-Package -Name docker -ProviderName DockerMsftProvider
        [Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "$null", "Machine")
        
    }
    
}
function Uninstall {
    param (
        [ValidateSet('Linux', 'NT')]
        [Parameter(Position = 0)]
        [string]$Kernal = 'NT'
    )
    if ($Kernal = ='Linux') {
        Uninstall-Package Docker -ProviderName DockerProvider
    }
    else {
        Uninstall-Package -Name docker -ProviderName DockerMSFTProvider

    }
}