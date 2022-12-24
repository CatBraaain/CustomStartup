function Run($FilePath,$ArgList,$WinTitle){
    #$FolderPath = $(Split-Path -Path $FilePath -Parent)
    # -WorkingDirectory $FolderPath
    if($ArgList -eq ""){
        Start-Process -FilePath $FilePath
    }else{
        Start-Process -WindowStyle Hidden  -FilePath $FilePath -ArgumentList $ArgList
    }
    While((Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}) -eq $null){
        SLEEP 0.5
    }
}

Run "C:\Program Files\AutoHotkey\Scripts\ScreenLock.ahk" "" "*"
Run "C:\Program Files\Google\Drive File Stream\launch.bat" "" "*"
Run "C:\Program Files\obs-studio\bin\64bit\obs64.exe" "--startreplaybuffer --minimize-to-tray" "*"
Run "explorer.exe" "" "*"
Run "Taskmgr.exe" "" "*タスク マネージャー*"
Run "C:\Program Files (x86)\Notepad++\notepad++.exe" "" "* - Notepad++"
Run "code" "-n -g `"C:\Program` Files\AutoHotkey`"" "* - AutoHotkey - Visual Studio Code"
Run "code" "-n -g `"C:\Users\PRO\Documents\カスタマイズ\自作拡張機能`"" "* - 自作拡張機能 - Visual Studio Code"
Run "C:\Users\PRO\Documents\タスク管理.xlsm" "" "*タスク管理.xlsm*"
Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "" "* - Google Chrome"

#メモ
#VSCodeには-WindowStyle Hiddenがないといつまでもプロンプトが表示される
#excelには-WindowStyle Hiddenがあるとウィンドウが小さく表示される

#Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
