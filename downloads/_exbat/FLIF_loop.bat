:: For Line In File do {{%2 commands}}
:: %1 as filename to read and loop

:: you can use __DEF_i if want to get data in for loop at batch


@echo off

for /f "tokens=1,* delims= " %%a in ("%*") do set command=%%b

SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%a in (%1) do (
	if [%%a] EQU [__DEF_EOL_] (exit)
	start !command:__DEF_i=%%a!
)
ENDLOCAL
