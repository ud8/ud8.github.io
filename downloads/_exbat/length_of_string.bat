:: %1 is analyte-string
:: if any space in string, plz use "" to include string
:: be careful that both "" is counted in. 

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\length_of_string.bat "123456"

@echo off

set string=%1
set length=0

:loop
if defined string (
	set string=%string:~1%
	set /a length+=1
	goto loop
)

exit /b %length%