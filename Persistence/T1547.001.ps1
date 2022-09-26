#Atomic Test #1 - Reg Key Run

Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Atomic Red Team" /t REG_SZ /F /D "#{command_to_execute}"'

#Cleanup Commands:
# Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Atomic Red Team" /f >nul 2>&1'