:: the batch needs admin-permission

:: %1 is 10/-10 to choose enabled/disabled internet

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\switch_internet.bat -10


@echo off

chcp 65001

if %1 EQU 10 (
	set en_dis=enabled
)
if %1 EQU -10 (
	set en_dis=disabled
)

for /f "skip=3 tokens=3* delims= " %%i in ('netsh interface show interface') do (
	netsh interface set interface name="%%j" admin=%en_dis% >NUL 2>NUL
)