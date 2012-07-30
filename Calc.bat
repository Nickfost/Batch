@echo off
title Calc
echo Please enter a number with the corrisponding type of math
Echo 1. Addition
echo 2. Subtraction
Echo 3. Multiplication
echo 4. Division
:start
set/p menu=
if %menu%==1 goto add
if %menu%==2 goto sub
if %menu%==3 goto mul
if %menu%==4 goto div
echo  We are sorry that was not a valid response.
echo  Please try agian
goto start
:q
cls
echo Please provide the first number %to% %mathtype3% %from%
set/p first=
cls
echo Please provide the second number to %mathtype4%
echo Your current problem stands at %first% %mathtype2% ? = ?
set/p second=
cls
set /a math= %first% %mathtype2% %second% 
echo Your result is:
echo %first% %mathtype2% %second% = %math%
echo Would you like to do another math problem?
echo y/n
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
echo Nickfost made this :D.... 
echo seriously, he did!
