@echo off
if not exist K:\kafka\bin subst K: /D >nul 2>&1
if not exist K:\kafka\bin subst K: "%~dp0."
set "JAVA_HOME=K:\jdk21"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "KAFKA_HEAP_OPTS=-Xmx1G -Xms1G"
cd /d K:\kafka
call bin\windows\kafka-server-start.bat config\server.properties
