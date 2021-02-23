
function Enable-HyperV {
  Install-WindowsFeature -Name Hyper-V -IncludeManagementTools

  Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All
  # RestartNeeded
}
