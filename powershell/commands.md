# `setx`

- [About](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/setx) 
- This command provides the only(?) command-line or programmatic way to directly and permanently set system environment values (similar to the UNIX utility `SETENV`)
  - The `set` command, which is internal to the command interpreter (Cmd.exe), sets user environment variables for the current console window only.
- Variables set with setx variables are available in future command windows only, not in the current command window.

# Test-NetConnection
perform a ping/ICMP test.
- not port listen check