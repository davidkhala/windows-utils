
function Enable-HyperV {

  Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All
  # RestartNeeded
}

function Install-HyperVTool {	
  Install-WindowsFeature -Name Hyper-V -IncludeManagementTools	
  # Tools include: Get-VM
} 