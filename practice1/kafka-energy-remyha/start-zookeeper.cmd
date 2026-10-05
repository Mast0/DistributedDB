@echo off
if not exist K:\kafka\bin subst K: /D >nul 2>&1
if not exist K:\kafka\bin subst K: "%~dp0."
set "JAVA_HOME=K:\jdk21"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d K:\kafka
call bin\windows\zookeeper-server-start.bat config\zookeeper.properties
