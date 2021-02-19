# unix-like shell compatible in PowerShell
## TODO Test
download(){
  # `wget` is an alias for `Invoke-WebRequest`
  wget $1 -outfile $2
}


$@
