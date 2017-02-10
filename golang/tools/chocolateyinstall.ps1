$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.7.4.windows-386.zip'
$checksum = '49df7846ab04d6106cc501526c14c055788e8c67590a967fb4abef7b8b70751f'
$url64 = 'https://storage.googleapis.com/golang/go1.7.4.windows-amd64.zip'
$checksum64 = '36739164fed38a6da908813aba48d72fb22fea923de5611a85a81135b7cfceb9'

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