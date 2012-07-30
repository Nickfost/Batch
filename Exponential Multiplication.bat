@echo off
title Exponential Adder
echo How many times do you want to exponentialy multiply? (6 max) 
set/p killnum=
if /i "%killnum%"=="why" goto explian
SET /A loopcount=1
SET /A num=2
:a
cls
echo %num%
SET /A num = %num% * %num%
SET /A loopcount = %loopcount% + 1
title Times Exponentialy Mulitplied:%loopcount%
if /i "%loopcount%"=="%killnum%" goto Exit
GOTO a
:exit
echo I successfully Exponentialy Mulitplied %killnum% times and the result is %num% 
pause
exit
echo ~Nickfost~
exit
:explian
echo Cmd can only do 32bit math
echo sadly 65536 * 65536 is not 32 bit math...
echo otherwise this code is a perfect solution to unlimitly find exponential multiples of things
pause
goto exit