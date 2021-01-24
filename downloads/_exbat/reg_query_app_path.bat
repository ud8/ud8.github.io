:: %1 is app name

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\reg_query_app_path.bat notepad.exe


@cho off

cmd /c %~dp0UTF-8.bat

for /f "skip=1 tokens=3* delims= " %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%1"') do (
	set appPath=%%i
)

if [%2] NEQ [] (
	echo %appPath%>%2\%1.path
) else (
	echo %appPath%>%tmp%\%1.path
)