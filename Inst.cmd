:: Hello!
:: Just a reminder that this script will have every explanation on it

:: Without further ado, let's get started
@echo off
title Inst

:: Check if Roblox exists in Local AppData
for /d %%x in ("%localappdata%\Roblox\Versions\*") do (
   if exist "%%x\RobloxPlayerBeta.exe" (
      set csfolder=%%x
      set lct=Local AppData
      goto instFolder
   )
)

:: Check if Roblox exists in Program Files
for /d %%x in ("C:\Program Files\Roblox\Versions\*") do (
   if exist "%%x\RobloxPlayerBeta.exe" (
      set csfolder=%%x
      set lct=Program Files
      goto instFolder
   )
)

:: Check if Roblox exists in Program Files (x86)
for /d %%x in ("C:\Program Files (x86)\Roblox\Versions\*") do (
   if exist "%%x\RobloxPlayerBeta.exe" (
      set csfolder=%%x
      set lct=Program Files (x86)
      goto instFolder
   )
)

:: If Roblox is not found in any of these locations, ask user to re-install Roblox
echo Roblox is not found, please re-install your Roblox
timeout /t 2 /nobreak >nul
exit

:: If "ClientSettings" folder doesn't exist, create one
:instFolder
if not exist "%csfolder%\ClientSettings" (
   mkdir "%csfolder%\ClientSettings"
)
goto instMain

:: Displays the main page if Roblox is found
:instMain
cls
echo ^<----------------------- x -----------------------^>
echo ^<        Inst            ^|    %lct%              ^>
echo ^<----------------------- x -----------------------^>
echo ^< 1) Optimal Quality     ^| 3) Uninstall          ^>
echo ^<                        ^|                       ^>
echo ^< 2) Potato Quality      ^| 4) Exit               ^>
echo ^<----------------------- x -----------------------^>
echo ^<            5) Run Roblox via Inst               ^>
echo ^<                 (Web Roblox)                    ^>
echo ^<----------------------- x -----------------------^>
echo+
set /p w="> "
if "%w%" equ "1" (
    goto optimal
)
if "%w%" equ "2" (
    goto potato
)
if "%w%" equ "3" (
    goto uninstall
)
if "%w%" equ "4" (
    exit
)
if "%w%" equ "5" (
    start "" "https://www.roblox.com/home"
    exit
)
echo Option not valid, please try again
timeout /t 2 /nobreak >nul
goto instMain

:: If user's choice is "optimal quality", start downloading optimal.ist
:: Link: https://github.com/nulasw/Inst/blob/main/Basic.json
:: If no error is encountered, go back to the main page
:: If an error exists, tell the user to contact the creator
:optimal
cls
echo Optimizing...
echo+
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/nulasw/Inst/main/Basic.json', '%csfolder%\ClientSettings\ClientAppSettings.json')"
if %errorlevel% equ 0 (
    echo Successfully imported optimal quality!
    timeout /t 2 /nobreak >nul
) else (
    echo Failed to import optimal quality!
    echo+
    echo Please report this issue to @spectaclet on Discord
    timeout /t 2 /nobreak >nul
)
goto instMain

:: Same step as optimal quality, but this time we are importing potato quality
:: Link: https://github.com/nulasw/Inst/blob/main/Super.json
:potato
cls
echo Optimizing...
echo+
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/nulasw/Inst/main/Super.json', '%csfolder%\ClientSettings\ClientAppSettings.json')"
if %errorlevel% equ 0 (
    echo Successfully imported potato quality!
    timeout /t 2 /nobreak >nul
) else (
    echo Failed to import potato quality!
    echo+
    echo Please report this issue to @spectaclet on Discord
    timeout /t 2 /nobreak >nul
)
goto instMain

:: If user's choice is "uninstall", delete "ClientSettings" folder in Roblox directory
:uninstall
cls
set /p w="You are removing your 'ClientSettings', are you sure you want to continue (Y/N) "
if /i "%w%" equ "Y" (
   rmdir /s /q "%csfolder%\ClientSettings"
   echo+
   echo Uninstallation was successful
   timeout /t 2 /nobreak >nul
)
   if /i "%w%" equ "N" (
      goto instMain
   )
   echo Option not valid, please try again
   timeout /t 2 /nobreak >nul
   goto uninstall
