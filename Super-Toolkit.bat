@echo off
title Super CMD Toolkit (Fixed)
color 0A

:: Admin password for sensitive commands (optional)
set "adminpass=MySecurePassword123"

:MENU
cls
echo ==================================================
echo              SUPER CMD TOOLKIT MENU
echo ==================================================
echo NETWORKING
echo 1. IP Configuration
echo 2. Flush DNS Cache
echo 3. Ping Test (Google)
echo 4. Trace Route (Google)
echo 5. Netstat Connections
echo 6. ARP Table
echo 7. Display Routing Table
echo 8. Release IP
echo 9. Renew IP
echo 10. DNS Lookup (nslookup)
echo --------------------------------------------------
echo SYSTEM
echo 11. System Info
echo 12. Task List
echo 13. Task Manager (GUI)
echo 14. Resource Monitor
echo 15. Performance Monitor
echo 16. Driver Query
echo 17. WMIC BIOS Info
echo 18. Group Policy Update
echo 19. Windows Update via Winget
echo --------------------------------------------------
echo STORAGE & SECURITY
echo 20. Disk Cleanup
echo 21. Check Disk (C:)
echo 22. SFC Scan (System File Checker) [Protected]
echo 23. DISM Health Restore [Protected]
echo 24. List Volumes
echo 25. Clear Printer Spooler
echo --------------------------------------------------
echo UTILITIES
echo 26. File Explorer (C:\)
echo 27. Registry Editor [Protected]
echo 28. Services Manager
echo 29. Event Viewer
echo 30. Notepad
echo 31. Calculator
echo --------------------------------------------------
echo POWER
echo 32. Shutdown
echo 33. Restart
echo 34. Logoff
echo 35. Hibernate
echo --------------------------------------------------
echo EXTRAS
echo 36. Control Panel
echo 37. Device Manager
echo 38. Network Connections
echo 39. Firewall Settings
echo 40. Command Prompt (New Window)
echo 41. Exit
echo ==================================================
set /p choice=Choose an option: 

if "%choice%"=="1" goto IPCONFIG
if "%choice%"=="2" goto FLUSHDNS
if "%choice%"=="3" goto PINGTEST
if "%choice%"=="4" goto TRACEROUTE
if "%choice%"=="5" goto NETSTAT
if "%choice%"=="6" goto ARP
if "%choice%"=="7" goto ROUTE
if "%choice%"=="8" goto RELEASE
if "%choice%"=="9" goto RENEW
if "%choice%"=="10" goto NSLOOKUP
if "%choice%"=="11" goto SYSINFO
if "%choice%"=="12" goto TASKLIST
if "%choice%"=="13" goto TASKMGR
if "%choice%"=="14" goto RESMON
if "%choice%"=="15" goto PERFMON
if "%choice%"=="16" goto DRIVER
if "%choice%"=="17" goto BIOS
if "%choice%"=="18" goto GPUPDATE
if "%choice%"=="19" goto WINGET
if "%choice%"=="20" goto DISKCLEAN
if "%choice%"=="21" goto CHKDSK
if "%choice%"=="22" goto AUTH_SFC
if "%choice%"=="23" goto AUTH_DISM
if "%choice%"=="24" goto VOLUMES
if "%choice%"=="25" goto SPOOLER
if "%choice%"=="26" goto EXPLORER
if "%choice%"=="27" goto AUTH_REGEDIT
if "%choice%"=="28" goto SERVICES
if "%choice%"=="29" goto EVENTVIEWER
if "%choice%"=="30" goto NOTEPAD
if "%choice%"=="31" goto CALC
if "%choice%"=="32" goto SHUTDOWN
if "%choice%"=="33" goto RESTART
if "%choice%"=="34" goto LOGOFF
if "%choice%"=="35" goto HIBERNATE
if "%choice%"=="36" goto CONTROL
if "%choice%"=="37" goto DEVICEMGR
if "%choice%"=="38" goto NETCONN
if "%choice%"=="39" goto FIREWALL
if "%choice%"=="40" goto NEWCMD
if "%choice%"=="41" exit
goto MENU

:: Networking
:IPCONFIG
ipconfig /all
pause
goto MENU

:FLUSHDNS
ipconfig /flushdns
pause
goto MENU

:PINGTEST
ping 8.8.8.8
pause
goto MENU

:TRACEROUTE
tracert 8.8.8.8
pause
goto MENU

:NETSTAT
netstat -ano
pause
goto MENU

:ARP
arp -a
pause
goto MENU

:ROUTE
route print
pause
goto MENU

:RELEASE
ipconfig /release
pause
goto MENU

:RENEW
ipconfig /renew
pause
goto MENU

:NSLOOKUP
nslookup google.com
pause
goto MENU

:: System
:SYSINFO
systeminfo
pause
goto MENU

:TASKLIST
tasklist
pause
goto MENU

:TASKMGR
start taskmgr
goto MENU

:RESMON
start resmon
goto MENU

:PERFMON
start perfmon
goto MENU

:DRIVER
driverquery
pause
goto MENU

:BIOS
wmic bios get serialnumber,version
pause
goto MENU

:GPUPDATE
gpupdate /force
pause
goto MENU

:WINGET
cls
where winget >nul 2>nul
if errorlevel 1 (
    echo Winget not found. Please install App Installer from Microsoft Store.
    pause
    goto MENU
)
echo Running Winget upgrade for all apps...
"%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe" upgrade --all
pause
goto MENU

:: Storage & Security
:DISKCLEAN
cleanmgr
pause
goto MENU

:CHKDSK
chkdsk C:
pause
goto MENU

:AUTH_SFC
set /p "input=Enter admin password: "
if "%input%"=="%adminpass%" (
    goto SFC
) else (
    echo Access denied.
    pause
    goto MENU
)

:SFC
sfc /scannow
pause
goto MENU

:AUTH_DISM
set /p "input=Enter admin password: "
if "%input%"=="%adminpass%" (
    goto DISM
) else (
    echo Access denied.
    pause
    goto MENU
)

:DISM
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto MENU

:VOLUMES
diskpart /s list volume
pause
goto MENU

:SPOOLER
net stop spooler
del /Q /F "%systemroot%\System32\spool\PRINTERS\*.*"
net start spooler
pause
goto MENU

:: Utilities
:EXPLORER
start explorer C:\
goto MENU

:AUTH_REGEDIT
set /p "input=Enter admin password: "
if "%input%"=="%adminpass%" (
    goto REGEDIT
) else (
    echo Access denied.
    pause
    goto MENU
)

:REGEDIT
start regedit
goto MENU

:SERVICES
start services.msc
goto MENU

:EVENTVIEWER
start eventvwr.msc
goto MENU

:NOTEPAD
start notepad
goto MENU

:CALC
start calc
goto MENU

:: Power
:SHUTDOWN
shutdown /s /t 0
goto MENU

:RESTART
shutdown /r /t 0
goto MENU

:LOGOFF
shutdown /l
goto MENU

:HIBERNATE
shutdown /h
goto MENU

:: Extras
:CONTROL
start control
goto MENU

:DEVICEMGR
start devmgmt.msc
goto MENU

:NETCONN
start ncpa.cpl
goto MENU

:FIREWALL
start firewall.cpl
goto MENU

:NEWCMD
start cmd
goto MENU