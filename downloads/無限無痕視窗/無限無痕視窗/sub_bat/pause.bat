@echo off
:start
timeout 1 >NUL
set /a a+=1
if %a% LSS %1 goto start