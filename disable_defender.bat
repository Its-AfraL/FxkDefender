:: This opensource script will permanently disable Windows Defender to optimise your Windows
:: Don't forget to star the github rep
@echo off

cls
title FxkDefender ^| Opensource script to disable Windows Defender 
echo.
echo.
echo     __________      ______ ________     ________           _________            
echo     ___  ____/___  ____  /____  __ \_______  __/_________________  /____________
echo     __  /_   __  ^|/_/_  //_/_  / / /  _ \_  /_ _  _ \_  __ \  __  /_  _ \_  ___/
echo     _  __/   __^>  ^< _  ,^<  _  /_/ //  __/  __/ /  __/  / / / /_/ / /  __/  /      
echo     /_/      /_/^|_^| /_/^|_^| /_____/ \___//_/    \___//_/ /_/\__,_/  \___//_/     
echo.      
echo.                                                
echo                        ^|  Created by AfraL ^|
echo.
echo.
echo    Disabling Windows Defender protection for user : %USERNAME%
timeout /t 4 /nobreak  > nul
echo.
echo        Disabling real time monitoring protection

powershell Set-MpPreference -DisableRealtimeMonitoring 1 > nul

timeout /t 4 /nobreak  > nul

echo        Adding to regedit keys to permanently disable Windows Defender

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f > nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f > nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f > nul 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f > nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v "DisableHeuristics" /t REG_DWORD /d 1 /f > nul

timeout /t 4 /nobreak  > nul

echo        ReSetting up preferences to disable Defender

powershell Set-MpPreference -DisableRealtimeMonitoring $true > nul
echo.

echo    ^>^> Windows Defender has been disabled, press any key to reboot your computer
pause > nul
shutdown /r /t 60 