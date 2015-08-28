@echo off
REM 2015 Nickfost.net
echo This script overwrites deleted data on all volumes. Press the enter key to continue.
PAUSE >nul
(for /F %%a in ('wmic logicaldisk get caption') do (
   Cipher /w:%%a
))
pause