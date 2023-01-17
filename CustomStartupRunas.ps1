if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }

function RunAs($FilePath,$ArgList,$WinTitle){
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
function HideWin($WinTitle){
    $Signature = @"
    [DllImport("user32.dll")]public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@

    $ShowWindowAsync = Add-Type -MemberDefinition $Signature -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru
    $ShowWindowAsync::ShowWindowAsync((Get-Process|Where-Object {$_.MainWindowTitle -like "*タスク マネージャー*"}).MainWindowHandle, 6)
}

RunAs "C:\Program Files\AutoHotkey\AutoHotkey.exe" """""C:\Program Files\AutoHotkey\AutoHotkey.ahk"""""
RunAs "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
RunAs "Taskmgr.exe" -WinTitle "タスク マネージャー"
HideWin "タスク マネージャー"
exit

#メモ
#VSCodeには-WindowStyle Hiddenがないといつまでもプロンプトが表示される
#excelには-WindowStyle Hiddenがあるとウィンドウが小さく表示される

#Get-Process|Where-Object {$_.MainWindowTitle}|Format-Table MainWindowTitle