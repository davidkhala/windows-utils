$ErrorActionPreference = "Stop"
function Get-WebFile {
    # Download file from Uri to local Path
    param (
        [string]$Uri,
        [string]$Path
    )

    
    if (!$Path) { 
        $Path = (Split-Path $Uri -Leaf)
    }
    
    Invoke-WebRequest -Uri $Uri -OutFile $Path -UseBasicParsing
}
function Find {
    param (
        [string]$Cmd
    )
    Get-Command $Cmd
}
function Remove-RF {
    # Remove File or Direcotry recursively with Force attitute, and skip if not exist
    param (
        [string]$Path
    )
    Remove-Item -Recurse -Force -ErrorAction Ignore "$Path"
    
}
function Use-RemoteSigned {
    # 改为RemoteSigned 执行策略，以允许执行PowerShell脚本
    # 否则在Restricted策略情况下，不允许执行脚本
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
    
}
function Use-SUDO {
    Set-ExecutionPolicy AllSigned -Force

}
function Use-AnyScript {
    Set-ExecutionPolicy Unrestricted -Force
}
function Test-San {
    Write-Output G! github.com/davidkhala/windows-utils/powershell.ps1 has been loaded!
}
function Use-RemoteScript {
    # source远程脚本，可用于加载远程PowerShell脚本中的所有函数到当前Powershell环境中，以直接调用
    param (
        [string]$Uri
    )
    (Invoke-WebRequest -Uri $Uri -UseBasicParsing).Content | Invoke-Expression
}

function Show-Env {
    Get-ChildItem Env:
}


# below is fork of https://gist.github.com/mkropat/c1226e0cc2ca941b23a9

function Add-Path {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path,

        [ValidateSet('Machine', 'User', 'Session')]
        [string] $Container = 'Session'
    )

    if ($Container -ne 'Session') {
        $containerMapping = @{
            Machine = [EnvironmentVariableTarget]::Machine
            User    = [EnvironmentVariableTarget]::User
        }
        $containerType = $containerMapping[$Container]

        $persistedPaths = [Environment]::GetEnvironmentVariable('Path', $containerType) -split [IO.Path]::PathSeparator
        if ($persistedPaths -notcontains $Path) {
            $persistedPaths = $persistedPaths + $Path | Where-Object { $_ }
            [Environment]::SetEnvironmentVariable('Path', $persistedPaths -join [IO.Path]::PathSeparator, $containerType)
        }
    }

    $envPaths = $env:Path -split [IO.Path]::PathSeparator
    if ($envPaths -notcontains $Path) {
        $envPaths = $envPaths + $Path | Where-Object { $_ }
        $env:Path = $envPaths -join [IO.Path]::PathSeparator
    }
}

function Remove-Path {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Path,

        [ValidateSet('Machine', 'User', 'Session')]
        [string] $Container = 'Session'
    )

    if ($Container -ne 'Session') {
        $containerMapping = @{
            Machine = [EnvironmentVariableTarget]::Machine
            User    = [EnvironmentVariableTarget]::User
        }
        $containerType = $containerMapping[$Container]

        $persistedPaths = [Environment]::GetEnvironmentVariable('Path', $containerType) -split [IO.Path]::PathSeparator
        if ($persistedPaths -contains $Path) {
            $persistedPaths = $persistedPaths | Where-Object { $_ -and $_ -ne $Path }
            [Environment]::SetEnvironmentVariable('Path', $persistedPaths -join [IO.Path]::PathSeparator, $containerType)
        }
    }

    $envPaths = $env:Path -split ';'
    if ($envPaths -contains $Path) {
        $envPaths = $envPaths | Where-Object { $_ -and $_ -ne $Path }
        $env:Path = $envPaths -join ';'
    }
}

function Get-Path {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Machine', 'User')]
        [string] $Container
    )

    $containerMapping = @{
        Machine = [EnvironmentVariableTarget]::Machine
        User    = [EnvironmentVariableTarget]::User
    }
    $containerType = $containerMapping[$Container]

    [Environment]::GetEnvironmentVariable('Path', $containerType) -split ';' |
    Where-Object { $_ }
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
