$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.6.4.windows-386.zip'
$checksum = '91fb3e13dfba94c13334a3ce8362ed6dfd0e5e94c4a1251517223571c2410d73'
$url64 = 'https://storage.googleapis.com/golang/go1.6.4.windows-amd64.zip'
$checksum64 = '4fc871ac03f5ca5978ad2ae860192e6a39dc2b1286afbe86f4947faab84ab231'

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