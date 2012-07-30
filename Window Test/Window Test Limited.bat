@echo off
title WARNING
echo This is VERY DANGEROUS
echo Use at your own risk
pause
cls
Title How many windows can you open
echo Number windows to open:
set/p killnum=
echo Started opening %killnum% windows at %time% >> Log_Windows_test(limited).txt
set wind=1
start cmd
:a
if /i "%wind%"=="%killnum%" goto Exit
ECHO %wind%
start explorer.exe
SET /a wind=%wind% + 1
title You can open %wind% Windows
if /i "%wind%"=="%killnum%" goto Exit
echo Number of windows opened %wind% >> Log_Windows_test(limited).txt
goto a
:exit
echo I succsessfully opened %killnum% windows at %time%
echo I succsessfully opened to %killnum% windows at %time% >> Log_Windows_test(limited).txt
pause
echo ~Nickfost~
exit