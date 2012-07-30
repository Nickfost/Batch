@echo off
Title Info Finder 3.0
echo Do You Need Info? (y/n)
SET /P no=
if '%no%'=='y' goto Make
if '%no%'=='Y' goto Make
if '%no%'=='n' exit
if '%no%'=='N' exit
start http://lmgtfy.com/?q=%no%
exit
:make
cls
echo What Info Do You Need?
echo Only One Word Please
SET /P info=
start http://lmgtfy.com/?q=%info%
cls