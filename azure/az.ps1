function Install{
  winget install --exact --id Microsoft.AzureCLI
}
function Install-PSModule{
  # Install the Azure Az PowerShell module
  Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
