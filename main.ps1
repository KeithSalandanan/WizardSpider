$directories =  Get-ChildItem -Directory -Recurse
$order = "Initial Access", "Execution", "Persistence","Privilege Escalation", "Defense Evasion", "Credential Access", "Discovery", "Lateral Movement", "Collection", "Command and Control", "Exfiltration", "Impact"

$ordered_directories = foreach ($directory in $order){
   $directories | Where-Object {$_.Name -eq $directory} | Sort-Object Name
}

foreach ($directory in $ordered_directories){
    "Running {0}..." -f $directory.Name
    $files = Get-ChildItem $directory.FullName
    foreach ($file in $files){
       "Executing {0}..." -f $file.Name
        Powershell.exe -executionpolicy remotesigned -File $file.FullName
    }
    "`n"
}





