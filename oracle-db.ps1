
function Install-LightClient {
    
    Invoke-WebRequest -Uri https://download.oracle.com/otn_software/nt/instantclient/instantclient-basiclite-windows.zip -OutFile instantclient-basiclite-windows.zip -UseBasicParsing
    Invoke-WebRequest -Uri https://aka.ms/vs/17/release/vc_redist.x64.exe -OutFile vc_redist17.x64.exe -UseBasicParsing
    
#     TODO how to unzip and install 
}
