Atomic Test #4 - System Network Configuration Discovery (TrickBot Style)

Start-Process -Filepath cmd.exe -ArgumentList '/c "ipconfig /all"'
Start-Process -Filepath cmd.exe -ArgumentList '/c "net config workstation"'
Start-Process -Filepath cmd.exe -ArgumentList '/c "net view /all /domain"'
Start-Process -Filepath cmd.exe -ArgumentList '/c "nltest /domain_trusts"'