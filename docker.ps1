
function Enable-HyperV {
  Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All
  
}
function Install-HyperV {
  Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
  
}