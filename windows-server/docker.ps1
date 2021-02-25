# TODO Test
function Install-Docker {
    param (
        [ValidateSet('Linux', 'NT')]
        [Parameter(Position = 0)]
        [string]$Kernal = 'NT'
        
        
    )
    try {
        Install-Module DockerProvider
        Install-Package Docker -ProviderName DockerProvider
        if ($Kernal = ='Linux') {
            
            if (Get-Service Docker -ErrorAction SilentlyContinue) {
                sc.exe delete Docker # Remove-Service -Name Docker
            }
            
            New-Service -Name Docker-Linux -BinaryPathName "C:\Program Files\Docker\dockerd.exe --run-service --experimental"
    
        }    
    }
    catch {
        $_
    }
    
}
function Uninstall {
    
    Uninstall-Package Docker -ProviderName DockerProvider
    
}