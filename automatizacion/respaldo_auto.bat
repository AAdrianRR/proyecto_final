@echo off
echo ===================================================
echo   AUTOMATIZACION DE RESPALDO DE BASE DE DATOS
echo ===================================================

:: Obtener la fecha actual
set FECHA=%date:~-4%%date:~3,2%%date:~0,2%

:: Definir ruta de salida y nombre del archivo
set RUTA_RESPALDO=C:\Users\Public\respaldo_helpdesk_%FECHA%.dump

:: Ejecutar pg_dump
pg_dump -U postgres -d helpdesk_db -F c -b -f "%RUTA_RESPALDO%"

echo Respaldo generado con exito en: %RUTA_RESPALDO%
pause