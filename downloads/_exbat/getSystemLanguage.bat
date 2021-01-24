:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\getSystemLanguage.bat

:: return numbers list is in the getSystemLanguage.txt


@echo off

for /f "tokens=1,2,3 delims= " %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Nls\Language" /v "InstallLanguage"') do (
	if "%%k" NEQ "" (
		exit /b %%k
	)
)