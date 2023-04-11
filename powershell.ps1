function Get-WebFile {
    # Download file from Uri to local Path
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$Uri,
        [Parameter(Position = 1)]
        [string]$Path
    )

    
    if (!$Path) { 
        $Path = (Split-Path $Uri -Leaf)
    }
    
    Invoke-WebRequest -Uri $Uri -OutFile $Path -UseBasicParsing
}
function Remove-RF {
    # Remove File or Direcotry recursively with Force attitute, and skip if not exist
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$Path
    )
    Remove-Item -Recurse -Force -ErrorAction Ignore "$Path"
    
}
function Use-RemoteSigned {
    # 改为RemoteSigned 执行策略，以允许执行PowerShell脚本
    # 否则在Restricted策略情况下，不允许执行脚本
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
    
}
function Invoke-RemoteScript{
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$Uri
    )
    (Invoke-WebRequest $Uri).Content | Invoke-Expression
}
function Disable-HyperV{
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
}
function Enable-HyperV{
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}
function Add-Path($Path) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", "Machine") + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
}
