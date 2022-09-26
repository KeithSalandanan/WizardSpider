#Atomic Test #1 - Scheduled Task Startup Script

Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "schtasks /create /tn "T1053_005_OnLogon" /sc onlogon /tr "cmd.exe /c calc.exe"'
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "schtasks /create /tn "T1053_005_OnStartup" /sc onstart /ru system /tr "cmd.exe /c calc.exe"'

#Cleanup Commands:
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "schtasks /delete /tn "T1053_005_OnLogon" /f >nul 2>&1"'
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c schtasks /delete /tn "T1053_005_OnStartup" /f >nul 2>&1"'