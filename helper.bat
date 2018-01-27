@echo off
mode con: cols=25 lines=2
set startloop=0
setlocal enabledelayedexpansion
:startloop
echo .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
echo . .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
echo . . .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
echo . . . .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
echo . . .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
echo . .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
echo .
PING 1.1.1.1 -n 1 -w 2 >NUL
cls
PING 1.1.1.1 -n 1 -w 2 >NUL
set /a "setloop=%setloop%+1"
if %setloop%==5 goto afterloop
goto startloop
:afterloop
cls
mode con: cols=58 lines=13
echo Some Random Helper
echo Not made to be user friendly
pause
:menu
cls
set /p "userInput= "

echo %userInput%>userInput.txt
title The Input '%userInput%' Has Sent
if "%userInput%"=="exit" exit
if "%userInput%"=="startFace" start helperFace.bat
goto menu