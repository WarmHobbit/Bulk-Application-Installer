@echo off
title Bulk Program Installation
cls

setlocal enabledelayedexpansion

set count1=0
set count2=0

::Array app - 
set app[0]="Adobe Acrobat Reader DC|XPDP273C0XHQH2"
set app[1]="Audacity|Audacity.Audacity"
set app[2]="Blender|BlenderFoundation.Blender"
set app[3]="Bulk Rename Utility|TGRMNSoftware.BulkRenameUtility"
set app[4]="Google Drive for PC|Google.GoogleDrive"
set app[5]="HWiNFO|REALiX.HWiNFO"
set app[6]="ImgBurn|LIGHTNINGUK.ImgBurn"
set app[7]="MP3Tag|FlorianHeidenreich.Mp3tag"
set app[8]="Nicotine+|Nicotine+.Nicotine+"
set app[9]="Oracle VM VirtualBox|Oracle.VirtualBox"
set app[10]="Python (3.13)|Python.Python.3.13"
set app[11]="Qbittorrent|qBittorrent.qBittorrent"
set app[12]="Quick Share|Google.QuickShare"
set app[13]="Recuva|Piriform.Recuva"
set app[14]="Steam|Valve.Steam"
set app[15]="Tailscale|Tailscale.Tailscale"
set app[16]="Tor Browser|TorProject.TorBrowser"
set app[17]="VLC Media Player|VideoLAN.VLC"
set app[18]="VS Code|Microsoft.VisualStudioCode"
set app[19]="WhatsApp|9NKSQGP7F2NH"
set app[20]="WinDirStat|WinDirStat.WinDirStat"
set app[21]="Windows Scan|9WZDNCRFJ3PV"
set app[22]="WinRAR|RARLab.WinRAR"
set app[23]="HP Smart|9WZDNCRFHWLH"


echo [36mFull list of apps included[0m - 
:list
if %count2% leq 23 (
   for /f "tokens=1,2 delims=|" %%A in ("!app[%count2%]!") do (
      set AName=%%A
      echo !AName:~1!
   )
   set /a count2+=1
   goto :list
)

echo.
echo [36mNow let's proceed with installation[0m - 

:loop
if %count1% leq 23 (
    @REM echo %count1%
    @REM echo !count1!
    for /f "tokens=1,2 delims=|" %%A in ("!app[%count1%]!") do (
       set name=%%A
       set id=%%B
       echo.
       set /P choice="Do you wish to install [32m!name:~1![0m? [Y/N/I] (I = Learn more) : "
       ::There is this this thing called escape sequence which allows text to be colored. To use, "[32mGreen[0m" replace "Green" with your text. 
       ::'%string:~1%' returns the string sans the first character

    @REM    echo !choice!
    @REM    echo %choice%

       if /i "!choice!" EQU "Y" (
        echo Installing !name!...
      @REM   winget show !id!
        winget install !id!
       ) else if /i "!choice!" EQU "N" (
         echo Skipping !name:~1!...
       ) else if /i "!choice!" EQU "I" (
         winget show !id!
         echo.
         set /P choice2="[34mWanna install now? [Y/N] : [0m"
         if /i "!choice2!" EQU "Y" (
            echo Alright!
            echo.
            @REM winget show !id!
            winget install !id!
         ) else if /i "!choice2!" EQU "N" (
            echo Skipping !name:~1!...
         ) else (
            echo Invalid input; maybe try again? - 
            goto :loop
         )
       ) else (
         echo Invalid input; maybe try again? - 
         goto :loop
       )
    )
    set /a count1+=1
    goto :loop
)

echo All apps processed!
pause
