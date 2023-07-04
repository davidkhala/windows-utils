function Choco-Install {
  choco install minikube -y
}
function Docker-Start {
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Tools-All -All
  minikube start --container-runtime=docker --vm=true
}
