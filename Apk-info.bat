@ echo off
%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin

rem 添加apk文件关联和右键菜单
reg add "HKEY_CLASSES_ROOT\.apk" /f /ve /d "APK-Info"
reg add "HKEY_CLASSES_ROOT\APK-Info" /f /ve /d "APK-Info"
rem 打开时的命令
reg add "HKEY_CLASSES_ROOT\APK-Info\shell\open\command" /f /ve /d "%~dp0APK-Info.exe \"%%1\""
rem 右键菜单
reg add "HKEY_CLASSES_ROOT\APK-Info\shell\查看apk信息" /f /v "Icon" /d "%~dp0APK-Info.exe"
reg add "HKEY_CLASSES_ROOT\APK-Info\shell\查看apk信息\command" /f /ve /d "%~dp0APK-Info.exe \"%%1\""
