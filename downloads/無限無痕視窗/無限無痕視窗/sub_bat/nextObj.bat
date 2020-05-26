@echo off
cd /d %2
set count=0
:aa
set /a count+=1
if exist %count%%4 goto aa
if [%3] EQU [c] (if [%4] EQU [] (mkdir %count%) else (type NUL>%count%%4))
cd /d %~dp1
exit /b %count%