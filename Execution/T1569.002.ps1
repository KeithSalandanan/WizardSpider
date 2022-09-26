#Atomic Test 1 - Execute a Command as a Service

sc.exe create ARTService binPath= "%COMSPEC% /c powershell.exe -nop -w hidden -command New-Item -ItemType File C:\art-marker.txt"
sc.exe start ARTService
sc.exe delete ARTService

#Cleanup Commands:
#del C:\art-marker.txt >nul 2>&1

