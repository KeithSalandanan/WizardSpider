#T1059.003 - Windows Command Shell

New-Item $env:TEMP\T1059.003_script.bat -Force | Out-Null
Set-Content -Path $env:TEMP\T1059.003_script.bat -Value "dir"

Start-Process $env:TEMP\T1059.003_script.bat