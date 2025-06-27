$ErrorActionPreference = "Stop"
function Show-Env {
    # Show cuurrent environment variables
    Get-ChildItem Env:
}
function date {
    # Show current date and time (+00:00 timezone)
    Get-Date
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}