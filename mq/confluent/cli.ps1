$ErrorActionPreference = "Stop"

function Install {

    $downloadUrl = "https://github.com/confluentinc/cli/releases/download/v4.28.0/confluent_4.28.0_windows_amd64.exe"
    # Asume chocolatey is installed and available in the PATH
    Invoke-WebRequest -Uri $downloadUrl -OutFile "C:\ProgramData\chocolatey\bin\confluent.exe"
    
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}