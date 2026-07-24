$ErrorActionPreference = "Stop"


function Download {
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
}
function Install-ODBC {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )
    Download -Version $Version
    $outputPath = "$PWD\msodbcsql_$Version.msi"


    $p = Start-Process msiexec.exe -Wait -PassThru -ArgumentList `
        '/i', "`"$outputPath`"", '/qn', '/norestart', 'IACCEPTMSODBCSQLLICENSETERMS=YES'
    if ($p.ExitCode -notin 0, 3010) {
        throw "ODBC installation Failed. Exit with code $($p.ExitCode)"
    }

    Remove-Item $outputPath
}

function Test-ODBC {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )

    $driverName = if ($Version -eq "18") {
        "ODBC Driver 18 for SQL Server"
    }
    else {
        "ODBC Driver 17 for SQL Server"
    }

    Get-OdbcDriver -Name $driverName -Platform "64-bit"
}

function Uninstall-ODBC {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )
    Download -Version $Version
    $outputPath = "$PWD\msodbcsql_$Version.msi"
    $p = Start-Process msiexec.exe -Wait -PassThru -ArgumentList `
        '/x', "`"$outputPath`"", '/qn', '/norestart'
    if ($p.ExitCode -notin 0, 3010) {
        throw "ODBC uninstallation Failed. Exit with code $($p.ExitCode)"
    }
    Remove-Item $outputPath
}
function Test{
    Install-ODBC

    Test-ODBC
    Uninstall-ODBC
    Test-ODBC
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}