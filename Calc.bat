@ECHO off
title Nickfost's Calculator
ECHO -----------------------------------------------------------
ECHO ^|Please enter a number with the corrisponding type of math^|
ECHO ----------------^|1. Addition       ^|-----------------------
ECHO                 ^|2. Subtraction    ^|
ECHO                 ^|3. Multiplication ^|
ECHO                 ^|4. Division       ^|
ECHO                  -------------------
:start
set/p menu=
if %menu%==1 goto add
if %menu%==2 goto sub
if %menu%==3 goto mul
if %menu%==4 goto div
ECHO sorry that was not a valid response.
ECHO Please try agian
goto start
:q
cls
ECHO Please provide the first number %to% %mathtype3% %from%
set/p first=
cls
ECHO Please provide the second number to %mathtype4%
ECHO Your current problem stands at %first% %mathtype2% ? = ?
set/p second=
cls
set /a math= %first% %mathtype2% %second% 
ECHO Your result is:
ECHO %first% %mathtype2% %second% = %math%
ECHO Would you like to do another math problem?
ECHO y/n
set/p yehno=
if "%yehno%"=="n" exit
if "%yehno%"=="y" Start Calc.bat
if "%yehno%"=="yes" Start Calc.bat
exit
:add
set mathtype2=+
set mathtype3=add
set to=to 
goto q
:sub
set mathtype2=-
set mathtype3=subtract
set mathtype4=subtract
set from=from
set to=to
goto q
:mul
set mathtype2=*
set mathtype3=multiply
set mathtype4=multiply
goto q
:div
set mathtype2=/
set mathtype4= Divide by
goto q
ECHO Nickfost made this :D....
