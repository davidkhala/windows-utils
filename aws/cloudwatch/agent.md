# Install
Prerequisite
- [pypi: toml-cli](https://github.com/mrijken/toml-cli)
  - `pip install toml-cli`
```Powershell

# Install
msiexec /i https://amazoncloudwatch-agent.s3.amazonaws.com/windows/amd64/latest/amazon-cloudwatch-agent.msi
# Configure, the output config.json is stored in current directory
& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-config-wizard"

# Start
Set-ExecutionPolicy RemoteSigned # need privilege
# workaround for cloudagent known issue
toml add_section --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials
toml set --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials.shared_credential_profile default
toml set --toml-path C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml credentials.shared_credential_file $env:USERPROFILE\.aws\credentials

& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m onPremise -s -c file:.\config.json # need privilege
```
Once success, you can see a last line in console as `AmazonCloudWatchAgent has been started`


# Known AWS issue
- [Got Home directory: C:\Users\Administrator](https://github.com/aws/amazon-cloudwatch-agent/issues/211)
  - cloudagent doesn't respect current current user and `$env:USERPROFILE`, it is always hardcoded to use `C:\Users\Administrator`
