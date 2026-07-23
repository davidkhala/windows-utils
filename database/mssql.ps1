$ErrorActionPreference = "Stop"



function Install-ODBC {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )

    $downloadUrls = @{
        "18" = "https://go.microsoft.com/fwlink/?linkid=2358430"
        "17" = "https://go.microsoft.com/fwlink/?linkid=2361646"
    }

    $downloadUrl = $downloadUrls[$Version]
    $outputPath = "$PWD\msodbcsql_$Version.msi"

    Invoke-WebRequest -Uri $downloadUrl -OutFile $outputPath
    Start-Process msiexec.exe -Wait -ArgumentList "/i `"$outputPath`" /norestart"

    # Optional: Clean up the MSI after installation
    Remove-Item $outputPath -ErrorAction SilentlyContinue
}

function Test-ODBC {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )

    $driverName = if ($Version -eq "18") {
        "ODBC Driver 18 for SQL Server"
    } else {
        "ODBC Driver 17 for SQL Server"
    }

    $installed = $null -ne (Get-OdbcDriver -Name $driverName -ErrorAction SilentlyContinue)
    exit [int](-not $installed)
}


if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}