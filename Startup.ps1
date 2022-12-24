function Run($FilePath,$ArgList,$WinTitle){
    $FolderPath = $(Split-Path -Path $FilePath -Parent)
    if($ArgList -eq ""){
        Start-Process -FilePath $FilePath -WorkingDirectory $FolderPath
    }else{
        Start-Process -FilePath $FilePath -WorkingDirectory $FolderPath -ArgumentList $ArgList
    }
    While((Get-Process|Where-Object {$_.MainWindowTitle -like $WinTitle}) -eq $null){
        SLEEP 0.5
    }
}

Run "C:\Program Files\obs-studio\bin\64bit\obs64.exe" "--startreplaybuffer --minimize-to-tray" "*"
Run "C:\Program Files (x86)\Notepad++\notepad++.exe" "" "* - Notepad++"
Run "C:\Users\PRO\AppData\Local\Programs\Microsoft VS Code\Code.exe" "-n `"C:\Program` Files\AutoHotkey`"" "* - AutoHotkey - Visual Studio Code"
Run "C:\Users\PRO\AppData\Local\Programs\Microsoft VS Code\Code.exe" "-n `"C:\Users\PRO\Documents\カスタマイズ\自作拡張機能`"" "* - 自作拡張機能 - Visual Studio Code"
Run "C:\Users\PRO\Documents\タスク管理.xlsm" "" "*タスク管理.xlsm*"
Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "" "* - Google Chrome"

#Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table *
#Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle
