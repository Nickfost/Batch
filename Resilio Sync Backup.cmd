@ECHO OFF

REM NICKFOST.NET 2016

REM THIS SCRIPT REQUIRES RESILIO SYNC, WINRAR, TERACOPY, AND WINDOWS 7 OR LATER. 

REM CONFIG
SET Backup-Folder="SET ME"
SET Resilio-Sync-Storage-Folder="SET ME"

SET Workspace="%USERPROFILE%\AppData\Local\Temp\Nickfost\Resilio-Sync-Backup\"
SET Winrar-exe-Path="C:\Program Files\WinRAR\WinRAR.exe"
SET Teracopy-exe-Path="C:\Program Files\TeraCopy\TeraCopy.exe"
SET Resilio-Sync-Path="%USERPROFILE%\AppData\Roaming\Resilio Sync\"
SET Resilio-Sync-exe-name="Resilio Sync.exe"

TITLE [Resilio Sync Backup] [Starting]
ECHO.
ECHO [Starting]
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" GOTO s_done
      SET _yyyy=%%L
      SET _mm=00%%J
      SET _dd=00%%G
)
:s_done
SET _mm=%_mm:~-2%
SET _dd=%_dd:~-2%
SET _hour=%_hour:~-2%
SET Filename=%_mm%-%_dd%-%_yyyy%" Resilio Sync Backup.rar"
if exist %Workspace% RD /S /Q %Workspace%
if not exist %Workspace% MD %Workspace%
if exist %Workspace% CD %Workspace%
TIMEOUT /T 5 /NOBREAK >NUL
TITLE [Resilio Sync Backup] [Opening Resilio Sync]
ECHO.
ECHO [Opening Resilio Sync]
START "[Resilio Sync Backup] [Opening Resilio Sync]" /MIN cmd.exe /C "%Resilio-Sync-Path%%Resilio-Sync-exe-name% /minimized" 
TIMEOUT /T 5 /NOBREAK >NUL
TITLE [Resilio Sync Backup] [Stopping Sync]
ECHO.
ECHO [Stopping Sync]
TASKKILL /IM %Resilio-Sync-exe-name% /F >NUL
TIMEOUT /T 5 /NOBREAK > NUL
TITLE [Resilio Sync Backup] [Performing Archival]
ECHO.
ECHO [Performing Archival]
%Winrar-exe-Path% a -r -y -m5 -IBCK -t -w%Workspace% -- %Workspace%/%Filename% %Resilio-Sync-Storage-Folder%
TIMEOUT /T 5 /NOBREAK > NUL
TITLE [Resilio Sync Backup] [Copying to Destination]
ECHO.
ECHO [Copying to Destination]
%Teracopy-exe-Path% Move %Workspace%%Filename% %Backup-Folder% /OverwriteOlder /Close
TIMEOUT /T 5 /NOBREAK >NUL
TITLE [Resilio Sync Backup] [Re-Opening Resilio Sync]
ECHO.
ECHO [Re-Opening Resilio Sync]
if exist %Resilio-Sync-Path% CD %Resilio-Sync-Path%
start "" ""%Resilio-Sync-exe-name%"" /minimized
TIMEOUT /T 5 /NOBREAK > NUL
TITLE [Resilio Sync Backup] [Finished]
ECHO.
ECHO [Finished]
TIMEOUT /T 5 /NOBREAK > NUL
ECHO.
ECHO Check out Nick Foster!
ECHO.
ECHO Nickfost.net
TIMEOUT /T 60