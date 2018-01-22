@echo off
setlocal enabledelayedexpansion
color 0f
mode con: cols=58 lines=2
:loop
cls
echo %date%   %username%
PING 1.1.1.1 -n 1 -w 1 >NUL
title %time%
goto loop
