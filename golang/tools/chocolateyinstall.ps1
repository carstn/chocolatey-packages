$ErrorActionPreference = 'Stop';

$packageName = 'golang'
$url = 'https://redirector.gvt1.com/edgedl/go/go1.8.5.windows-386.zip'
$checksum = 'c14d800bb79bf38a945f83cf37005609b719466c0051d20a5fc59d6efdd6fc66'
$url64 = 'https://redirector.gvt1.com/edgedl/go/go1.8.5.windows-amd64.zip'
$checksum64 = '137827cabff27cc36cbe13018f629a6418c2a6af85adde1b1bfb8d000c9fc1ae'

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