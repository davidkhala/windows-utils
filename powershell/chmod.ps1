$ErrorActionPreference = "Stop"
function Protect-PrivKey() {
  # Source: https://stackoverflow.com/a/43317244
  # equivalent to chmod 400
  param(
    [string] $Path
  )

  # Reset to remove explict permissions
  icacls.exe $Path /reset
  # Give current user explicit read-permission
  icacls.exe $Path /GRANT:R "$($env:USERNAME):(R)"
  # Disable inheritance and remove inherited permissions
  icacls.exe $Path /inheritance:r

}
if ($args.Count -gt 0) {
  Invoke-Expression ($args -join " ")
}