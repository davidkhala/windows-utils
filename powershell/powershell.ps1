$ErrorActionPreference = "Stop"

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
function Modernize-TLS {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
}

function Install-Core {
    winget install --id Microsoft.PowerShell --source winget
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
