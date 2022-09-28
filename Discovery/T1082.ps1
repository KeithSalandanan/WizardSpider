#Atomic Test #1 - System Information Discovery

Start-Process -Filepath cmd.exe -Verb runAs -ArgumentList '/c "systeminfo"'
Start-Process -Filepath cmd.exe -Verb runAs -ArgumentList '/c "reg query HKLM\SYSTEM\CurrentControlSet\Services\Disk\Enum"'