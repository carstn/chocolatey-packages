$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://dl.google.com/go/go1.9.5.windows-386.zip'
$checksum = 'c29ea03496a5d61ddcc811110b3d6b8f774e89b19a6dc3839f2d2f82e3789635'
$url64 = 'https://dl.google.com/go/go1.9.5.windows-amd64.zip'
$checksum64 = '6c3ef0e069c0edb0b5e8575f0efca806f69354a7b808f9846b89046f46a260c2'

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
