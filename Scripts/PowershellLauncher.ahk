Class PowershellLauncher
{
    LaunchPowershellAtCurrentDir()
    {
        Dir := PowershellLauncher.ActiveFolderPath()
        Run powershell.exe -noexit cd %Dir%
    }

    ActiveFolderPath(WinTitle="A")
    {
        WinGetClass Class, %WinTitle%
        If (Class ~= "Progman|WorkerW") ;desktop
            WinPath := A_Desktop
        ;Else If (Class ~= "(Cabinet|Explore)WClass") ;all other Explorer windows
        Else ;all other windows
        {
            WinGetText, WinPath, A
            RegExMatch(WinPath, "Address:.*", WinPath)
            WinPath := RegExReplace(WinPath, "Address: ") ;remove "Address: " part
        }

        WinPath := RegExReplace(WinPath, "\\+$") ;remove single or double  trailing backslash
        If WinPath ;if path not empty, append single backslash
            WinPath .= "\"
        Return WinPath
    }
}
