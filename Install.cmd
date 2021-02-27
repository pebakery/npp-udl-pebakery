@echo off
IF NOT EXIST "%AppData%\Notepad++\userDefineLangs" MKDIR "%AppData%\Notepad++\userDefineLangs"
COPY PEBakery-UDL.xml "%AppData%\Notepad++\userDefineLangs"