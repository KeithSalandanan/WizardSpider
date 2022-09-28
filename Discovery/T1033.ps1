#Atomic Test #1 - System Owner/User Discovery

cmd.exe /C whoami
cmd.exe wmic useraccount get /ALL
cmd.exe quser /SERVER:"#{computer_name}"
cmd.exe quser
cmd.exe qwinsta.exe /server:#{computer_name}
cmd.exe qwinsta.exe
cmd.exe for /F "tokens=1,2" %i in ('qwinsta /server:#{computer_name} ^| findstr "Active Disc"') do @echo %i | find /v "#" | find /v "console" || echo %j > computers.txt
cmd.exe @FOR /F %n in (computers.txt) DO @FOR /F "tokens=1,2" %i in ('qwinsta /server:%n ^| findstr "Active Disc"') do @echo %i | find /v "#" | find /v "console" || echo %j > usernames.txt