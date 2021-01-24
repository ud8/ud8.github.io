:: %1 is y/n to set the judge value
:: %2 is user input
:: if %2 EQU judge value will return 1

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\chechYesNo.bat y YES


@echo off

if [%1] EQU [y] (
	for %%i in (y Y yes Yes yEs yeS YEs YeS yES YES) do (
		if %2 EQU %%i (
			exit /b 1
		)
	)
)

if [%1] EQU [n] (
	for %%i in (n N no No nO NO) do (
		if %2 EQU %%i (
			exit /b 1
		)
	)
)

exit /b 0