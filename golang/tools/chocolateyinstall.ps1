$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.8.2.windows-386.zip'
$checksum = '75e295f5cd0eb3236e68324ac51b9e54a1aad1fa3a3b259f62cc11e05d948aed'
$url64 = 'https://storage.googleapis.com/golang/go1.8.2.windows-amd64.zip'
$checksum64 = '9bfa4d497caee1b7ec8720acdea2fa8af8d51b525ddc7e4648a63a3138a6a8e3'

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