
function Install-LightClient {
    
    Invoke-WebRequest -Uri https://download.oracle.com/otn_software/nt/instantclient/instantclient-basiclite-windows.zip -OutFile instantclient-basiclite-windows.zip -UseBasicParsing
#     TODO how to unzip and install 
}
