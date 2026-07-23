$ErrorActionPreference = "Stop"

function Install {
    $version = "4.70.1"
    $installDir = "$env:ProgramFiles\confluent"
    $exePath = "$installDir\confluent.exe"
    $downloadUrl = "https://github.com/confluentinc/cli/releases/download/v${version}/confluent_${version}_windows_amd64.exe"

    if (-not (Test-Path $installDir)) {
        New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    }

    Invoke-WebRequest -Uri $downloadUrl -OutFile $exePath -UseBasicParsing

    Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/davidkhala/windows-utils/refs/heads/master/powershell/path.ps1" -UseBasicParsing).Content
    Add-Path -Path $installDir -Container Machine

    & $exePath version
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}