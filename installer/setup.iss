; Install the PEBakery Notepad++ User-Defined Language syntax highlighter, function list, and auto complete.
; Author: Homes32

#define MyAppName "PEBakery Notepad++ UDL"
#define MyAppVersion "1.3"
#define MyAppPublisher "PEBakery"
#define MyAppURL "https://github.com/pebakery/npp-udl-pebakery"
#define PEBakeryURL "https://github.com/pebakery/"

[Setup]
AppId={{0D482819-718A-43A2-A4C4-839713AED17D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#PEBakeryURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
VersionInfoCompany={#MyAppPublisher}
VersionInfoVersion={#MyAppVersion}
VersionInfoCopyright=Copyright (C) Hajin Jang and Jonathan Holmgren (Homes32)
CreateAppDir=no
LicenseFile=..\LICENSE
InfoBeforeFile=..\CHANGELOG.md
OutputDir=..\bin
OutputBaseFilename=PEBakery UDL
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\autoCompletion\pebakery.xml"; DestDir: "{code:GetNPPInstallPath}\autoCompletion"; Flags: ignoreversion
Source: "..\functionList\pebakery.xml"; DestDir: "{userappdata}\Notepad++\functionList"; Flags: ignoreversion; AfterInstall: ConfigureFunctionList
Source: "..\userDefineLangs\PEBakery.udl.xml"; DestDir: "{userappdata}\Notepad++\userDefineLangs"; Flags: ignoreversion

[Code]

// Globals
var
  NPPInstallPath: string;

// Check if Notepad++ is installed. Returns True if installed, False if not installed.
function IsNPPInstalled: boolean;
begin
  Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe');
end;

// Return NPPInstallPath for use as a scripted constant in [Run]
function GetNPPInstallPath(Param: string): string;
begin
  Result := NPPInstallPath;
end;

// Writes the associationMap for our functionList
procedure ConfigureFunctionList();
var
  XMLDoc, NewNode, PEBakeryValue, PEBakeryRootNode, RootNode: Variant;
  XMLPath: string;
begin
  XMLPath := ExpandConstant('{userappdata}\Notepad++\functionList\overrideMap.xml')
 
  XMLDoc := CreateOleObject('MSXML2.DOMDocument');
  XMLDoc.async := False;
  XMLDoc.resolveExternals := False;
  XMLDoc.setProperty('SelectionLanguage', 'XPath');
  
  XMLDoc.load(XMLPath);
  if (XMLDoc.parseError.errorCode <> 0) then
    RaiseException('Error on line ' + IntToStr(XMLDoc.parseError.line) + ', position ' + IntToStr(XMLDoc.parseError.linepos) + ': ' + XMLDoc.parseError.reason);
 
  PEBakeryValue := XMLDoc.SelectSingleNode('//NotepadPlus/functionList/associationMap/association[@id="pebakery.xml"]/@userDefinedLangName')  
  if (IDispatch(PEBakeryValue) = nil) then
  begin
    // No association exists, create a new element
    NewNode := XMLDoc.createElement('association');
    RootNode := XMLDoc.selectSingleNode('//NotepadPlus/functionList/associationMap');
    RootNode.appendChild(NewNode);
    RootNode.lastChild.setAttribute('id', 'pebakery.xml');
    RootNode.lastChild.setAttribute('userDefinedLangName', 'PEBakery');
    XMLDoc.Save(XMLPath);
  end
  else
  begin
    // association exists, overwrite
    Log('Overwriting existing association [' + PEBakeryValue.Value + ']...')
    PEBakeryRootNode := XMLDoc.selectSingleNode('//NotepadPlus/functionList/associationMap/association[@id="pebakery.xml"]');
    PEBakeryRootNode.setAttribute('userDefinedLangName', 'PEBakery');
    XMLDoc.Save(XMLPath);
  end;
end;

// Removes the associationMap for our functionList
procedure DeconfigureFunctionList();
var
  XMLDoc, PEBakeryValue, XMLNodeList: Variant;
  XMLPath: string;
  Index: Integer;
begin
  XMLPath := ExpandConstant('{userappdata}\Notepad++\functionList\overrideMap.xml')
 
  XMLDoc := CreateOleObject('MSXML2.DOMDocument');
  XMLDoc.async := False;
  XMLDoc.resolveExternals := False;
  XMLDoc.setProperty('SelectionLanguage', 'XPath');
  
  XMLDoc.load(XMLPath);
  if (XMLDoc.parseError.errorCode <> 0) then
    RaiseException('Error on line ' + IntToStr(XMLDoc.parseError.line) + ', position ' + IntToStr(XMLDoc.parseError.linepos) + ': ' + XMLDoc.parseError.reason);
 
  PEBakeryValue := XMLDoc.SelectSingleNode('//NotepadPlus/functionList/associationMap/association[@id="pebakery.xml"]/@userDefinedLangName')  
  if (IDispatch(PEBakeryValue) <> nil) then
  begin
    XMLNodeList := XMLDoc.selectNodes('//NotepadPlus/functionList/associationMap/association[@id="pebakery.xml"]');
    for Index := 0 to XMLNodeList.length - 1 do
    begin
      XMLNodeList.item[Index].parentNode.removeChild(XMLNodeList.item[Index]);
    end;
    XMLDoc.Save(XMLPath);
  end;
end;

// Uninstall Events
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usPostUninstall then
  begin
    DeconfigureFunctionList
  end;
end;

// Initialize Setup - This function runs before the GUI
function InitializeSetup: boolean;
var
  Path: string;
begin
  if (IsNPPInstalled) then
  begin
    RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe', '', Path)
    NPPInstallPath := ExtractFileDir(Path);
    Log(Format('Notepad++ installed in %s', [NPPInstallPath]));
    Result := True;
  end
  else
  begin
    MsgBox('You need to install Notepad++ before you can use the PEBakery User-Defined Language.', mbError, MB_OK);
    Result := False;
  end;
end;
