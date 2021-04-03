function Clear-Global-Modules {
    try {
        Remove-Item -Recurse -Force  -ErrorAction Ignore "$env:LOCALAPPDATA\node-gyp"
        Remove-Item -Recurse -Force  -ErrorAction Ignore "$env:APPDATA\npm"
        Remove-Item -Recurse -Force  -ErrorAction Ignore "$env:APPDATA\npm-cache"
        
    }
    catch {
        $_
    }
    
    
}