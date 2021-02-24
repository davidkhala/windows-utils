# PowerShell
## Alternative for bash
- `set -e`: quit when error seen. 
    ```
        try
    {
    blabla
    }
    catch
    {
    "$_"
    }  

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
    [Group] Common          [Verb] Add, Clear, Close, Copy
    [Group] Lifecycle       [Verb] Approve, Assert, Complete, Confirm, Deny, Disable, Enable
    [Group] Data            [Verb] Backup, Checkpoint, Compare, Compress, Convert, ConvertFrom, ConvertTo, Dismount, Edit
    [Group] Security        [Verb] Block
    [Group] Communications  [Verb] Connect, Disconnect
    [Group] Diagnostic      [Verb] Debug
    
    Verb        Group
    ----        -----
    
    [WIP]
    Enter       Common
    Exit        Common
    Expand      Data
    Export      Data
    Find        Common
    Format      Common
    Get         Common
    Grant       Security
    Group       Data
    Hide        Common
    Import      Data
    Initialize  Data
    Install     Lifecycle
    Invoke      Lifecycle
    Join        Common
    Limit       Data
    Lock        Common
    Measure     Diagnostic
    Merge       Data
    Mount       Data
    Move        Common
    New         Common
    Open        Common
    Optimize    Common
    Out         Data
    Ping        Diagnostic
    Pop         Common
    Protect     Security
    Publish     Data
    Push        Common
    Read        Communications
    Receive     Communications
    Redo        Common
    Register    Lifecycle
    Remove      Common
    Rename      Common
    Repair      Diagnostic
    Request     Lifecycle
    Reset       Common
    Resize      Common
    Resolve     Diagnostic
    Restart     Lifecycle
    Restore     Data
    Resume      Lifecycle
    Revoke      Security
    Save        Data
    Search      Common
    Select      Common
    Send        Communications
    Set         Common
    Show        Common
    Skip        Common
    Split       Common
    Start       Lifecycle
    Step        Common
    Stop        Lifecycle
    Submit      Lifecycle
    Suspend     Lifecycle
    Switch      Common
    Sync        Data
    Test        Diagnostic
    Trace       Diagnostic
    Unblock     Security
    Undo        Common
    Uninstall   Lifecycle
    Unlock      Common
    Unprotect   Security
    Unpublish   Data
    Unregister  Lifecycle
    Update      Data
    Use         Other
    Wait        Lifecycle
    Watch       Common
    Write       Communications
    ```
