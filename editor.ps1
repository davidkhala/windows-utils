function Append {
  param (
    [string]$file,
    [string]$content
  )
  Add-Content -Path $file -Value "$content"
}
function Configure {
  param (
    [string]$file,
    [string]$key, 
    [string]$value
  )
    
  
  $data = Get-Properties $file
  $data["$key"] = "$value"
  $data.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" } | Set-Content -Path $file
}
function Get-Properties {
  param (
    [string]$file
  )
  
  $content = Get-Content -Path $file | Out-String
  return ConvertFrom-StringData -StringData $content

}
