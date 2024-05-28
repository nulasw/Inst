@echo off
title Inst

set "csfolder="

for /d %%x in ("%localappdata%\Roblox\Versions\*") do (
   if exist "%%x\RobloxPlayerBeta.exe" (
      set "csfolder=%%x"
      set "Directory=Local AppData"
      goto :instFolder
    )
)

for /d %%x in ("C:\Program Files\Roblox\Versions\*") do (
   if exist "%%x\RobloxPlayerBeta.exe" (
      set "csfolder=%%x"
      set "Directory=Program Files"
      goto :instFolder
    )
)

for /d %%x in ("C:\Program Files (x86)\Roblox\Versions\*") do (
   if exist "%%x\RobloxPlayerBeta.exe" (
      set "csfolder=%%x"
      set "Directory=Program Files (x86)"
      goto :instFolder
    )
)

:instFolder
if defined csfolder (
  if not exist "%csfolder%\ClientSettings" (
     md "%csfolder%\ClientSettings"
    )
)

:instMain
cls
echo ----------------------------
echo           Inst
echo ----------------------------
echo  Directory: %Directory%
echo ----------------------------
echo [1] Basic Optimize
echo    (Default)
echo.
echo [2] Super Optimize
echo     (Potato)
echo.
echo [3] Remove Inst
echo.
echo [4] Exit
echo ----------------------------
echo       Version: 03
echo ----------------------------
echo     Copyright nulasw
echo ----------------------------
echo.
set /p key="Enter your option: "
if "%key%"=="1" (
    goto basic
)
if "%key%"=="2" (
    goto super
)
if "%key%"=="3" (
    goto remove
)
if "%key%"=="4" (
    goto exit
)
echo Option not valid, please try again.
pause
goto instMain

:basic
cls
echo Start optimizing...
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/nulasw/Inst/main/Basic.json', '%csfolder%\ClientSettings\ClientAppSettings.json')"
    echo Successfully optimized Roblox!
    pause
    goto instMain
) else (
    echo Failed to optimize Roblox!
    echo.
    pause
    goto instMain
)

:super
cls
echo Start optimizing...
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/nulasw/Inst/main/Super.json', '%csfolder%\ClientSettings\ClientAppSettings.json')"
    echo Successfully optimized Roblox!
    pause
    goto instMain
) else (
    echo Failed to optimize Roblox!
    echo.
    pause
    goto instMain
)

:remove
cls
set /p key="You are removing Inst, are you sure you want to continue (Y/N) : "
if /i "%key%"=="Y" (
   rmdir /s /q "%csfolder%\ClientSettings"
   goto instMain
)
if /i "%key%"=="N" (
   echo Yippee!11!111
   pause
   goto instMain
)
echo Option not valid, please try again.
pause
goto remove

:exit
exit
