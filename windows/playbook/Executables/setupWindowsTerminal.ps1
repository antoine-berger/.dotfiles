.\init.ps1

# credits: https://github.com/Atlas-OS/Atlas/blob/70151ee624b3e8c93f6dd7aca3b0f89d22d0fb02/src/playbook/Executables/STARTMENU.ps1#L3
foreach ($userKey in (Get-RegUserPaths -NoDefault).PsPath) {
  $appData = (Get-ItemProperty "$userKey\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" -Name 'Local AppData' -EA 0).'Local AppData';

  if ([string]::IsNullOrEmpty($appData) -or !(Test-Path $appData)) {
    Write-Error "Couldn't find AppData!"
    continue
  }

  $packagesPath = "$appData\Packages"
  $packages = Get-ChildItem -Path $packagesPath -Directory | Where-Object { $_.Name -match "Microsoft.WindowsTerminal" }
  foreach ($package in $packages) {
    Get-Content -Path ".\windows_terminal\settings.json" | Out-File -FilePath "$packagesPath\$($package.Name)\LocalState\settings.json" -Encoding utf8 -Force
  }
}
