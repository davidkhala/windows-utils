function Disable {
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
}
function Enable {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}
