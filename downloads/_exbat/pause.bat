:: %1 is int as pause-time
:: do NOT use (space) as %1 value

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\pause.bat 5


@echo off

:start
	timeout 1 >NUL
	set /a a+=1
if %a% LSS %1 goto start