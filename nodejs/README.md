- node-gyp requires Visual Studio on windows
```
  msvs_version not set from command line or npm config
  VCINSTALLDIR not set, not running in VS Command Prompt
  could not use PowerShell to find Visual Studio 2017 or newer
  looking for Visual Studio 2015
  - not found
  not looking for VS2013 as it is only supported up to Node.js 8

  **************************************************************
  You need to install the latest version of Visual Studio
  including the "Desktop development with C++" workload.
  For more information consult the documentation at:
  https://github.com/nodejs/node-gyp#on-windows
  **************************************************************
```
- `node-v12.21.0-x64.msi` install wizard can automate Windows Build Tools and Python installation as neccessary depency for node-gyp
- 
