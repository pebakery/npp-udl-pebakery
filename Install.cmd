@echo off

:: Check Admin Privileges
SET IsAdmin=0
net session >nul 2>&1
IF %ERRORLEVEL% == 0 (
    SET IsAdmin=1
) else (
    SET IsAdmin=0
    ECHO npp-udl-pebakery full installation requires Administrator privilege.
    ECHO Without admin privileges, autoCompletion will not be available.
    PAUSE
)

:: UDL Definition
IF NOT EXIST "%AppData%\Notepad++\userDefineLangs" MKDIR "%AppData%\Notepad++\userDefineLangs"
COPY "userDefineLangs\PEBakery.udl.xml" "%AppData%\Notepad++\userDefineLangs"

:: Function List
IF NOT EXIST "%AppData%\Notepad++\functionList" MKDIR "%AppData%\Notepad++\functionList"
COPY "functionList\PEBakery.xml" "%AppData%\Notepad++\functionList"

:: AutoComplete
IF %IsAdmin% == 1 (
    IF EXIST "%ProgramFiles%\Notepad++\Notepad++.exe" (
        IF NOT EXIST "%ProgramFiles%\Notepad++\autoCompletion" MKDIR "%ProgramFiles%\Notepad++\autoCompletion"
        COPY "autoCompletion\PEBakery.xml" "%ProgramFiles%\Notepad++\autoCompletion"
    )

    IF EXIST "%ProgramFiles(x86)%\Notepad++\Notepad++.exe" (
        IF NOT EXIST "%ProgramFiles(x86)%\Notepad++\autoCompletion" MKDIR "%ProgramFiles(x86)%\Notepad++\autoCompletion"
        COPY "autoCompletion\PEBakery.xml" "%ProgramFiles(x86)%\Notepad++\autoCompletion"
    )

    ECHO npp-udl-pebakery was successfully installed!
)
