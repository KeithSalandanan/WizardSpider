#Atomic Test #1 - Creating W32Time similar named service using schtasks

Start-Process -FilePath cmde.exe -Verb -RunAs -ArgumentList '/c "schtasks /create /ru system /sc daily /tr "cmd /c powershell.exe -ep bypass -file c:\T1036.004_NonExistingScript.ps1" /tn win32times /f"'
Start-Process -FilePath cmde.exe -Verb -RunAs -ArgumentList '/c "schtasks /query /tn win32times"'

# Cleanup Commands:
# Start-Process -FilePath cmde.exe -Verb -RunAs -ArgumentList '/c "schtasks /tn win32times /delete /f"'