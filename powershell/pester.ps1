$ErrorActionPreference = "Stop"
function Update {
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force # PowerShellGet 需要使用 NuGet 提供程序“2.8.5.201”或更高版本来与基于 NuGet 的存储库交互
    # See in https://pester.dev/docs/introduction/installation/#windows
    Install-Module -Name Pester -Force -SkipPublisherCheck # side-by-side installation, for Petest 3.4.0 built-in on windows systems (10+, 2016+)
    Update-Module -Name Pester
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
    (Get-Module Pester).Version
}
function Log {
    Write-Host $args
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
