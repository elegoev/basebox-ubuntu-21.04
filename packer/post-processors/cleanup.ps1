# cleanup task

# delete ubuntu log file
$LogFileName = '.\ubuntu-hirsute-21.04-cloudimg-console.log'
if (Test-Path $LogFileName) {
  Remove-Item $LogFileName
}

# delete output_dir
$OutputDirName = '.\packer_build_dir'
if (Test-Path $OutputDirName) {
  Remove-Item $OutputDirName -Recurse
}
