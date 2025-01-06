param(
  [Parameter(Mandatory=$true)]
  [string]$TempDirectory,
  [Parameter(Mandatory=$true)]
  [string]$PlaybookPath
)

Push-Location $TempDirectory

.\TrustedUninstaller\TrustedUninstaller.CLI.exe "$PlaybookPath" none

Remove-Item -Force .\TrustedUninstaller -Recurse

Pop-Location
Remove-Item -Force $TempDirectory -Recurse

Read-Host
