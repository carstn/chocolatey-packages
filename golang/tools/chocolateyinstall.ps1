$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://redirector.gvt1.com/edgedl/go/go1.9.3.windows-386.zip'
$checksum = 'cab7d4e008adefed322d36dee87a4c1775ab60b25ce587a2b55d90c75d0bafbc'
$url64 = 'https://redirector.gvt1.com/edgedl/go/go1.9.3.windows-amd64.zip'
$checksum64 = '4eee59bb5b70abc357aebd0c54f75e46322eb8b58bbdabc026fdd35834d65e1e'

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