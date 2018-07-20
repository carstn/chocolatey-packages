$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://dl.google.com/go/go1.10.3.windows-386.zip'
$checksum = '89696a29bdf808fa9861216a21824ae8eb2e750a54b1424ce7f2a177e5cd1466'
$url64 = 'https://dl.google.com/go/go1.10.3.windows-amd64.zip'
$checksum64 = 'a3f19d4fc0f4b45836b349503e347e64e31ab830dedac2fc9c390836d4418edb'

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
