function Choco-Install {
  choco install minikube -y
}
function Docker-Start {
  
  minikube start --container-runtime=docker --vm=true
}
function Docker-Alias{
  & minikube -p <profile> docker-env --shell powershell | Invoke-Expression
}
