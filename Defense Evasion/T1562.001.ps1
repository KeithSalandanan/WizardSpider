
#CHECK IF INSTALLED
function CheckSysmonInstalled {
    if(sc.exe query sysmon | findstr sysmon) { 
        # return 0 
        return $true 
    } else{ 
        if(cmd.exe /c "where.exe Sysmon.exe 2> nul | findstr Sysmon 2> nul") { 
            C:\Windows\Sysmon.exe -accepteula -i 
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
        sysmon -u
        sysmon -accepteula -i
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

if (CheckSysmonExist -and CheckSysmonInstalled -and CheckSysmonLoaded ) {
    fltmc.exe unload SysmonDrv
}