.\init.ps1

$tempDir = Join-Path -Path (Get-SystemDrive) -ChildPath $([System.Guid]::NewGuid())
New-Item -Force -ItemType Directory -Path $tempDir | Out-Null
Push-Location $tempDir

$url = "https://github.com/nix-community/NixOS-WSL/releases/download/2405.5.4/nixos-wsl.tar.gz"
$filePath = "$tempDir\nixos-wsl.tar.gz"

# Download faster plz
$ProgressPreference = "SilentlyContinue"

Invoke-WebRequest -Uri $url -OutFile $filePath
wsl.exe --import NixOS $env:USERPROFILE\NixOS\ $filePath --version 2
Remove-Item -Force $filePath

Pop-Location
Remove-Item -Force $tempDir -Recurse
