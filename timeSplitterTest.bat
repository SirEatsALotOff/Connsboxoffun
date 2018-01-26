setlocal enabledelayedexpansin
::This line is for testing purposes only :)
::set /p input=
set input=%1
::comment out the above line if you need to enable in program input.
set "hour=%time:~0,2%"
set "minute=%time:~3,2%"
set "second=%time:~6,2%"
set /a "minuteP=%input%/60"
set /a "hourP=%minuteP%/60"
set /a "minuteP=%minuteP%-(%hourP%*60)"
set /a "secondP=%input%-((%minuteP%*60)+(60*(%hourP%*60)))"
set /a "second=%second%+%secondP%"
set /a "minute=%minute%+%minuteP%"
set /a "hour=%hour%+%hourP%"
set formatTime=%hour%:%minute%:%second%.00
set /a reSecond=%second%/60
set /a second=%second%-(60*%reSecond%)
set /a minute=%minute%+%reSecond%
set /a reMinute=%minute%/60
set /a minute=%minute%-(60*%reMinute%)
set /a hour=%hour%+%reMinute%

if "%hour%" GEQ "24" (
set errorlevel=1
@echo Error, Too many hours!
pause
goto :eof
)
ECHO %hour%> tempfile.txt
FOR %%? IN (tempfile.txt) DO ( SET /A strlength=%%~z? - 2 )
if %strlength%==1 (
set "hour= %hour%"
)

ECHO %minute%> tempfile.txt
FOR %%? IN (tempfile.txt) DO ( SET /A strlength=%%~z? - 2 )
if %strlength%==1 (
set "minute=0%minute%"
)

ECHO %second%> tempfile.txt
FOR %%? IN (tempfile.txt) DO ( SET /A strlength=%%~z? - 2 )
if %strlength%==1 (
set "second=0%second%"
)
set formatTime=%hour%:%minute%:%second%

:delayLoop
set "currentTime=%time:~0,8%"
if %currentTime%==%formatTime% (
goto :eof
)
goto delayLoop
@echo You shouldn't be seeing this...
@echo So hi... I'll just let you read what happened above... if you left @echo on of course :)
pause
goto :eof