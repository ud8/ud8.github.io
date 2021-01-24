:: %1 is bat-caller's path, please use %0 as %1 value
:: %2 is work path
:: if %3 == 'c', create the next object (optional without %4)
:: %4 is file extension (optional), if exist, will check the count for *.%4 in work path

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\nextObj.bat %0 "%tmp%" c .txt


@echo off

cd /d %2

set count=0
:aa
	set /a count+=1
if exist %count%%4 goto aa

if [%3] EQU [c] (
	if [%4] EQU [] (
		mkdir %count%
	) else (
		type NUL>%count%%4
	)
)

cd /d %~dp1
exit /b %count%





:: 下面是錯誤的用法, 會產生兩行空白行而非全空檔案
:: echo.>%count%%4