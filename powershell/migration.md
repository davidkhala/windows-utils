# From bash

- `set -e` -> [`$ErrorActionPreference = "Stop"`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.4#erroractionpreference)
- `"$@"` ->

  ```powershell

  if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
  }

  ```

  - It only supports running in local like `./test.ps1 command list`