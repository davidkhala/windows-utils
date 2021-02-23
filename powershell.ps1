function Get-WebFile {
    # Download file from Uri to local Path
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]$Uri,
        [Parameter(Position = 1)]
        [string]$Path
    )

    Invoke-WebRequest -Uri $Uri -OutFile $Path -UseBasicParsing
}
