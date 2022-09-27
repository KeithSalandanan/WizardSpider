#Atomic Test 1 - Execute a Command as a Service

Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "sc.exe create ARTService binPath= "%COMSPEC% /c powershell.exe -nop -w hidden -command New-Item -ItemType File C:\art-marker.txt"'
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "sc.exe start ARTService"'
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "sc.exe delete ARTService"'

#Cleanup Commands:
#Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "del C:\art-marker.txt >nul 2>&1"'

