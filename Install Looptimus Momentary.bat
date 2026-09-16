@echo off
setlocal

set "REMOTE=%APPDATA%\Propellerhead Software\Remote"
set "CODEC_DEST=%REMOTE%\Codecs\Lua Codecs\Loop Community"
set "MAP_DEST=%REMOTE%\Maps\Loop Community"

echo.
echo Installing Looptimus Momentary Reason Remote codec v1.0.0...
echo.

if not exist "%CODEC_DEST%" mkdir "%CODEC_DEST%"
if errorlevel 1 goto :error

if not exist "%MAP_DEST%" mkdir "%MAP_DEST%"
if errorlevel 1 goto :error

copy /Y "%~dp0Remote\Codecs\Lua Codecs\Loop Community\LooptimusMomentary.lua" "%CODEC_DEST%\LooptimusMomentary.lua" >nul
if errorlevel 1 goto :error

copy /Y "%~dp0Remote\Codecs\Lua Codecs\Loop Community\LooptimusMomentary.luacodec" "%CODEC_DEST%\LooptimusMomentary.luacodec" >nul
if errorlevel 1 goto :error

copy /Y "%~dp0Remote\Maps\Loop Community\Looptimus Momentary.remotemap" "%MAP_DEST%\Looptimus Momentary.remotemap" >nul
if errorlevel 1 goto :error

echo Installation complete.
echo.
echo IMPORTANT:
echo 1. Fully close Reason before installing/updating.
echo 2. Restart Reason after installation.
echo 3. Re-learn the Warp Remote Override for the test.
echo.
pause
exit /b 0

:error
echo.
echo Installation failed.
echo.
pause
exit /b 1
