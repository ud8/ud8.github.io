:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\is_x64.bat


@echo off

if %PROCESSOR_ARCHITECTURE% EQU AMD64 (
	exit /b 1
)
exit /b 0