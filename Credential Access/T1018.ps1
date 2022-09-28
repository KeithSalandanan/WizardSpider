# Atomic Test #11 - Adfind - Enumerate Active Directory Domain Controller Objects

if (Test-Path C:\AtomicRedTeam\atomics) {
    Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "C:\AtomicRedTeam\atomics -sc dclist"'
} else {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1087.002/src/AdFind.exe" -OutFile C:\AtomicRedTeam\atomics
    Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "C:\AtomicRedTeam\atomics -sc dclist"'
}

