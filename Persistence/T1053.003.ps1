#Atomic Test #4 - Powershell Cmdlet Scheduled Task

$Action = New-ScheduledTaskAction -Execute "calc.exe"
$Trigger = New-ScheduledTaskTrigger -AtLogon
$User = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$Set = New-ScheduledTaskSettingsSet
$object = New-ScheduledTask -Action $Action -Principal $User -Trigger $Trigger -Settings $Set
Register-ScheduledTask AtomicTask -InputObject $object

#Cleanup Commands:
#Unregister-ScheduledTask -TaskName "AtomicTask" -confirm:$false >$null 2>&1