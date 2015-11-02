@echo off
setlocal
CD /d "%~dp0"

::Test If script has Admin Privileges/is elevated
REG QUERY "HKU\S-1-5-19"
IF %ERRORLEVEL% NEQ 0 (
    ECHO Please run this script as an administrator
    pause
    EXIT /B 1
)
cls

REM --------- Variables ---------
SET powerShellDir=%WINDIR%\system32\windowspowershell\v1.0
echo.

cls
%powerShellDir%\powershell.exe -NonInteractive -ExecutionPolicy Unrestricted -command ".\Setup\cleanup.ps1" ".\config.xml"
echo.

call %powerShellDir%\powershell.exe -NonInteractive -ExecutionPolicy Unrestricted -Command "&'.\setup\tasks\installCodeSnippets.ps1' '%~dp0setup\assets\snippets\demo.vsi'"

:exit
echo.
@pause