#Atomic Test #6 - Security Software Discovery - AV Discovery via WMI

Start-Process -Filepath cmd.exe -Verb runAs -ArgumentList '/c "wmic.exe /Namespace:\\root\SecurityCenter2 Path AntiVirusProduct Get displayName /Format:List"'