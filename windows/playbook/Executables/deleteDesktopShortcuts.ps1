.\init.ps1

# credits: https://github.com/Atlas-OS/Atlas/blob/70151ee624b3e8c93f6dd7aca3b0f89d22d0fb02/src/playbook/Executables/STARTMENU.ps1#L3
foreach ($userKey in (Get-RegUserPaths -NoDefault).PsPath) {
  $desktopPath = (Get-ItemProperty "$userKey\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" -Name "Desktop" -EA 0)."Desktop";

  if ([string]::IsNullOrEmpty($desktopPath) -or !(Test-Path $desktopPath)) {
    Write-Error "Couldn't find Desktop!"
    continue
  }

  $shortcuts = Get-ChildItem -Path $desktopPath -File | Where-Object { $_.Name -like "*.lnk" }
  foreach ($shortcut in $shortcuts) {
    if ($shortcut.Name -match "Atlas") {
      continue
    }
    Remove-Item -Path $shortcut.FullName -Force
  }
}
