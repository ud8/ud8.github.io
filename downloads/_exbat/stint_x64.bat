:: call-bat example at .\sub_bat\..
:: call %~dp0sub_bat\stint_x64.bat

:: if you call the batch, your page-code will change to UTF-8 (65001) 


@echo off

cmd /c %~dp0UTF-8.bat
cmd /c %~dp0is_x64.bat
if %ERRORLEVEL% EQU 1 (
	goto :EOF
) else (
	color 0c
	echo.
	echo   本程式僅作用於 x64 系統
	echo.
	echo   您的系統不符合條件
	echo.
	echo   將於 10 秒後退出
	cmd /c %~dp0pause.bat 10
	exit
)

