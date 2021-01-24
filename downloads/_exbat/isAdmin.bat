:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\isAdmin.bat

:: return 1 if is admin
:: return 0 when is not admin


@echo off

reg query "HKU\S-1-5-19\Environment" >NUL 2>NUL

if %ERRORLEVEL% EQU 0 (
	exit /b 1
)
exit /b 0