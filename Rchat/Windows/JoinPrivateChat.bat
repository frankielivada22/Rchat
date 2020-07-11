@echo off
title Joining Chat
cls

set chatname=%USERNAME%

:top
cls
color a
echo Username: %chatname%
echo:
echo 1) Join session
echo:
echo 2) Set username
echo:
echo e) exit
set /p c="-->> "
if "%c%" == "1" goto :chatsettings
if "%c%" == "2" goto :setname
if "%c%" == "e" goto :exit
goto :top

:exit
color a
echo Aight bet
echo cya :)
pause >nul
exit


:setname
color a
set /p chatname="Enter chatname: "
if "%chatname%" == "" goto :setnamefail
echo %chatname% > chatname.txt
goto :top
:setnamefail
color c
echo You must have a name...
timeout /t 2 /NOBREAK >nul
goto :setname



:chatsettings
color a
cls
set /p ipordomain="Enter chat ip or domain: "
echo:
set /p port="Enter chat port: "
echo:
set /p issslon="Is encrypiton enabled (y / n): "
echo:
echo Connecting...
echo:
if "%issslon%" == "y" goto :startschatwithssl
if "%issslon%" == "n" goto :startschatnossl
color c
echo something went wrong...
timeout /t 2 /NOBREAK >nul
goto :chatsettings

:startschatwithssl
echo %chatname% Joined the chat (%time%::%date%) | start /B ncat.exe %ipordomain% %port% --ssl
echo %chatname% Joined the chat (%time%::%date%)
echo Type something...
:chatloop1
color a
title Chatting...

set /p pmessage=" "

echo %chatname%: %pmessage% | start /B ncat.exe %ipordomain% %port% --ssl

set pmessage=
timeout /t 2 /NOBREAK >nul

goto :chatloop1

:startschatnossl
echo %chatname% Joined the chat (%time%::%date%) | start /B ncat.exe %ipordomain% %port%
echo %chatname% Joined the chat (%time%::%date%)
echo Type something...

:chatloop
color a
title Chatting...

set /p pmessage=" " >nul

echo %chatname%: %pmessage% | start /B ncat.exe %ipordomain% %port% >nul

set pmessage= >nul
timeout /t 2 /NOBREAK >nul

goto :chatloop

