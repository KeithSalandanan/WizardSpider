#Atomic Test #3 - Execute base64-encoded PowerShell from Windows Registry

$OriginalCommand = 'Write-Host "Hey, Atomic!"'
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($OriginalCommand)
$EncodedCommand =[Convert]::ToBase64String($Bytes)
$EncodedCommand

Set-ItemProperty -Force -Path HKCU:Software\Microsoft\Windows\CurrentVersion -Name Debug -Value $EncodedCommand
powershell.exe -Command "IEX ([Text.Encoding]::UNICODE.GetString([Convert]::FromBase64String((gp HKCU:Software\Microsoft\Windows\CurrentVersion Debug).Debug)))"

# Cleanup Commands:
# Remove-ItemProperty -Force -ErrorAction Ignore -Path HKCU:Software\Microsoft\Windows\CurrentVersion -Name Debug
