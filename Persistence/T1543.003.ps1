#Atomic Test #1 - Modify Fax service to run PowerShell
sc config Fax binPath= "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -noexit -c \"write-host 'T1543.003 Test'\""
sc start Fax

#Cleanup Commands:
#sc config Fax binPath= "C:\WINDOWS\system32\fxssvc.exe" >nul 2>&1