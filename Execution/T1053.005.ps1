# Atomic Test 1 - Scheduled Task Startup Script

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Start-Process cmd.exe -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        exit;
    }

Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList /c 'schtasks /create /tn "T1053_005_OnLogon" /sc onlogon /tr "cmd.exe /c calc.exe"'
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList /c 'schtasks /create /tn "T1053_005_OnStartup" /sc onstart /ru system /tr "cmd.exe /c calc.exe"'

#Cleanup Commands:
schtasks /delete /tn "T1053_005_OnLogon" /f >nul 2>&1
schtasks /delete /tn "T1053_005_OnStartup" /f >nul 2>&1

#Atomic Test #2 - Scheduled task Local

SCHTASKS /Create /SC ONCE /TN spawn /TR #{task_command} /ST #{time}

#Cleanup Commands:
SCHTASKS /Delete /TN spawn /F >nul 2>&1

#Atomic Test #4 - Powershell Cmdlet Scheduled Task

$Action = New-ScheduledTaskAction -Execute "calc.exe"
$Trigger = New-ScheduledTaskTrigger -AtLogon
$User = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$Set = New-ScheduledTaskSettingsSet
$object = New-ScheduledTask -Action $Action -Principal $User -Trigger $Trigger -Settings $Set
Register-ScheduledTask AtomicTask -InputObject $object

#Cleanup Commands:
Unregister-ScheduledTask -TaskName "AtomicTask" -confirm:$false >$null 2>&1