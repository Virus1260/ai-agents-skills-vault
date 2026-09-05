@echo off
title AI Agents Skills Vault - 1-Click Update
echo ========================================================
echo  AI AGENTS SKILLS VAULT: 1-CLICK UPSTREAM SYNC
echo ========================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0update-skills.ps1" %*
echo.
echo Press any key to exit...
pause >nul
