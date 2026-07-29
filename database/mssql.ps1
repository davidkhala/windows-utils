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

function Download-BCP {
    $outputPath = "$PWD\MsSqlCmdLnUtils.msi"

    Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=2370127" -OutFile $outputPath
}

function Resolve-BCPDirectory {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )

    $versionFolder = "$($Version)0"
    $command = Get-Command bcp -ErrorAction SilentlyContinue
    if ($command -and $command.Source -like "*\ODBC\$versionFolder\*") {
        return Split-Path $command.Source
    }

    $roots = @($env:ProgramFiles, ${env:ProgramFiles(x86)}) | Where-Object { $_ } | Select-Object -Unique
    foreach ($root in $roots) {
        $odbcRoot = Join-Path $root "Microsoft SQL Server\Client SDK\ODBC"
        if (-not (Test-Path $odbcRoot)) {
            continue
        }

        $candidates = Get-ChildItem -Path $odbcRoot -Filter bcp.exe -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -like "*\ODBC\$versionFolder\*" }
        if ($candidates) {
            return $candidates[0].DirectoryName
        }
    }

    throw "Unable to locate bcp.exe for ODBC version $Version."
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

function Install-BCP {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )

    Install-ODBC -Version $Version
    Download-BCP
    $outputPath = "$PWD\MsSqlCmdLnUtils.msi"

    $p = Start-Process msiexec.exe -Wait -PassThru -ArgumentList `
        '/i', "`"$outputPath`"", 'IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES', '/qn', '/norestart'
    if ($p.ExitCode -notin 0, 3010) {
        throw "BCP installation failed. Exit with code $($p.ExitCode)"
    }

    Remove-Item $outputPath

    . "$PSScriptRoot\..\powershell\path.ps1"
    Add-Path -Path (Resolve-BCPDirectory -Version $Version) -Container Machine
}

function Test-BCP {
    param(
        [ValidateSet("17", "18")]
        [string]$Version = "18"
    )

    . "$PSScriptRoot\..\powershell\path.ps1"
    $directory = Resolve-BCPDirectory -Version $Version
    Add-Path -Path $directory -Container Session
    & (Join-Path $directory "bcp.exe") -v
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


if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
