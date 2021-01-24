:: %1 is test-number
:: %2 is lower-limit, %3 is upper-limit
:: %4 and %5 is yes/no to choice %1 include/except %2 or %3 

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\in_range.bat 5 1 10 n n

:: return 1 if in range
:: return -10 if LSS/LEQ the lower-limit
:: return 10 if GTR/GEQ the upper-limit
:: return -65535 if lower-limit and upper-limit error


@echo off

if %2 GTR %3 (
	exit /b -65535
)

set OPER1=GTR
cmd /c %~dp0checkYesNo.bat y %4
if %ERRORLEVEL% EQU 1 (
	set OPER1=GEQ
)

set OPER2=LSS
cmd /c %~dp0checkYesNo.bat y %5
if %ERRORLEVEL% EQU 1 (
	set OPER2=LEQ
)

if %1 %OPER1% %2 (
	if %1 %OPER2% %3 (
		exit /b 1
	) else (
		exit /b 10
	)
) else (
	exit /b -10
)