#Atomic Test #2 - Windows - Stop service using net.exe

net.exe stop spooler

# Cleanup Commands:
# net.exe start spooler >nul 2>&1

#Atomic Test #3 - Windows - Stop service by killing process

taskkill.exe /f /im spoolsv.exe