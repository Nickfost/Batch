@echo off
REM 2015 Nickfost
set /a x=0
:loop
start http://niceme.me
set /a x=%x%+1
if %x% NEQ 100 goto loop
exit