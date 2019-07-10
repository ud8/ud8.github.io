

@echo off

:start

set /p inputt=請輸入連結 

echo "</br>%date% %time% --> <a href="%inputt%">%inputt%</a>">>lnk.html"

goto start