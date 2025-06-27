$ErrorActionPreference = "Stop"
function By-Choco{
  choco install go -y
}
function By-msi{
  $installerUrl = "https://go.dev/dl/go1.24.4.windows-amd64.msi"
  $installerPath = "go.windows-amd64.msi"
  Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
  Start-Process msiexec.exe -Wait -ArgumentList "/i `"$installerPath`" /quiet"
  Remove-Item $installerPath
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
