
function Enable-HyperV {

  Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All
  # RestartNeeded
}
