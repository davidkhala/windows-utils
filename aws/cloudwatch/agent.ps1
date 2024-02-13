# TODO make it runnable
Install(){
msiexec /i https://amazoncloudwatch-agent.s3.amazonaws.com/windows/amd64/latest/amazon-cloudwatch-agent.msi


}
Configure(){
pip install toml-cli
# workaround for cloudagent known issue
toml add_section --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials
toml set --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials.shared_credential_profile default
toml set --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials.shared_credential_file $env:USERPROFILE\.aws\credentials

  # The output config.json is stored in current directory
& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-config-wizard"


}
Start(){
  
Set-ExecutionPolicy RemoteSigned # grant privilege

& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m onPremise -s -c file:.\config.json # need privilege
}
