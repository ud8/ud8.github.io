@echo off
if [%1] EQU [min] (
mode con lines=1 cols=15
) else (
mode con lines=%1 cols=%2
)