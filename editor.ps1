function Append
{
   param (
        [string]$content, 
        [string]$file 
    )
   Add-Content -Path $file -Value "$content"
}
function Configure
{
  param (
        [string]$key, 
        [string]$value,
        [string]$file 
    )
    
  $content = Get-Content -Path $filePath | Out-String
  $data = ConvertFrom-StringData -StringData $content
  $data["$key"] = "$value"
  $data.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" } | Set-Content -Path $filePath
}
