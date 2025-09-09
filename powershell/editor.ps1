$ErrorActionPreference = "Stop"

function Install-JQ {
  winget install jqlang.jq
}
if ($args.Count -gt 0) {
  Invoke-Expression ($args -join " ")
}
