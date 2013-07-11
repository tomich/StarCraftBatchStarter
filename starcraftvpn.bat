@echo off
::-----------------------------------------------------------
::INICIO
::-----------------------------------------------------------
set ip="192.168.5.3"
set app="C:\Windows\SysWOW64\ForceBindIP.exe" %ip% "C:\Program Files (x86)\StarCraft\starcraft.exe"
set mostrado=0
ECHO *Cerrando explorer.exe
taskkill /f /IM explorer.exe 
ECHO *explorer.exe cerrado
ECHO *Abriendo Starcraft
start %app%
PING 127.0.0.1 -n 11 >NUL

::-----------------------------------------------------------
::Ver si starcraft.exe esta abierto
::-----------------------------------------------------------
:START
tasklist /FI "IMAGENAME eq starcraft.exe" | find /i "starcraft.exe" >NUL
 
IF ERRORLEVEL 2 GOTO SCOPEN 
IF ERRORLEVEL 1 GOTO SCCLOSE 

::-----------------------------------------------------------
::Starcraft esta abierto
::-----------------------------------------------------------
:SCOPEN
IF %mostrado% == 0 ECHO *Starcraft esta abierto
set mostrado=1
PING 127.0.0.1 -n 2 >NUL
goto START 
 

::-----------------------------------------------------------
::Starcraft esta cerrado
::-----------------------------------------------------------
:SCCLOSE 
ECHO *El Juego fue cerrado
ECHO *Abriendo explorer.exe
start explorer.exe
ECHO *explorer.exe abierto
goto EXIT
 

::-----------------------------------------------------------
::TERMINAR
::-----------------------------------------------------------
:EXIT 
ECHO ****FIN del script****
pause