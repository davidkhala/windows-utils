function Install-CWAgent {
  msiexec /i https://amazoncloudwatch-agent.s3.amazonaws.com/windows/amd64/latest/amazon-cloudwatch-agent.msi

}
function Set-CWAgent {
  pip install toml-cli # need `run as administrator`
  # workaround for cloudagent known issue
  toml add_section --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials
  toml set --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials.shared_credential_profile default
  toml set --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials.shared_credential_file $env:USERPROFILE\.aws\credentials

  Push-Location $env:USERPROFILE
  git clone https://github.com/davidkhala/.aws.git
  Pop-Location

  # The output config.json is stored in current directory
  & "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-config-wizard"
}
function Start-CWAgent {
  Set-ExecutionPolicy RemoteSigned # need `run as administrator`
  & "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m onPremise -s -c file:.\config.json # need `run as administrator`
  # Once success, you can see a last line in console as `AmazonCloudWatchAgent has been started`
}
function Stop-CWAgent {
  & "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a stop
}
function Trace-CWAgent {
  & "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a status
}
