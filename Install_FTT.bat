@echo off
rem Powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& './Install_FTT.ps1'"
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""./Install_FTT.ps1""' -Verb RunAs}"
TIMEOUT /T 5