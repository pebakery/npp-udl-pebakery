# PEBakery Language Support for Notepad++

Notepad++ UDL file for PEBakery language.

## Features

- Syntax Highlighting for PEBakery files (.script, .project) on Notepad++.
- AutoComplete/Parameter Hints of PEBakery commands.

## Auto Install

Run `Install.cmd` as Administrator.

## Manual Install

### Copy XML files

1. Close NotePad++.
1. Copy `userDefineLangs\PEBakery.udl.xml` into the `%AppData%\Notepad++\userDefineLangs` directory.
1. Copy `functionList\PEBakery.xml` into the `%AppData%\Notepad++\functionList` directory.
1. Copy `autoCompletion\PEBakery.xml` into the `%ProgramFiles%\Notepad++\autoCompletion` directory (Requires Administrater privileges).

### Import within Notepad++ GUI

If you are only interested in the syntax highlighting, you can import `PEBakery.udl.xml` from within the Notepad++ GUI. Click `Languages > Define Your Language...` to access UDL Dialog Box.

In Notepad++ 7.6.3 or higher, importing through UDL Dialog Box can corrupt font names, due to [a Notepad++ bug](https://github.com/notepad-plus-plus/notepad-plus-plus/issues/5630). We recommend to copy XML files manually until the bug has resolved.

## License

Licensed under [MIT License](./LICENSE).

# ChangeLog

Please read [ChangeLog](CHANGELOG.md).
