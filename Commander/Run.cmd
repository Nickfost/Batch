@echo off
echo.
echo Hi, I can Run the Same command billions of times
echo.
pause
cls
echo We can run the same command one after another (queued) or we can run them all at once
echo.
echo.
echo That is up to you
pause
cls
:q1
echo So, What'll it be?
echo Press the number with the corrisponding Choice
echo.
echo 1. Queued      
echo 2. All at once 
echo 3. Both        
SET /P type=
if  "%type%"=="1" goto qued
goto 1