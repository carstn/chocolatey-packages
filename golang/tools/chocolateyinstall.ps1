$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.7.windows-386.zip'
$checksum = '9a4323fde431f1638ac40a504c1a96f584b6a7a53931599f95df4c8dd530b627'
$url64 = 'https://storage.googleapis.com/golang/go1.7.windows-amd64.zip'
$checksum64 = 'f51aad06644cc8bd119d2f6933334fa8da24d26e6676fde022cecf5978f1a0c7'

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