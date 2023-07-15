﻿function RunAsync($FilePath,$ArgumentList,$Options,$WinTitle){
    $command = "Start-Process -FilePath ""$FilePath"""
    $folderPath = $(Split-Path -Path $FilePath -Parent)
    if($folderPath -ne ""){$command = $command + " -WorkingDirectory ""$folderPath"""}
    if($ArgumentList -ne $null){$command = $command + " -ArgumentList ""$ArgumentList"""}
    if($Options -ne $null){$command = $command + " $Options"}

    echo $command
    Invoke-Expression $command

    if($WinTitle -ne $null){
        While((Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}) -eq $null){
            SLEEP 0.5
        }
    }
}

RunAsync "C:\Users\PRO\Documents\Projects\AutoHotkey\Scripts\ScreenLock.ahk"
RunAsync "C:\Program Files (x86)\PicPick\picpick.exe"
RunAsync "C:\Program Files\obs-studio\bin\64bit\obs64.exe" "--startreplaybuffer --minimize-to-tray"
RunAsync "explorer.exe"
RunAsync "C:\Program Files (x86)\Notepad++\notepad++.exe" -WinTitle "* - Notepad++"
RunAsync "Code" "C:\Users\PRO\Documents\Projects\AutoHotkey" -Options "-WindowStyle Hidden" -WinTitle "*AutoHotkey - Visual Studio Code"
RunAsync "Code" "C:\Users\PRO\Documents\Projects\MyChromeExtension" -Options "-WindowStyle Hidden" -WinTitle "*MyChromeExtension - Visual Studio Code"
RunAsync "Code" "C:\Users\PRO\Documents\Projects\SeleniumProject" -Options "-WindowStyle Hidden" -WinTitle "*SeleniumProject - Visual Studio Code"
RunAsync "C:\Users\PRO\Documents\タスク管理.xlsm" -WinTitle "*タスク管理.xlsm*"
RunAsync "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -WinTitle "* - Google Chrome"
RunAsync "C:\Program Files\Google\Drive File Stream\launch.bat"

exit

# メモ
# Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
