$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.7.1.windows-386.zip'
$checksum = '312fcbb84c0b4268e6e0351dccf0d6e9bb226c9934b5ee81bd7865a693a68aaa'
$url64 = 'https://storage.googleapis.com/golang/go1.7.1.windows-amd64.zip'
$checksum64 = 'af2b836bb894672cf4c28df32a2ee3ff560e2b463e1ab44bb99833064ba09e5f'

Get-ToolsLocation
$tools = $env:ChocolateyToolsLocation
$goroot = Join-Path "$tools" 'go'
$gorootBin = Join-Path "$goroot" 'bin'
if (Test-Path "$goroot") {
  Remove-Item "$goroot" -Recurse
}

Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$tools" -Url64bit "$url64" -Checksum "$checksum" -ChecksumType 'sha256' -Checksum64 "$checksum64" -ChecksumType64 'sha256'

Install-ChocolateyEnvironmentVariable -VariableName 'GOROOT' -VariableValue "$goroot" -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "$gorootBin" -PathType 'Machine'