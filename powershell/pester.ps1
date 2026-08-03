$ErrorActionPreference = "Stop"

function Update {
    # See in https://pester.dev/docs/introduction/installation/#windows
    if (Get-Command Install-PSResource -ErrorAction SilentlyContinue) {
        # PowerShell 7 (PSResourceGet): no NuGet provider bootstrap needed.
        Install-PSResource -Name Pester -TrustRepository -Reinstall
    }
    else {
        # Windows PowerShell 5.1: PowerShellGet needs the NuGet provider (>= 2.8.5.201) to talk to NuGet-based repos.
        # PowerShellGet 需要使用 NuGet 提供程序“2.8.5.201”或更高版本来与基于 NuGet 的存储库交互
        [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
        # side-by-side installation, for Pester 3.4.0 built-in on windows systems (10+, 2016+)
        Install-Module -Name Pester -Force -SkipPublisherCheck
        Update-Module -Name Pester
    }
}
function Uninstall {
    # run as administrator
    $module = "C:\Program Files\WindowsPowerShell\Modules\Pester"
    & takeown.exe /F $module /A /R
    & icacls.exe $module /reset
    & icacls.exe $module /grant "*S-1-5-32-544:F" /inheritance:d /T
    Remove-Item -Path $module -Recurse -Force -Confirm:$false
}
function Version {
    Get-Module Pester -ListAvailable
}
function Log {
    Write-Host $args
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
