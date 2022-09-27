#Atomic Test #6 - Delete a single file - Windows PowerShell

if (Test-Path $env:TEMP\deleteme_T1551.004) {
   
} else {
    New-Item -Path $env:TEMP\deleteme_T1551.004 | Out-Null
}

Remove-Item -path $env:TEMP\deleteme_T1551.004
