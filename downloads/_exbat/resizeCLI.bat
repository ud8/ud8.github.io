:: %1 is row-lines and %2 is column-lines
:: or input %1 as min to set CLI to minimum value

:: call-bat example at .\sub_bat\..
:: cmd /c %~dp0sub_bat\resizeCLI.bat 50 100


@echo off

if [%1] EQU [min] (
	mode con lines=1 cols=15
) else (
	mode con lines=%1 cols=%2
)