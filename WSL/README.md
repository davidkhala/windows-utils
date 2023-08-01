# WSL
**W**indows **S**ubsystem for **L**inux

启用 WSL 并从 Microsoft Store 中安装 Linux 分发版后，在打开新安装的 Linux 分发版时将会要求你完成的第一步是创建帐户
https://aka.ms/wslusers

# Install
wsl --update
## Offline Install
Enable the Windows Subsystem for Linux
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
Enable Virtual Machine feature
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

[x86 download](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

