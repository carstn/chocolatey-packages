$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://dl.google.com/go/go1.8.7.windows-386.zip'
$checksum = '46995f7b022f6638183f1e777be6c9fdaa0cc8156af879db329d5820a2de1f9d'
$url64 = 'https://dl.google.com/go/go1.8.7.windows-amd64.zip'
$checksum64 = '633a28e72b95e8372e5416dd4723881d7a7109be08daf097ebce2679939f6a82'

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
