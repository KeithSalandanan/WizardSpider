#Atomic Test #1 - Stage data from Discovery.bat

Invoke-WebRequest "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1074.001/src/Discovery.bat" -OutFile $env:TEMP\discovery.bat