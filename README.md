# PEBakery Syntax Highlighter for Notepad++

Notepad++ UDL file for PEBakery language.

## Feature

- Syntax Highlighting for PEBakery files (.script, .project) on Notepad++

## Install

Run `Install.cmd` to copy XML file into predefined location.

### Copy XML file

Copy `PEBakery-UDL.xml` into `%AppData%\Notepad++\userDefineLangs` directory, and restart Notepad++. `Install.cmd` does that automatically.

### Import within Notepad++ GUI

You can import `PEBakery-UDL.xml` within Notepad++ GUI. Click `Languages > Define Your Language...` to access UDL Dialog Box.

#### Issue

In Noteoad++ 7.6.3 or higher, importing through UDL Dialog Box can corrupt font names, due to [a bug](https://github.com/notepad-plus-plus/notepad-plus-plus/issues/5630). We recommend manual copy until the bug is resolved.

## License

Licensed under MIT License.

## Changelog

### 1.1

- Updated keywords and commands to of PEBakery Prerelease beta 6
- Highlighting of the variables nested in the double-quoted string
- Partial highlighting of the section parameters in the dobule-quoted string
- Attachment section folding 

### 1.0.2

- Updated keywords and commands to of PEBakery Prerelease beta 5

### 1.0.1

- Updated keywords and commands to of PEBakery Prerelease beta 4

### 1.0.0

- Initial release
