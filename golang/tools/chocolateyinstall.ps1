$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.7.3.windows-386.zip'
$checksum = 'd0ac2d3aaa20452d0f09112f034cca1c5b8560452a45e10523af7f0a1089c792'
$url64 = 'https://storage.googleapis.com/golang/go1.7.3.windows-amd64.zip'
$checksum64 = '9fe41313b97e2a6a703f5ae22938c7d9ac4336a128b522376c224ba97e8c7f01'

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