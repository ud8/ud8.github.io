@echo off
cmd /c %~dp0sub_bat\resizeCLI.bat 3 35
cmd /c %~dp0sub_bat\nextObj.bat %0 "%tmp%" c
set err=%ERRORLEVEL%
set dir="%tmp%\%err%"
echo waiting for close chrome.exe [%err%]
start /wait C:\"Program Files (x86)"\Google\Chrome\Application\chrome.exe --incognito --user-data-dir=%dir%
echo chrome.exe [%err%] closed!
cmd /c %~dp0sub_bat\pause.bat 2
rmdir /s /q %dir%
