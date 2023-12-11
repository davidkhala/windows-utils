# Known AWS issue
- [Got Home directory: C:\Users\Administrator](https://github.com/aws/amazon-cloudwatch-agent/issues/211)
  - cloudagent doesn't respect current current user and `$env:USERPROFILE`, it is always hardcoded to use `C:\Users\Administrator`
