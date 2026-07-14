function Enable-Agent{
  Set-Service -Name ssh-agent -StartupType Automatic
  Start-Service ssh-agent

}


