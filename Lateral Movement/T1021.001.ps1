#Atomic Test #1 - RDP to DomainController

$Server=$ENV:logonserver.TrimStart("\")
$User = Join-Path $Env:USERDOMAIN $ENV:USERNAME
$Password="1password2!"
cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password
mstsc /v:$Server
echo "RDP connection established"

# Cleanup Commands:
# $p=Tasklist /svc /fi "IMAGENAME eq mstsc.exe" /fo csv | convertfrom-csv
# if(-not ([string]::IsNullOrEmpty($p.PID))) { Stop-Process -Id $p.PID }