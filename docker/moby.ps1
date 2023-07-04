function Choco-Install{
  choco install Containers Microsoft-Hyper-V --source windowsfeatures
  choco install docker-engine
  # This package creates the group `docker-users` and adds the installing user to it.
  #   In order to communicate with docker you will need to log out and back in.

}
