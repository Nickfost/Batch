@echo off
title WARNING
echo This is DANGEROUS
echo Use at your own risk
pause
cls
echo @echo off > pops.bat
echo exit >> pops.bat
Title How many popups can you open?
echo Number popups to open:
set/p killnum=
cls
echo Started opening %killnum% popups at %time% > Log_Popups(limited).txt
set wind=1
start pops.bat
echo %wind% Popups Finished >> Log_Popups(limited).txt
:a
if /i "%wind%"=="%killnum%" goto Exit
ECHO %wind%
start pops.bat
SET /a wind=%wind% + 1
title You can open %wind% popups.
echo %wind% Popups Finished >> Log_Popups(limited).txt
if /i "%wind%"=="%killnum%" goto Exit
goto a
:exit
cls
echo I succsessfully opened %killnum% popups at %time%
echo I succsessfully opened %killnum% popups at %time% >> Log_Popups(limited).txt
pause
del pops.bat
start Log_Popups(limited).txt
cls
echo ~Nickfost~
exit