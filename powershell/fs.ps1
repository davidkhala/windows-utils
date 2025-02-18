$ErrorActionPreference = "Stop"
function Remove-RF {
    # Remove File or Direcotry recursively with Force attitute, and skip if not exist
    param (
        [string]$Path
    )
    Remove-Item -Recurse -Force -ErrorAction Ignore "$Path"
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}