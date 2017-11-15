$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://redirector.gvt1.com/edgedl/go/go1.9.2.windows-386.zip'
$checksum = '35d3be5d7b97c6d11ffb76c1b19e20a824e427805ee918e82c08a2e5793eda20'
$url64 = 'https://redirector.gvt1.com/edgedl/go/go1.9.2.windows-amd64.zip'
$checksum64 = '682ec3626a9c45b657c2456e35cadad119057408d37f334c6c24d88389c2164c'

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