function Choco-Install {
  choco install minikube -y
}
function Install{
  winget install Kubernetes.minikube
}

function Docker-Start {
  
  minikube start --container-runtime=docker --vm=true
  # If minikube fails to start, see the [drivers page](https://minikube.sigs.k8s.io/docs/drivers/) for help setting up a compatible container or virtual-machine manager.
}
function Docker-Alias{
  & minikube -p <profile> docker-env --shell powershell | Invoke-Expression
}
