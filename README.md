# PEBakery Syntax Highlighter for Notepad++

Notepad++ UDL file for PEBakery language.

## Features

- Syntax Highlighting for PEBakery files (.script, .project) on Notepad++
- AutoComplete/Parameter Hints

## Auto Install

Run `Install.cmd` as Administrator.

## Manual Install

### Copy XML files

1. Close NotePad++ 
1. Copy `userDefineLangs\PEBakery.udl.xml` into the `%AppData%\Notepad++\userDefineLangs` directory.
1. Copy `functionList\PEBakery.xml` into the `%AppData%\Notepad++\functionList` directory.
1. Copy `autoCompletion\PEBakery.xml` into the `%ProgramFiles%\Notepad++\autoCompletion` directory.

### Import within Notepad++ GUI

If you are only interested in the Syntax Highlighting, you can import `PEBakery.udl.xml` from within the Notepad++ GUI. Click `Languages > Define Your Language...` to access UDL Dialog Box.

In Notepad++ 7.6.3 or higher, importing through UDL Dialog Box can corrupt font names, due to [a bug](https://github.com/notepad-plus-plus/notepad-plus-plus/issues/5630) within NotePad++. We recommend manual copy until the bug has resolved.

## License

Licensed under MIT License.

## Changelog

### 1.2

- Updated keywords and commands for PEBakery v1.0.0
- Added functionList for section headings
- Added AutoComplete/Parameter Hints. (Note: Due to PEBakery's comma delimited syntax and the way Notepad++ has implemented AutoComplete, the parameter hints will not be shown after the 2nd argument.)

### 1.1

- Updated keywords and commands for PEBakery Prerelease beta 6
- Highlighting of the variables nested in the double-quoted string
- Partial highlighting of the section parameters in the dobule-quoted string
- Attachment section folding 

### 1.0.2

- Updated keywords and commands for PEBakery Prerelease beta 5

### 1.0.1

- Updated keywords and commands for PEBakery Prerelease beta 4

### 1.0.0

- Initial release
