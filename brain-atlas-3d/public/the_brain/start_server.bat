@echo off
echo.
echo ============================================
echo    Brain Atlas Server wird gestartet...
echo ============================================
echo.

cd /d "%~dp0"
echo Aktueller Ordner: %CD%
echo.

echo Starte Python HTTP Server auf Port 8000...
echo.
echo Der Server ist bereit wenn du siehst:
echo "Serving HTTP on :: port 8000 (http://[::]:8000/) ..."
echo.
echo Dann öffne deinen Browser und gehe zu:
echo http://localhost:8000
echo.
echo Zum Beenden drücke Ctrl+C
echo.

python -m http.server 8000

pause
