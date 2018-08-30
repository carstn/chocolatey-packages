$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://dl.google.com/go/go1.11.windows-386.zip'
$checksum = 'd3279f0e3d728637352eff0aa1e11268a0eb01f13644bcbce1c066139f5a90db'
$url64 = 'https://dl.google.com/go/go1.11.windows-amd64.zip'
$checksum64 = '29f9291270f0b303d0b270f993972ead215b1bad3cc674a0b8a09699d978aeb4'

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
