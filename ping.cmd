@echo off
REM 2015 Nickfost
mode con: cols=22 lines=2
:start
%SystemRoot%\system32\ping.exe -n 1 web.randomdevelopment.biz >nul
cls
if errorlevel 1 goto offline
COLOR 0F
echo webserver is online.
goto start
:offline
COLOR FC
echo webserver is offline.
goto start