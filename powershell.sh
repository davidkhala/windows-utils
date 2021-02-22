# unix-like shell compatible in PowerShell
## TODO Test

setup(){
    # 改为远程签名 执行策略，以允许执行.ps脚本
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
}
download(){
  # `wget` is an alias for `Invoke-WebRequest`
  wget $1 -outfile $2
}


$@
