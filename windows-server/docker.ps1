function Install-Docker {
    param (
        [ValidateSet('Linux', 'NT')]
        [Parameter(Position = 0)]
        [string]$Kernal = 'NT'
        
        
    )
    try {
        Install-Module DockerProvider -Force
        Install-Package Docker -ProviderName DockerProvider -Force
        if ($Kernal -eq 'Linux') {
            
            if (Get-Service Docker -ErrorAction SilentlyContinue) {
                sc.exe delete Docker # Remove-Service -Name Docker
            }
            
            New-Service -Name Docker -BinaryPathName "C:\Program Files\Docker\dockerd.exe --run-service --experimental" -StartupType Automatic
            Start-Service Docker
        }    
    }
    catch {
        $_
    }
    
}
function Uninstall-Docker {
    
    Uninstall-Package Docker -ProviderName DockerProvider
    Uninstall-Module DockerProvider
}