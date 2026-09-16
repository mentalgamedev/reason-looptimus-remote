@echo off
setlocal

set "REMOTE=%APPDATA%\Propellerhead Software\Remote"
set "CODEC_DEST=%REMOTE%\Codecs\Lua Codecs\Loop Community"
set "MAP_DEST=%REMOTE%\Maps\Loop Community"

echo.
echo Uninstalling Looptimus Momentary Reason Remote codec...
echo.

del /Q "%CODEC_DEST%\LooptimusMomentary.lua" 2>nul
del /Q "%CODEC_DEST%\LooptimusMomentary.luacodec" 2>nul
del /Q "%MAP_DEST%\Looptimus Momentary.remotemap" 2>nul

rd "%CODEC_DEST%" 2>nul
rd "%MAP_DEST%" 2>nul

echo Uninstallation complete.
echo.
echo Fully restart Reason if it was running.
echo.
pause
