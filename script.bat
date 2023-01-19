@ECHO OFF
:: Add user
TITLE Add user
ECHO *******Adding user**********
net user rdpuser Password1 /add 
net localgroup Administrators rdpuser /add
net localgroup "Remote Desktop Users" rdpuser /add
:: Optional: uncomment to disable WinDefend and Firewall
::ECHO ****Turning off firewall****
::netsh advfirewall show allprofiles
::netsh advfirewall set allprofiles state off
::netsh firewall set opmode disable
::ECHO ****Turning off WinDefend***
::sc stop WinDefend
::ECHO
::Enable RDP 
ECHO ********Enabling RDP********
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
ECHO ********Listing users*******
net users
