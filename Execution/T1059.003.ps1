#Atomic Test 1 - Windows Command Shell

New-Item $env:TEMP\T1059.003_script.bat -Force | Out-Null
Set-Content -Path $env:TEMP\T1059.003_script.bat -Value "dir"

Start-Process $env:TEMP\T1059.003_script.bat


#Atomic Test 2 - Writes text to a file and displays it.
Start-Process -Filepath cmd.exe -ArgumentList '/c "echo "Hello from the Windows Command Prompt!" > "%TEMP%\test.bin" & type "%TEMP%\test.bin"'
#cleanup command:
Start-Process -Filepath cmd.exe -ArgumentList '/c "del "%TEMP%\test.bin" >nul 2>&1"'


#Atomic Test 3 - Suspicious Execution via Windows Command Shell
Start-Process -Filepath cmd.exe -ArgumentList '/c "%LOCALAPPDATA:~-3,1%md /c echo Hello, from CMD! > #hello.txt & type #hello.txt"'


#Atomic Test 4 - Simulate BlackByte Ransomware Print Bombing
new-item $env:temp\T1059_003note.txt -value "This file has been created by T1059.003 Test 4" -Force | Out-Null
cmd /c "for /l %x in (1,1,75) do start wordpad.exe /p $env:temp\T1059_003note.txt" | out-null
#cleanup command:
stop-process -name wordpad -force -erroraction silentlycontinue


#Atomic Test 5 - Command Prompt read contents from CMD file and execute
New-Item -Type Directory (split-path C:\AtomicRedTeam\atomics) -ErrorAction ignore | Out-Null
Invoke-WebRequest "https://github.com/redcanaryco/atomic-red-team/raw/master/atomics/T1059.003/src/t1059.003_cmd.cmd" -OutFile "#{input_file}"

cmd /r cmd<C:\AtomicRedTeam\atomics\T1059.003\src\t1059.003_cmd.cmd