@echo off
mode con: cols=58 lines=20
set timeDisplay=0
set dateDisplay=0
set infoDisplay=0
set tom=0

setlocal enabledelayedexpansion
title Face
:main
set /p userInput=<userInput.txt
:loop
if %timeDisplay%==1 title %time%
if %dateDisplay%==1 title %date%
if %infoDisplay%==1 title %time% %date% %username%

set /a tom=%tom%+1
if "%tom%"=="10000" goto idle

set "oldUserInput=%userInput%"
set /p userInput=<userInput.txt
if "%userInput%"=="%oldUserInput%" goto loop

:inputRecieved
title Output '%userInput%' Recieved
::if statement block
::for functions
if "%userInput%"=="freakOut" goto freakout
if "%userInput%"=="exit" exit
if "%userInput%"=="timeTitle" (
	set timeDisplay=1
	set dateDisplay=0
	set infoDisplay=0
)
if "%userInput%"=="dateTitle" (
	set dateDisplay=1
	set timeDisplay=0
	set infoDisplay=0
)
if "%userInput%"=="infoTitle" (
	set infoDisplay=1
	set dateDisplay=0
	set timeDisplay=0
)
if "%userInput%"=="test" goto idle
if "%userInput%"=="time" echo %time%
if "%userInput%"=="cls" (
set timeDisplay=0
set dateDisplay=0
set infoDisplay=0
echo.>userInput.txt
title Face
cls
)
::end if statement block
goto :main
:freakout
cls
set counter2=0
:numericalI
set line=%random%%random%%random%%random%
set "randomm=!line:~0,2!"
set cols=%randomm%
mode con: cols=%cols% lines=20
if %counter2%==10 goto main
set /a counter2=%counter2%+1
goto numericalI

PING 1.1.1.1 -n 1 -w 3 >NUL
color a1
echo FREAKOUT
PING 1.1.1.1 -n 1 -w 3 >NUL
color a2
PING 1.1.1.1 -n 1 -w 3 >NUL
color 0f
PING 1.1.1.1 -n 1 -w 3 >NUL
color 0a
PING 1.1.1.1 -n 1 -w 3 >NUL
color 10
PING 1.1.1.1 -n 1 -w 3 >NUL
color 07
PING 1.1.1.1 -n 1 -w 3 >NUL
mode con: cols=58 lines=20
goto loop
:idle
PING 1.1.1.1 -n 1 -w 3 >NUL
cls
type face1.txt
PING 1.1.1.1 -n 1 -w 1 >NUL
type face3.txt
type face2.txt
PING 1.1.1.1 -n 1 -w 2 >NUL
type face3.txt
PING 1.1.1.1 -n 1 -w 3 >NUL
echo.
cls
set tom=0
goto main