# PowerShell

[wiki](https://github.com/davidkhala/windows-utils/wiki/PowerShell)

## Use script

- Grant execution right: `Set-ExecutionPolicy Unrestricted -Force` as Admin
- To use remote ps script: `(Invoke-WebRequest $Uri).Content | Invoke-Expression`
  - The uri can be a GitHub raw file link
