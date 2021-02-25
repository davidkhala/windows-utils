# TODO Test
function Install-Docker {
    param (
        [ValidateSet('Linux', 'NT')]
        [Parameter(Position = 0)]
        [string]$Kernal = 'NT'
        
        
    )
    Install-Module DockerProvider
    Install-Package Docker -ProviderName DockerProvider
    if ($Kernal = ='Linux') {
        # -RequiredVersion preview
        Remove-Service -Name Docker ## TODO powershell 7 only
        New-Service -Name Docker-Linux -BinaryPathName "C:\Program Files\Docker\dockerd.exe --run-service --experimental"

    }
    
    
}
function Uninstall {
    param (
        [ValidateSet('Linux', 'NT')]
        [Parameter(Position = 0)]
        [string]$Kernal = 'NT'
    )
    
    Uninstall-Package Docker -ProviderName DockerProvider
    
}