# `setx`

- [About](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/setx) 
- This command provides the only(?) command-line or programmatic way to directly and permanently set system environment values (similar to the UNIX utility `SETENV`)
  - The `set` command, which is internal to the command interpreter (Cmd.exe), sets user environment variables for the current console window only.
- Variables set with setx variables are available in future command windows only, not in the current command window.

Known limit
- setx 有 1024 字符截断问题，PATH 长了会把后面的全删掉，尽量避免用 setx 改 PATH。
  - Solution: https://github.com/davidkhala/windows-utils/blob/master/powershell/path.ps1
  - Solution: `pathman`
# Test-NetConnection
perform a ping/ICMP test.
- not port listen check
