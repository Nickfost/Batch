@echo off
title Crazy Raca Options
mode con: cols=60 lines=60
echo How many Racaca's do you want?
set/p killnum=
SET loopcount=4
SET cas=ca
:a
cls
ECHO ra%cas%
SET cas=%cas%%cas%
SET /A loopcount= %loopcount% * 2
title Number Of Characters %loopcount%
if /i "%loopcount%"=="%killnum%" goto Exit
GOTO a
:exit
echo I successfully 'racaca'ed %killnum% times
exit
echo ~Nickfost~
exit