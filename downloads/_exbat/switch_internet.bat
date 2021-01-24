:: the batch needs admin-permission

:: %1 is 10/-10 to choose enabled/disabled internet

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\switch_internet.bat -10


@echo off

cmd /c %~dp0UTF-8.bat

if %1 EQU 10 (
	set en_dis=enabled
)
if %1 EQU -10 (
	set en_dis=disabled
)

for /f "skip=3 tokens=3* delims= " %%i in ('netsh interface show interface') do (
	netsh interface set interface name="%%j" admin=%en_dis% >NUL 2>NUL
)





:: cannot apply for internet interface name that has space like "a  bc d"

::	set type=Disconnected
::	set type=Connected

:: for /f "tokens=1,2,3,4 delims= " %%i in ('netsh interface show interface ^| find "%type%"') do (
:: 	netsh interface set interface name="%%l" admin=%en_dis% >NUL 2>NUL
:: )



:: remember that if you used UTF-8 encoded, the "type" variable is fixed in english

::	cmd /c %~dp0getSystemLanguage.bat
::	if %ERRORLEVEL% EQU 404 (
::		if %en_dis% EQU enabled (
::			set type=已中斷連線
::		) else (
::			set type=已連線
::		)
::	)
::	if %ERRORLEVEL% EQU 411 (
::		if %en_dis% EQU enabled (
::			set type=切断
::		) else (
::			set type=接続
::		)
::	)

::	Language ID	Linked		unLinked
::	0411		接続		切断
::	0404		已連線		已中斷連線