@echo off
Title Info Finder By Nickfost
echo Do You Need Info? (y/n)
SET /P need=
if '%need%'=='y' goto INFONEEDED
if '%need%'=='Y' goto INFONEEDED
if '%need%'=='yes' goto INFONEEDED
if '%need%'=='Yes' goto INFONEEDED
if '%need%'=='YES' goto INFONEEDED
exit
:INFONEEDED
cls
echo What Info Do You Need?
echo Only One Word Please
SET /P info=
start http://lmgtfy.com/?q=%info%
cls