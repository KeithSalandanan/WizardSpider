#Atomic Test #1 - Modify Registry of Current User Profile - cmd
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /t REG_DWORD /v HideFileExt /d 1 /f"'

#Cleanup Commands:
#Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /f >nul 2>&1"'