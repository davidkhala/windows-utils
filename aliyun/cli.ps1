# Or https://aliyuncli.alicdn.com/aliyun-cli-windows-latest-amd64.zip
$ErrorActionPreference = "Stop"
function install {
  choco install aliyun-cli -y

}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
