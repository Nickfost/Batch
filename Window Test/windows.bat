@echo off
title WARNING
echo This is VERY DANGEROUS
echo Use at your own risk
pause
cls
Title How many windows can you open
echo Number windows to open:
set/p killnum=
set wind=1
start explorer.exe
:a
if /i "%wind%"=="%killnum%" goto Exit
ECHO %wind%
start explorer.exe
SET /a wind=%wind% + 1
title You can open %wind% Windows
if /i "%wind%"=="%killnum%" goto Exit
goto a
:exit
echo I succsessfully opened %killnum% windows at %time%
echo ~Nickfost~
exit