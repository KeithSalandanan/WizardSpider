#Atomic Test #4 - Delete a single file - Windows cmd

Start-Process -Filepath cmd.exe -ArgumentList '/c IF EXIST "%temp%\deleteme_T1551.004" ( 
    EXIT 0 
) ELSE ( 
    echo deleteme_T1551.004 >> %temp%\deleteme_T1551.004
    EXIT 1 
)

del /f %temp%\deleteme_T1551.004"'
