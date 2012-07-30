@echo off
echo Number to count to:
set/p killnum=
echo Started counting to %killnum% at %time%> Log_Counter(limited).txt
echo 1 >> Log_Counter(limited).txt
SET loopcount=1
SET num=1
:a
cls
ECHO %num%
SET /a num=%num% + 1
title I Can Count To:%num%
if /i "%num%"=="%killnum%" goto Exit
echo %num% >> Log_Counter(limited).txt
GOTO a
:exit
cls
echo %NUM%
echo I Succsessfully counted to %killnum% at %time%
echo I Succsessfully counted to %killnum% at %time% >> Log_Counter(limited).txt
pause
exit
echo ~Nickfost~
exit