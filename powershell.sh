# unix-like shell compatible in PowerShell
## TODO Test

setup(){
    # 改为RemoteSigned 执行策略，以允许执行.ps脚本
    # 否则在Restricted策略情况下，不允许执行脚本
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
}
download(){
  # `wget` is an alias for `Invoke-WebRequest`
  wget $1 -outfile $2
}


$@
