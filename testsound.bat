@echo off
:: Scherz-Skript zum Hinzufügen des Sounds zum Autostart

:: Dateien für den Sound und das Skript
set "soundfile=https://github.com/TillZxx/Fun/blob/main/pornbuh.wav"
set "soundpath=%USERPROFILE%\AppData\Local\Temp\scary_sounds.wav"
set "autostart=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\scary_sound.bat"

:: Herunterladen des Sounds
echo Lade unheimlichen Sound herunter...
powershell -Command "Invoke-WebRequest -Uri %soundfile% -OutFile %soundpath%"
timeout /t 2 >nul

:: Erstelle das Autostart-Skript
echo @echo off > "%autostart%"
echo start /min mplay32 /play /close "%soundpath%" >> "%autostart%"
echo del "%autostart%" >> "%autostart%"  :: Löscht das Skript nach der ersten Ausführung

:: Informiere den Benutzer
echo Der Scherz wird beim nächsten Start deines PCs ausgefuehrt!
echo Du kannst das Skript jederzeit löschen, um es zu stoppen.

:: Skript beenden
exit
