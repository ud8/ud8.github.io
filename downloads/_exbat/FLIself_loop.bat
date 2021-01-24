@echo off
goto start

:: write below this line, empty line wont counted in.

1
2
3
4
5
6
7
8
__DEF_EOL_


:start
SETLOCAL ENABLEDELAYEDEXPANSION

set skipedCount=0
set skipLineCount=3

for /f "tokens=*" %%a in (%0) do (
	if [%%a] EQU [__DEF_EOL_] ( exit )

	set /a skipedCount+=1
	if !skipedCount! GTR !skipLineCount! (
		echo %%a
		cmd /c manager.bat download %%a
	)
)
ENDLOCAL
