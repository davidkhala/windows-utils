$ErrorActionPreference = "Stop"
function Show-Env {
    # Show cuurrent environment variables
    Get-ChildItem Env:
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}