@echo off
title AI Agent Skills Vault - Weekly Safe Auto-Updater
echo ======================================================
echo  AI Agent Skills Vault - Non-Destructive Weekly Sync
echo ======================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\auto_update_weekly.ps1"
echo.
echo Sync completed. Press any key to exit.
pause >nul
