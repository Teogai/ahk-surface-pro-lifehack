Class Launcher
{
    LaunchPowershellAtCurrentDir(isAdmin=false)
    {
        Dir := Launcher.ActiveFolderPath()
        If !Dir
            Dir := "c:\windows\system32"

        If isAdmin
            Run *RunAs powershell -noexit cd %Dir%
        Else
            Run powershell -noexit cd %Dir%
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

    LaunchVSCodeAtCurrentDir()
    {
        Dir := Launcher.ActiveFolderPath()
        If !Dir
            Run powershell -windowstyle hidden | code
        Else
            Run powershell -windowstyle hidden cd %Dir% | code .
    }
}
