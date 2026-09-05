@echo off
title AI Agents Skills Vault - 1-Click Restore
echo ========================================================
echo  AI AGENTS SKILLS VAULT: 1-CLICK DISASTER RESTORE
echo ========================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0restore-skills.ps1" %*
echo.
echo Press any key to exit...
pause >nul
