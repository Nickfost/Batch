@echo off
REM NICKFOST.NET 2015

:: BatchGotAdmin
REM http://nckfst.us/pu6ie
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 

title Quick Downloads folder Sigcheck - Nickfost
echo THIS PROGRAM DOWNLOADS SIGCHECK AND CHECKS THE USERS DOWNLOAD FOLDER AND OPENS A TEXT FILE WITH RESULTS
echo MALICIOUS FILES WILL BE SUBMITTED TO VIRUSTOTAL FOR ANALYSIS
pause
cls
if exist %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\ RD /S /Q %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\
if not exist %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\ MD %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\
if exist %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\ CD %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\
echo Downloading latest Sigcheck...
REM SIGCHECK WRITTEN BY MARK RUSSINOVICH 
REM https://technet.microsoft.com/en-us/sysinternals/bb897441.aspx
bitsadmin.exe /transfer "sigcheck" https://download.sysinternals.com/files/sigcheck.zip %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\Sigcheck.zip >NUL
if not exist %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\Sigcheck.zip goto downloadSigcheckfail
echo Sigcheck Downloaded!
echo Downloading unzip application...
REM UNZIP APPLICATION WRITTEN BY GOVIND PARMAR
REM https://github.com/govindparmar/Unzip
bitsadmin.exe /transfer "unzipvbs" https://raw.githubusercontent.com/govindparmar/Unzip/master/Unzip.vbs %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\unzip.vbs >NUL
if not exist %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\unzip.vbs goto downloadunzipfail
echo Unzip application downloaded!
echo Unzipping...
cscript unzip.vbs Sigcheck.zip > NUL
if not exist %USERPROFILE%\AppData\Local\Temp\Nickfost\Sigcheck-checker\sigcheck.exe goto unzipfail
echo Unzipped!
echo Scanning all files in the downloads directory...
sigcheck.exe -vt -vrs -u -s %USERPROFILE%\Downloads > sigchecklog.txt
echo Finished!
echo Opening log...
start sighecklog.txt
echo Success!
echo Hopefully you find use of this script. 
echo If you are interested in batch just right click this file
echo and click edit. There is plenty to learn!


echo Press the any key to exit!
pause > NUL

exit

:unzipfail
echo Unzipping failed. Please create a Github issue:
echo https://github.com/Nickfost/Batch/issues/new
echo or you can email me at me@nickfost.com.
pause
exit

:downloadSigcheckfail
echo The download of Sigcheck failed.
echo Please check your internet connection. 
goto downloadfail

:downloadunzipfail
cls
echo The download of the unzip functionality failed. 
echo Please check your internet connection. 
goto downloadfail

:downloadfail
echo if the internet connection is not the issue please create a Github issue:
echo https://github.com/Nickfost/Batch/issues/new
echo or you can email me at me@nickfost.com.
pause
exit

