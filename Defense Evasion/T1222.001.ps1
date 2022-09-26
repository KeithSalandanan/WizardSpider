Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "IF EXIST %temp%\T1222.001-folder-perms-backup.txt (
    icacls "C:\Users\Public\*" /grant Everyone:F /T /C /Q
    EXIT 0 
     ) ELSE ( 
        icacls C:\Users\Public\* /save %temp%\T1222.001-folder-perms-backup.txt /t /q >nul 2>&1
        EXIT 1 
        
    )"'

#Cleanup Commands:
#Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c"icacls '#{path}' /restore #{file_path} /q >nul 2>&1"'