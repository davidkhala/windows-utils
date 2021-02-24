# PowerShell
## Alternative for bash
- `set -e`: quit when error seen. 
    ```
        try{
            blabla
        } catch{
            "$_"
        }  
    ```
## Philosophy
- Don't over complicate things. Keep it simple and use the most straight forward way to accomplish a task. 
- Avoid aliases and positional parameters in any code that you reuse. Format your code for readability. 
- Don't hardcode values; use parameters and variables. 
- Don't write unnecessary code even if it doesn't hurt anything. It adds unnecessary complexity. Attention to detail goes a long way when writing any PowerShell code.
- Develop a standard and stick to it.
### Function Naming
- When naming your functions in PowerShell, use a Pascal case name with an approved verb and a singular noun.
- In PowerShell, there's a specific list of approved verbs. It's important to choose an approved verb in PowerShell when functions are added to a module. The module **generates a warning message at load time if you choose an unapproved verb**. That warning message makes your functions look unprofessional. Unapproved verbs also limit the discoverability of your functions.
    ```
    [Group] Common          [Verb] Add, Clear, Close, Copy, Enter, Exit, Find, Format, Get, Hide, Join, Lock, Move, New, Open, Optimize, Pop, Push, Redo, Remove, Rename, Reset, Resize, Search, Select, Set, Show, Skip, Split, Step, Switch, Undo, Unlock, Watch
    [Group] Lifecycle       [Verb] Approve, Assert, Complete, Confirm, Deny, Disable, Enable, Install, Invoke, Register, Request, Restart, Resume, Start, Stop, Submit, Suspend, Uninstall, Unregister, Wait
    [Group] Data            [Verb] Backup, Checkpoint, Compare, Compress, Convert, ConvertFrom, ConvertTo, Dismount, Edit, Expand, Export, Group, Import, Initialize, Limit, Merge, Mount, Out, Publish, Restore, Save, Sync, Unpublish, Update
    [Group] Security        [Verb] Block, Grant, Protect, Revoke, Unblock, Unprotect
    [Group] Communications  [Verb] Connect, Disconnect, Read, Receive, Send, Write
    [Group] Diagnostic      [Verb] Debug, Measure, Ping, Repair, Resolve, Test, Trace
    [Group] Other           [Verb] Use
    ```
    
