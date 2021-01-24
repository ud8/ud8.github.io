@echo off
chcp 65001 >NUL

echo 請選擇螢幕顯示型態
echo 1. only show on internal screen
echo 2. 同步顯示螢幕
echo 3. 螢幕延伸
echo 4. 僅在外部螢幕顯示

echo 註: 也可以按下 win + P 鍵調整

set /p inp=

if %inp% EQU 1 set code=/internal
if %inp% EQU 2 set code=/clone
if %inp% EQU 3 set code=/extend
if %inp% EQU 4 set code=/external

displayswitch %code%