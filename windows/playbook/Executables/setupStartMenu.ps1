.\init.ps1

$data = Get-Content -Path ".\startLayout.json"
$key = "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start"
New-Item -Path $key -ItemType "Directory" -ErrorAction "SilentlyContinue"
Set-ItemProperty -Path $key -Name "ConfigureStartPins" -Value $data -Type "String"

# credits: https://github.com/Atlas-OS/Atlas/blob/70151ee624b3e8c93f6dd7aca3b0f89d22d0fb02/src/playbook/Executables/STARTMENU.ps1#L3
foreach ($userKey in (Get-RegUserPaths -NoDefault).PsPath) {
  $appData = (Get-ItemProperty "$userKey\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" -Name 'Local AppData' -EA 0).'Local AppData';

  if ([string]::IsNullOrEmpty($appData) -or !(Test-Path $appData)) {
    Write-Error "Couldn't find AppData!"
    continue
  }

  $packages = Get-ChildItem -Path "$appData\Packages" -Directory | Where-Object { $_.Name -match "Microsoft.Windows.StartMenuExperienceHost" }
  foreach ($package in $packages) {
    $bins = Get-ChildItem -Path "$appData\Packages\$($package.Name)\LocalState" -File | Where-Object { $_.Name -like "start*.bin" }
    foreach ($bin in $bins.FullName) {
      Remove-Item -Path $bin -Force
    }
  }
}
