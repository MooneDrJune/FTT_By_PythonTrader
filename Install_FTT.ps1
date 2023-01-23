$destinationpath = "$env:USERPROFILE\FinvasiaTradeTerminal"
$ariafolder = "$destinationpath\aria2-1.36.0-win-64bit-build1\"
mkdir $destinationpath
$url = 'https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0-win-64bit-build1.zip'
$tmp = New-TemporaryFile | Rename-Item -NewName { $_ -replace 'tmp$', 'zip' } -PassThru
Invoke-WebRequest -OutFile $tmp $url
Microsoft.PowerShell.Archive\Expand-Archive -Path $tmp -DestinationPath $destinationpath -Force -PassThru
$tmp | Remove-Item

cd $ariafolder

$url = 'https://github.com/MooneDrJune/FTT_By_PythonTrader/releases/download/V.0.3/FinvasiaTradeTerminal.zip'
.\aria2c.exe  --out="FinvasiaTradeTerminal.zip" $url
Microsoft.PowerShell.Archive\Expand-Archive -Path .\FinvasiaTradeTerminal.zip -DestinationPath ..\ -Force -PassThru
cd $destinationpath
Remove-Item .\aria2-1.36.0-win-64bit-build1\ -Force -Recurse

write-output "Creating FinvasiaTradeTerminal Icon on Desktop"

$SourceFilePath = "$env:USERPROFILE\FinvasiaTradeTerminal\python.exe"
$ArgumentsToSourceExe = "Finvasia_Trade_Terminal_V3.py"
$ShortcutPath = "$env:USERPROFILE\Desktop\FinvasiaTradeTerminal.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$Shortcut.Arguments = $ArgumentsToSourceExe
$Shortcut.IconLocation = "$env:USERPROFILE\FinvasiaTradeTerminal\PythonTrader.ico"
$Shortcut.WorkingDirectory = "$env:USERPROFILE\FinvasiaTradeTerminal"
$shortcut.WindowStyle = 1
$ShortCut.Hotkey = "CTRL+ALT+SHIFT+F"
$shortcut.Save()

$desktopfolder = "$env:USERPROFILE\Desktop"
cd $desktopfolder