$ErrorActionPreference = "Stop"
function Install {
    (New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
    & $env:Temp\GoogleCloudSDKInstaller.exe
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
else {
    Install
}
