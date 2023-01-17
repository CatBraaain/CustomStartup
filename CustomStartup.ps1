

function Run($FilePath,$ArgList,$WinTitle){
    $FolderPath = $(Split-Path -Path $FilePath -Parent)
    $Command = "Start-Process -FilePath ""$FilePath"""
    if($FolderPath -ne ""){$Command = $Command + " -WorkingDirectory ""$FolderPath"""}
    if($ArgList -ne $null){$Command = $Command + " -WindowStyle Hidden -ArgumentList ""$ArgList"""}
    echo $Command
    Invoke-Expression $Command

    if($WinTitle -ne $null){
        While((Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}) -eq $null){
            SLEEP 0.5
        }
    }
}

Run "C:\Program Files\AutoHotkey\Scripts\ScreenLock.ahk"
Run "C:\Program Files (x86)\PicPick\picpick.exe"
Run "C:\Program Files\obs-studio\bin\64bit\obs64.exe" -ArgList "--startreplaybuffer --minimize-to-tray"
Run "explorer.exe"
Run "C:\Program Files (x86)\Notepad++\notepad++.exe" -WinTitle "* - Notepad++"
Run "Code" -ArgList "-n -g """"C:\Program Files\AutoHotkey""""" -WinTitle "* - AutoHotkey - Visual Studio Code"
Run "Code" -ArgList "-n -g """"C:\Users\PRO\Documents\カスタマイズ\自作拡張機能""""" -WinTitle "* - 自作拡張機能 - Visual Studio Code"
Run "C:\Users\PRO\Documents\タスク管理.xlsm" -WinTitle "*タスク管理.xlsm*"
Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -WinTitle "* - Google Chrome"
Run "C:\Program Files\Google\Drive File Stream\launch.bat"
exit

#メモ
# -WindowStyle Hidden 
#VSCodeには-WindowStyle Hiddenがないといつまでもプロンプトが表示される
#excelには-WindowStyle Hiddenがあるとウィンドウが小さく表示される

#Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle