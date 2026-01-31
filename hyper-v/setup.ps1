function Disable {
    bcdedit /set hypervisorlaunchtype off
}
function Enable {
    bcdedit /set hypervisorlaunchtype auto
}

function Uninstall{
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
}
function Install {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}
