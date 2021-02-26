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

function Use-RemoteSigned {
    # 改为RemoteSigned 执行策略，以允许执行PowerShell脚本
    # 否则在Restricted策略情况下，不允许执行脚本
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
    
}
