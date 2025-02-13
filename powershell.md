# PowerShell

## Use script

- Grant execution right: `Set-ExecutionPolicy Unrestricted -Force` as Admin
- To use remote ps script: `(Invoke-WebRequest $Uri).Content | Invoke-Expression`
  - The uri can be a Github raw file link

## Alternative for bash

- `set -e` -> [`$ErrorActionPreference = "Stop"`](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.4#erroractionpreference)
- `"$@"` -> `Invoke-Expression ($args -join " ")`

## Design Notes

- PowerShell 7 is designed to coexist with Windows PowerShell 5.1
- It's common in other languages like C# to use `==` for equality (ex: `5 == $value`) but that doesn't work with PowerShell.

### Function Naming

- When naming your functions in PowerShell, use a Pascal case name with an approved verb and a singular noun.
- In PowerShell, there's a specific list of [approved verbs](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7.4). It's important to choose an approved verb in PowerShell when functions are added to a module. The module **generates a warning message at load time if you choose an unapproved verb**. That warning message makes your functions look unprofessional. Unapproved verbs also limit the discoverability of your functions.

    ```text
    [Group] Common          [Verb] Add, Clear, Close, Copy, Enter, Exit, Find, Format, Get, Hide, Join, Lock, Move, New, Open, Optimize, Pop, Push, Redo, Remove, Rename, Reset, Resize, Search, Select, Set, Show, Skip, Split, Step, Switch, Undo, Unlock, Watch
    [Group] Lifecycle       [Verb] Approve, Assert, Complete, Confirm, Deny, Disable, Enable, Install, Invoke, Register, Request, Restart, Resume, Start, Stop, Submit, Suspend, Uninstall, Unregister, Wait
    [Group] Data            [Verb] Backup, Checkpoint, Compare, Compress, Convert, ConvertFrom, ConvertTo, Dismount, Edit, Expand, Export, Group, Import, Initialize, Limit, Merge, Mount, Out, Publish, Restore, Save, Sync, Unpublish, Update
    [Group] Security        [Verb] Block, Grant, Protect, Revoke, Unblock, Unprotect
    [Group] Communications  [Verb] Connect, Disconnect, Read, Receive, Send, Write
    [Group] Diagnostic      [Verb] Debug, Measure, Ping, Repair, Resolve, Test, Trace
    [Group] Other           [Verb] Use
    ```

  - `Get-Verb` to check above
