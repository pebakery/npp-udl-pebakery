@echo off
:: UDL Definition
IF NOT EXIST "%AppData%\Notepad++\userDefineLangs" MKDIR "%AppData%\Notepad++\userDefineLangs"
COPY "userDefineLangs\PEBakery.UDL.xml" "%AppData%\Notepad++\userDefineLangs"

:: Function List
IF NOT EXIST "%AppData%\Notepad++\functionList" MKDIR "%AppData%\Notepad++\functionList"
COPY "functionList\PEBakery.xml" "%AppData%\Notepad++\functionList"

:: AutoComplete
IF EXIST "%ProgramFiles%\Notepad++\Notepad++.exe" (
    IF NOT EXIST "%ProgramFiles%\Notepad++\autoCompletion" MKDIR "%ProgramFiles%\Notepad++\autoCompletion"
    COPY "autoCompletion\PEBakery.xml" "%ProgramFiles%\Notepad++\autoCompletion"
)

IF EXIST "%ProgramFiles(x86)%\Notepad++\Notepad++.exe" (
    IF NOT EXIST "%ProgramFiles(x86)%\Notepad++\autoCompletion" MKDIR "%ProgramFiles(x86)%\Notepad++\autoCompletion"
    COPY "autoCompletion\PEBakery.xml" "%ProgramFiles(x86)%\Notepad++\autoCompletion"
)
