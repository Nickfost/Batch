@echo off
mode con: cols=30 lines=2
echo 1 > Log_Counter(Inf).txt
SET num=1
:a
cls
ECHO %num%
SET /a num=%num% + 1
title I Can Count To:%num% 
echo %num% >> Log_Counter(Inf).txt
GOTO a
:exit
echo ~Nickfost~
exit