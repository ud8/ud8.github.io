:: %1 is bat-caller's path
:: please use %0 as %1 value

:: call-bat example at .\sub_bat\..
:: call %~dp0sub_bat\getAdmin.bat %0


@echo off

cmd /c %~dp0isAdmin.bat
if %ERRORLEVEL% EQU 1 (
	cd /d %~dp1
	goto :EOF
) else (
	echo Set RequestUAC = CreateObject^("Shell.Application"^) >"%temp%\getadmin.vbs"
	echo RequestUAC.ShellExecute %1,"","","runas",1 >>"%temp%\getadmin.vbs"
	echo WScript.Quit >>"%temp%\getadmin.vbs"

	"%temp%\getadmin.vbs" /f
	exit
)