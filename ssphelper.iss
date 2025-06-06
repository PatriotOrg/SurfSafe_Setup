#define RegAppName "SurfSafeHelper"
#define HelpedAppName "SurfSafe"

#define Manufacturer "DefenderPro"

#define MyAppVersion "10.10.10.10"

#define AppGUID "{5A32E367-94B0-4C36-85C1-C6D8F54B577B}"

#define MyAppExeName "SurfSafeHelper.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)

AppId={{#AppGUID}
AppName={#RegAppName}
AppVersion={#MyAppVersion}
Uninstallable=no

DefaultDirName={tmp}\{#RegAppName}
DisableWelcomePage=yes
DisableProgramGroupPage=yes
DisableDirPage=yes
DisableReadyPage=yes
DisableFinishedPage=yes
DisableReadyMemo=yes
DisableStartupPrompt=yes

PrivilegesRequired=lowest

OutputBaseFilename="SurfSafeHelper"
SetupIconFile=.\images\wia.ico
Compression=lzma2/max
SolidCompression=yes

[Code]
function InitializeSetup(): Boolean;
var
  Node, Value: string;  
  Hive: integer;
  
begin
    
  Hive := HKCU;
  Node := 'Software\{#Manufacturer}\{#HelpedAppName}';
  Value := 'InstallPath';

  Result := False;
  if RegValueExists(Hive, Node, Value) then
  begin
    // SurfSafe is installed. Exit doing nothing    
  end
  else
  begin
    //MsgBox(ExpandConstant('{localappdata}\Programs\SurfSafe'), mbInformation, MB_OK);
    // SurfSafe not installed
    if ( DirExists(ExpandConstant('{localappdata}\Programs\SurfSafe'))) then
        DelTree(ExpandConstant('{localappdata}\Programs\SurfSafe'), True, True, True);      
  end;  

end;