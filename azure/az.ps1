function Install{
  winget install --exact --id Microsoft.AzureCLI
}
function Install-PSModule{
  # Install the Azure Az PowerShell module
  Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
}
function Install-AZD{
  # Install Azure Developer CLI (`azd`)
  winget install microsoft.azd
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
